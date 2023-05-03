import os
import uuid
from flask import url_for,send_from_directory,current_app
from flask_restx import Resource,Namespace,fields,marshal,marshal_with,reqparse
from werkzeug.datastructures import FileStorage
from  app.models import db,Post,User,Likes,Comment
from flask_jwt_extended import jwt_required,get_jwt_identity
from datetime import datetime
from app.utils.image_save import save_image



post = Namespace("posts",description="Posts related operations endpoint")



upload_parser = post.parser()
upload_parser.add_argument('body',location="form",type=str, required=True)
upload_parser.add_argument('updated_at',location="form",type=str, required=True)
upload_parser.add_argument('file' , location="files",type=FileStorage,required=False)

user_model = post.model('User',{
    'username':fields.String(),
    'image':fields.String(),
    'profile_img_url':fields.String(),
    'verified':fields.Boolean()
})

post_model = post.model("Post",{
    'id':fields.Integer(),
    'body':fields.String(),
    'updated_at':fields.String(),
    'image':fields.String(),
    'image_url':fields.String(),
    'likes':fields.Integer(),
    'liked':fields.Boolean(),
    'comment_count':fields.Integer(),
    'author':fields.Nested(user_model),
})

@post.route('/')
class PostApi(Resource):
    @jwt_required()
    @post.marshal_with(post_model)
    def get(self):
        posts = Post.query.order_by(Post.updated_at.desc()).all()     
        post_list = []

        current_user = get_jwt_identity()
        user = User.query.filter_by(email = current_user).first()


        for post in posts:
            author = post.author 

            num_likes = Likes.query.filter_by(post_id = post.id).count()
            comment_count = Comment.query.filter_by(post_id = post.id).count()


            likes = Likes.query.filter_by(post_id = post.id).all()
            # User liked posts
            

            liked = False
            for like in likes:
                if like.user_id == user.id:
                    liked = True
                    break

            post_dict = {
                'id':post.id,
                'body':post.body,
                'updated_at':post.updated_at,
                'image':post.image,
                'likes':num_likes,
                'liked':liked,
                'comment_count':comment_count,
                'author':{
                    'username':author.username,
                    'image':author.image,
                    'verified':author.verified
                }
            }    

            if post.image:
                post_dict['image_url'] = url_for('uploaded_file',filename=post.image)
            else:
                post_dict['image_url'] = None


            if author.image:
                post_dict['author']['profile_img_url'] = url_for('uploaded_file',filename=author.image)
            else:
                post_dict['author']['profile_img_url'] = None
            
            post_list.append(post_dict)
           
                
        return post_list



    @jwt_required()
    @post.expect(upload_parser)
    def post(self):
        args = upload_parser.parse_args()

        body = args['body']
        file = args['file']
        updated_at = args['updated_at']

        current_user = get_jwt_identity()
        user = User.query.filter_by(email=current_user).first()
        # print(user.email)

        
        if file:
            filename = str(uuid.uuid4())+os.path.splitext(file.filename)[1]
            posta = Post(body=body,image=filename,author=user , updated_at=updated_at)
            db.session.add(posta)
            db.session.commit()
            save_image(file=file,filename=filename)

        else:
            posta  = Post(body=body,author=user,updated_at=updated_at)
            db.session.add(posta)
            db.session.commit()

        return {'sucess':'Post created'},201

@post.route('/<int:id>/edit')
class EditPost(Resource):
    @jwt_required
    @post.expect(upload_parser)
    def put(self ,id):

        args = upload_parser.parse_args()

        body = args['body']
        image = args['file']


        post = Post.query.filter_by(id=id).first()


        if not post:
            return {'error':'Post not found'},404
        
        if image:
            if post.image:
                filepath = os.path.join(current_app.root_path,current_app.config['UPLOAD_DIRECTORY'],post.image)
                if os.path.exists(filepath):
                    os.remove(filepath)


            filename = str(uuid.uuid4())+os.path.splitext(image.filename)[1]
            image.save(os.path.join(current_app.root_path, current_app.config['UPLOAD_DIRECTORY'] , filename))
        
            post.body = body
            post.image = filename
            post.updated_at = datetime.utcnow()
            db.session.commit()

            return {'message':'Post updated sucessfully'},200

        else:
            post.body = body
            post.body = filename
            post.updated_at = datetime.utcnow()
            db.session.commit()

            return {'message':'Post updated sucessfully'},200


@post.route('/<int:id>/comment')
class CommentList(Resource):
    @post.expect(upload_parser)
    @jwt_required()

    def post(self , id):
        args = upload_parser.parse_args()

        content = args['body']
        updated_at = args['updated_at']


        current_user = get_jwt_identity()
        user = User.query.filter_by(email=current_user).first()

        post = Post.query.filter_by(id=id).first()
        comment = Comment(content = content ,updated_at = updated_at ,user_id = user.id , post_id=id)


        if not post:
            return {'error' , f'Post with id {id} not found'},404


        db.session.add(comment)
        db.session.commit()

        return {'message':'Ok'},200
        

@post.route('/<int:id>/like')
class CommentList(Resource):
    @jwt_required()
    def post(self , id):
        current_user = get_jwt_identity()
        user = User.query.filter_by(email=current_user).first()

        post = Post.query.filter_by(id=id).first()
        like = Likes.query.filter_by(user_id=user.id,post_id=id).first()
        

        if not post:
            return {'error':f'Post with {id} not found'},404
        
        if like:
            return {'error':'You already liked the post'},404

     
        new_like = Likes(user_id=user.id,post_id=id)
        db.session.add(new_like)
        db.session.commit()
        return {'message':'ok'},200