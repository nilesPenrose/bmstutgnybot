import typing

import aiogram.types
from aiogram.dispatcher.filters import BoundFilter

from tgbot.config import Config


class AdminFilter(BoundFilter):
    key = 'is_admin'

    def __init__(self, is_admin: typing.Optional[bool] = None):
        self.is_admin = is_admin

    async def check(self, obj):
        if self.is_admin is None:
            return False
        config: Config = obj.bot.get('config')
        return (obj.from_user.id in config.tg_bot.admin_ids) == self.is_admin


class StickerFilter(BoundFilter):
    key = 'is_sticker'

    def __init__(self, is_sticker: typing.Optional[bool] = None):
        self.is_sticker = is_sticker

    async def check(self, obj):
        if self.is_sticker is None:
            return False
        print(obj.sticker is None)
        return obj.sticker is None
