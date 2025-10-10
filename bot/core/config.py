"""Config helper.

Defines the config for the project.
"""

from pydantic_settings import BaseSettings, SettingsConfigDict


class Config(BaseSettings):
    """Represents project settings.

    Fetches Psycopg3 database connection info and
    Discord bot credentials from .env using Pydantic.

    Attributes:
        app_id (str): The Discord application ID.
        token (str): The Discord bot token.
        public_key (str): The Discord public key.
        db_name (str): The Postgres database name.
        db_user (str): The Postgres database username.
        db_host (str): The Postgres database hostname.
    """

    app_id: str
    token: str
    public_key: str
    db_name: str
    db_user: str
    db_host: str

    model_config = SettingsConfigDict(env_file=".env")


config = Config()
