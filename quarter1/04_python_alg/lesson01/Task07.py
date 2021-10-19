# 7. По длинам трех отрезков, введенных пользователем, определить возможность существования треугольника,
# составленного из этих отрезков. Если такой треугольник существует, то определить, является ли он разносторонним,
# равнобедренным или равносторонним.
lst = input('Введите длины сторон треугольника: ').split(' ')
lst.sort()

triangle_ok = True
for i in range(0, len(lst)):
    triangle_ok = triangle_ok and (float(lst[i]) + float(lst[(i+1) % 3])) > float(lst[(i+2) % 3])

if not triangle_ok:
    print(f'Из отрезков длиной {lst[0]}, {lst[1]} и {lst[2]} нельзя составить треугольник')
    exit(-1)
a = lst[0]
b = lst[1]
c = lst[2]

if a == b:
    if a == c:
        print('Треугольник равносторонний')
    else:
        print('Треугольник равнобедренный')
else:
    if (a == c) or (b == c):
        print('Треугольник равнобедренный')
    else:
        print('Треугольник разносторонний')
