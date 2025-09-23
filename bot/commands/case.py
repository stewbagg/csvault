from bot.utils.db import get_choices
from bot.utils.embed import build_embed
from interactions import (
    AutocompleteContext,
    Extension,
    OptionType,
    slash_command,
    slash_option,
    SlashContext,
)


class Case(Extension):
    """Represents the /case command.

    Retrieves all info for a Counter-Strike case, handles choice autocomplete, and calls the Discord embeded message.
    """

    @slash_command(name="case", description="View a Counter-Strike Case")
    @slash_option(
        name="name",
        description="Case Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def case(self, ctx: SlashContext, name: str):
        """Get the embeded Discord message for a case.

        Builds the Discord embeded message for a Counter-Strike case.
        """

        embed = await build_embed("cases", name)
        await ctx.send(embed=embed)

    @case.autocomplete("name")
    async def case_autocomplete(self, ctx: AutocompleteContext):
        """Get autocomplete choices for Counter-Strike cases.

        Searches the case table for names that match the user's input of a Counter-Strike case.
        """
        input = ctx.input_text or ""
        choices = await get_choices("cases", input)
        await ctx.send(
            choices=[{"name": choice.name, "value": choice.name} for choice in choices]
        )
