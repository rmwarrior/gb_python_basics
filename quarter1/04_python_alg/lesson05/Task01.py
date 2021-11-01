# 1. Пользователь вводит данные о количестве предприятий, их наименования и прибыль за 4 квартала
# (т.е. 4 отдельных числа) для каждого предприятия. Программа должна определить среднюю прибыль
# (за год для всех предприятий) и вывести наименования предприятий, чья прибыль выше среднего
# и отдельно вывести наименования предприятий, чья прибыль ниже среднего.
import random

# Для упрощения получения исходных данных, заведем словарь, в котором ключ - название компании, а прибыль за четыре
# квартала хранится в списке, заполняемом случайными числами (100 +/- 20 млн.)

plant_dict = {'ЕврАЗ': [100 + random.randint(-20, 20), 100 + random.randint(-20, 20),
                        100 + random.randint(-20, 20), 100 + random.randint(-20, 20)],
              'ММК': [100 + random.randint(-20, 20), 100 + random.randint(-20, 20),
                      100 + random.randint(-20, 20), 100 + random.randint(-20, 20)],
              'НЛМК': [100 + random.randint(-20, 20), 100 + random.randint(-20, 20),
                       100 + random.randint(-20, 20), 100 + random.randint(-20, 20)],
              'Северсталь': [100 + random.randint(-20, 20), 100 + random.randint(-20, 20),
                             100 + random.randint(-20, 20), 100 + random.randint(-20, 20)]}

plant_cnt = len(plant_dict)  # кол-во предприятий
sum_list = []  # хранилище сумм за год по предприятиям
for key, item in plant_dict.items():
    sum_list.append(sum(item))
    print(f'{key}, {sum(item)} млн.')

avg_sum = sum(sum_list) / plant_cnt  # средняя прибыль
print(f'{avg_sum = }')

sum_dict = dict(zip(plant_dict.keys(), sum_list))  # сцепим вместе прибыль и название предприятия
str_high = ''
str_low = ''
for key, item in sum_dict.items():
    if item > avg_sum:
        str_high = ' '.join([str_high, f'{key} ({item} млн.)'])
    elif item < avg_sum:
        str_low = ' '.join([str_low, f'{key} ({item} млн.)'])

if str_high != '':
    print(f'Предприятия, чья прибыль выше среднего: {str_high}')
if str_low != '':
    print(f'Предприятия, чья прибыль ниже среднего: {str_low}')

