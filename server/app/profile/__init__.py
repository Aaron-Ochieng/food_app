from flask_restx import Namespace ,Resource
from werkzeug.datastructures import FileStorage
from app.models import db,User
from flask_jwt_extended import jwt_required


profile = Namespace('profile',description="Endpoint for modifying and updating user profile")

profile_parser = profile.parser()
profile_parser.add_argument('username',type=str, help='Username')
profile_parser.add_argument('email',required=False,type=str, help='Email Address')
profile_parser.add_argument('file' , location="files",type=FileStorage,required=False)



@profile.route('/')
class Profile(Resource):
    @jwt_required()
    @profile.expect(profile_parser)
    def put(self):
        data = profile_parser.parse_args()
        file = data['file']
        # 
        current_user = get_jwt_identity()
        user = User.query.filter_by(email = current_user).first()

        # 
        if user:
            if file:
                filename = str(uuid.uuid4())+os.path.splitext(file.filename)[1]
                if not os.path.exists(current_app.config['UPLOAD_DIRECTORY']):
                    os.makedirs(current_app.config['UPLOAD_DIRECTORY'])


                
                user.image = filename
                db.session.commit()
                file.save(os.path.join(current_app.config['UPLOAD_DIRECTORY'] , filename))

            else:
                auth.abort(404 , 'Image file is expected')

        
        else:
            auth.abort(404 ,f'User with email {current_user} not found')