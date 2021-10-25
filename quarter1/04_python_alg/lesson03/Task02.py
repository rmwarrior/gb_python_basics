# 2. Во втором массиве сохранить индексы четных элементов первого массива.
# Например, если дан массив со значениями 8, 3, 15, 6, 4, 2, то во второй массив надо заполнить
# значениями 1, 4, 5, 6 (или 0, 3, 4, 5 - если индексация начинается с нуля),
# т.к. именно в этих позициях первого массива стоят четные числа.
import random as rnd

max_random = 12
random_count = 10
# source_list = [8, 3, 15, 6, 4, 2]
source_list = [round(rnd.random() * max_random) for i in range(random_count)]
print(source_list)  # Выведем исходные данные

target_list = []
for i in range(len(source_list)):
    if source_list[i] % 2 == 0:
        target_list.append(i)
print(target_list)
