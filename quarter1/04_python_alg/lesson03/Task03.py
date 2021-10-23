# 3. В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.
import random as rnd

max_random = 12
random_count = 10
source_list = [round(rnd.random() * max_random) for i in range(random_count)]

min_value_index = 0
max_value_index = 0

print(source_list)  # Выведем исходные данные
for i in range(len(source_list)):
    if source_list[i] < source_list[min_value_index]:
        min_value_index = i
    if source_list[i] > source_list[max_value_index]:
        max_value_index = i

##################################################################################################
min_value = source_list[min_value_index]  # сохраним минимальный элемент для задачи со звёздочкой
max_value = source_list[max_value_index]  # сохраним максимальный элемент для задачи со звёздочкой
source_list_copy = source_list.copy()  # сохраним копию списка для задачи со звёздочкой
##################################################################################################

source_list[min_value_index], source_list[max_value_index] = source_list[max_value_index], source_list[min_value_index]
print(source_list, end=' первое вхождение\n')


# 3*. В массиве случайных целых чисел поменять местами минимальный и максимальный элементы (все вхождения).

for i in range(len(source_list_copy)):
    if source_list_copy[i] == min_value:
        source_list_copy[i] = max_value
    elif source_list_copy[i] == max_value:
        source_list_copy[i] = min_value

print(source_list_copy, end=' все вхождения\n')
