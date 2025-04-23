# app/routes.py

from flask import (
    Blueprint, render_template, redirect,
    url_for, flash, request, abort
)
from flask_login import (
    current_user, login_user, logout_user,
    login_required
)
from .extensions import db
from .models     import (
    User, Team, Game, Rank,
    PeakRecord, Badge, GameAccount,
    Friendship
)
from .forms      import (
    RegistrationForm, LoginForm,
    TeamForm, JoinTeamForm, GameAccountForm
)

bp = Blueprint('main', __name__)

@bp.route('/')
def index():
    games    = Game.query.order_by(Game.id).all()
    selected = request.args.get('game_id', type=int)
    records  = (PeakRecord.query.filter_by(gameId=selected).all()
                if selected else PeakRecord.query.all())
    return render_template(
        'index.html',
        games=games,
        records=records,
        selected_game=selected
    )

@bp.route('/register', methods=['GET','POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
    form = RegistrationForm()
    if form.validate_on_submit():
        user = User(username=form.username.data,
                    email=form.email.data)
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()
        flash('Registered! You can now log in.')
        return redirect(url_for('main.login'))
    return render_template('register.html', form=form)

@bp.route('/login', methods=['GET','POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(
            username=form.username.data
        ).first()
        if user and user.check_password(form.password.data):
            login_user(user, remember=form.remember.data)
            return redirect(request.args.get('next')
                            or url_for('main.index'))
        flash('Invalid username or password.')
    return render_template('login.html', form=form)

@bp.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main.index'))

@bp.route('/team/create', methods=['GET','POST'])
@login_required
def create_team():
    form = TeamForm()
    if form.validate_on_submit():
        team = Team(
            teamName=form.teamName.data,
            description=form.description.data,
            createdByUserId=current_user.id
        )
        db.session.add(team)
        db.session.commit()
        flash('Team created.')
        return redirect(url_for('main.index'))
    return render_template('create_team.html', form=form)

@bp.route('/team/join', methods=['GET','POST'])
@login_required
def join_team():
    form = JoinTeamForm()
    form.team.choices = [
        (t.id, t.teamName) for t in Team.query.order_by(Team.teamName)
    ]
    if form.validate_on_submit():
        current_user.teamId = form.team.data
        db.session.commit()
        flash('You’ve joined the team!')
        return redirect(url_for('main.index'))
    return render_template('join_team.html', form=form)

@bp.route('/rank/edit', methods=['GET','POST'])
@login_required
def edit_rank():
    games = Game.query.order_by(Game.id).all()
    if request.method == 'POST':
        for game in games:
            sel = request.form.get(f'rank_{game.id}')
            if sel:
                rank = Rank.query.get(int(sel))
                pr = PeakRecord.query.filter_by(
                    userId=current_user.id,
                    gameId=game.id
                ).first()
                if pr:
                    pr.rankId = rank.id
                else:
                    pr = PeakRecord(
                        userId=current_user.id,
                        gameId=game.id,
                        rankId=rank.id
                    )
                    db.session.add(pr)
        db.session.commit()
        flash('Your peak ranks have been updated.')
        return redirect(url_for('main.index'))

    current = {pr.gameId: pr.rankId for pr in current_user.peak_records}
    ranks_by_game = {
        g.id: Rank.query.filter_by(gameId=g.id)
                        .order_by(Rank.rankOrder).all()
        for g in games
    }
    return render_template(
        'edit_rank.html',
        games=games,
        current=current,
        ranks_by_game=ranks_by_game
    )

@bp.route('/accounts', methods=['GET','POST'])
@login_required
def manage_accounts():
    form = GameAccountForm()
    form.game.choices = [
        (g.id, g.title) for g in Game.query.order_by(Game.title)
    ]
    if form.validate_on_submit():
        acct = GameAccount.query.filter_by(
            userId=current_user.id,
            gameId=form.game.data
        ).first()
        if acct:
            acct.accountUsername = form.accountUsername.data
        else:
            acct = GameAccount(
                userId=current_user.id,
                gameId=form.game.data,
                accountUsername=form.accountUsername.data
            )
            db.session.add(acct)
        db.session.commit()
        flash('Game account saved.')
        return redirect(url_for('main.manage_accounts'))
    accounts = GameAccount.query.filter_by(
        userId=current_user.id
    ).all()
    return render_template(
        'manage_accounts.html',
        form=form,
        accounts=accounts
    )

@bp.route('/accounts/delete/<int:account_id>', methods=['POST'])
@login_required
def delete_account_record(account_id):
    acct = GameAccount.query.get_or_404(account_id)
    if acct.userId != current_user.id:
        abort(403)
    db.session.delete(acct)
    db.session.commit()
    flash('Game account removed.')
    return redirect(url_for('main.manage_accounts'))

@bp.route('/account/delete', methods=['GET','POST'])
@login_required
def delete_account():
    if request.method == 'POST':
        db.session.delete(current_user)
        db.session.commit()
        flash('Your account has been deleted.')
        return redirect(url_for('main.index'))
    return render_template('confirm_delete.html')

@bp.route('/users')
@login_required
def users():
    return render_template(
        'users.html',
        users=User.query.order_by(User.username).all()
    )

@bp.route('/user/<int:user_id>')
@login_required
def user_profile(user_id):
    return render_template(
        'profile.html',
        user=User.query.get_or_404(user_id)
    )

@bp.route('/friends/add/<int:user_id>', methods=['POST'])
@login_required
def add_friend(user_id):
    if user_id == current_user.id:
        abort(400)
    existing = Friendship.query.filter_by(
        userId=current_user.id,
        friendId=user_id
    ).first()
    if existing:
        flash('Friend request already sent or you are already friends.')
    else:
        fr = Friendship(
            userId=current_user.id,
            friendId=user_id,
            status='pending'
        )
        db.session.add(fr)
        db.session.commit()
        flash('Friend request sent.')
    return redirect(request.referrer or url_for('main.users'))

@bp.route('/friends')
@login_required
def friends():
    sent     = current_user.friendships
    received = Friendship.query.filter_by(
        friendId=current_user.id
    ).all()
    return render_template(
        'friends.html',
        sent=sent,
        received=received
    )

@bp.route('/friends/respond/<int:request_id>/<action>', methods=['POST'])
@login_required
def respond_friend(request_id, action):
    fr = Friendship.query.get_or_404(request_id)
    if fr.friendId != current_user.id:
        abort(403)
    fr.status = 'accepted' if action == 'accept' else 'blocked'
    db.session.commit()
    flash('Friend request updated.')
    return redirect(url_for('main.friends'))

@bp.route('/badges')
@login_required
def badges():
    return render_template(
        'badges.html',
        badges=Badge.query.order_by(Badge.badgeName).all()
    )

@bp.route('/teams')
def teams():
    return render_template(
        'teams.html',
        teams=Team.query.order_by(Team.teamName).all()
    )

@bp.route('/team/<int:team_id>')
def team_detail(team_id):
    return render_template(
        'team_profile.html',
        team=Team.query.get_or_404(team_id)
    )
