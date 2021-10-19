# 3. Сформировать из введенного числа обратное по порядку входящих в него цифр и вывести на экран.
# Например, если введено число 3486, то надо вывести число 6843.

# Так как число, оканчивающееся нулём, при развороте числовыми функциями будет усекаться, используем строки
def reverse(num: int):
    hi, lo = divmod(num, 10)
    if hi > 0:
        return str(lo)+reverse(hi)
    else:
        return str(lo)


int_in = int(input('Введите натуральное число: '))
print(f'{int_in} наоборот: {reverse(int_in)}')
