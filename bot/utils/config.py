from bot.utils.log import init_logger
from os import path
from pydantic_settings import BaseSettings, SettingsConfigDict

logger = init_logger(path.basename(__file__))

class Settings(BaseSettings):
    app_id: str
    token: str
    public_key: str
    db_name: str
    db_user: str
    db_host: str
    db_pass: str

    model_config = SettingsConfigDict(env_file='.env')

settings = Settings() #type: ignore