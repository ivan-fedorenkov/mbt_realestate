# language: ru

@require-seed-data
Функционал: Поиск предложений о жилье
  Для того чтобы привлекать новых клиентов 
  Пользователи должны иметь возможность искать предложения о жилье, используя форму поиска

Предыстория:
  Допустим на сайте размещены следующие предложения о жилье:
    | Название                                | Месторасположение | Тип жилья       | Цена    |
    | Detached house residential              | Larnaca           | detached_house  | 1000    |
    | Semi detached residential               | Limassol          | semi_detached   | 2000    |
    | Town house residential                  | Nicosia           | town_house      | 3000    |
    | Apartment residential                   | Paphos            | apartment       | 4000    |
    | Semi detached limassol residential 1500 | Limassol          | semi_detached   | 1500    |
    | Semi detached limassol residential 2000 | Limassol          | semi_detached   | 2000    |
    | Semi detached limassol residential 4000 | Limassol          | semi_detached   | 4000    |

  Допустим я - обычный пользователь сайта
  И я нахожусь на главной странице

Структура сценария: Поиск предложения о жилье
  Допустим я хочу найти предложение о жилье <search_criteria>
  Когда я заполняю поля формы поиска предложений о жилье следующими значениями:
    | Месторасположение | <residential_location>    |
    | Тип жилья         | <residential_type>        |
    | Цена от           | <residential_price_from>  |
    | Цена до           | <residential_price_to>    |

  То я должен оказаться на странице результатов поиска предложений о жилье
  И я должен видеть <search_results> в результатах поиска

Примеры:
  | search_criteria                 | residential_location | residential_type | residential_price_from | residential_price_to | search_results                                                                                              |
  | используя тип жилья             | All                  | Detached House   | 1000                   | 2000                 | Detached house residential                                                                                  |
  | используя тип жилья             | All                  | Town House       | 0                      | No limit             | Town house residential                                                                                      |
  | используя месторасположение     | Larnaca              | All              | 0                      | No limit             | Detached house residential                                                                                  |
  | используя месторасположение     | Paphos               | All              | 0                      | No limit             | Apartment residential                                                                                       |
  | используя цену                  | All                  | All              | 1500                   | 3000                 | Все, кроме: Detached house residential, Apartment residential, Semi detached limassol residential 4000      |
  | используя цену                  | All                  | All              | 3000                   | No limit             | Town house residential, Apartment residential, Semi detached limassol residential 4000                      |
  | используя все параметры         | Limassol             | Semi Detached    | 1000                   | 2000                 | Semi detached residential, Semi detached limassol residential 1500, Semi detached limassol residential 2000 |
  | используя все параметры         | Limassol             | Semi Detached    | 5000                   | No limit             | Ни одного предложения о жилье                                                                               |
  | не используя никаких параметров | All                  | All              | 0                      | No limit             | Все предложения о жилье                                                                                     |