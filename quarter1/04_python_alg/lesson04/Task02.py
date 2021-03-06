# 2. Написать два алгоритма нахождения i-го по счёту простого числа.
# Без использования «Решета Эратосфена»;
# Используя алгоритм «Решето Эратосфена»
# Примечание ко всему домашнему заданию: Проанализировать скорость и сложность алгоритмов.
# Результаты анализа сохранить в виде комментариев в файле с кодом.
import cProfile


n = int(input("Какое по счёту простое число нужно получить? "))
# Взял максимальный размер массива за 20*n. До миллионного простого числа хватит (нужен массив на 15 млн. эл-тов)
max_len = 20 * n


def erath():
    a = [i for i in range(max_len)]  # заполнение массива n количеством элементов ...

    # вторым элементом является единица, которую не считают простым числом
    # забиваем ее нулем.
    a[1] = 0
    b = []

    m = 2  # замена на 0 начинается с 3-го элемента (первые два уже нули)
    while len(b) < n:  # пока не получили n-ное простое...
        if a[m] != 0:  # если он не равен нулю, то
            b.append(a[m])  # текущий элемент простое число
            j = m * 2  # увеличить в два раза
            while j < max_len:
                a[j] = 0  # заменить на 0
                j = j + m  # перейти в позицию на m больше
        m += 1

    del a
    # print(b)
    print(b[-1])


cProfile.run('erath()')


def no_erath():
    b = []  # список полученных простых чисел
    m = 2  # начнем проверку на простоту числа с 2
    while len(b) < n:  # пока не получили n-ное простое...
        i = 0  # индекс в массиве простых чесел
        prime = True  # предположим, текущее число простое
        # пройдём по списку имеющихся простых, таких что умножая его на 2 мы не превысим текущее проверяемое.
        # смысл такой, что имея список простых [2, 3, 5, 7] и проверяя 8, нам нет смысла делить 8 на 5 и на 7.
        # ограничимся 2 и 3.
        while (i < len(b)) and (m >= b[i] * 2) and prime:
            prime = prime and ((m % b[i]) != 0)  # простым будет число, которое нацело не делится ни на одно из них
            i += 1
        if prime:
            b.append(m)  # если простое, добавим в список
            # print(m)
        m += 1
    # print(b)
    print(b[-1])


cProfile.run('no_erath()')

##################################################################################################################
# Какое по счёту простое число нужно получить? 10000
# 104729
#          114735 function calls in 0.100 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.001    0.001    0.100    0.100 <string>:1(<module>)
#         1    0.084    0.084    0.099    0.099 Task02.py:14(erath)
#         1    0.007    0.007    0.007    0.007 Task02.py:15(<listcomp>)
#         1    0.000    0.000    0.100    0.100 {built-in method builtins.exec}
#    104729    0.008    0.000    0.008    0.000 {built-in method builtins.len}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#     10000    0.001    0.000    0.001    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
##################################################################################################################
# 104729
#          27418446 function calls in 10.885 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000   10.885   10.885 <string>:1(<module>)
#         1    8.857    8.857   10.885   10.885 Task02.py:42(no_erath)
#         1    0.000    0.000   10.885   10.885 {built-in method builtins.exec}
#  27408441    2.027    0.000    2.027    0.000 {built-in method builtins.len}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
#     10000    0.001    0.000    0.001    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
##################################################################################################################
#  N      E     not E
# 500	0,004	0,028
# 1000	0,008	0,111
# 1500	0,011	0,238
# 2000	0,016	0,513
# 2500	0,021	0,706
# 3000	0,025	1,004
# 3500	0,035	1,375
# 4000	0,033	1,735
# 4500	0,039	2,167
# 5000	0,043	2,648
# 6000	0,056	3,748
# 7000	0,062	5,189
# 8000	0,074	6,641
# 9000	0,082	8,534
# 10000	0,092	10,389
#       O(n)    O(N^2)   Сложность алгоритма (по моей оценке)
