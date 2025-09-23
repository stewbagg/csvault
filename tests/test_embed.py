import pytest
import pytest_asyncio

from bot.utils.db import pool
from bot.utils.embed import build_embed


@pytest_asyncio.fixture(autouse=True)
async def db_pool():
    await pool.open()


class TestEmbed:
    @pytest.mark.asyncio
    async def test_case_embed(self):
        embed = await build_embed("cases", "CS:GO Weapon Case")
        assert embed
        assert embed.title == "CS:GO Weapon Case"
        assert "The Arms Deal Collection" in embed.description
        assert len(embed.fields) > 0

        garbage = await build_embed("cases", "Random")
        assert garbage is None

    @pytest.mark.asyncio
    async def test_collection_embed(self):
        embed = await build_embed("collections", "The Arms Deal Collection")
        assert embed
        assert embed.title == "The Arms Deal Collection"
        assert "CS:GO Weapon Case" in embed.description
        assert len(embed.fields) > 0

        garbage = await build_embed("collections", "Random")
        assert garbage is None

    @pytest.mark.asyncio
    async def test_package_embed(self):
        embed = await build_embed(
            "packages", "ESL One Katowice 2015 Inferno Souvenir Package"
        )
        assert embed
        assert embed.title == "ESL One Katowice 2015 Inferno Souvenir Package"
        assert "The Inferno Collection" in embed.description
        assert len(embed.fields) > 0

        garbage = await build_embed("packages", "Random")
        assert garbage is None
