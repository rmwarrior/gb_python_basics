# Урок 3. Задание 3.
# Написать функцию thesaurus(), принимающую в качестве аргументов имена сотрудников и возвращающую словарь, в котором
# ключи — первые буквы имен, а значения — списки, содержащие имена, начинающиеся с соответствующей буквы.
# Например:
# >>> >>> thesaurus("Иван", "Мария", "Петр", "Илья")
# {
#     "И": ["Иван", "Илья"],
#     "М": ["Мария"], "П": ["Петр"]
# }
# Подумайте: полезен ли будет вам оператор распаковки? Сможете ли вы вернуть отсортированный по ключам словарь?

# Урок 3. Задание 4.
# Написать функцию thesaurus_adv(), принимающую в качестве аргументов строки в формате «Имя Фамилия» и возвращающую
# словарь, в котором ключи — первые буквы фамилий, а значения — словари, реализованные по схеме предыдущего задания и
# содержащие записи, в которых фамилия начинается с соответствующей буквы. Например:
# >>> >>> thesaurus_adv("Иван Сергеев", "Инна Серова", "Петр Алексеев", "Илья Иванов", "Анна Савельева")
# {
#     "А": {
#         "П": "Петр Алексеев"
#     },
#     "И": {
#         "И": "Илья Иванов"
#     },
#     "С": {
#         "И": ["Иван Сергеев", "Инна Серова"],
#         "А": ["Анна Савельева"]
#     }
# }
# Сможете ли вы вернуть отсортированный по ключам словарь?
#
# Решение: Представлены оба варианта функций thesaurus() и thesaurus_adv(). Оба возвращают отсортированные словари
#
#       Дата  Автор
# 2021.06.15  Кузнецов Денис

def get_start_char_list(*args):
    """
    Функция возвращает первые буквы имен, полученных на входе
    :param args: Список имен
    :return: первые буквы имен, без повторений (повторы отбрасываем)
    """
    names_list = args
    result = []
    for el in range(0, len(names_list)):
        first_char = str(names_list[el])[0].upper()
        cnt = result.count(first_char)
        if cnt == 0:
            result.append(first_char)
    return result


def thesaurus(*args):
    """
    Функция thesaurus использует функцию get_start_char_list() для получения первых букв
    :param args: список имен
    :return: возвращает словарь, где ключ первая буква имени, а значение - полученные имена на эту букву
    """
    start_chars = get_start_char_list(*args)  # первые буквы имен, полученных на входе
    start_chars.sort()  # Отсортируем список

    result = {}
    for el in start_chars:  # Инициализируем словарь пустыми списками (словарь так же будет отсортирован по ключу)
        result[el] = []

    names_list = args
    for el in names_list:  # заполним словарь
        result[el[0]].append(el)
    print(result)


def thesaurus_adv_helper(*args):
    """
    Вспомогательная функция для thesaurus_adv()
    :param args: список пар имя/фамилия : сначала имя, затем пробел и фамилия
    :return: возвращает неотсортированный словарь.
    Ключи - первые буквы фамилий
    Значения - словари, ключами являются первые буквы имени, значениями - списки имен/фамилий
    """
    full_names_list = args
    result = {}
    for el in full_names_list:
        split_list = str(el).split(' ')  # разобъем на имя/фамилию

        surname_first_char = str(split_list[-1])[0].upper()  # Первая буква фамилии
        name_first_char = str(split_list[-2])[0].upper()  # Первая буква имени
        surname_dict = result.get(surname_first_char)  # Поищем значения по букве фамилии
        if surname_dict is None:  # Если ничего нет
            name_list = [el]  # создадим список [имя_фамилия]
            # добавим словарь в словарь: (буква имени, [имя_фамилия])
            result[surname_first_char] = {name_first_char: name_list}
        else:  # Если по фамилии есть словарь, поищем по имени
            name_list = surname_dict.get(name_first_char)  # Поищем словарь
            if name_list is None:  # Если ничего нет
                surname_dict[name_first_char] = [el]  # Добавим элемент списка
            else:  # Если список уже есть, дополним
                surname_dict[name_first_char].append(el)
    return result


def thesaurus_adv(*args):
    prev_result = thesaurus_adv_helper(*args)  # получим неотсортированную структуру
    result_keys = []
    result = {}
    for key in prev_result:  # соберем ключи (фамильные)...
        result_keys.append(key)
    result_keys.sort()  # ... и отсортируем ('А', 'И', 'С')

    for el in result_keys:  # заполним отсортированную по фамилии копию
        sub_el_keys = []
        name_result = {}
        for sub_el in prev_result[el].keys():
            for name_key in sub_el:  # соберем ключи (именные)...
                sub_el_keys.append(name_key)
        sub_el_keys.sort()  # ... и отсортируем
        for i in sub_el_keys:  # заполним отсортированную по имени копию
            name_result[i] = prev_result[el][i]
        result[el] = name_result
    print(result)


thesaurus("Иван", "Мария", "Петр", "Илья")
thesaurus_adv("Иван Сергеев", "Инна Серова", "Петр Алексеев", "Илья Иванов", "Анна Савельева")
