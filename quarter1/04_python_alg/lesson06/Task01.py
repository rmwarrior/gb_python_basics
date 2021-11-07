# 1. Подсчитать, сколько было выделено памяти под переменные в ранее разработанных программах в рамках первых
# трех уроков. Проанализировать результат и определить программы с наиболее эффективным использованием памяти.

# За основу была взята
# Задача 2 урока 4. Написать два алгоритма нахождения i-го по счёту простого числа.
# Без использования «Решета Эратосфена»;
# Используя алгоритм «Решето Эратосфена»

# Попытался использовать пакет "memory_profiler", но не всё прошло гладко (пришлось вернутся с Python 3.10 на 3.9):
#   1. ok    python.exe -m pip install --upgrade pip
#   Successfully installed pip-21.3.1
#   2. fail  pip install memory_profiler
#   error: Microsoft Visual C++ 14.0 or greater is required.\
#   Get it with "Microsoft C++ Build Tools": https://visualstudio.microsoft.com/visual-cpp-build-tools/
#   https://wiki.python.org/moin/WindowsCompilers
#   3. ok    pip install --upgrade setuptools
#   Successfully uninstalled setuptools-57.0.0
#   4. Microsoft Visual C++ 14.25 standalone: Build Tools for Visual Studio 2019 (x86, x64, ARM, ARM64)
#   ok + reboot
#   5. ok    pip install --upgrade wheel
#   Successfully uninstalled wheel-0.36.2
#   6. fail    pip install --upgrade pstools
#   ERROR: Could not build wheels for healpy, which is required to install pyproject.toml-based projects
#   7. ok    pip install memory_profiler
#   https://code.tutsplus.com/ru/tutorials/understand-how-much-memory-your-python-objects-use--cms-25609

import sys
from memory_profiler import profile

n = int(input("Какое по счёту простое число нужно получить? "))
# Взял максимальный размер массива за 20*n. До миллионного простого числа хватит (нужен массив на 15 млн. эл-тов)
max_len = 20 * n


@profile
def erath():
    a = [i for i in range(max_len)]  # заполнение массива n количеством элементов ...
    print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys.getsizeof(a) + len(a) * sys.getsizeof(a[0])}')

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
    print(f'sizeof(b)={sys.getsizeof(b)}, total={sys.getsizeof(a) + len(a) * sys.getsizeof(a[0])}')

    del a
    # print(b)
    print(b[-1])


@profile
def no_erath():
    a = [i for i in range(max_len)]  # заполнение массива n количеством элементов ...
    print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys.getsizeof(a) + len(a) * sys.getsizeof(a[0])}')

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


##################################################################################################################
# Если закомментировать декораторы @profile, то мы получим поверхностную информацию о размерах списков:
#     print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys.getsizeof(a) + len(a) * sys.getsizeof(a[0])}')
#     print(f'sizeof(b)={sys.getsizeof(b)}, total={sys.getsizeof(a) + len(a) * sys.getsizeof(a[0])}')
# Если использовать декораторы @profile, то мы получим более подробную информацию о памяти:
# но в случае с алгоритмом без решета Эратосфена, алгоритм работает ооочень долго (для 10000-го простого числа)
# и выдает отрицательные объёмы памяти

# На момент написания комментария, объем используемой памяти в диспетчере задач составляет 6.6 Гб
# (42% от 16 доступных). В момент работы алгоритма было использовано более 8 Гб.
# Я думаю, что произошло переполнение 32-х разрядного целого (со знаком это примерно 2 гигабайта)

# Notebook Lenovo, Windows 10 Pro x64, 16 Gb RAM

##################################################################################################################
erath()

# Какое по счёту простое число нужно получить? 10000  <- - - - - - - - - - - - - - - - - - - - - - - 10000
# max_len=200000, sizeof(a)=1624056, total=6424056
# sizeof(b)=85176, total=6424056
# 104729
# Filename: C:\Users\dn-ku\PycharmProjects\Q1_Course_05\python39\Task01.py
#
# Line #    Mem usage    Increment  Occurences   Line Contents
# ============================================================
#     16     20.1 MiB     20.1 MiB           1   @profile
#     17                                         def erath():
#     18     27.7 MiB -81004.2 MiB      200003       a = [i for i in range(max_len)]  # заполнение массива n ...
#     19     27.7 MiB      0.0 MiB           1       print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys...
#     20
#     21                                             # вторым элементом является единица, которую не считают ...
#     22                                             # забиваем ее нулем.
#     23     27.7 MiB      0.0 MiB           1       a[1] = 0
#     24     27.7 MiB      0.0 MiB           1       b = []
#     25
#     26     27.7 MiB      0.0 MiB           1       m = 2  # замена на 0 начинается с 3-го элемента (первые два ...
#     27     28.0 MiB      0.0 MiB      104729       while len(b) < n:  # пока не получили n-ное простое...
#     28     28.0 MiB      0.0 MiB      104728           if a[m] != 0:  # если он не равен нулю, то
#     29     28.0 MiB      0.2 MiB       10000               b.append(a[m])  # текущий элемент простое число
#     30     28.0 MiB      0.0 MiB       10000               j = m * 2  # увеличить в два раза
#     31     28.0 MiB      0.0 MiB      537010               while j < max_len:
#     32     28.0 MiB      0.0 MiB      527010                   a[j] = 0  # заменить на 0
#     33     28.0 MiB      0.0 MiB      527010                   j = j + m  # перейти в позицию на m больше
#     34     28.0 MiB      0.0 MiB      104728           m += 1
#     35     28.0 MiB      0.0 MiB           1       print(f'sizeof(b)={sys.getsizeof(b)}, total={sys.getsizeof(a) ...
#     36
#     37     23.9 MiB     -4.0 MiB           1       del a
#     38                                             # print(b)
#     39     23.9 MiB      0.0 MiB           1       print(b[-1])


##################################################################################################################
no_erath()

# Какое по счёту простое число нужно получить? 10000  <- - - - - - - - - - - - - - - - - - - - - - - 10000
# max_len=200000, sizeof(a)=1624056, total=6424056
# 104729
# Filename: C:\Users\dn-ku\PycharmProjects\Q1_Course_05\python39\Task01.py
#
# Line #    Mem usage    Increment  Occurences   Line Contents
# ============================================================
#     61     19.3 MiB     19.3 MiB           1   @profile
#     62                                         def no_erath():
#     63     27.7 MiB   -922.8 MiB      200003       a = [i for i in range(max_len)]  # заполнение массива n ...
#     64     27.7 MiB      0.0 MiB           1       print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys...
#     65
#     66     27.7 MiB      0.0 MiB           1       b = []  # список полученных простых чисел
#     67     27.7 MiB      0.0 MiB           1       m = 2  # начнем проверку на простоту числа с 2
#     68     27.9 MiB  -6251.2 MiB      104729       while len(b) < n:  # пока не получили n-ное простое...
#     69     27.9 MiB  -6250.9 MiB      104728           i = 0  # индекс в массиве простых чесел
#     70     27.9 MiB  -6250.9 MiB      104728           prime = True  # предположим, текущее число простое
#     71                                                 # пройдём по списку имеющихся простых, таких что умножая ...
#     72                                                 # смысл такой, что имея список простых [2, 3, 5, 7] и ...
#     73                                                 # ограничимся 2 и 3.
#     74     27.9 MiB -2547252.7 MiB    27303712           while (i < len(b)) and (m >= b[i] * 2) and prime:
#     75     27.9 MiB -2541001.4 MiB    27198984               prime = prime and ((m % b[i]) != 0)  # простым будет ...
#     76     27.9 MiB -2541001.5 MiB    27198984               i += 1
#     77     27.9 MiB  -6251.5 MiB      104728           if prime:
#     78     27.9 MiB   -552.4 MiB       10000               b.append(m)  # если простое, добавим в список
#     79                                                     # print(m)
#     80     27.9 MiB  -6251.5 MiB      104728           m += 1
#     81                                             # print(b)
#     82     27.4 MiB     -0.5 MiB           1       print(b[-1])

##################################################################################################################
# Какое по счёту простое число нужно получить? 1000  <- - - - - - - - - - - - - - - - - - - - - - - 1000
# max_len=20000, sizeof(a)=173016, total=653016
# sizeof(b)=8856, total=653016
# 7919
# Filename: C:\Users\dn-ku\PycharmProjects\Q1_Course_05\python39\Task01.py
#
# Line #    Mem usage    Increment  Occurences   Line Contents
# ============================================================
#     35     19.3 MiB     19.3 MiB           1   @profile
#     36                                         def erath():
#     37     20.1 MiB      0.9 MiB       20003       a = [i for i in range(max_len)]  # заполнение массива n ...
#     38     20.2 MiB      0.0 MiB           1       print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys...
#     39
#     40                                             # вторым элементом является единица, которую не считают ...
#     41                                             # забиваем ее нулем.
#     42     20.2 MiB      0.0 MiB           1       a[1] = 0
#     43     20.2 MiB      0.0 MiB           1       b = []
#     44
#     45     20.2 MiB      0.0 MiB           1       m = 2  # замена на 0 начинается с 3-го элемента (первые два ...
#     46     20.2 MiB      0.0 MiB        7919       while len(b) < n:  # пока не получили n-ное простое...
#     47     20.2 MiB      0.0 MiB        7918           if a[m] != 0:  # если он не равен нулю, то
#     48     20.2 MiB      0.0 MiB        1000               b.append(a[m])  # текущий элемент простое число
#     49     20.2 MiB      0.0 MiB        1000               j = m * 2  # увеличить в два раза
#     50     20.2 MiB      0.0 MiB       48633               while j < max_len:
#     51     20.2 MiB      0.0 MiB       47633                   a[j] = 0  # заменить на 0
#     52     20.2 MiB      0.0 MiB       47633                   j = j + m  # перейти в позицию на m больше
#     53     20.2 MiB      0.0 MiB        7918           m += 1
#     54     20.2 MiB      0.0 MiB           1       print(f'sizeof(b)={sys.getsizeof(b)}, total={sys.getsizeof(a) ...
#     55
#     56     20.2 MiB      0.0 MiB           1       del a
#     57                                             # print(b)
#     58     20.2 MiB      0.0 MiB           1       print(b[-1])

##################################################################################################################
# Какое по счёту простое число нужно получить? 1000  <- - - - - - - - - - - - - - - - - - - - - - - 1000
# max_len=20000, sizeof(a)=173016, total=653016
# 7919
# Filename: C:\Users\dn-ku\PycharmProjects\Q1_Course_05\python39\Task01.py
#
# Line #    Mem usage    Increment  Occurences   Line Contents
# ============================================================
#     61     19.3 MiB     19.3 MiB           1   @profile
#     62                                         def no_erath():
#     63     20.3 MiB      1.0 MiB       20003       a = [i for i in range(max_len)]  # заполнение массива n ...
#     64     20.3 MiB      0.0 MiB           1       print(f'{max_len=}, sizeof(a)={sys.getsizeof(a)}, total={sys...
#     65
#     66     20.3 MiB      0.0 MiB           1       b = []  # список полученных простых чисел
#     67     20.3 MiB      0.0 MiB           1       m = 2  # начнем проверку на простоту числа с 2
#     68     20.4 MiB      0.1 MiB        7919       while len(b) < n:  # пока не получили n-ное простое...
#     69     20.4 MiB      0.0 MiB        7918           i = 0  # индекс в массиве простых чесел
#     70     20.4 MiB      0.0 MiB        7918           prime = True  # предположим, текущее число простое
#     71                                                 # пройдём по списку имеющихся простых, таких что умножая ...
#     72                                                 # смысл такой, что имея список простых [2, 3, 5, 7] и ...
#     73                                                 # ограничимся 2 и 3.
#     74     20.4 MiB      0.0 MiB      299775           while (i < len(b)) and (m >= b[i] * 2) and prime:
#     75     20.4 MiB      0.0 MiB      291857               prime = prime and ((m % b[i]) != 0)  # простым будет ...
#     76     20.4 MiB      0.0 MiB      291857               i += 1
#     77     20.4 MiB      0.0 MiB        7918           if prime:
#     78     20.4 MiB      0.0 MiB        1000               b.append(m)  # если простое, добавим в список
#     79                                                     # print(m)
#     80     20.4 MiB      0.0 MiB        7918           m += 1
#     81                                             # print(b)
#     82     20.4 MiB      0.0 MiB           1       print(b[-1])
