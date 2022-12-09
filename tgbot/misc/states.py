from aiogram.dispatcher import FSMContext
from aiogram.dispatcher.filters.state import State, StatesGroup


class Form(StatesGroup):
    start = State()
    name = State()  # ФИО
    vk_page = State()  # Страница в VK
    study_group = State()  # Твоя учебная группа
    birthday = State()  # Дата рождения
    phone_number = State()  # Номер телефона & Ник в Telegram
    food_feature = State()  # Если есть особенности по питанию, расскажи о них
    evening_event = State()  # Вечернее мероприятие
    media_files = State()  # Медиафайлы для выступления(если нужны), можно позже отправить в телеграмме @ umerenkova


class ConfirmReg(StatesGroup):
    confirm_message = State()
    confirmation = State()

class UserEvents(StatesGroup):
    main_menu = State()


class EventMedia(StatesGroup):
    send_media = State()


class AdminEvents(StatesGroup):
    main_menu = State()
    start_export = State()
    broadcast = State()