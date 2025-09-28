"""Unit tests for the database helper of the Counter-Strike Discord bot."""

import pytest
import pytest_asyncio

from bot.utils.db import get_choices, get_items, get_metadata, pool


@pytest_asyncio.fixture(autouse=True)
async def db_pool():
    await pool.open()


class TestDB:
    @pytest.mark.asyncio
    async def test_get_agent_choices(self):
        choices = await get_choices("agents", "")
        assert choices

        fragment_choices = await get_choices("agents", "Cr")
        assert any("cr" in choice.name.lower() for choice in fragment_choices)

        garbage_choices = await get_choices("agents", "Random")
        assert garbage_choices == []

    @pytest.mark.asyncio
    async def test_get_case_choices(self):
        choices = await get_choices("cases", "")
        assert choices

        fragment_choices = await get_choices("cases", "CS")
        assert any("cs" in choice.name.lower() for choice in fragment_choices)

        garbage_choices = await get_choices("cases", "Random")
        assert garbage_choices == []

    @pytest.mark.asyncio
    async def test_get_collection_choices(self):
        choices = await get_choices("collections", "")
        assert choices

        fragment_choices = await get_choices("collections", "Ar")
        assert any("ar" in choice.name.lower() for choice in fragment_choices)

        garbage_choices = await get_choices("collections", "Random")
        assert garbage_choices == []

    @pytest.mark.asyncio
    async def test_get_package_choices(self):
        choices = await get_choices("packages", "")
        assert choices

        fragment_choices = await get_choices("packages", "2013")
        assert any(
            "2013" in choice.name.lower() for choice in fragment_choices
        )

        garbage_choices = await get_choices("packages", "Random")
        assert garbage_choices == []

    @pytest.mark.asyncio
    async def test_get_skins_choices(self):
        choices = await get_choices("skins", "")
        assert choices

        fragment_choices = await get_choices("skins", "AK")
        assert any("ak" in choice.name.lower() for choice in fragment_choices)

        garbage_choices = await get_choices("skins", "Random")
        assert garbage_choices == []

    @pytest.mark.asyncio
    async def test_get_agent(self):
        item = await get_items("agents", 2)
        assert item
        assert "Exceptional" in item.grade

        garbage_items = await get_items("agents", 0)
        assert garbage_items is None

    @pytest.mark.asyncio
    async def test_get_case_items(self):
        items = await get_items("cases", 1)
        assert items
        assert any("AWP | Lightning Strike" in item.name for item in items)

        garbage_items = await get_items("cases", 0)
        assert garbage_items == []

    @pytest.mark.asyncio
    async def test_get_collection_items(self):
        items = await get_items("collections", 1)
        assert items
        assert any("AWP | Lightning Strike" in item.name for item in items)

        garbage_items = await get_items("collections", 0)
        assert garbage_items == []

    @pytest.mark.asyncio
    async def test_get_package_items(self):
        items = await get_items("packages", 6)
        assert items
        assert any(
            "Dual Berettas | Anodized Navy" in item.name for item in items
        )

        garbage_items = await get_items("packages", 0)
        assert garbage_items == []

    @pytest.mark.asyncio
    async def test_get_skin(self):
        item = await get_items("skins", 6)
        assert item
        assert "Restricted" in item.grade

        garbage_items = await get_items("skins", 0)
        assert garbage_items is None

    @pytest.mark.asyncio
    async def test_get_agent_metadata(self):
        metadata = await get_metadata(
            "agents", "Col. Mangos Dabisi | Guerrilla Warfare"
        )
        assert metadata
        assert "The Operation Riptide Collection" in metadata.collection_name

        garbage_metadata = await get_metadata("agents", "Random")
        assert garbage_metadata is None

    @pytest.mark.asyncio
    async def test_get_case_metadata(self):
        metadata = await get_metadata("cases", "CS:GO Weapon Case")
        assert metadata
        assert "The Arms Deal Collection" in metadata.collection_name

        garbage_metadata = await get_metadata("cases", "Random")
        assert garbage_metadata is None

    @pytest.mark.asyncio
    async def test_get_collection_metadata(self):
        metadata = await get_metadata(
            "collections", "The Arms Deal Collection"
        )
        assert metadata
        assert "CS:GO Weapon Case" in metadata.case_name

        garbage_metadata = await get_metadata("collections", "Random")
        assert garbage_metadata is None

    @pytest.mark.asyncio
    async def test_get_package_metadata(self):
        metadata = await get_metadata(
            "packages", "ESL One Katowice 2015 Inferno Souvenir Package"
        )
        assert metadata
        assert "The Inferno Collection" in metadata.collection_name

        garbage_metadata = await get_metadata("packages", "Random")
        assert garbage_metadata is None

    @pytest.mark.asyncio
    async def test_get_skin_metadata(self):
        metadata = await get_metadata("skins", "AK-47 | Case Hardened")
        assert metadata
        assert "The Arms Deal Collection" in metadata.collection_name

        garbage_metadata = await get_metadata("skins", "Random")
        assert garbage_metadata is None
