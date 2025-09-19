import atexit
from bot.utils.config import settings, logger
from bot.utils.db import pool
from interactions import Activity, ActivityType, Client, errors, listen
from os import listdir

bot = Client(
    token=f"{settings.token}",
    activity=Activity(name="Counter-Strike Data Hoarder", type=ActivityType.PLAYING),
)


@listen()
async def on_startup():
    await pool.open()
    logger.info(f"Logged in as {bot.user}")


command = [
    f"bot.commands.{f[:-3]}"
    for f in listdir("bot/commands")
    if f.endswith(".py") and not f.startswith("_")
]
for commands in command:
    try:
        bot.load_extension(commands)
        logger.info(f"Loaded {commands}")
    except errors.ExtensionException as e:
        logger.exception(f"Failed to load {commands}.", exc_info=e)

bot.start()
