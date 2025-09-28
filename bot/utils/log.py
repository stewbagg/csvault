"""Log helper for Counter-Strike Discord bot.

Defines the logger and formatting used for logging the bot.
"""

import logging


class CustomFormatter(logging.Formatter):
    """Custom formatter class"""

    grey = "\x1b[38;1m"
    green = "\x1b[42;1m"
    yellow = "\x1b[43;1m"
    red = "\x1b[41;1m"
    bold_red = "\x1b[31;1m"
    reset = "\x1b[0m"

    FORMATS = {
        logging.INFO: grey
        + "[%(asctime)s][%(levelname)7s] %(message)s"
        + reset,
        logging.WARNING: yellow
        + "[%(asctime)s][%(levelname)7s] %(message)s"
        + reset,
        logging.ERROR: red
        + "[%(asctime)s][%(levelname)7s] %(message)s"
        + reset,
        logging.CRITICAL: bold_red
        + "[%(asctime)s][%(levelname)7s] %(message)s"
        + reset,
    }

    def format(self, record):
        log_fmt = self.FORMATS.get(record.levelno)
        formatter = logging.Formatter(log_fmt, datefmt="%I:%M.%S%p")
        return formatter.format(record)


def get_logger(name):
    """Function to get a logger
    Useful for modules that have already
    initialized a logger, such as discord.py
    """
    __logger = logging.getLogger(name)
    __logger.setLevel(logging.INFO)
    __ch = logging.StreamHandler()
    __ch.setFormatter(CustomFormatter())
    __logger.addHandler(__ch)
    return __logger


def init_logger(name="root"):
    """Function to create a designated logger for separate modules"""
    __logger = logging.Logger(name)
    __ch = logging.StreamHandler()
    __ch.setLevel(logging.INFO)
    __ch.setFormatter(CustomFormatter())
    __logger.addHandler(__ch)
    return __logger
