"""Agent command for Counter-Strike Discord bot.

Defines the /agent command, including autocomplete and embed handling.
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


class Agent(Extension):
    """Represents the /agent command.

    Retrieves all info for a Counter-Strike agent, handles
    choice autocomplete, and calls the Discord embeded message.
    """

    @slash_command(name="agent", description="View a Counter-Strike Agent")
    @slash_option(
        name="name",
        description="Agent Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def agent(self, ctx: SlashContext, name: str):
        """Get the embeded Discord message for a agent.

        Builds the Discord embeded message for a Counter-Strike agent.
        """

        embed = await build_embed("agents", name)
        await ctx.send(embed=embed)
        logger.info(f"{ctx.author} viewed a agent")

    @agent.autocomplete("name")
    async def agent_autocomplete(self, ctx: AutocompleteContext):
        """Get autocomplete choices for Counter-Strike agents.

        Searches the agents table for names that match
        the user's input of a Counter-Strike agent.
        """

        input = ctx.input_text or ""
        choices = await get_choices("agents", input)
        await ctx.send(
            choices=[
                {"name": choice.name, "value": choice.name}
                for choice in choices
            ]
        )
