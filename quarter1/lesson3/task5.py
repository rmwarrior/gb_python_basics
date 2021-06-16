# Урок 3. Задание 5.
# Реализовать функцию get_jokes(), возвращающую n шуток, сформированных из двух случайных слов, взятых из трёх списков:
# nouns = ["автомобиль", "лес", "огонь", "город", "дом"]
# adverbs = ["сегодня", "вчера", "завтра", "позавчера", "ночью"]
# adjectives = ["веселый", "яркий", "зеленый", "утопичный", "мягкий"]
#
# Например:
# >>> get_jokes(2)
# ["лес завтра зеленый", "город вчера веселый"]
# Документировать код функции.
# Сможете ли вы добавить еще один аргумент — флаг, разрешающий или запрещающий повторы слов в шутках
# (когда каждое слово можно использовать только в одной шутке)?
# Сможете ли вы сделать аргументы именованными?

# Решение: Сначала реализовал через вспомогательную функцию get_rand_from_list(), но потом исключил её.
#
#       Дата  Автор
# 2021.06.16  Кузнецов Денис

# Импортируем библиотеку генерации псевдослучайных чисел
import random


# def get_rand_from_list(p_list):
#     index = random.randint(0, len(p_list)-1)
#     return p_list[index]


def get_jokes(p_cnt: int, p_no_repeats: bool = False):
    # Объявил внутри функции списки со словами, но можно было их вынести наружу, сделать константами и пр.
    nouns = ["автомобиль", "лес", "огонь", "город", "дом"]
    adverbs = ["сегодня", "вчера", "завтра", "позавчера", "ночью"]
    adjectives = ["веселый", "яркий", "зеленый", "утопичный", "мягкий"]

    # Сделал из них рабочие копии, на случай исключения повторов
    work_noun = nouns.copy()
    work_adverb = adverbs.copy()
    work_adjective = adjectives.copy()

    result = []
    # Организовал цикл по количеству повторов - параметр p_cnt функции
    for i in range(0, p_cnt):
        # Если списки слов не пустые (могут опустошиться при  исключении повторов)
        if (len(work_noun) > 0) and (len(work_adverb) > 0) and (len(work_adjective) > 0):
            # вариант с вызовом вспом. функции
            # noun = get_rand_from_list(nouns)
            # adverb = get_rand_from_list(adverbs)
            # adjective = get_rand_from_list(adjectives)

            # получаю из списков случайные слова
            noun = work_noun[random.randint(0, len(work_noun) - 1)]
            adverb = work_adverb[random.randint(0, len(work_adverb) - 1)]
            adjective = work_adjective[random.randint(0, len(work_adjective) - 1)]
            # собираю в строку
            result.append(f'{noun} {adverb} {adjective}')
            # если не нужны повторы, удаляю слова из рабочих копий
            if p_no_repeats:
                work_noun.remove(noun)
                work_adverb.remove(adverb)
                work_adjective.remove(adjective)
        else:  # когда хотя бы один список опустел, добавляю в результат сообщение об отсутствии слов
            result.append('!!! Нет слов !!!')
    print(result)


print('Один параметр ------------------')
get_jokes(6)
print('Два параметра ------------------')
get_jokes(4, True)
print('Два именованных параметра ------')
get_jokes(p_cnt=6, p_no_repeats=True)
