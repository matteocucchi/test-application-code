from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>CIAO MONDO v. 1.4! </p>"