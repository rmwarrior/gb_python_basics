# Урок 1.
# Задание 3.
# Реализовать склонение слова «процент» для чисел до 20.
# Например, задаем число 5 — получаем «5 процентов», задаем число 2 — получаем «2 процента».
# Вывести все склонения для проверки.
#
# Решение: Найдем все возможные варианты окончаний и запишем в список.
# Можно было бы использовать перекодировщик "percent_codes", но в нем нет смысла,
# так как окончания хорошо укладываются в 3 диапазона.
# Дальше - дело техники, в зависимости от значения подбираем нужное окончание.
# Программа запрашивает значение от 1 до 20, выводит результат, а затем выводит все значения от 1 до 20
#       Дата  Автор
# 2021.06.06  мальчик Денис, 43 годика

# Определим используемые константы

PERCENT_TXT = 'процент'

percent_ends = ['', 'а', 'ов']  # список возможных уникальных окончаний
# percent_codes = [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]  # список кодов уникальных окончаний

percent_value_s = input('Введите число от 1 до 20: ')
if percent_value_s.isdecimal():
    percent_value = int(percent_value_s)
    if percent_value == 1:
        print(percent_value, PERCENT_TXT + percent_ends[0])
    elif percent_value < 5:
        print(percent_value, PERCENT_TXT + percent_ends[1])
    elif percent_value <= 20:
        print(percent_value, PERCENT_TXT + percent_ends[2])
else:
    print('Должно быть число от 1 до 20: ')

print('----------------------------------')

for i in range(0, 20):
    percent_value = i + 1
    if percent_value == 1:
        print(percent_value, PERCENT_TXT + percent_ends[0])
    elif percent_value < 5:
        print(percent_value, PERCENT_TXT + percent_ends[1])
    elif percent_value <= 20:
        print(percent_value, PERCENT_TXT + percent_ends[2])
