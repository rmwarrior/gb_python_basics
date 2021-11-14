# 1. Определение количества различных подстрок с использованием хэш-функции.
# Пусть дана строка S длиной N, состоящая только из маленьких латинских букв.
# Требуется найти количество различных подстрок в этой строке.
import hashlib
import random as rnd

N = 6  # длина исходной строки

rnd.seed(42)
s = ''.join([chr(ord('a') + rnd.randint(0, 25)) for i in range(N)])
print(f'Исходная строка: {s}')

uniq_hashes = set()  # множество для уникальных хэшей
uniq_values = set()  # множество для уникальных значений (для наглядности)

for i in range(1, len(s)):  # длина подстроки: i от 1 до n-1
    for pos in range(N - i + 1):  # позиция начала подстроки в строке: от 0 до n - i + 1.
        t = s[pos:pos + i]  # подстрока
        h_t = hashlib.sha1(t.encode('utf-8')).hexdigest()  # хэш подстроки
        uniq_hashes.add(h_t)  # добавим во множество (дубликаты отбросятся)
        uniq_values.add(t)  # добавим во множество (дубликаты отбросятся) (для наглядности)
        # print(t, h_t)

print(f'Количество различных подстрок в строке: {len(uniq_hashes)}')
# print(uniq_hashes)
print(sorted(list(uniq_values)))  # (для наглядности)
