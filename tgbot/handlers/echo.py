from aiogram import types, Dispatcher
from aiogram.dispatcher import FSMContext
from aiogram.utils.markdown import hcode
from tgbot.misc.states import UserEvents
from tgbot.keyboards.reply import confirm_reg
async def bot_echo(message: types.Message, state = FSMContext):
    print("emergency situation!!!")
    await message.bot.send_message(392875761, f"чел зарегался, {message.chat.id}")
    await UserEvents.main_menu.set()
    await message.answer("используй кнопки внизу", reply_markup=confirm_reg)
    text = [
        "Эхо без состояния.",
        "Сообщение:",
        message.text
    ]
    print(message)
    # await message.answer('\n'.join(text))


async def bot_echo_all(message: types.Message, state: FSMContext):
    state_name = await state.get_state()
    text = [
        f'Эхо в состоянии {hcode(state_name)}',
        'Содержание сообщения:',
        hcode(message.text)
    ]
    print(message)
    if message.text is None:
        await message.answer("пожалуйста не присылай нам ничего кроме текстовых сообщений")
    else:
        await message.answer('\n'.join(text))


def register_echo(dp: Dispatcher):
    dp.register_message_handler(bot_echo, state="*")
    dp.register_message_handler(bot_echo_all, state="*", content_types=types.ContentTypes.ANY)
