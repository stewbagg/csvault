from bot.utils.db import get_metadata, get_items
from interactions import Embed, EmbedAttachment, EmbedField


async def build_embed(category: str, name: str):
    metadata = await get_metadata(category, name)

    release_date = f"**Released:** {metadata.release_date.strftime('%m/%d/%Y')}\n"
    collection = f"**Collection:** {metadata.collection_name}\n"

    if category != "packages":
        items = await get_items(category, metadata.id)
    else:
        items = await get_items(category, metadata.collection_id)
    item_count = f"**Items:** {len(items)}"

    fields = []
    for item in items:
        fields.append(EmbedField(name=item.name, value=item.grade, inline=True))

    if metadata.case_name != None:
        containers = f"**Case:** {metadata.case_name}\n"
    elif metadata.packages != None:
        packages = metadata.packages.split("\n")
        containers = "**Package(s):**\n" + "\n".join(packages) + "\n"
    else:
        containers = f"**Case/Package(s):** None\n"

    if category == "collections":
        description = f"{release_date}{containers}{item_count}"
    else:
        description = f"{release_date}{collection}{item_count}"

    thumbnail = EmbedAttachment(url=metadata.icon_url)

    embed = Embed(
        title=name,
        description=description,
        thumbnail=thumbnail,
        fields=fields,
    )
    return embed
