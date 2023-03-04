from flask import Flask, jsonify

app = Flask(__name__)

# List of articles
articles = [
    {"id": 1, "name": "SQOIN 1"},
    {"id": 2, "name": "SQOIN 2"},
    {"id": 3, "name": "SQOIN 3"},
    {"id": 4, "name": "SQOIN 4"},
    {"id": 5, "name": "SQOIN 5"},
    {"id": 6, "name": "SQOIN 6"},
    {"id": 7, "name": "SQOIN 7"},
    {"id": 8, "name": "SQOIN 8"},
    {"id": 9, "name": "SQOIN 9"},
    {"id": 10, "name": "SQOIN 30"},
]

@app.route("/")
def hello():
    # Return the first 10 articles in JSON format
    return jsonify(articles[:10])

if __name__ == "__main__":
    app.run(host="0.0.0.0")
