from bot.utils.log import init_logger
from os import path
from pydantic_settings import BaseSettings, SettingsConfigDict


logger = init_logger(path.basename(__file__))


class Settings(BaseSettings):
    """Represents bot and database settings.

    Fetches Psycopg3 database connection info and Interactions-py bot credentials from .env using Pydantic.

    Attributes:
        app_id (str): The Discord application ID.
        token (str): The Discord bot token.
        public_key (str): The Discord public key.
        db_name (str): The PostgreSQL database name.
        db_user (str): The PostgreSQL database username.
        db_host (str): The PostgreSQL database hostname.
        db_pass (str): The PostgreSQL database password.
    """

    app_id: str
    token: str
    public_key: str
    db_name: str
    db_user: str
    db_host: str
    db_pass: str

    model_config = SettingsConfigDict(env_file=".env")


settings = Settings()
