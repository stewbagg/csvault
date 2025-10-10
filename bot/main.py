"""Main entry point for project.

Defines the startup and command list for the project.
"""

import os
import sys

import interactions
from core.config import config
from core.logging import logger

if not config.token:
    logger.critical("token variable not set. Exiting...")
    sys.exit(1)

bot = interactions.Client(
    token=f"{config.token}",
    activity=interactions.Activity(
        name="with database", type=interactions.ActivityType.PLAYING
    ),
)


@interactions.listen()
async def startup():
    logger.info(f"Logged in as {bot.user}")
    logger.info("-------------------------")


commands = [
    f"commands.{f[:-3]}"
    for f in os.listdir("bot/commands")
    if f.endswith(".py") and not f.startswith("_")
]
for command in commands:
    try:
        bot.load_extension(command)
        logger.info(f"Loaded {command}")
    except interactions.errors.ExtensionLoadException as e:
        logger.exception(f"Failed to load {command}.", exc_info=e)

bot.start()
