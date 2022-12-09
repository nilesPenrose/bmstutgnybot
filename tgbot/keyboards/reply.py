from aiogram.types import InlineKeyboardButton, InlineKeyboardMarkup, ReplyKeyboardMarkup


of_course = ReplyKeyboardMarkup(True, True)
of_course.row("Конечно❄️")

confirm_reg = ReplyKeyboardMarkup(True, True)
confirm_reg.row("ДА🌟", "Нет")
