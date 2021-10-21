# 9. Среди натуральных чисел, которые были введены, найти наибольшее по сумме цифр.
# Вывести на экран это число и сумму его цифр.
import random as rnd

lst = []
for i in range(0, 10):
    lst.append(str(int(rnd.random() * 32767)))

max_val = 0
max_item = 0

for item in lst:
    digit_sum = 0
    i = int(item)
    while i > 0:
        i, lo = divmod(i, 10)
        digit_sum += lo

    # print(item, digit_sum)
    if digit_sum > max_val:
        max_val = digit_sum
        max_item = int(item)

print(f'Среди чисел {lst},\nмаксимальная сумма цифр {max_val} у числа {max_item}')
