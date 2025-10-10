import interactions


class Foo(interactions.Extension):
    @interactions.slash_command("foo", description="Foo command")
    async def foo(self, ctx: interactions.SlashContext):
        await ctx.send("Bar!")
