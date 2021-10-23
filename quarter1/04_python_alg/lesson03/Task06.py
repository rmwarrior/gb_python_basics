# 6. В одномерном массиве найти сумму элементов, находящихся между минимальным и максимальным элементами.
# Сами минимальный и максимальный элементы в сумму не включать.
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

print(f'min_value_index = {min_value_index}, min_value = {source_list[min_value_index]}, '
      f'max_value_index = {max_value_index}, max_value = {source_list[max_value_index]}')

list_sum = 0
if min_value_index > max_value_index:
    min_value_index, max_value_index = max_value_index, min_value_index
    print(f'min_value_index = {min_value_index}, max_value_index = {max_value_index}')

for i in range(min_value_index + 1, max_value_index):
    list_sum += source_list[i]
print(f'Сумма элементов между минимальным и максимальным: {list_sum}')
