from bot.utils.db import pool
from interactions import AutocompleteContext, Extension, OptionType, slash_command, slash_option, SlashContext
from psycopg.rows import class_row
from pydantic import BaseModel

class Cases(BaseModel):
    name: str

async def get_cases():
    async with pool.connection() as conn, conn.cursor(row_factory=class_row(Cases)) as cur:
        await cur.execute("SELECT name FROM cases")
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
        cases = await get_cases()
        user_input = ctx.input_text or ""
        filtered_cases = [
            case for case in cases
            if user_input.lower() in case.name.lower()
        ]
        filtered_cases = filtered_cases[:25]
        await ctx.send(choices = [{"name": case.name, "value": case.name} for case in filtered_cases])