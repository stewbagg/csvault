"""Collection command for Counter-Strike Discord bot.

Defines the /collection command, including autocomplete and embed handling.
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


class Collection(Extension):
    """Represents the /collection command.

    Retrieves all info for a Counter-Strike collection, handles
    choice autocomplete, and calls the Discord embeded message.
    """

    @slash_command(
        name="collection", description="View a Counter-Strike Collection"
    )
    @slash_option(
        name="name",
        description="Collection Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def collection(self, ctx: SlashContext, name: str):
        """Get the embeded Discord message for a collection.

        Builds the Discord embeded message for a Counter-Strike collection.
        """

        embed = await build_embed("collections", name)
        await ctx.send(embed=embed)
        logger.info(f"{ctx.author} viewed a collection")

    @collection.autocomplete("name")
    async def collection_autocomplete(self, ctx: AutocompleteContext):
        """Get autocomplete choices for Counter-Strike collections.

        Searches the collections table for names that match
        the user's input of a Counter-Strike collection.
        """

        input = ctx.input_text or ""
        choices = await get_choices("collections", input)
        await ctx.send(
            choices=[
                {"name": choice.name, "value": choice.name}
                for choice in choices
            ]
        )
