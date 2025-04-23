from flask_wtf import FlaskForm
from wtforms import (
    StringField, PasswordField, BooleanField,
    SubmitField, SelectField
)
from wtforms.validators import DataRequired, Email, EqualTo, ValidationError
from .models import User, Game, Rank

class RegistrationForm(FlaskForm):
    username  = StringField('Username', validators=[DataRequired()])
    email     = StringField('Email',    validators=[DataRequired(), Email()])
    password  = PasswordField('Password', validators=[DataRequired()])
    password2 = PasswordField(
        'Repeat Password',
        validators=[DataRequired(), EqualTo('password')]
    )
    submit    = SubmitField('Register')

    def validate_username(self, field):
        if User.query.filter_by(username=field.data).first():
            raise ValidationError('Please use a different username.')

    def validate_email(self, field):
        if User.query.filter_by(email=field.data).first():
            raise ValidationError('Email already registered.')

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember = BooleanField('Remember Me')
    submit   = SubmitField('Sign In')

class TeamForm(FlaskForm):
    teamName    = StringField('Team Name', validators=[DataRequired()])
    description = StringField('Description')
    submit      = SubmitField('Create Team')

class JoinTeamForm(FlaskForm):
    team   = SelectField('Team', coerce=int)
    submit = SubmitField('Join Team')

class EditRankForm(FlaskForm):
    rank   = SelectField('Select Peak Rank', coerce=int)
    submit = SubmitField('Update Rank')

class GameAccountForm(FlaskForm):
    game            = SelectField('Game', coerce=int, validators=[DataRequired()])
    accountUsername = StringField('Account Username', validators=[DataRequired()])
    submit          = SubmitField('Save Game Account')
