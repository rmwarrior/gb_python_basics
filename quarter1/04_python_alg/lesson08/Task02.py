# 2. Закодируйте любую строку из трех слов по алгоритму Хаффмана.
import collections


# класс Узел
class Node:
    def __init__(self, parent, key, weight, left, right):
        self.parent = parent  # ссылка на Узел-родитель
        self.key = key  # ключ (в нашем случае буква)
        self.weight = weight  # вес узла (для листа - количество вхождений)
        self.left = left  # ссылка на дочерний Узел слева
        self.right = right  # ссылка на дочерний Узел справа


s = 'beep boop beer!'
c = collections.Counter(s)  # получение статистики по количеству вхождений
# print(c, c.most_common(len(c.keys())))

temp_lst = c.most_common(len(c.keys()))  # положим во временный список
print(temp_lst)

for i in range(len(temp_lst) // 2):  # обратим временный список
    temp_lst[i], temp_lst[-(i+1)] = temp_lst[-(i+1)], temp_lst[i]
print(temp_lst)

# сформируем из данных временного списка узлы Node и положим их в список
node_lst = []
for i in temp_lst:
    node = Node(None, i[0], i[1], None, None)  # parent, key, weight, left, right
    node_lst.append(node)
    # print(node.key)

# построим дерево
while len(node_lst) > 1:  # пока в списке узлов не останется один, родительский применим алгоритм Хаффмана
    n0 = node_lst[0]  # два первых узла n0 и n1 заменим на один
    n1 = node_lst[1]

    # новый узел node, потомками которого становятся n0 и n1
    node = Node(None, None, n0.weight + n1.weight, n0, n1)  # parent, key, weight, left, right
    n0.parent = node  # новый узел node, становится для них родителем
    n1.parent = node

    node_lst[0] = node  # первый элемент списка узлов заменяем на новый
    node_lst.pop(1)  # второй удалили (не самое эффективное решение, но сначала заставим работать)

    k = 0
    while (k + 1 < len(node_lst)) and (node_lst[k].weight > node_lst[k+1].weight):  # переместим новый узел
        node_lst[k], node_lst[k + 1] = node_lst[k + 1], node_lst[k]
        k += 1

    # x = []  # выведем отладочную информацию по текущему состоянию весов в списке
    # for item in node_lst:
    #     x.append(item.weight)
    # print(x)


# Распечатаем двоичный код ключа
def print_bin(p_node: Node, p_key):
    tmp_s = ''
    if p_node.key == p_key:  # если нашли узел, возвращаем ''
        tmp_s = ''
    elif (p_node.left is None) and (p_node.right is None):  # если дошли до листа, а ключ не совпал
        tmp_s = '-'  # возвращаем "-", то есть в этой ветке пусто
    else:
        if p_node.left:
            tmp_s1 = print_bin(p_node.left, p_key)  # рекурсивно пойдём по дереву
            if tmp_s1 == '-':
                tmp_s = '-'
            else:
                tmp_s = '0' + tmp_s1  # припишем 0, если узел левый

        if (tmp_s == '-') and p_node.right:
            tmp_s1 = print_bin(p_node.right, p_key)  # рекурсивно пойдём по дереву
            if tmp_s1 == '-':
                tmp_s = '-'
            else:
                tmp_s = '1' + tmp_s1  # припишем 1, если узел правый

    return tmp_s  # возвращаем полученный код выше по рекурсии
    # if p_node.parent is None:
    #     print(f'Код ключа "{p_key}" {tmp_s}')  # если вышли из рекурсии к корню дерева - выведем на экран код ключа
    # else:
    #     return tmp_s  # возвращаем полученный код выше по рекурсии


dic_codes = {}  # поместим коды в словарик и выведем на экран
for i in c.keys():
    dic_codes[i] = print_bin(node_lst[0], i)
    print(f'Код ключа "{i}" {dic_codes[i]}')

result = []  # закодируем строку
for i in s:
    result.append(dic_codes[i])

print(s)
print(''.join(result))

# Код ключа "b" 00
# Код ключа "e" 11
# Код ключа "p" 011
# Код ключа " " 010
# Код ключа "o" 101
# Код ключа "r" 1001
# Код ключа "!" 1000

# beep boop beer!
# 0011110110100010110101101000111110011000
# .b.e.e..p.. .b..o..o..p.. .b.e.e...r...!
