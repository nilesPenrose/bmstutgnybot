import time

import aiogram.types
import gspread
import pandas as pd
import psycopg2
import qrcode
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers import RoundedModuleDrawer, GappedSquareModuleDrawer, CircleModuleDrawer, VerticalBarsDrawer, SquareModuleDrawer, HorizontalBarsDrawer
from qrcode.image.styles.colormasks import RadialGradiantColorMask
from aiogram import Dispatcher
from aiogram.types import CallbackQuery
from aiogram.types import Message
from aiogram.utils.deep_linking import decode_payload
from aiogram.utils.deep_linking import get_start_link
from gspread_dataframe import set_with_dataframe

from tgbot.handlers.template_messages.user_messages import brdct_msg_confirm_registration
from tgbot.keyboards.inline import admin_broadcast, kb1, broadcast
from tgbot.keyboards.reply import confirm_reg
from tgbot.middlewares.throttling import rate_limit
from tgbot.misc.states import AdminEvents


@rate_limit(5)
async def admin_start(message: Message):
    await AdminEvents.main_menu.set()
    await message.reply("Hello, admin! что ты хочешь сделать?", reply_markup=kb1)

    args = message.get_args()
    payload = decode_payload(args)
    if payload:
        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        cursor = connection.cursor()

        query = "select * from clients where chat_id = {}".format(payload)
        cursor.execute(query)
        person = cursor.fetchall()
        if person:
            await message.answer(f"участник найден: {person[0][1]}")

            query = "update clients set confirm_qr='yes' where chat_id={};".format(payload)
            cursor.execute(query)
            connection.commit()
            count = cursor.rowcount
            print("confirm_qr {}".format(count))
            await message.answer("участник зарегистрирован")
            await message.bot.send_message(person[0][0],
                                           """Сани с оленями, конечно, лучше, но автобусы тоже неплохо! Уже совсем скоро ты окажешься в нашем сказочном зимнем лесу, но пока ты находишься в пути, предлагаем вступить в Telegram-канал (https://t.me/+lv644GAvp-tlMzhi) нашего выезда, где будет публиковаться важная информация. Счастливого пути☃️""")
            cursor.close()
            connection.close()

    await message.answer(f"Your payload: {payload}")


@rate_limit(5)
async def admin_menu(message: Message, state=AdminEvents.main_menu):
    if message.text == 'экспорт':
        await message.reply("starting export psql to spreadsheets")
        await message.bot.send_message(message.chat.id,
                                       "https://docs.google.com/spreadsheets/d/1hD7JaiXyh95PI2MDa8p2gSaYG7RHyNE_gWiM_JeLOXM/edit?usp=sharing")
        key = "1hD7JaiXyh95PI2MDa8p2gSaYG7RHyNE_gWiM_JeLOXM"

        # connect to database
        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        print(connection)
        # create dataframe from query
        sql = "SELECT * from clients;"
        df = pd.read_sql(sql, connection)

        print(len(df))
        await message.bot.send_message(message.chat.id,
                                       f"{len(df)} rows was uploaded to the new_year spreadsheet")
        # open the first tab (worksheet) of the Google spreadsheet
        gc = gspread.service_account(
            # filename="/home/gnom/Documents/tg_bots/tgbot_template-master/newyearbmstu-ee871fc0cbd1.json")
            filename="/root/tgbot/bmstutgnybot/newyearbmstu-ee871fc0cbd1.json")
        print(gc)
        sh = gc.open_by_key(key)
        print(sh.id)
        worksheet = sh.get_worksheet(0)
        # #
        # # # write the dataframe to the worksheet
        print(set_with_dataframe(worksheet, df))

    elif message.text == 'рассылка':
        await message.bot.send_message(message.chat.id, "это раздел рассылки")
        # await AdminEvents.broadcast.set()
        await message.reply("на кого рассылка?", reply_markup=admin_broadcast)

    elif message.text == "статистика":
        await message.bot.send_message(message.chat.id, "это раздел статистики, "
                                                        "в будущем здесь будет сводная информация")

    elif message.text == "qr":

        link = await get_start_link(f'{message.chat.id}', encode=True)
        print(str(link))
        qr = qrcode.QRCode(
            version=3,
            error_correction=qrcode.constants.ERROR_CORRECT_L,
            box_size=10,
            border=4,
        )
        qr.add_data(link)
        qr.make(fit=True)
        img_2 = qr.make_image(image_factory=StyledPilImage,
                              color_mask=RadialGradiantColorMask(
                                  back_color = (255,255,255),
                                  center_color = (51,255,255),
                                  edge_color = (0,0,153)
                              ),
                              module_drawer=HorizontalBarsDrawer())

        img_2.save('./qr.png')
        ph = open("./qr.png", "rb")

        # ph = open(img)

        await message.bot.send_photo(message.chat.id, ph)


    elif message.text == "food_features":
        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        cursor = connection.cursor()
        postgres_insert_query = """ select chat_id from clients;"""

        cursor.execute(postgres_insert_query)
        clients = cursor.fetchall()


    else:
        if message.sticker:
            await message.bot.send_sticker(message.chat.id,
                                           "CAACAgIAAxkBAAIGIWONNzb0N_CXkMXiJSUmgCBB85rDAAJmAAM9mOUbPDdel85xPYArBA")
        await message.bot.send_message(message.chat.id, "используй кнопки снизу", reply_markup=kb1)


@rate_limit(5)
async def process_callback_reg_info(callback_query: CallbackQuery):
    code = callback_query.data[-1]
    print(code)
    if code == '1':
        await callback_query.bot.answer_callback_query(callback_query.id,
                                                       text='рассылка на участников :)\nпока отключено',
                                                       show_alert=True)
        await callback_query.bot.edit_message_text("рассылки", callback_query.from_user.id,
                                                   callback_query.message.message_id,
                                                   inline_message_id=callback_query.inline_message_id)
        await callback_query.bot.edit_message_reply_markup(callback_query.from_user.id,
                                                           message_id=callback_query.message.message_id,
                                                           inline_message_id=callback_query.inline_message_id,
                                                           reply_markup=broadcast)

    if code == '2':
        await callback_query.bot.answer_callback_query(callback_query.id,
                                                       text='рассылка на душнил\nпока отключено',
                                                       show_alert=True)

    if code == '3':
        await callback_query.answer("подтверждаю регу")
        mrk = aiogram.types.InlineKeyboardMarkup()
        await callback_query.bot.edit_message_reply_markup(callback_query.from_user.id,
                                                           message_id=callback_query.message.message_id,
                                                           inline_message_id=callback_query.inline_message_id,
                                                           reply_markup=mrk)

        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        cursor = connection.cursor()
        postgres_insert_query = """select * from clients where confirm is NULL;"""

        cursor.execute(postgres_insert_query)
        clients = cursor.fetchall()
        sended = 0
        for row in clients:
            print(row)
            try:
                await callback_query.bot.send_message(chat_id=int(row[0]), text=brdct_msg_confirm_registration, # 392875761 int(row[0])
                                                      reply_markup=confirm_reg)

                time.sleep(0.5)
                await qr_code_registry(int(row[0]))
            except:
                print("ERROR")
                continue
        cursor.close()
        connection.close()
        await callback_query.bot.send_message(392875761, f"sended {sended} qr-codes")

    if code == '4':
        await callback_query.answer("со всем уважением! Ты дебил")
        # todo make final braodcast


def register_admin(dp: Dispatcher):
    dp.register_message_handler(admin_start, commands=["start"], state="*", is_admin=True)
    dp.register_message_handler(admin_menu, state=AdminEvents.main_menu, is_admin=True,
                                content_types=aiogram.types.ContentType.ANY)
    dp.register_callback_query_handler(process_callback_reg_info, state="*")

async def qr_code_registry(user_chat_id):
    link = await get_start_link(f'{user_chat_id}', encode=True)
    print(str(link))
    qr = qrcode.QRCode(
        version=3,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(link)
    qr.make(fit=True)
    img_2 = qr.make_image(image_factory=StyledPilImage,
                          color_mask=RadialGradiantColorMask(
                              back_color=(255, 255, 255),
                              center_color=(51, 255, 255),
                              edge_color=(0, 0, 153)
                          ),
                          module_drawer=SquareModuleDrawer())
    
    img_2.save('./qr.png')
    return "ok"
