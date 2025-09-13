from bot.utils.db import pool
from datetime import date
from interactions import AutocompleteContext, Embed, EmbedAttachment, EmbedField, Extension, OptionType, slash_command, slash_option, SlashContext
from psycopg.rows import class_row
from pydantic import BaseModel

class Name(BaseModel):
    name: str

class Metadata(BaseModel):
    name: str
    id: int
    release_date: date
    icon_url: str
    collection_name: str

class Contents(BaseModel):
    name: str
    grade: str

# TODO: move to wrapper for reuse
async def get_cases(input):
    async with pool.connection() as conn, conn.cursor(row_factory=class_row(Name)) as cur:
        await cur.execute("SELECT cases.name FROM cases WHERE cases.name ILIKE %s LIMIT 25", (f"%{input}%",))
        names = await cur.fetchall()
        return names

async def get_case_metadata(name):
    async with pool.connection() as conn, conn.cursor(row_factory=class_row(Metadata)) as cur:
        await cur.execute("SELECT cases.id, cases.name, cases.release_date, cases.icon_url, cases.collection_id, collections.name AS collection_name FROM cases LEFT JOIN collections on cases.collection_id = collections.id WHERE cases.name = %s", (name,))
        metadata = await cur.fetchone()
        return metadata

async def get_case_contents(id):
    async with pool.connection() as conn, conn.cursor(row_factory=class_row(Contents)) as cur:
        await cur.execute("SELECT name, grade FROM skins WHERE case_id = %s", (id,))
        skins = await cur.fetchall()
        return skins

async def case_embed(name):
    metadata = await get_case_metadata(name)
    skins = await get_case_contents(metadata.id) # type: ignore
    fields = []
    for skin in skins:
        fields.append(EmbedField(name = skin.name, value = skin.grade, inline = True))
    embed = Embed(
        title = metadata.name, # type: ignore
        description = f"**Released:** {metadata.release_date.strftime('%m/%d/%Y')}\n**Collection**: {metadata.collection_name}\n**Skins**: {len(skins)}", # type: ignore
        thumbnail = EmbedAttachment(url = metadata.icon_url), # type: ignore
        fields = fields
    )
    return embed

class Case(Extension):
    @slash_command(name="case", description="View a Counter-Strike Case")
    @slash_option(
        name="name",
        description="Case Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def case(self, ctx: SlashContext, name: str):
        embed = await case_embed(name)
        await ctx.send(embed=embed)
    
    @case.autocomplete("name")
    async def case_autocomplete(self, ctx: AutocompleteContext):
        user_input = ctx.input_text or ""
        cases = await get_cases(user_input)
        await ctx.send(choices = [{"name": case.name, "value": case.name} for case in cases])