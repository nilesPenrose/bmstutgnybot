import asyncio
import logging
from tgbot.misc.states import UserEvents
import psycopg2
from aiogram import Bot, Dispatcher
from aiogram.contrib.fsm_storage.memory import MemoryStorage
from aiogram.contrib.fsm_storage.redis import RedisStorage2
import sys
from tgbot.config import load_config
from tgbot.filters.admin import AdminFilter, StickerFilter
from tgbot.handlers.admin import register_admin
from tgbot.handlers.echo import register_echo
from tgbot.handlers.user import register_user
from tgbot.middlewares.environment import EnvironmentMiddleware
from tgbot.middlewares.throttling import ThrottlingMiddleware
from aiogram.contrib.middlewares.logging import LoggingMiddleware
logger = logging.getLogger(__name__)


def register_all_middlewares(dp, config):
    dp.setup_middleware(EnvironmentMiddleware(config=config))
    dp.setup_middleware(ThrottlingMiddleware())


def register_all_filters(dp):
    dp.filters_factory.bind(AdminFilter)
    dp.filters_factory.bind(StickerFilter)

def register_all_handlers(dp):
    register_admin(dp)
    register_user(dp)
    register_echo(dp)


async def set_base_state(dp:Dispatcher):
    connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                  password="qwerty")
    cursor = connection.cursor()
    postgres_insert_query = """ select * from clients;"""

    cursor.execute(postgres_insert_query)
    clients = cursor.fetchall()
    for row in clients:
        # print(row)
        cur_state = dp.current_state(chat=row[0], user=row[0])
        await cur_state.set_state(UserEvents.main_menu)
    cursor.close()
    connection.close()

async def main():
    logging.basicConfig(
        level=logging.INFO,
        format=u'%(filename)s:%(lineno)d #%(levelname)-8s [%(asctime)s] - %(name)s - %(message)s',
    )
    logger.info("Starting bot")

    config = load_config(".env.dist_test") if sys.argv[1] == 'test' else load_config(".env.dist")
    storage = RedisStorage2() if config.tg_bot.use_redis else MemoryStorage()

    bot = Bot(token=config.tg_bot.token, parse_mode='HTML')
    dp = Dispatcher(bot, storage=storage)
    dp.middleware.setup(LoggingMiddleware())
    bot['config'] = config

    register_all_middlewares(dp, config)
    register_all_filters(dp)
    register_all_handlers(dp)
    await set_base_state(dp)

    # start
    try:
        await dp.start_polling()
    finally:
        await dp.storage.close()
        await dp.storage.wait_closed()
        await bot.session.close()


if __name__ == '__main__':
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        logger.error("Bot stopped!")
