from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/")
def hello():
    return jsonify(
        application="hello-eks-app",
        message="Hello from Amazon EKS!",
        status="running",
    )


@app.get("/healthz")
def health():
    return jsonify(status="healthy")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)