from bot.utils.db import get_metadata, get_items
from interactions import Embed, EmbedAttachment, EmbedField

async def build_embed(category: str, name: str):
    metadata = await get_metadata(category, name)
    release_date = metadata.release_date.strftime('%m/%d/%Y')
    items = await get_items(category, metadata.id)
    item_count = len(items)
    fields = []
    for item in items:
        fields.append(EmbedField(name = item.name, value = item.grade, inline = True))
    containers = ""
    if metadata.packages != None:
        packages = []
        packages = metadata.packages.split("\n")
        containers = f"**Package(s):** "
        for package in packages:
            containers += package

    elif metadata.case != None:
        containers = f"**Case:** {metadata.case}"
    else:
        containers = f"**Case/Package(s):** None"
    thumbnail = EmbedAttachment(url = metadata.icon_url)
    embed = Embed()
    if category == "collections":
        embed = Embed(
            title = metadata.name,
            description = f"**Released:** {release_date}\n{containers}\n**Items:** {item_count}",
            thumbnail = thumbnail,
            fields = fields
        )
    elif category == "cases":
        embed = Embed(
            title = metadata.name,
            description = f"**Released:** {release_date}\n**Collection:** {metadata.collection_name}\n**Items:** {item_count}",
            thumbnail = thumbnail,
            fields = fields
        )
    elif category == "packages":
        embed = Embed(
            title = metadata.name,
            description = f"**Released:** {release_date}\n**Collection:** {metadata.collection_name}\n**Items:** {item_count}",
            thumbnail = thumbnail,
            fields = fields
        )
    return embed