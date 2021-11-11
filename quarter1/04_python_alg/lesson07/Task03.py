# 3. Массив размером 2m + 1, где m – натуральное число, заполнен случайным образом. Найдите в массиве медиану.
# Медианой называется элемент ряда, делящий его на две равные части: в одной находятся элементы, которые
# не меньше медианы, в другой – не больше медианы.
# Задачу можно решить без сортировки исходного массива.
# Но если это слишком сложно, то используйте метод сортировки, который не рассматривался на уроках
import random as rnd
M_VAL = 5

# rnd.seed(42)
lst_rand = [rnd.randint(1, 50) for i in range(M_VAL * 2 + 1)]  # заполним массив случайными числами
lst_sort = lst_rand.copy()  # скопируем в рабочий

print(lst_rand)
lst_rand.sort()
print(lst_rand)  # распечатаем отсортированный массив для наглядности

k = 0
max_item = 0
min_item = 100
# Пройдемся m по массиву, отыскивая каждый раз минимум и максимум значений и обнуляя их
# Это аналогично движению к центру в отсортированном массиве
while k < M_VAL:
    max_item = 0
    min_item = 100
    max_item_pos = -1
    min_item_pos = -1
    for j in range(len(lst_sort)):
        if lst_sort[j] != 0 and lst_sort[j] > max_item:
            max_item = lst_sort[j]
            max_item_pos = j
        if lst_sort[j] != 0 and lst_sort[j] < min_item:
            min_item = lst_sort[j]
            min_item_pos = j
    k += 1
    lst_sort[max_item_pos] = 0
    lst_sort[min_item_pos] = 0

print(lst_sort)

for item in lst_sort:
    if item != 0:
        print(f'Медиана = {item}')

# [37, 9, 5, 24, 28, 17, 5, 39, 11, 46, 44]
# [5, 5, 9, 11, 17, 24, 28, 37, 39, 44, 46]
# [0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0]
# Медиана = 24
