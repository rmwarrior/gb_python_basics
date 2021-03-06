# Урок 2. Задание 4.
# Дан список, содержащий искажённые данные с должностями и именами сотрудников:
# ['инженер-конструктор Игорь', 'главный бухгалтер МАРИНА', 'токарь высшего разряда нИКОЛАй', 'директор аэлита']
#
# Известно, что имя сотрудника всегда в конце строки. Сформировать и вывести на экран фразы вида: 'Привет, Игорь!'
# Подумать, как получить имена сотрудников из элементов списка, как привести их к корректному виду.
# Можно ли при этом не создавать новый список?
#
# Решение: На вопрос "Можно ли не создавать новый список?" можно ответить если знать цель - что делать с именами.
# Если вывести на экран, то можно.
# Если их куда-то сохранить, то тоже можно - записать в строку, а потом сплитить по необходимости и т. д.
#
#       Дата  Автор
# 2021.06.09  Кузнецов Денис

working_list = ['инженер-конструктор Игорь', 'главный бухгалтер МАРИНА', 'токарь высшего разряда нИКОЛАй',
                'директор аэлита']
idx = 0
while idx < len(working_list):
    list_element = working_list[idx]  # загрузим элемент в строку
    list_element = list_element.split(' ')[-1]  # разобъем на элементы и возьмем последний - Имя
    list_element = list_element.lower().capitalize()  # Приведём к нижнему регистру и сделаем заглавной первую букву
    print(f'Привет, {list_element}!')
    idx += 1
