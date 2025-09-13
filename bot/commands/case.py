from bot.utils.db import pool
from interactions import AutocompleteContext, Extension, OptionType, slash_command, slash_option, SlashContext
from psycopg.rows import class_row
from pydantic import BaseModel

class Cases(BaseModel):
    name: str

# TODO: move to handler for reuse
async def get_cases(input):
    async with pool.connection() as conn, conn.cursor(row_factory=class_row(Cases)) as cur:
        await cur.execute("SELECT name FROM cases WHERE name ILIKE %s LIMIT 25", (f"%{input}%",))
        cases = await cur.fetchall()
        return cases

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
        await ctx.send()
    
    @case.autocomplete("name")
    async def case_autocomplete(self, ctx: AutocompleteContext):
        user_input = ctx.input_text or ""
        cases = await get_cases(user_input)
        await ctx.send(choices = [{"name": case.name, "value": case.name} for case in cases])