# 8. Матрица 5x4 заполняется вводом с клавиатуры кроме последних элементов строк.
# Программа должна вычислять сумму введенных элементов каждой строки и записывать ее в последнюю ячейку строки.
# В конце следует вывести полученную матрицу.
import random as rnd

max_random = 120
random_count = 4
row_count = 4
source_list = [[round(rnd.random() * max_random) for j in range(random_count)] for i in range(row_count)]

for i in source_list:
    s = 0
    for j in i:
        s += j
    i.append(s)

print(source_list)
