from bot.utils.config import settings
from datetime import date
from psycopg_pool import AsyncConnectionPool
from psycopg.rows import class_row
from pydantic import BaseModel


def conninfo():
    return f"""
    dbname={settings.db_name} 
    user={settings.db_user} 
    host={settings.db_host} 
    password={settings.db_pass}
    """


class Choice(BaseModel):
    name: str


class Metadata(BaseModel):
    id: int | None = None
    name: str | None = None
    release_date: date
    icon_url: str | None = None
    case_name: str | None = None
    collection_id: int | None = None
    collection_name: str | None = None
    packages: str | None = None


class Items(BaseModel):
    name: str
    grade: str


pool = AsyncConnectionPool(conninfo=conninfo(), open=False)


async def get_choices(category: str, input: str):
    async with pool.connection() as conn, conn.cursor(
        row_factory=class_row(Choice)
    ) as cur:
        if category == "cases":
            await cur.execute(
                "SELECT name FROM cases WHERE cases.name ILIKE %s LIMIT 25",
                (f"%{input}%",),
            )
        elif category == "collections":
            await cur.execute(
                "SELECT name FROM collections WHERE collections.name ILIKE %s LIMIT 25",
                (f"%{input}%",),
            )
        elif category == "packages":
            await cur.execute(
                "SELECT name FROM packages WHERE packages.name ILIKE %s LIMIT 25",
                (f"%{input}%",),
            )
        choices = await cur.fetchall()
        return choices


async def get_items(category: str, id: int):
    async with pool.connection() as conn, conn.cursor(
        row_factory=class_row(Items)
    ) as cur:
        if category == "cases":
            await cur.execute("SELECT name, grade FROM skins WHERE case_id = %s", (id,))
        elif category == "collections" or "packages":
            await cur.execute(
                "SELECT name, grade FROM skins WHERE collection_id = %s", (id,)
            )
        items = await cur.fetchall()
        return items


async def get_metadata(category: str, name: str):
    async with pool.connection() as conn, conn.cursor(
        row_factory=class_row(Metadata)
    ) as cur:
        if category == "cases":
            await cur.execute(
                "SELECT cases.id, cases.release_date, cases.icon_url, cases.collection_id, collections.name AS collection_name FROM cases LEFT JOIN collections ON cases.collection_id = collections.id WHERE cases.name = %s",
                (name,),
            )
        elif category == "collections":
            await cur.execute(
                "SELECT collections.id, collections.release_date, collections.icon_url, cases.name AS case_name, STRING_AGG(packages.name, '\n') AS packages FROM collections LEFT JOIN cases ON cases.collection_id = collections.id LEFT JOIN packages ON packages.collection_id = collections.id WHERE collections.name = %s GROUP BY collections.id, collections.release_date, collections.icon_url, cases.name",
                (name,),
            )
        elif category == "packages":
            await cur.execute(
                "SELECT packages.id, packages.release_date, packages.icon_url, packages.collection_id, collections.name AS collection_name FROM packages LEFT JOIN collections ON packages.collection_id = collections.id WHERE packages.name = %s",
                (name,),
            )
        metadata = await cur.fetchone()
        return metadata
