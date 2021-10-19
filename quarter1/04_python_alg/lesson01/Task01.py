# 1. Найти сумму и произведение цифр трехзначного числа, которое вводит пользователь.
str_in = input('Введите трёхзначное число: ')
try:
    int_in = int(str_in)

    if 99 < int_in < 1000:
        s = 0
        m = 1
        while int_in > 0:
            int_in, d = divmod(int_in, 10)
            s = s + d
            m = m * d
        print(f'Сумма цифр числа {str_in}: {s}, произведение: {m}')
    else:
        print(f'"{str_in}" не трёхзначное число')
        exit(-1)
except ValueError:
    print(f'"{str_in}" не трёхзначное число')
    exit(-1)
