from bot.utils.db import get_metadata, get_items
from interactions import Embed


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
    if metadata is None:
        return None

    containers = f"**Case/Package(s):** None\n"
    if metadata.case_name is not None:
        containers = f"**Case:** {metadata.case_name}\n"
    elif metadata.packages is not None:
        packages = metadata.packages.split("\n")
        containers = "**Package(s):**\n" + "\n".join(packages) + "\n"

    match category:
        case "cases" | "collections":
            items = await get_items(category, metadata.id)
        case "packages":
            items = await get_items(category, metadata.collection_id)
    item_count = f"**Items:** {len(items)}"

    release_date = f"**Released:** {metadata.release_date.strftime('%m/%d/%Y')}\n"
    collection = f"**Collection:** {metadata.collection_name}\n"
    match category:
        case "cases" | "packages":
            description = f"{release_date}{collection}{item_count}"
        case "collections":
            description = f"{release_date}{containers}{item_count}"

    embed = Embed(
        title=name,
        description=description,
    )
    embed.set_thumbnail(url=metadata.icon_url)

    for item in items[:25]:
        embed.add_field(name=item.name, value=item.grade, inline=True)

    return embed
