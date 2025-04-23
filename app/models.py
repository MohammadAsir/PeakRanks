# app/models.py

from datetime import datetime
from flask_login import UserMixin
from .extensions import db, login

class User(UserMixin, db.Model):
    __tablename__   = 'User'
    id              = db.Column(db.Integer, primary_key=True)
    username        = db.Column(db.String,  nullable=False, unique=True)
    email           = db.Column(db.String,  nullable=False, unique=True)
    # store plaintext passwords in the existing `password` column
    password_hash   = db.Column('password', db.String, nullable=False)
    dateJoined      = db.Column(db.DateTime, default=datetime.utcnow)
    teamId          = db.Column(db.Integer, db.ForeignKey('Team.id'))

    # Which team am I a member of?
    team            = db.relationship(
                        'Team',
                        back_populates='members',
                        foreign_keys=[teamId]
                      )
    # My peak records (one per game)
    peak_records    = db.relationship(
                        'PeakRecord',
                        back_populates='user',
                        cascade='all, delete-orphan'
                      )
    # My linked game accounts
    game_accounts   = db.relationship(
                        'GameAccount',
                        back_populates='user',
                        cascade='all, delete-orphan'
                      )
    # Badges I’ve earned
    badges          = db.relationship(
                        'Badge',
                        secondary='UserBadge',
                        back_populates='users'
                      )
    # Friendships I’ve requested
    friendships     = db.relationship(
                        'Friendship',
                        foreign_keys='Friendship.userId',
                        back_populates='requester',
                        cascade='all, delete-orphan'
                      )

    def set_password(self, pw):
        # store plaintext for now
        self.password_hash = pw

    def check_password(self, pw):
        return self.password_hash == pw


@login.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class Team(db.Model):
    __tablename__      = 'Team'
    id                 = db.Column(db.Integer, primary_key=True)
    teamName           = db.Column(db.String, nullable=False)
    description        = db.Column(db.String)
    createdByUserId    = db.Column(
                           db.Integer,
                           db.ForeignKey('User.id'),
                           nullable=False
                         )

    # Who created this team?
    creator = db.relationship(
                  'User',
                  backref='owned_teams',
                  foreign_keys=[createdByUserId]
              )
    # Which users belong here?
    members = db.relationship(
                  'User',
                  back_populates='team',
                  foreign_keys=[User.teamId]
              )


class Game(db.Model):
    __tablename__ = 'Game'
    id            = db.Column(db.Integer, primary_key=True)
    title         = db.Column(db.String, nullable=False)
    description   = db.Column(db.String)

    ranks = db.relationship(
              'Rank',
              back_populates='game',
              cascade='all, delete-orphan'
            )


class Rank(db.Model):
    __tablename__ = 'Rank'
    id            = db.Column(db.Integer, primary_key=True)
    gameId        = db.Column(
                     db.Integer,
                     db.ForeignKey('Game.id'),
                     nullable=False
                   )
    rankName      = db.Column(db.String, nullable=False)
    rankOrder     = db.Column(db.Integer, nullable=False)

    game         = db.relationship('Game', back_populates='ranks')
    peak_records = db.relationship(
                     'PeakRecord',
                     back_populates='rank',
                     cascade='all, delete-orphan'
                   )


class PeakRecord(db.Model):
    __tablename__  = 'PeakRecord'
    id             = db.Column(db.Integer, primary_key=True)
    userId         = db.Column(
                       db.Integer,
                       db.ForeignKey('User.id'),
                       nullable=False
                     )
    gameId         = db.Column(
                       db.Integer,
                       db.ForeignKey('Game.id'),
                       nullable=False
                     )
    rankId         = db.Column(
                       db.Integer,
                       db.ForeignKey('Rank.id'),
                       nullable=False
                     )
    dateAchieved   = db.Column(
                       db.DateTime,
                       default=datetime.utcnow,
                       nullable=False
                     )

    user = db.relationship('User', back_populates='peak_records')
    game = db.relationship('Game')
    rank = db.relationship('Rank', back_populates='peak_records')


class GameAccount(db.Model):
    __tablename__     = 'GameAccount'
    id                = db.Column(db.Integer, primary_key=True)
    userId            = db.Column(
                          db.Integer,
                          db.ForeignKey('User.id'),
                          nullable=False
                       )
    gameId            = db.Column(
                          db.Integer,
                          db.ForeignKey('Game.id'),
                          nullable=False
                       )
    accountUsername   = db.Column(db.String, nullable=False)

    user = db.relationship('User', back_populates='game_accounts')
    game = db.relationship('Game')


class Badge(db.Model):
    __tablename__ = 'Badge'
    id            = db.Column(db.Integer, primary_key=True)
    badgeName     = db.Column(db.String, nullable=False)
    description   = db.Column(db.String)
    iconUrl       = db.Column(db.String)

    users = db.relationship(
              'User',
              secondary='UserBadge',
              back_populates='badges'
            )


class UserBadge(db.Model):
    __tablename__ = 'UserBadge'
    userId        = db.Column(
                      db.Integer,
                      db.ForeignKey('User.id'),
                      primary_key=True
                   )
    badgeId       = db.Column(
                      db.Integer,
                      db.ForeignKey('Badge.id'),
                      primary_key=True
                   )


class Friendship(db.Model):
    __tablename__ = 'Friendship'
    id            = db.Column(db.Integer, primary_key=True)
    userId        = db.Column(
                      db.Integer,
                      db.ForeignKey('User.id'),
                      nullable=False
                   )
    friendId      = db.Column(
                      db.Integer,
                      db.ForeignKey('User.id'),
                      nullable=False
                   )
    status        = db.Column(db.String, nullable=False)  # pending/accepted/blocked

    requester = db.relationship(
                  'User',
                  foreign_keys=[userId],
                  back_populates='friendships'
                )
    requested = db.relationship(
                  'User',
                  foreign_keys=[friendId]
                )
