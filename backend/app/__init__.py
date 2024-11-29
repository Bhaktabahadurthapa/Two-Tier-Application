from flask import Flask
from flask_cors import CORS
from .config import Config

def create_app():
    app = Flask(__name__)
    CORS(app)
    app.config.from_object(Config)
    
    from .routes import user_routes
    app.register_blueprint(user_routes.bp)
    
    return app
