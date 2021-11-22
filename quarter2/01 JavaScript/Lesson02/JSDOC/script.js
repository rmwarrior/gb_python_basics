/**
 * Складывает два числа
 * @param {number} a - первое число
 * @param {number} b - второе число
 */
function fAdd(a, b) {
    return a + b;
}

/**
 * Вычитает два числа
 * Из большего меньшее, либо возвращает 0, если числа равны.
 * @param {number} a - первое число
 * @param {number} b - второе число
 */
function fSub(a, b) {
    if (a > b)
        return a - b;
    else
        return b - a;
}

/**
 * Умножает два числа
 * @param {number} a - первое число
 * @param {number} b - второе число
 */
function fMul(a, b) {
    return a * b;
}

/**
 * Делит два числа, первое на второе
 * @param {number} a - первое число
 * @param {number} b - второе число
 */
function fDiv(a, b) {
    return a / b;
}

/**
 * Функция возвращает результат операции, который был передан
 * в параметр operation для двух первых аргументов (arg1 и arg2)
 * @param {number} arg1 - первое число.
 * @param {number} arg2 - второе число.
 * @param {string} operation - строка, которая содержит один символ из:
 *   "+", "-", "*", "/"
 */
function mathOperation(arg1, arg2, operation) {
    switch (operation) {
        case '+': return fAdd(arg1, arg2);
            break;
        case '-': return fSub(arg1, arg2);
            break;
        case '*': return fMul(arg1, arg2);
            break;
        case '/': return fDiv(arg1, arg2);
            break;
        default: return NaN;
    }
}
