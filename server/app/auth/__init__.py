from flask_restx import Namespace,Resource,fields,marshal,marshal_with
from flask_jwt_extended import jwt_required,create_access_token,create_refresh_token
from flask import request,current_app
from app.models import User,db
from werkzeug.security import generate_password_hash
from flask_jwt_extended import JWTManager,get_jwt_identity
from werkzeug.datastructures import FileStorage
import uuid
import os

jwt = JWTManager()



auth = Namespace('auth',description="Authentication related  endpoint .")


auth_parser = auth.parser()
auth_parser.add_argument('username',type=str, help='Username')
auth_parser.add_argument('email',required=True ,type=str, help='Email Address')
auth_parser.add_argument('password',required=True,type=str , help='Password')
auth_parser.add_argument('file' , location="files",type=FileStorage,required=False)


login_parser = auth.parser()
login_parser.add_argument('email',required=True ,type=str, help='Email Address')
login_parser.add_argument('password',required=True,type=str , help='Password')

user_model = auth.model('User model',{
    "id":fields.String(),
    "email":fields.String(),
    "image":fields.String(),

})




@auth.route('/login')
class Login(Resource):
    @auth.expect(login_parser)
    def post(self):
        data = auth_parser.parse_args()
        email =  data['email']
        password =  data['password']


        user =  User.query.filter_by(email=email).first()
        

        if not user or not user.check_password_hash(password):
            return {'error':'Invalid email or password'},401

        else:
            access_token = create_access_token(identity=user.email)
            return {'access_token':access_token},200




@auth.route('/register')
class register(Resource):
    @auth.expect(auth_parser)
    def post(self):
        data = auth_parser.parse_args()

        email =  data['email']
        username =  data['username']
        password =  data['password']
        file = data['file']


        if User.query.filter_by(email=email).first():
            return {'message':'User already exists'},409


        if file:
            filename = str(uuid.uuid4())+os.path.splitext(file.filename)[1]
            if not os.path.exists(current_app.config['UPLOAD_DIRECTORY']):
                os.makedirs(current_app.config['UPLOAD_DIRECTORY'])
            file.save(os.path.join(current_app.config['UPLOAD_DIRECTORY'] , filename))


            user = User(email=email,password=password,username=username,image=filename)

            db.session.add(user)
            db.session.commit()
        else:
            user = User(email=email,password=password,username=username)
            db.session.add(user)
            db.session.commit()


        return auth.marshal(user, user_model),201

