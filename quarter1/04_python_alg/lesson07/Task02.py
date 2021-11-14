# 2. Отсортируйте по возрастанию методом слияния одномерный вещественный массив, заданный случайными числами на
# промежутке [0; 50). Выведите на экран исходный и отсортированный массивы.
import random as rnd

LIST_LENGTH = 10


# Рекурсивная функция сортировки:
# 1) Разбивает список на два (левый и правый);
# 2) сортирует каждый в отдельности;
# 3) сливает в один
def sort_merge(lst):
    length = len(lst)
    if length < 2:  # если длина списка 0 или 1 - он уже отсортирован (граничное условие для выхода из рекурсии)
        return lst

    length_2 = length // 2

    left = sort_merge(lst[:length_2])  # сортируем левую половину
    right = sort_merge(lst[length_2:])  # сортируем правую половину

    l_pos = 0
    r_pos = 0
    res = []  # текущий результат сортировки

    # сливаем.
    # идем по обоим спискам одновременно (следим за границами)
    # поочередно добавляем элемент то из правого, то из левого списка
    while (l_pos < len(left)) or (r_pos < len(right)):
        if (r_pos >= len(right)) or ((l_pos < len(left)) and (left[l_pos] < right[r_pos])):
            res.append(left[l_pos])
            l_pos += 1
        else:
            while (r_pos < len(right)) and ((l_pos >= len(left)) or (left[l_pos] > right[r_pos])):
                res.append(right[r_pos])
                r_pos += 1
    return res


rnd.seed(42)
lst_rand = [rnd.random() * 50 for i in range(LIST_LENGTH)]  # сформируем массив случайных чисел
print(lst_rand)
print(sort_merge(lst_rand))
