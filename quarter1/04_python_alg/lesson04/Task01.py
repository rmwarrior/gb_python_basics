# 1. Проанализировать скорость и сложность одного любого алгоритма, разработанных в рамках домашнего задания
# первых трех уроков.
# Примечание: попробуйте написать несколько реализаций алгоритма и сравнить их.

# Рассмотрим урок 3. Задача 1.
# В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9.
# - Заменим диапазон на 2..65536, а за делители возьмем 2..99
# - Преобразуем в функции для работы с профайлером

# Так как сложно придумать другую реализацию - увеличу диапазон до 1 000 000,
# а затем увеличим количество делителей до 999
# а затем увеличим количество делителей до 9999
import cProfile

range_from = 2
range_to = 1000000  # 65536

divider_min = 2
divider_max = 9999  # 99


def clear_counter_list():
    return [0 for _ in range(divider_max - divider_min + 1)]


def print_result(p_counters_list):
    print('В диапазоне натуральных чисел от 2 до 65536')
    for d in range(divider_min, divider_max + 1):
        print(f' на {d} делятся {p_counters_list[d - divider_min]} чисел')


def find_dividers():
    counters_list = clear_counter_list()

    for i in range(range_from, range_to + 1):
        for d in range(divider_min, divider_max + 1):
            if i % d == 0:
                counters_list[d - divider_min] += 1

    print_result(counters_list)


cProfile.run('find_dividers()')

# ############### диапазон 2..65536
# 106 function calls in 0.347 seconds
#
# Ordered by: standard name
#
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#      1    0.000    0.000    0.347    0.347 <string>:1(<module>)
#      1    0.000    0.000    0.000    0.000 Task01.py:18(clear_counter_list)
#      1    0.000    0.000    0.000    0.000 Task01.py:19(<listcomp>)
#      1    0.000    0.000    0.001    0.001 Task01.py:22(print_result)
#      1    0.346    0.346    0.347    0.347 Task01.py:28(find_dividers)
#      1    0.000    0.000    0.347    0.347 {built-in method builtins.exec}
#     99    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#      1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


# ############### диапазон 2..1 000 000
#      106 function calls in 5.690 seconds
#
# Ordered by: standard name
#
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#      1    0.000    0.000    5.690    5.690 <string>:1(<module>)
#      1    0.000    0.000    0.000    0.000 Task01.py:19(clear_counter_list)
#      1    0.000    0.000    0.000    0.000 Task01.py:20(<listcomp>)
#      1    0.000    0.000    0.004    0.004 Task01.py:23(print_result)
#      1    5.687    5.687    5.690    5.690 Task01.py:29(find_dividers)
#      1    0.000    0.000    5.690    5.690 {built-in method builtins.exec}
#     99    0.004    0.000    0.004    0.000 {built-in method builtins.print}
#      1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


# ############### диапазон 2..1 000 000, делители 2..999
#      1006 function calls in 66.712 seconds
#
# Ordered by: standard name
#
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#      1    0.000    0.000   66.712   66.712 <string>:1(<module>)
#      1    0.000    0.000    0.000    0.000 Task01.py:21(clear_counter_list)
#      1    0.000    0.000    0.000    0.000 Task01.py:22(<listcomp>)
#      1    0.002    0.002    0.027    0.027 Task01.py:25(print_result)
#      1   66.685   66.685   66.712   66.712 Task01.py:31(find_dividers)
#      1    0.000    0.000   66.712   66.712 {built-in method builtins.exec}
#    999    0.025    0.000    0.025    0.000 {built-in method builtins.print}
#      1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


# ############### диапазон 2..1 000 000, делители 2..9999
#      10006 function calls in 698.965 seconds
#
# Ordered by: standard name
#
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#      1    0.000    0.000  698.965  698.965 <string>:1(<module>)
#      1    0.000    0.000    0.000    0.000 Task01.py:21(clear_counter_list)
#      1    0.000    0.000    0.000    0.000 Task01.py:22(<listcomp>)
#      1    0.007    0.007    0.087    0.087 Task01.py:25(print_result)
#      1  698.878  698.878  698.965  698.965 Task01.py:31(find_dividers)
#      1    0.000    0.000  698.965  698.965 {built-in method builtins.exec}
#   9999    0.080    0.000    0.080    0.000 {built-in method builtins.print}
#      1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

# на ~100 делителей 0,0000052947998046875 = 0.347 / 65536
# на ~100 делителей 0,00000569 = 5.69 / 1 000 000
# на ~100 делителей 0,0000066712 = 66.712 / 1 000 000 / 10 (или на ~1000 делителей 0,000066712)
# на ~100 делителей 0,00000698965 = 698.965 / 1 000 000 / 100

# Сложность близка к O(m*n)
