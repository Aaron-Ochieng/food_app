import os
from flask import current_app
from PIL import Image


def allowed_files_extensions(filename):
    return '.' in filename and filename.rsplit('.',1)[1].lower() in current_app.config['ALLOWED_EXTENSIONS']

def save_image(file,filename):

    if not allowed_files_extensions(file.filename):
        return  'Invalid file extension'

    img = Image.open(file)
    upload_folder = os.path.join(current_app.root_path ,current_app.config['UPLOAD_DIRECTORY'] )
    file_path = os.path.join(upload_folder , filename)
    # if not os.path.exists(upload_folder):
    #     os.makedirs(upload_folder,exist_ok=True)
    img.save(file_path, options=True , quality=10 , format="JPEG")
    