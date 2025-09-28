"""Package command for Counter-Strike Discord bot.

Defines the /package command, including autocomplete and embed handling.
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


class Package(Extension):
    """Represents the /package command.

    Retrieves all info for a Counter-Strike package, handles
    choice autocomplete, and calls the Discord embeded message.
    """

    @slash_command(name="package", description="View a Counter-Strike Package")
    @slash_option(
        name="name",
        description="Package Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def package(self, ctx: SlashContext, name: str):
        """Get the embeded Discord message for a package.

        Builds the Discord embeded message for a Counter-Strike package.
        """

        embed = await build_embed("packages", name)
        await ctx.send(embed=embed)
        logger.info(f"{ctx.author} viewed a package")

    @package.autocomplete("name")
    async def package_autocomplete(self, ctx: AutocompleteContext):
        """Get autocomplete choices for Counter-Strike packages.

        Searches the packages table for names that match
        the user's input of a Counter-Strike package.
        """

        input = ctx.input_text or ""
        choices = await get_choices("packages", input)
        await ctx.send(
            choices=[
                {"name": choice.name, "value": choice.name}
                for choice in choices
            ]
        )
