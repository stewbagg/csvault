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


class Collection(Extension):
    @slash_command(name="collection", description="View a Counter-Strike Collection")
    @slash_option(
        name="name",
        description="Collection Name",
        required=True,
        opt_type=OptionType.STRING,
        autocomplete=True,
    )
    async def collection(self, ctx: SlashContext, name: str):
        embed = await build_embed("collections", name)
        await ctx.send(embed=embed)

    @collection.autocomplete("name")
    async def collection_autocomplete(self, ctx: AutocompleteContext):
        input = ctx.input_text or ""
        choices = await get_choices("collections", input)
        await ctx.send(
            choices=[{"name": choice.name, "value": choice.name} for choice in choices]
        )
