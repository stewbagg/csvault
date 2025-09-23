from bot.utils.settings import logger, settings
from datetime import date
from psycopg_pool import AsyncConnectionPool
from psycopg.rows import class_row
from pydantic import BaseModel


def conninfo():
    """Build the database connection string for Psycopg3.

    Uses settings provided by Pydantic to format the connection string.

    Returns:
        str: The database connection string formatted for Psycopg3.
    """

    return f"dbname={settings.db_name} user={settings.db_user} host={settings.db_host} password={settings.db_pass}"


class Choice(BaseModel):
    """Represents a user choice.

    Attributes:
        name (str): The choice's name.
    """

    name: str


class Metadata(BaseModel):
    """Represents item metadata.

    Attributes:
        id (int): The item’s database ID.
        name (str): The item’s name.
        release_date (date): The item’s release date.
        icon_url (str): The item’s icon URL.
        case_name (str): The item’s case name.
        collection_id (int): The item’s collection ID.
        collection_name (str): The item’s collection name.
        packages (str): The item’s package names.
    """

    id: int | None = None
    name: str | None = None
    release_date: date | None = None
    icon_url: str | None = None
    case_name: str | None = None
    collection_id: int | None = None
    collection_name: str | None = None
    packages: str | None = None


class Item(BaseModel):
    """Represents an item from a collection, case, or package.

    Attributes:
        name (str): The item's name.
        grade (str): The item's grade.
    """

    name: str
    grade: str


pool = AsyncConnectionPool(conninfo=conninfo(), open=False)


async def get_choices(category: str, input: str) -> list[Choice]:
    """Get matching choices from the database.

    Searches the specified category table for names that match the user's input.

    Args:
        category (str): The category to search in ("cases", "collections", "packages").
        input (str): The user's search input.

    Returns:
        list[Choice]: A list of up to 25 closest matches.
    """

    async with (
        pool.connection() as conn,
        conn.cursor(row_factory=class_row(Choice)) as cur,
    ):
        match category:
            case "cases":
                await cur.execute(
                    "SELECT name FROM cases WHERE cases.name ILIKE %s LIMIT 25",
                    (f"%{input}%",),
                )
            case "collections":
                await cur.execute(
                    "SELECT name FROM collections WHERE collections.name ILIKE %s LIMIT 25",
                    (f"%{input}%",),
                )
            case "packages":
                await cur.execute(
                    "SELECT name FROM packages WHERE packages.name ILIKE %s LIMIT 25",
                    (f"%{input}%",),
                )
        return await cur.fetchall()


async def get_items(category: str, id: int) -> list[Item]:
    """Get items belonging to a category.

    Retrieves item names and grades from the database for the given category.

    Args:
        category (str): The category to search in ("cases", "collections", "packages").
        id (int): The database ID of the category entry.

    Returns:
        list[Item]: A list of items in the specified category.
    """

    async with (
        pool.connection() as conn,
        conn.cursor(row_factory=class_row(Item)) as cur,
    ):
        match category:
            case "cases":
                await cur.execute(
                    "SELECT name, grade FROM skins WHERE case_id = %s", (id,)
                )
            case "collections" | "packages":
                await cur.execute(
                    "SELECT name, grade FROM skins WHERE collection_id = %s", (id,)
                )
        return await cur.fetchall()


async def get_metadata(category: str, name: str) -> Metadata | None:
    """Get metadata for a specific item.

    Retrieves metadata from the database for the given category and item name.

    Args:
        category (str): The category to search in ("cases", "collections", "packages").
        name (str): The name of the item.

    Returns:
        Metadata | None: The item's metadata, or None if not found.
    """

    async with (
        pool.connection() as conn,
        conn.cursor(row_factory=class_row(Metadata)) as cur,
    ):
        match category:
            case "cases":
                await cur.execute(
                    "SELECT cases.id, cases.release_date, cases.icon_url, cases.collection_id, collections.name AS collection_name FROM cases LEFT JOIN collections ON cases.collection_id = collections.id WHERE cases.name = %s",
                    (name,),
                )
            case "collections":
                await cur.execute(
                    "SELECT collections.id, collections.release_date, collections.icon_url, cases.name AS case_name, STRING_AGG(packages.name, '\n') AS packages FROM collections LEFT JOIN cases ON cases.collection_id = collections.id LEFT JOIN packages ON packages.collection_id = collections.id WHERE collections.name = %s GROUP BY collections.id, collections.release_date, collections.icon_url, cases.name",
                    (name,),
                )
            case "packages":
                await cur.execute(
                    "SELECT packages.id, packages.release_date, packages.icon_url, packages.collection_id, collections.name AS collection_name FROM packages LEFT JOIN collections ON packages.collection_id = collections.id WHERE packages.name = %s",
                    (name,),
                )
        return await cur.fetchone()
