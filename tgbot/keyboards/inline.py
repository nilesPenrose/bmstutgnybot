from aiogram.types import InlineKeyboardButton, InlineKeyboardMarkup, ReplyKeyboardMarkup

users = InlineKeyboardButton('рассылка на участников', callback_data='btn1')
admins = InlineKeyboardButton('рассылка на админов', callback_data='btn2')
admin_broadcast = InlineKeyboardMarkup().add(users, admins)

ready = InlineKeyboardButton('подтвердить реги', callback_data='btn3')
admins = InlineKeyboardButton('назвать админов дибилами', callback_data='btn4')

broadcast = InlineKeyboardMarkup()
broadcast.row(ready)
broadcast.row(admins)


kb1 = ReplyKeyboardMarkup(True, True)
kb1.row("экспорт", "рассылка", "статистика")
