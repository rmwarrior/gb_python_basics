# 1. В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9.
range_from = 2
range_to = 99

divider_min = 2
divider_max = 9

counters_list = [0 for i in range(divider_max - divider_min + 1)]

for i in range(range_from, range_to + 1):
    for d in range(divider_min, divider_max + 1):
        if i % d == 0:
            counters_list[d - divider_min] += 1

print('В диапазоне натуральных чисел от 2 до 99')
for d in range(divider_min, divider_max + 1):
    print(f' на {d} делятся {counters_list[d - divider_min]} чисел')
