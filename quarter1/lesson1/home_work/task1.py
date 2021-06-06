# Урок 1. Задание 1.
# Реализовать вывод информации о промежутке времени в зависимости от его продолжительности duration в секундах:
# до минуты: <s> сек;
# * до часа: <m> мин <s> сек;
# * до суток: <h> час <m> мин <s> сек;
# * *до месяца, до года, больше года: по аналогии.
#
# Решение: Программа ожидает ввода целого числа больше 0
# Если введено не число, то выдает сообщение об ошибке и снова ожидает ввода
# Если введен 0, программа сообщает, что 'Интервал равен нулю'
# Ограничился точностью до дней (при вводе числа 35000000, получим 405 дн. 2 час. 13 мин. 20 сек.)
# или 405 days, 2 hours, 13 minutes and 20 seconds. как на https://www.epochconverter.com/
#       Дата  Автор
# 2021.06.06  мальчик Денис, 43 годика

# Определим используемые константы
MSG_PROMPT = 'Введите промежуток времени (целое число, больше 0): '
MSG_WRONG = 'Вы ошиблись.'
SECONDS_IN_MINUTE = 60
MINUTES_IN_HOUR = 60
SECONDS_IN_HOUR = MINUTES_IN_HOUR * SECONDS_IN_MINUTE
HOURS_IN_DAY = 24
MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR
SECONDS_IN_DAY = MINUTES_IN_DAY * SECONDS_IN_MINUTE

# Ввод значения с клавиатуры
duration = input(MSG_PROMPT)

# Проверим ввод
input_correct = duration.isdecimal()
while not input_correct:
    print(MSG_WRONG)
    duration = input(MSG_PROMPT)
    input_correct = duration.isdecimal()
else:
    num_val = int(duration)

if num_val > 0:
    # Количество секунд, как остаток от деления на 60 сек.
    num_int_scs = num_val % SECONDS_IN_MINUTE
    # Выразим интервал в минутах, как деление секунд нацело на 60 сек.
    num_val = num_val // SECONDS_IN_MINUTE
    # Количество минут, как остаток от деления интервала в минутах на 60 мин.
    num_int_mns = num_val % MINUTES_IN_HOUR
    # Выразим интервал в часах, как деление минут нацело на 60 мин.
    num_val = num_val // MINUTES_IN_HOUR
    # Количество часов, как остаток от деления интервала в часах на 24 ч.
    num_int_hrs = num_val % HOURS_IN_DAY
    # Выразим интервал в днях, как деление часов нацело на 24 ч.
    num_int_days = num_val // HOURS_IN_DAY
    message_text = ''

    if num_int_scs > 0:  # если секунды не нулевые, добавим в сообщение
        message_text = f'{num_int_scs} сек.'

    if num_int_mns > 0:  # если минуты не нулевые...
        if len(message_text) > 0:  # и секунды не нулевые, добавим в сообщение через пробел
            message_text = f'{num_int_mns} мин. ' + message_text
        else:  # и секунды нулевые, добавим в сообщение только минуты
            message_text = f'{num_int_mns} мин.'

    if num_int_hrs > 0:  # если часы не нулевые...
        if len(message_text) > 0:  # и секунды/минуты не нулевые, добавим в сообщение через пробел
            message_text = f'{num_int_hrs} час. ' + message_text
        else:  # и секунды/минуты нулевые, добавим в сообщение только часы
            message_text = f'{num_int_hrs} час.'

    if num_int_days > 0:  # если дни не нулевые...
        if len(message_text) > 0:  # и секунды/минуты/часы не нулевые, добавим в сообщение через пробел
            message_text = f'{num_int_days} дн. ' + message_text
        else:  # и секунды/минуты/часы нулевые, добавим в сообщение только дни
            message_text = f'{num_int_days} дн.'
else:
    message_text = 'Интервал равен нулю'

# print('Интервал ' + message_text)
print(message_text)
