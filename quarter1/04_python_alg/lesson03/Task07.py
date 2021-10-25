# 7. В одномерном массиве целых чисел определить два наименьших элемента. Они могут быть как равны между собой
# (оба являться минимальными), так и различаться.
import random as rnd

max_random = 120
random_count = 10
source_list = [round(rnd.random() * max_random) for i in range(random_count)]
# [76, 5, 15, 54, 29, 109, 17, 49, 98, 111]
# [5, 76, 15, 54, 29, 109, 17, 49, 98, 111]

min_value_1 = max_random + 1  # минимальное число
min_value_2 = min_value_1  # минимальное число, равное min_value_1 либо следующее за ним по величине

print(source_list)  # Выведем исходные данные
for i in source_list:
    if i <= min_value_1:  # если найдено минимальное число из рассмотренных
        min_value_2 = min_value_1  # скинем min_value_1 в min_value_2
        min_value_1 = i  # и обновим min_value_1
    elif i <= min_value_2:  # иначе, если найденное число больше min_value_1, но меньше min_value_2
        min_value_2 = i  # обновим min_value_2


print(f'{min_value_1 = }, {min_value_2 = }')
