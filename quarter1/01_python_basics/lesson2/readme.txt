# Домашнее задание для урока 2 первой четверти

task1.py

# Урок 2. Задание 1.
# Выяснить тип результата выражений:
# 15 * 3
# 15 / 3
# 15 // 2
# 15 ** 2


task2.py

# Урок 2. Задание 2-3.
# Дан список:
# ['в', '5', 'часов', '17', 'минут', 'температура', 'воздуха', 'была', '+5', 'градусов']
# Необходимо его обработать — обособить каждое целое число кавычками и дополнить нулём до двух разрядов:
# ['в', '"', '05', '"', 'часов', '"', '17', '"', 'минут', 'температура', 'воздуха', 'была', '"', '+05', '"', 'градусов']
# Новый список не создавать! Сформировать из обработанного списка строку:
# в "05" часов "17" минут температура воздуха была "+05" градусов
#
# Решение: Определение числа в списке.
# Берем элемент списка.
# Определяем знак "+" или "-" (если он есть) при помощи startswith() или el[0]
# Предполагаемую числовую часть получаем отбрасыванием первого символа: el[1:]
# Определяем вещественное число через поиск разделителя ("." или ",") с помощью методов el.find('.') и el.count('.')
# 1 способ: при этом также левая (целая) и правая (дробная) части должны быть целым числом.
# 2 способ: просто преобразовать строку во float
# Целое же число можно определить при помощи методов isdigit, isnumeric или isdecimal


task4.py

# Урок 2. Задание 4.
# Дан список, содержащий искажённые данные с должностями и именами сотрудников:
# ['инженер-конструктор Игорь', 'главный бухгалтер МАРИНА', 'токарь высшего разряда нИКОЛАй', 'директор аэлита']
#
# Известно, что имя сотрудника всегда в конце строки. Сформировать и вывести на экран фразы вида: 'Привет, Игорь!'
# Подумать, как получить имена сотрудников из элементов списка, как привести их к корректному виду.
# Можно ли при этом не создавать новый список?
#
# Решение: На вопрос "Можно ли не создавать новый список?" можно ответить если знать цель - что делать с именами.
# Если вывести на экран, то можно.
# Если их куда-то сохранить, то тоже можно - записать в строку, а потом сплитить по необходимости и т. д.


task5.py

# Урок 2. Задание 5.
# Создать список, содержащий цены на товары (10–20 товаров), например:
# [57.8, 46.51, 97, ...]
# * Вывести на экран эти цены через запятую в одну строку, цена должна отображаться в виде <r> руб <kk> коп
#   (например «5 руб 04 коп»).
#   Подумать, как из цены получить рубли и копейки, как добавить нули, если, например, получилось 7 копеек или 0 копеек
#   (должно быть 07 коп или 00 коп).
#
# * Вывести цены, отсортированные по возрастанию, новый список не создавать
#   (доказать, что объект списка после сортировки остался тот же).
# * Создать новый список, содержащий те же цены, но отсортированные по убыванию.
# * Вывести цены пяти самых дорогих товаров. Сможете ли вывести цены этих товаров по возрастанию, написав минимум кода?

