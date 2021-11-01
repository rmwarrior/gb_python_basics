# 2. Написать программу сложения и умножения двух шестнадцатеричных чисел. При этом каждое число представляется
# как массив, элементы которого это цифры числа. Например, пользователь ввёл A2 и C4F. Сохранить их как [‘A’, ‘2’]
# и [‘C’, ‘4’, ‘F’] соответственно. Сумма чисел из примера: [‘C’, ‘F’, ‘1’], произведение - [‘7’, ‘C’, ‘9’, ‘F’, ‘E’].
import collections as col
str1 = 'A2'  # 'COFFEE'
str2 = 'C4F'

hex1, hex2 = col.deque(str1), col.deque(str2)  # числа в шестнадцатеричном представлении преобразуем в очереди


def hex2dec(c):  # шестнадцатеричный символ в десятичное число. можно было сделать через if, но решил так ))
    v = 0
    match c:
        case value if ord(c) in range(ord('0'),  ord('9') + 1):
            v += ord(c) - ord('0')
        case _:
            v += (ord(c) - ord('A')) + 10
    return v


num1, num2 = 0, 0  # числа в десятичном представлении

while len(hex1) > 0:
    num1 = num1 * 16 + hex2dec(hex1.popleft())

while len(hex2) > 0:
    num2 = num2 * 16 + hex2dec(hex2.popleft())

sum1, mul1 = num1 + num2, num1 * num2  # Сумма чисел и произведение

# print(f'{num1 = }, {num2 = }, {sum1 = }, {mul1 = }')


def dec2hex(c):
    lst = []
    while c > 0:
        c, d = divmod(c, 16)
        if d in range(0, 10):
            lst.append(chr(d + ord('0')))
        else:
            lst.append(chr(d - 10 + ord('A')))
    return lst


sum2 = dec2hex(sum1)
sum2.reverse()
print(f"Сумма чисел 0x{str1} и 0x{str2} равна 0x{''.join(sum2)},")

mul2 = dec2hex(mul1)
mul2.reverse()
print(f"а произведение: 0x{''.join(mul2)}")
