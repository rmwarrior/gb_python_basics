# 2. Выполнить логические побитовые операции «И», «ИЛИ» и др. над числами 5 и 6.
# Выполнить над числом 5 побитовый сдвиг вправо и влево на два знака.
# Объяснить полученный результат.

int_val1 = 5  # 0101
int_val2 = 6  # 0110


# функция NOT для отрицательных целых
def not_negatives(n, bits=32):
    mask = (1 << bits) - 1
    if n < 0:
        n = ((abs(n) ^ mask) + 1)
    return bin(n & mask)


print(f'Логические побитовые операции над числами {int_val1} ({bin(int_val1)[2:]}) и {int_val2} ({bin(int_val2)[2:]}):')
print('«И» (в результате в разряде единица, если единица в разряде в обоих операндах):')
result = int_val1 & int_val2
print(f' {bin(int_val1)[2:]}\n {bin(int_val2)[2:]}\n------\n {bin(result)[2:].rjust(3, "0")} = {result}\n')

print('«ИЛИ» (в результате в разряде единица, если единица в разряде в любом из операндов):')
result = int_val1 | int_val2
print(f' {bin(int_val1)[2:]}\n {bin(int_val2)[2:]}\n------\n {bin(result)[2:].rjust(3, "0")} = {result}\n')

print('«Исключающеее ИЛИ» (в результате в разряде единица, если единица в разряде только в одном из операндов):')
result = int_val1 ^ int_val2
print(f' {bin(int_val1)[2:]}\n {bin(int_val2)[2:]}\n------\n {bin(result)[2:].rjust(3, "0")} = {result}\n')

print('«НЕ» (инвертируем биты, ноль становится единицей и наоборот):')
result = ~int_val1
print(f' {bin(int_val1)[2:]}\n------\n {not_negatives(result, 8)[7:]} = {result}\n')

print('«НЕ» (инвертируем биты, ноль становится единицей и наоборот):')
result = ~int_val2
print(f' {bin(int_val2)[2:]}\n------\n {not_negatives(result, 8)[7:]} = {result}\n')

print(f'«Побитовый сдвиг {int_val1} вправо на два знака (убираем справа два разряда):')
result = int_val1 >> 2
print(f' {bin(int_val1)[2:]}\n------\n {bin(result)[2:].rjust(3, "0")} = {result}\n')

print(f'«Побитовый сдвиг {int_val1} влево на два знака (дописываем справа два нуля):')
result = int_val1 << 2
print(f' {bin(int_val1)[2:].rjust(5, "0")}\n------\n {bin(result)[2:].rjust(3, "0")} = {result}\n')
