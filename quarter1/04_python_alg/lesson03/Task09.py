# 9. Найти максимальный элемент среди минимальных элементов столбцов матрицы.
import random as rnd

max_random = 120
random_count = 4
row_count = 4
source_list = [[round(rnd.random() * max_random) for j in range(random_count)] for i in range(row_count)]

print(source_list)  # Выведем исходные данные

min_list = []  # список для минимумов по столбцам
for i in range(random_count):  # цикл по длине строки
    min_item = max_random + 1  # заведомо максимальное значение
    for j in range(row_count):  # цикл по высоте столбца
        if source_list[j][i] < min_item:
            min_item = source_list[j][i]
    min_list.append(min_item)  # добавим в список для минимумов по столбцам найденный минимум

print(min_list)  # Выведем список минимумов по столбцам
max_item = 0
for i in min_list:
    if i > max_item:
        max_item = i

print(f'Максимальное значение среди минимальных элементов столбцов матрицы {max_item}')
