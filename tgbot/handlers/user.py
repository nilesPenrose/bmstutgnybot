from datetime import datetime

import aiogram
import psycopg2
import qrcode
from aiogram import Dispatcher
from aiogram.dispatcher import FSMContext
from aiogram.types import Message, ReplyKeyboardRemove
from aiogram.utils.deep_linking import get_start_link
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers import RoundedModuleDrawer, GappedSquareModuleDrawer, CircleModuleDrawer, VerticalBarsDrawer, SquareModuleDrawer, HorizontalBarsDrawer
from qrcode.image.styles.colormasks import RadialGradiantColorMask
from tgbot.misc.states import Form, UserEvents
from .template_messages.user_messages import vk_page, study_group, birthday, phone_number, food_feature, \
    evening_event, media_files, summary_msg, start_message, name_messages
from tgbot.keyboards.reply import of_course
from ..middlewares.throttling import rate_limit

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

def check_date(date: str):
    date_format = "%d.%m.%Y"
    res = True
    try:
        res = bool(datetime.strptime(date, date_format))
    except ValueError:
        res = False
    return res

def check_phone(phone: str):
    if len(phone) == 12 or len(phone) == 11:
        return True
    else:
        return False

def check_tag(msg: str):
    for ch in msg:
        if ch in "<>'?|!@#$%^&*":
            msg = msg.replace(ch, '_')
    print(msg)
    return msg


@rate_limit(40)
async def user_start(message: Message, state: FSMContext):
    state_name = await state.get_state()
    print(state_name)
    print(type(state_name))

    if state_name is None:
        print(message.chat.username, message.chat.id)
        await Form.start.set()
        await message.reply(start_message,
                            reply_markup=of_course)
    else:
        await message.reply("ты уже зарегестрирован, друг мой",
                            reply_markup=ReplyKeyboardRemove())


@rate_limit(5)
async def process_start(message: Message, state: FSMContext):
    if message.text == "Конечно❄️":
        await Form.next()
        await message.answer("Укажи свое полное ФИО",
                            reply_markup=ReplyKeyboardRemove())
    else:
        await message.answer("нажми на кнопку)", reply_markup=of_course)


@rate_limit(5)
async def process_name(message: Message, state: FSMContext):
    print(message.text, message.chat.username)

    msg = check_tag(message.text)

    async with state.proxy() as data:
        data['chat_id'] = message.chat.id
        data['name'] = msg
    await Form.next()
    await message.reply(vk_page)

@rate_limit(5)
async def process_vk_page(message: Message, state: Form.vk_page):
    print(message.text, message.chat.username)
    msg = check_tag(message.text)
    if msg.lower() == "нет":
        await message.answer("понятно, будем писать тебе в телеграм")
        await state.update_data(vk_page=str(message.text))
        await Form.next()
        await message.answer(study_group)
        return 0

    if msg.find('vk.com/') == -1:
        await message.answer("скинь ссылку на вк в формате 'vk.com/quasinp'")
    else:
        await state.update_data(vk_page=str(msg))
        await Form.next()
        await message.answer(study_group)

@rate_limit(5)
async def process_group(message: Message, state: Form.study_group):
    print(message.text, message.chat.username)
    msg = check_tag(message.text)

    async with state.proxy() as data:
        data['study_group'] = msg
    await Form.next()
    await message.answer(birthday)

@rate_limit(5)
async def process_birthday(message: Message, state: Form.birthday):
    if not check_date(message.text):
        await message.reply("введи дату рождения в формате: ДД.ММ.ГГГГ")
    else:
        print(message.text, message.chat.username)
        async with state.proxy() as data:
            data['birthday'] = message.text
        await Form.next()
        await message.answer(phone_number)

@rate_limit(5)
async def process_phone(message: Message, state: Form.phone_number):
    print(message.text, message.chat.username)
    if not check_phone(message.text):
        await message.reply("неверный формат." + phone_number)
    else:
        async with state.proxy() as data:
            print(data)
            data['phone_number'] = message.text
        await Form.next()
        await message.answer(food_feature)

@rate_limit(5)
async def process_food_features(message: Message, state: Form.food_feature):
    print(message.text, message.chat.username)
    msg = check_tag(message.text)
    async with state.proxy() as data:
        print(data)
        data['food_feature'] = msg
    await Form.next()
    await message.answer(evening_event)

@rate_limit(5)
async def process_event_description(message: Message, state: Form.evening_event):
    print(message.text, message.chat.username)
    msg = check_tag(message.text)
    async with state.proxy() as data:
        data['evening_event'] = msg
    await Form.next()
    await message.answer(media_files)

@rate_limit(5)
async def process_media(message: Message, state: Form.media_files):
    print(message.text, message.chat.username)
    await message.reply("""Спасибо большое за твои ответы, совсем скоро тебе придет сообщение с подтверждением 
    регистрации, после которого ты сможешь отправиться с нами на выезд и, 
    конечно же, самый долгожданный Маскарад 🌟""")
    msg = check_tag(message.text)
    async with state.proxy() as data:
        data['media_files'] = msg
        markup = ReplyKeyboardRemove()
        await message.bot.send_message(message.chat.id,
                                       text=summary_msg.substitute(name=data['name'], vk_page=data['vk_page'],
                                                                   study_group=data['study_group'],
                                                                   birthday=data['birthday'],
                                                                   phone_number=data['phone_number'],
                                                                   food_feature=data['food_feature'],
                                                                   evening_event=data['evening_event'],
                                                                   media_files=data['media_files']))

        print(data)

        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        cursor = connection.cursor()
        postgres_insert_query = """ INSERT INTO clients (chat_id, username, phone, vk_page, study_group, 
                                        birthday, evening_event, media) VALUES (%s,%s,%s, %s,%s,%s, %s,%s)
                                        on conflict (chat_id) do update set username = EXCLUDED.username, 
                                        phone = EXCLUDED.phone, vk_page = EXCLUDED.vk_page, 
                                        study_group= EXCLUDED.study_group, birthday= EXCLUDED.birthday, 
                                        evening_event= EXCLUDED.evening_event, media= EXCLUDED.media;"""

        record_to_insert = (data['chat_id'], data['name'], data['phone_number'], data['vk_page'], data['study_group'],
                            data['birthday'], data['evening_event'], data['media_files'])
        cursor.execute(postgres_insert_query, record_to_insert)
        connection.commit()
        count = cursor.rowcount
        if count:
            await message.bot.send_message(message.chat.id, "твоя регистрация прошла успешно!\n")
        print(count, "Record inserted successfully into mobile table")
        cursor.close()
        connection.close()

    await UserEvents.main_menu.set()
    await message.bot.send_message(message.chat.id, text="при возникновении вопросов или критичных "
                                                         "ошибок заполнения: '/help'")


@rate_limit(5)
async def user_menu(message: Message, state: UserEvents.main_menu):
    st = await state.get_state()
    print("CONFIRM ERROR", st)
    if message.text == "Нет":
        await message.answer("Очень жаль, что у тебя не получится отправиться в новогоднее путешествие вместе с нами в этот раз, но у тебя всегда есть возможность посетить другие мероприятия Студенческого совета (https://vk.com/studsovet_bmstu). Следи за новостями, до новых встреч🎁", reply_markup=ReplyKeyboardRemove())
        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        cursor = connection.cursor()

        query = "update clients set confirm='no' where chat_id={};".format(message.chat.id)
        cursor.execute(query)
        connection.commit()
        count = cursor.rowcount
        print("confirm {}".format(count))
        cursor.close()
        connection.close()
        await message.bot.send_message(392875761, "НЕТ")

    elif message.text == "ДА🌟":
        await message.answer("Отлично! Прикрепляем твой индивидуальный qr-код, который необходимо будет показать нашим организаторам на регистрации перед отъездом. Только по нему ты сможешь попасть на наше мероприятие! Если остались вопросы, то можешь их задать Анастасии (http://t.me/cot_boris_13). Увидимся 16 декабря в 18:30🎄", reply_markup=ReplyKeyboardRemove())
        connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        cursor = connection.cursor()

        query = "update clients set confirm='yes' where chat_id={};".format(message.chat.id)
        cursor.execute(query)
        connection.commit()
        count = cursor.rowcount
        await message.bot.send_message(392875761, "ДА")
        print("confirm {}".format(count))
        cursor.close()
        connection.close()
        await qr_code_registry(int(message.chat.id))
        ph = open("./qr.png", "rb")
        await message.bot.send_photo(int(message.chat.id), ph)
        ph.close()
    else:
        await message.answer("а ты знал, что в мире нас уже 8 миллиардов?")

async def user_help(message: Message):
    await message.reply("контакты организаторов, которым можно писать в телеграм при возникновении проблем:"
                        "\nhttps://t.me/niles_penrose,\nhttps://t.me/cot_boris_13,\nhttps://t.me/andrew_yas")
                        #\nhttps://t.me/true_psinu

def register_user(dp: Dispatcher):
    dp.register_message_handler(user_start, commands=["start"], state="*", is_admin=False)
    dp.register_message_handler(user_help, commands=["help"], state="*")
    dp.register_message_handler(process_start, state=Form.start, is_sticker=False)
    dp.register_message_handler(process_name, state=Form.name, is_sticker=False)
    dp.register_message_handler(process_vk_page, state=Form.vk_page, is_sticker=False)
    dp.register_message_handler(process_group, state=Form.study_group, is_sticker=False)
    dp.register_message_handler(process_birthday, state=Form.birthday, is_sticker=False)
    dp.register_message_handler(process_phone, state=Form.phone_number, is_sticker=False)
    dp.register_message_handler(process_food_features, state=Form.food_feature, is_sticker=False)
    dp.register_message_handler(process_event_description, state=Form.evening_event, is_sticker=False)
    dp.register_message_handler(process_media, state=Form.media_files, is_sticker=False)
    dp.register_message_handler(user_menu, state=UserEvents.main_menu, is_sticker=False)



