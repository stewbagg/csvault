"""Skin command for Counter-Strike Discord bot.

Defines the /skin command, including autocomplete and embed handling.
"""

from interactions import (
    AutocompleteContext,
    Extension,
    OptionType,
    SlashContext,
    slash_command,
    slash_option,
)

from bot.utils.db import get_choices
from bot.utils.embed import build_embed
from bot.utils.settings import logger


class Skin(Extension):
    """Represents the /skin command.

    Retrieves all info for a Counter-Strike skin, handles
    choice autocomplete, and calls the Discord embeded message.
    """

    @slash_command(name="skin", description="View a Counter-Strike Skin")
    @slash_option(
        name="name",
        description="Skin Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def skin(self, ctx: SlashContext, name: str):
        """Get the embeded Discord message for a skin.

        Builds the Discord embeded message for a Counter-Strike skin.
        """

        embed = await build_embed("skins", name)
        await ctx.send(embed=embed)
        logger.info(f"{ctx.author} viewed a skin")

    @skin.autocomplete("name")
    async def skin_autocomplete(self, ctx: AutocompleteContext):
        """Get autocomplete choices for Counter-Strike skins.

        Searches the skins table for names that match
        the user's input of a Counter-Strike skin.
        """

        input = ctx.input_text or ""
        choices = await get_choices("skins", input)
        await ctx.send(
            choices=[
                {"name": choice.name, "value": choice.name}
                for choice in choices
            ]
        )
