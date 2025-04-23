from flask import Flask
from .config     import Config
from .extensions import db, migrate, login
from .routes     import bp as main_bp

def create_app():
    app = Flask(
        __name__,
        static_folder='ui/static',
        template_folder='ui/templates'
    )
    app.config.from_object(Config)

    db.init_app(app)
    migrate.init_app(app, db)
    login.init_app(app)

    app.register_blueprint(main_bp)
    return app
