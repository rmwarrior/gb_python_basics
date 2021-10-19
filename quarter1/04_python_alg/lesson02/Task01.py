# 1. Написать программу, которая будет складывать, вычитать, умножать или делить два числа. Числа и знак операции
# вводятся пользователем. После выполнения вычисления программа не должна завершаться, а должна запрашивать новые
# данные для вычислений. Завершение программы должно выполняться при вводе символа '0' в качестве знака операции.
# Если пользователь вводит неверный знак (не '0', '+', '-', '*', '/'), то программа должна сообщать ему об ошибке и
# снова запрашивать знак операции.
# Также сообщать пользователю о невозможности деления на ноль, если он ввел 0 в качестве делителя.

while True:
    a = input('Введите выражение: ').split()
    match list(a):
        case operand1, '+', operand2:
            print(float(operand1) + float(operand2))
        case operand1, '-', operand2:
            print(float(operand1) - float(operand2))
        case operand1, '*', operand2:
            print(float(operand1) * float(operand2))
        case operand1, '/', operand2:
            if float(operand2) != 0:
                print(float(operand1) / float(operand2))
            else:
                print('Делить на 0 нельзя')
        case operand1, '0', operand2:
            print('exiting...')
            exit(0)
        case _:
            print('Wrong expression')
