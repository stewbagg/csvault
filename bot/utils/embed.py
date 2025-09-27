"""Embed helper for Counter-Strike Discord bot.

Defines embed data, handling, and formatting used for the bot.
"""

from bot.utils.db import get_metadata, get_items
from interactions import Color, Embed


async def build_embed(category: str, name: str) -> Embed | None:
    """Build a Discord embeded message.

    Builds an embeded Discord message based on category choice and item name.

    Args:
        category (str): The category to search in ("cases", "collections", "packages").
        name (str): The name of the item.

    Returns:
        Embed | None: The embeded Discord messsage, or None if no metadata is found.
    """

    metadata = await get_metadata(category, name)
    if metadata == None:
        return None

    containers = f"**Case/Package(s):** None\n"
    if metadata.case_name != None:
        containers = f"**Case:** {metadata.case_name}\n"
    elif metadata.packages != None:
        packages = metadata.packages.split("\n")
        containers = "**Package(s):**\n" + "\n".join(packages) + "\n"

    match category:
        case "cases" | "collections" | "skins":
            items = await get_items(category, metadata.id)
        case "packages":
            items = await get_items(category, metadata.collection_id)

    if category != "skins":
        item_count = f"**Items:** {len(items)}"

    release_date = f"**Released:** {metadata.release_date.strftime('%m/%d/%Y')}\n"
    collection = f"**Collection:** {metadata.collection_name}\n"
    if category == "skins":
        grade = f"**Grade:** {items.grade}\n"

    match category:
        case "cases" | "packages":
            description = f"{release_date}{collection}{item_count}"
        case "collections":
            description = f"{release_date}{containers}{item_count}"
        case "skins":
            description = f"{release_date}{collection}{containers}{grade}"

    embed = Embed(
        title=name,
        description=description,
    )
    match category:
        case "cases" | "packages" | "skins":
            embed.set_thumbnail(url=metadata.collection_icon_url)
            embed.set_image(url=metadata.icon_url)
        case "collections":
            embed.set_thumbnail(url=metadata.icon_url)

    if category == "skins":
        match items.grade:
            case "Consumer":
                embed.color = Color("#AFAFAF")
            case "Industrial":
                embed.color = Color("#6496E1")
            case "Mil-Spec":
                embed.color = Color("#4B69CD")
            case "Restricted":
                embed.color = Color("#8847FF")
            case "Classified":
                embed.color = Color("#D32CE6")
            case "Covert":
                embed.color = Color("#EB4B4B")
            case "Contraband":
                embed.color = Color("#886A08")

    if category != "skins":
        for item in items[:25]:
            embed.add_field(name=item.name, value=item.grade, inline=True)

    return embed
