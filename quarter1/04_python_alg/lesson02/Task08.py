# 8. Посчитать, сколько раз встречается определенная цифра в введенной последовательности чисел.
# Количество вводимых чисел и цифра, которую необходимо посчитать, задаются вводом с клавиатуры.
import random as rnd
numbers_cnt, digit = map(int, input('Введите количество вводимых чисел и цифру: ').split())

lst = []
for i in range(0, numbers_cnt):
    lst.append(str(int(rnd.random() * 32767)))

digit_cnt = 0
for item in lst:
    i = int(item)
    while i > 0:
        i, lo = divmod(i, 10)
        if lo == digit:
            digit_cnt += 1

print(f'Среди чисел {lst},\nцифра {digit} встречается {digit_cnt} раз(а)')
