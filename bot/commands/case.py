from bot.utils.db import get_choices
from bot.utils.embeds import build_embed
from interactions import AutocompleteContext, Extension, OptionType, slash_command, slash_option, SlashContext

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
        embed = await build_embed("cases", name)
        await ctx.send(embed=embed)
    
    @case.autocomplete("name")
    async def case_autocomplete(self, ctx: AutocompleteContext):
        input = ctx.input_text or ""
        choices = await get_choices("cases", input)
        await ctx.send(choices = [{"name": choice.name, "value": choice.name} for choice in choices])