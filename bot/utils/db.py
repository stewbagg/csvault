from psycopg_pool import AsyncConnectionPool
from bot.utils.config import settings

def conninfo():
    return f"""
    dbname={settings.db_name} 
    user={settings.db_user} 
    host={settings.db_host} 
    password={settings.db_pass}
    """

pool = AsyncConnectionPool(conninfo=conninfo(), open=False)