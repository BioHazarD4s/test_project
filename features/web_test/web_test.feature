# encoding: UTF-8
# language: ru

Функция: Сравнение цен в различных торговых сетях

  Сценарий: Сравнение цен в различных торговых сетях

    И захожу на страницу "https://yandex.ru/"
    И ввожу в поисковой строке Яндекса текст "Эльдорадо"
    И выбираю в результате поиска ссылку на Эльдорадо
    И ввожу в поисковой строке Эльдорадо текст "Xiaomi mi smart band 5"
    И должен увидеть текст "По вашему запросу «Xiaomi mi smart band 5» найден 1 товар" на странице
    И должен увидеть текст "Фитнес-трекер Xiaomi Mi Smart Band 5 (BHR4215GL)" на странице
    И выбираю товар "Фитнес-трекер Xiaomi Mi Smart Band 5 (BHR4215GL)" в результате поиска Эльдорадо и запоминаю его стоимость

    И захожу на страницу "https://yandex.ru/"
    И ввожу в поисковой строке Яндекса текст "Мвидео"
    И выбираю в результате поиска ссылку на Мвидео
    И ввожу в поисковой строке Мвидео текст "Xiaomi mi smart band 5"
    И должен увидеть текст "Найден 1 товар по запросу "Xiaomi mi smart band 5" на странице
    И должен увидеть текст "Фитнес-трекер Xiaomi Mi Smart Band 5 (BHR4215GL/BHR4219RU)" на странице
    И выбираю товар "Фитнес-трекер Xiaomi Mi Smart Band 5 (BHR4215GL/BHR4219RU)" в результате поиска Мвидео и запоминаю его стоимость

    И цены на товар mi band в Мвидео и Эльдорадо должны быть равны