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
#
#       Дата  Автор
# 2021.06.09  Кузнецов Денис

working_list = [57.8, 46.51, 97, 73.45, 83.16, 12000, 150000, 43000, 25, 140,
                578, 465.1, 96, 734.5, 831.6, 1200.5, 100500, 34000, 42, 150]

result_str = ''
sep_str = ''
print('***** цены через запятую в одну строку *****')
for el in working_list:
    list_element = str(el)
    dot_pos = list_element.find('.')
    # if dot_pos > 0:
    #     print(f'{list_element[:dot_pos]} руб {int(list_element[dot_pos+1:]):02d} коп')
    # else:
    #     print(f'{list_element} руб 00 коп')

    if (result_str != '') and (sep_str == ''):
        sep_str = ' '

    if dot_pos > 0:
        result_str = f'{result_str}{sep_str}{list_element[:dot_pos]} руб {int(list_element[dot_pos+1:]):02d} коп,'
    else:
        result_str = f'{result_str}{sep_str}{list_element} руб 00 коп,'

print(result_str[:-1])
# 57 руб 08 коп, 46 руб 51 коп, 97 руб 00 коп, 73 руб 45 коп, 83 руб 16 коп, 12000 руб 00 коп, 150000 руб 00 коп,
# 43000 руб 00 коп, 25 руб 00 коп, 140 руб 00 коп, 578 руб 00 коп, 465 руб 01 коп, 96 руб 00 коп, 734 руб 05 коп,
# 831 руб 06 коп, 1200 руб 05 коп, 100500 руб 00 коп, 34000 руб 00 коп, 42 руб 00 коп, 150 руб 00 коп

print('***** цены, отсортированные по возрастанию *****')
print(f'original id(working_list)={id(working_list)}')
working_list.sort()

result_str = ''
sep_str = ''
for el in working_list:
    list_element = str(el)
    dot_pos = list_element.find('.')
    # if dot_pos > 0:
    #     print(f'{list_element[:dot_pos]} руб {int(list_element[dot_pos+1:]):02d} коп')
    # else:
    #     print(f'{list_element} руб 00 коп')

    if (result_str != '') and (sep_str == ''):
        sep_str = ' '

    if dot_pos > 0:
        result_str = f'{result_str}{sep_str}{list_element[:dot_pos]} руб {int(list_element[dot_pos+1:]):02d} коп,'
    else:
        result_str = f'{result_str}{sep_str}{list_element} руб 00 коп,'

print(result_str[:-1])
print(f'sorted   id(working_list)={id(working_list)}')
# 25 руб 00 коп, 42 руб 00 коп, 46 руб 51 коп, 57 руб 08 коп, 73 руб 45 коп, 83 руб 16 коп, 96 руб 00 коп,
# 97 руб 00 коп, 140 руб 00 коп, 150 руб 00 коп, 465 руб 01 коп, 578 руб 00 коп, 734 руб 05 коп, 831 руб 06 коп,
# 1200 руб 05 коп, 12000 руб 00 коп, 34000 руб 00 коп, 43000 руб 00 коп, 100500 руб 00 коп, 150000 руб 00 коп

print('***** новый список, по убыванию *****')
new_list = working_list.copy()
new_list.sort(reverse=True)
print(new_list)

print('***** Вывести цены пяти самых дорогих товаров *****')
print(new_list[:5])
