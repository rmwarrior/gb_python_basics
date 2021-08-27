import requests
import datetime

KEY_DATE = 'Date'  # Ключ для получения даты из справочника
KEY_RATES = 'Rates'  # Ключ для получения курсов из справочника


def get_date(p_resp: requests.models.Response):
    """
    Возвращает дату курса валют
    :param p_resp: ответ от сервера типа requests.models.Response
    :return: дата курса валют, типа datetime.date
    """
    date_no_hdr = p_resp.text.split('<button class="datepicker-filter_button" type="button">')[1]
    cur_date_str = date_no_hdr.split('</button>')[0]
    cur_date_parts = cur_date_str.split('.')

    cur_date = datetime.date(int(cur_date_parts[2]), int(cur_date_parts[1]), int(cur_date_parts[0]))
    return cur_date


def get_rates_str():
    """
    Функция возвращает справочник валют. Печатает текущую дату.
    Реализовано поэтапно, при помощи строковых функций
    :return: справочник:
        первый элемент (с ключом KEY_DATE) - дата установления курсов
        второй элемент (с ключом KEY_RATES) - справочник валют: ключ - код валюты, значение - текущий курс (float)
    """
    resp = requests.get('https://www.cbr.ru/currency_base/daily/')  # ('https://www.cbr.ru')

    table_with_tail = resp.text.split('    <table class="data">')  # отсекаем шапку страницы до таблицы с курсами
    # отсекаем хвост страницы после таблицы с курсами
    table_body_with_hdr = table_with_tail[1].split('</td>\r\n        </tr>\r\n      </tbody>')
    # print('table_body_with_hdr', table_body_with_hdr[0])

    # отсекаем шапку таблицы валют
    table_body = table_body_with_hdr[0].split('</th>\r\n        </tr>\r\n        <tr>\r\n          <td>')
    # print(table_body[1])

    # получаем строки из таблицы валют
    table_rows = table_body[1].split('</td>\r\n        </tr>\r\n        <tr>\r\n          <td>')
    # print(table_rows[:])

    currency_dict = {}
    # Соберем справочник из кода и курса
    for el in table_rows:
        items = el.split('</td>\r\n          <td>')
        currency_dict[items[1]] = items[4].upper()
    # print(currency_dict)

    # Получим дату
    cur_date = get_date(resp)
    # print(f'Курсы валют на {cur_date:%d.%m.%Y}:')

    return {KEY_DATE: cur_date, KEY_RATES: currency_dict}


def currency_rates(*args):
    """
    Функция возвращает курсы валют
    :param args: коды валют в любом регистре (Usd, EUR, aud...)
    :return: список курсов валют, если валюта не найдена, возвращает None
    """
    # Получаем справочник валют
    currency_dict = get_rates_str()
    cur_date = get_rates_str()[KEY_DATE]
    result = []
    for cur in args:
        cur_upper = cur.upper()
        if cur_upper in currency_dict[KEY_RATES].keys():
            float_value = float(currency_dict[KEY_RATES][cur_upper].replace(",", "."))
        else:
            float_value = None
        result.append(float_value)
    return {KEY_DATE: cur_date, KEY_RATES: result}


if __name__ == '__main__':
    rates = currency_rates("usd", "euR")
    print(f'Текущий курс валют USD, EUR составляет {rates[KEY_RATES]}')

    rates = currency_rates("usd", "euR", "Aud", "ByN", "hKD")
    print(f'Текущий курс валют USD, EUR, AUD, BYN, HKD составляет {rates[KEY_RATES]}')
