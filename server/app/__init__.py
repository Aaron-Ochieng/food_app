from flask_restx import Api
from flask import Flask,send_from_directory,current_app
from flask_migrate import Migrate
from app.models import db
from app.config import Config
from app.auth import jwt


api = Api(title="Posting API" , version="1.1.0", description="Posing api , ha, ha ha.",security='Bearer Auth')

api.authorizations = {
    'Bearer Auth': {
        'type': 'apiKey',
        'in': 'header',
        'name': 'Authorization',
        'description': 'Enter your JWT token "Bearer {token}"'
    }
}


migrate = Migrate()



def create_index():
    app = Flask(__name__)
    app.config.from_object(Config)

    api.init_app(app)
    db.init_app(app)
    migrate.init_app(app,db)
    jwt.init_app(app)

    from .post import post
    api.add_namespace(post )


    from .auth import auth
    api.add_namespace(auth)

    from .profile import profile
    api.add_namespace(profile)


    @app.route('/images/<path:filename>')
    def uploaded_file(filename):
        return send_from_directory(current_app.config['UPLOAD_DIRECTORY'], filename)


    return app
