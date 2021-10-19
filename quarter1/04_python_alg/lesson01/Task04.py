# 4. Написать программу, которая генерирует в указанных пользователем границах:
# случайное целое число;
# случайное вещественное число;
# случайный символ.
import random as r

ord_a = ord('a')
ord_z = ord('z')


def get_char(ch: str):
    # ввод: один символ в диапазоне a..z
    if ch.isalpha() and (len(ch) == 1) and (ord(ch) >= ord_a) and (ord(ch) <= ord_z):
        return ch
    else:
        raise ValueError('Не символ в диапазоне a..z')


def get_int(ch: str):
    # ввод: целое число
    if ch.isdigit() or (ch[0] in ('+', '-') and ch[1:].isdigit()):
        return int(ch)
    else:
        raise ValueError('Не целое число')


def get_float(ch: str):
    # ввод: вещественное число
    if ch.count('.') == 1:
        dot_pos = ch.find('.')
        if (dot_pos == 0) or (dot_pos == len(ch)):
            raise ValueError
        try:
            get_int(ch[:dot_pos])
        except ValueError:
            raise ValueError('Не вещественное число')
        try:
            if get_int(ch[dot_pos + 1:]) < 0:
                raise ValueError('Не вещественное число')
        except ValueError:
            raise ValueError('Не вещественное число')
        return float(ch)
    else:
        raise ValueError('Не вещественное число')


f = input('Введите границы для получения случайного значения\n'
          '(ввод: одно целое число;            результат: случайное целое число от 0 до введённого значения;\n'
          'ввод: два целых числа;              результат: случайное целое число между введёнными значениями;\n'
          'ввод: одно вещественное число;      результат: случайное вещественное число от 0 до введённого значения;\n'
          'ввод: два вещественных значения;    результат: случайное вещественное число между введёнными значениями;\n'
          'ввод: один символ a..z;             результат: случайный символ от a до введённого значения;\n'
          'ввод: два символ a..z;              результат: случайный символ между введёнными значениями): ')
lst = f.split(' ')
item_type = 0  # 0-undefined, 1-char, 2-int, 3-float, 4-error
values = []
for item in lst:
    if (len(values) < 2) and (item_type < 4):
        try:
            if item_type in (0, 1):
                values.append(get_char(item))
                item_type = 1
            else:
                raise ValueError('Не символ в диапазоне a..z')
        except ValueError:
            try:
                if item_type in (0, 2):
                    values.append(get_int(item))
                    item_type = 2
                else:
                    raise ValueError('Не целое число')
            except ValueError:
                try:
                    if item_type in (0, 3):
                        values.append(get_float(item))
                        item_type = 3
                    else:
                        raise ValueError('Не вещественное число')
                except ValueError as ex:
                    item_type = 4
                    print(ex)
                    exit(-1)
    else:
        print('Неверный ввод')

# print(item_type, values)
if item_type == 1:  # ввод: один символ
    if len(values) == 1:
        b_value = ord_a
        e_value = ord(values[0])
    else:
        values.sort()
        b_value = ord(values[0])
        e_value = ord(values[1])
    print(chr(b_value + round(r.random() * (e_value - b_value))))
elif item_type == 2:  # ввод: целое число
    if len(values) == 1:
        if values[0] >= 0:
            b_value = 0
            e_value = values[0]
        else:
            b_value = values[0]
            e_value = 0
    else:
        values.sort()
        b_value = values[0]
        e_value = values[1]
    print(b_value + round(r.random() * (e_value - b_value)))
elif item_type == 3:  # ввод: вещественное число
    if len(values) == 1:
        if values[0] >= 0:
            b_value = 0
            e_value = values[0]
        else:
            b_value = values[0]
            e_value = 0
    else:
        values.sort()
        b_value = values[0]
        e_value = values[1]
    print(b_value + r.random() * (e_value - b_value))
else:
    print('Неверный ввод')
