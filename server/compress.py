from PIL import Image


img = Image.open('/home/pepe/Desktop/IMG20230118100413.jpg')


img.save('/home/pepe/Desktop/compressed.jpg' ,options=True , quality=10 , format="JPEG")


