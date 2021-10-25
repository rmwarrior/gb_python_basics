# 5. В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.
import random as rnd

max_random = 10
random_count = 32
source_list = [round(rnd.random() * max_random * 2) - max_random for i in range(random_count)]

max_negative_value = -max_random
max_negative_index = -1
for i in range(len(source_list)):
    if (source_list[i] < 0) and (source_list[i] > max_negative_value):
        max_negative_value = source_list[i]
        max_negative_index = i
print(source_list)  # Выведем исходные данные
print(f'{max_negative_index = }, {max_negative_value = }')
