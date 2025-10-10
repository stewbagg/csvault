"""Logger helper.

Defines the logger for the project.

Attribution:
https://github.com/savioxavier/repo-finder-bot/
"""

import logging
import os


class CustomFormatter(logging.Formatter):
    """Custom formatter class"""

    grey = "\x1b[38;1m"
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


def overwrite_ipy_loggers():
    for k, v in logging.Logger.manager.loggerDict.items():
        print(k, v)
        if k in ["mixin", "dispatch", "http", "gateway", "client", "context"]:
            for h in v.handlers:
                h.setFormatter(CustomFormatter)


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


logger = init_logger(os.path.basename(__file__))
