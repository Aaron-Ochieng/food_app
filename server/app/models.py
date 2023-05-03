from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import check_password_hash,generate_password_hash
import uuid
from datetime import datetime

db = SQLAlchemy()

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True , index=True)
    username  = db.Column(db.String(50) )
    image = db.Column(db.String(256) , nullable=True , default='')
    email  = db.Column(db.String(50), unique=True , nullable=False )
    password  = db.Column(db.String(100), nullable=False )
    verified = db.Column(db.Boolean ,nullable = True,default=False )
    # posts = db.relationship('Post',backref='author',lazy=True)   
    updated_at = db.Column(db.DateTime ,nullable=False, default=datetime.utcnow)
    sent_messages = db.relationship('Message',backref='sender',lazy=True,foreign_keys='Message.sender_id')
    recieved_messages = db.relationship('Message',backref='recipient',lazy=True,foreign_keys='Message.recipient_id')


    def __init__(self,username,email,password):
        self.username = username
        self.email = email
        self.password = generate_password_hash(password)

    def check_password_hash(self,password):
        return check_password_hash(self.password, password)




class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True , index=True)
    body = db.Column(db.Text, nullable = False)
    image = db.Column(db.String(256) , nullable=True)
    updated_at = db.Column(db.String(100),nullable=False)
    likes = db.relationship('Likes',backref='post',lazy=True)
    user_id = db.Column(db.Integer , db.ForeignKey('user.id') , nullable=False)
    author = db.relationship('User',backref=db.backref('posts',lazy=True))    


class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True , index=True)
    body = db.Column(db.Text(),nullable=False)
    timestamp = db.Column(db.DateTime , nullable=False, default=datetime.utcnow)
    sender_id = db.Column(db.Integer , db.ForeignKey('user.id') , nullable=False)
    recipient_id = db.Column(db.Integer , db.ForeignKey('user.id') , nullable=False)

class Comment(db.Model):
    id = db.Column(db.Integer, primary_key=True , index=True)
    content = db.Column(db.Text,nullable=False)
    updated_at = db.Column(db.String(100),nullable=False)
    user_id = db.Column(db.Integer ,db.ForeignKey('user.id') , nullable=False)
    post_id = db.Column(db.Integer ,db.ForeignKey('post.id') , nullable=False)
    
class Likes(db.Model):
    id = db.Column(db.Integer, primary_key=True , index=True)
    user_id = db.Column(db.Integer ,db.ForeignKey('user.id') , nullable=False)
    post_id = db.Column(db.Integer ,db.ForeignKey('post.id') , nullable=False)
    