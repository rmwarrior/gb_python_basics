# 1. Написать генератор нечётных чисел от 1 до n (включительно), используя ключевое слово yield, например:
# >>> odd_to_15 = odd_nums(15)
# >>> next(odd_to_15)
# 1
# >>> next(odd_to_15)
# 3
# ...
# >>> next(odd_to_15)
# 15
# >>> next(odd_to_15)
# ...StopIteration...

# 2. * (вместо 1) Решить задачу генерации нечётных чисел от 1 до n (включительно), не используя ключевое слово yield.

# Решение: Создал стандартный генератор odd_nums_yield через yield для задачи 1.
# Для задачи 2, генератор odd_nums написал без ключевого слова yield, хотя его можно было написать сразу в строку:
# например: odd_to_15 = (num for num in range(1, 15 + 1) if num % 2 == 1)

def odd_nums_yield(num: int):
    """
    Генератор нечетных чисел (с yield) до num, включительно
    :param num:
    :return:
    """
    for i in range(0, num + 1):
        if i % 2 == 1:
            yield i


def odd_nums(num: int):
    """
    Генератор нечетных чисел (без yield) до num, включительно
    :param num:
    :return:
    """
    return (num for num in range(1, num + 1) if num % 2 == 1)


odd_to_15_yield = odd_nums_yield(15)
print('Тип "odd_to_15_yield": ', type(odd_to_15_yield))
print(*odd_to_15_yield)  # 1 3 5 7 9 11 13 15
# print(next(odd_to_15_yield))  # 1
# print(next(odd_to_15_yield))  # 3
# print(next(odd_to_15_yield))  # 5

odd_to_15 = odd_nums(15)  # (num for num in range(1, 15 + 1) if num % 2 == 1)
print('Тип "odd_to_15": ', type(odd_to_15))
print(*odd_to_15)  # 1 3 5 7 9 11 13 15
# print(next(odd_to_15))  # 1
# print(next(odd_to_15))  # 3
# print(next(odd_to_15))  # 5
