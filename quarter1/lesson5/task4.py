# 4. Представлен список чисел. Необходимо вывести те его элементы, значения которых больше предыдущего, например:
# src = [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55]
# result = [12, 44, 4, 10, 78, 123]
# Решение: два варианта
# первое - генератор gen_src через yield
# второе - генератор через for .. if

src = [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55]


def gen_src(p_list):
    prev = None
    for item in p_list:
        if not (prev is None) and (item > prev):
            yield item
        prev = item


gen_yield = gen_src(src)
print(next(gen_yield), next(gen_yield), next(gen_yield), next(gen_yield), next(gen_yield), next(gen_yield))

gen_result = (src[i] for i in range(len(src)) if (i > 0) and src[i] > src[i - 1])
print(next(gen_result), next(gen_result), next(gen_result), next(gen_result), next(gen_result), next(gen_result))
