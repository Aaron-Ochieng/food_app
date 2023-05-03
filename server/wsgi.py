from app import create_index



app = create_index()


if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=5000)
