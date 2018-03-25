from flask import Flask, render_template


app = Flask(__name__, static_folder="../static/dist", template_folder="../static")


@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def index(path):
    return render_template("index.html")

@app.route("/resume")
def resume():
    return "Hello this is the resume page yea"


if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host='0.0.0.0', debug=True, port=80)
