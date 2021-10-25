# 4. Определить, какое число в массиве встречается чаще всего.
import random as rnd

max_random = 10
random_count = 32
source_list = [round(rnd.random() * max_random) for i in range(random_count)]

distinct_values = set(source_list)  # Найдём все уникальные значения

most_often_value = None  # пусть пока самое частовстречаемое число неопределено
most_often_count = 0  # количество самого частовстречаемого числа также неопределено

for i in distinct_values:  # Пройдём все уникальные значения
    cnt = source_list.count(i)  # Найдём количество, каждого уникального значения

    print(f'{i = }, {cnt = }')

    if cnt > most_often_count:
        most_often_count = cnt  # обновим количество самого частовстречаемого числа
        most_often_value = i  # обновим самое частовстречаемое число

print(source_list)  # Выведем исходные данные
# print(distinct_values)

print(f'{most_often_value} встречается чаще всего ({most_often_count} раз)')
