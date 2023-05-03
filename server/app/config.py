from datetime import timedelta


class Config:
    SECRET_KEY = "8990280b-3825-4c9f-8cc6-5406c47a43c3"
    SQLALCHEMY_DATABASE_URI = "sqlite:///posts.db"
    RESTX_VALIDATE = True
    RESTX_MASK_SWAGGER = False
    ERROR_404_HELP=False


    UPLOAD_DIRECTORY = 'static'
    ALLOWED_EXTENSIONS = {'png','jpg','jpeg','gif'}


    JWT_SECRET_KEY = '816a761c-124b-4d3f-8d5f-91a4be5e27b1'
    JWT_HEADER_TYPE = "Bearer"
    JWT_ACCESS_TOKEN_EXPIRES = timedelta(days=30)