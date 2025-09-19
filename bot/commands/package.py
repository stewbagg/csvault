from bot.utils.db import get_choices
from bot.utils.embeds import build_embed
from interactions import (
    AutocompleteContext,
    Extension,
    OptionType,
    slash_command,
    slash_option,
    SlashContext,
)


class Package(Extension):
    @slash_command(name="package", description="View a Counter-Strike Package")
    @slash_option(
        name="name",
        description="Package Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def package(self, ctx: SlashContext, name: str):
        embed = await build_embed("packages", name)
        await ctx.send(embed=embed)

    @package.autocomplete("name")
    async def package_autocomplete(self, ctx: AutocompleteContext):
        input = ctx.input_text or ""
        choices = await get_choices("packages", input)
        await ctx.send(
            choices=[{"name": choice.name, "value": choice.name} for choice in choices]
        )
