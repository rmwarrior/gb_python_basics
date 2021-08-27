# Урок 1. Задание 1.
# Реализовать вывод информации о промежутке времени в зависимости от его продолжительности duration в секундах:
# до минуты: <s> сек;
# * до часа: <m> мин <s> сек;
# * до суток: <h> час <m> мин <s> сек;
# * *до месяца, до года, больше года: по аналогии.
#
# Решение: Программа имеет список значений промежутков времени
# В цикле заполняет набор дополнительных списков, промежуточными вычислениями
# Ограничился точностью до дней (при вводе числа 35000000, получим 405 дн. 2 час. 13 мин. 20 сек.)
# или 405 days, 2 hours, 13 minutes and 20 seconds. как на https://www.epochconverter.com/
#       Дата  Автор
# 2021.06.06  мальчик Денис, 43 годика

# Определим используемые константы
SECONDS_IN_MINUTE = 60
MINUTES_IN_HOUR = 60
SECONDS_IN_HOUR = MINUTES_IN_HOUR * SECONDS_IN_MINUTE
HOURS_IN_DAY = 24
MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR
SECONDS_IN_DAY = MINUTES_IN_DAY * SECONDS_IN_MINUTE

# Вместо ввода значений с клавиатуры, зададим список
duration = (53, 153, 4153, 400153, 90001, 35000000)
num_val = []
message_text = []
num_int_scs = []
num_int_mns = []
num_int_hrs = []
num_int_days = []

for i in range(0, len(duration)):
    num_val.append(duration[i])
    message_text.append(0)
    num_int_scs.append(0)
    num_int_mns.append(0)
    num_int_hrs.append(0)
    num_int_days.append(0)

    # Количество секунд, как остаток от деления на 60 сек.
    num_int_scs[i] = num_val[i] % SECONDS_IN_MINUTE
    # Выразим интервал в минутах, как деление секунд нацело на 60 сек.
    num_val[i] = num_val[i] // SECONDS_IN_MINUTE
    # Количество минут, как остаток от деления интервала в минутах на 60 мин.
    num_int_mns[i] = num_val[i] % MINUTES_IN_HOUR
    # Выразим интервал в часах, как деление минут нацело на 60 мин.
    num_val[i] = num_val[i] // MINUTES_IN_HOUR
    # Количество часов, как остаток от деления интервала в часах на 24 ч.
    num_int_hrs[i] = num_val[i] % HOURS_IN_DAY
    # Выразим интервал в днях, как деление часов нацело на 24 ч.
    num_int_days[i] = num_val[i] // HOURS_IN_DAY
    message_text[i] = ''

    if num_int_scs[i] > 0:  # если секунды не нулевые, добавим в сообщение
        message_text[i] = f'{num_int_scs[i]} сек.'

    if num_int_mns[i] > 0:  # если минуты не нулевые...
        if len(message_text[i]) > 0:  # и секунды не нулевые, добавим в сообщение через пробел
            message_text[i] = f'{num_int_mns[i]} мин. ' + message_text[i]
        else:  # и секунды нулевые, добавим в сообщение только минуты
            message_text[i] = f'{num_int_mns[i]} мин.'

    if num_int_hrs[i] > 0:  # если часы не нулевые...
        if len(message_text[i]) > 0:  # и секунды/минуты не нулевые, добавим в сообщение через пробел
            message_text[i] = f'{num_int_hrs[i]} час. ' + message_text[i]
        else:  # и секунды/минуты нулевые, добавим в сообщение только часы
            message_text[i] = f'{num_int_hrs[i]} час.'

    if num_int_days[i] > 0:  # если дни не нулевые...
        if len(message_text[i]) > 0:  # и секунды/минуты/часы не нулевые, добавим в сообщение через пробел
            message_text[i] = f'{num_int_days[i]} дн. ' + message_text[i]
        else:  # и секунды/минуты/часы нулевые, добавим в сообщение только дни
            message_text[i] = f'{num_int_days[i]} дн.'
    print(duration[i], message_text[i])
