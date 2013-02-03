# language: ru

@require-seed-data
Функционал: Поиск лотов
  Для того чтобы привлекать новых клиентов 
  Пользователи должны иметь возможность искать лоты, используя форму поиска

Предыстория:
  Допустим на сайте размещены следующие лоты:
    
    | Title     | Type          | Location  | Price | Lot Internal Type   |

    | Res #1    | Residential   | Larnaca   | 1000  | detached_house      |
    | Res #2    | Residential   | Nicosia   | 2000  | detached_house      |
    | Res #3    | Residential   | Famagusta | 3000  | apartment           |
    | Res #4    | Residential   | Larnaca   | 2500  | semi_detached       |
    | Res #5    | Residential   | Larnaca   | 3500  | town_house          |

    | Inv #1    | Investment    | Paphos    | 1000  | detached_house      |
    | Inv #2    | Investment    | Limassol  | 2000  | detached_house      |
    | Inv #3    | Investment    | Larnaca   | 3000  | detached_house      |

    | Pl #1     | Plot          | Larnaca   | 1000  | plot                |
    | Pl #2     | Plot          | Nicosia   | 2000  | land                |
    | Pl #3     | Plot          | Paphos    | 3000  | land                |

Структура сценария: Поиск лота используя форму на главной странице
  Допустим я - обычный пользователь сайта
  И нахожусь на главной странице

  Когда я заполняю поля формы поиска лотов следующими значениями:
    | I want to   | <action>      |
    | Where       | <location>    |
    | Price from  | <price_from>  |
    | Price to    | <price_to>    |

  То я должен оказаться на странице результатов поиска лотов
  И результаты поиска <search_results>

Примеры:
  | action                    | location | price_from | price_to | search_results                                           |
  | Find a residential        | All      | Min        | Max      | должны содержать все предложения о жилье                 |
  | Invest money in something | All      | Min        | Max      | должны содержать все предложения для инвестирования      |
  | Buy a plot or land        | All      | Min        | Max      | должны содержать все предложения о покупке земли         |

  | Find a residential        | Nicosia  | Min        | Max      | должны содержать только следующие предложения о жилье: Res #2   |
  | Find a residential        | Larnaca  | Min        | Max      | должны содержать только следующие предложения о жилье: Res #1, Res #4, Res #5 |
  | Find a residential        | Larnaca  | 1000       | 2500     | должны содержать только следующие предложения о жилье: Res #1, Res #4 |
  | Find a residential        | All      | 3000       | Max      | должны содержать только следующие предложения о жилье: Res #3, Res #5 |
  | Find a residential        | All      | 5000       | Max      | не должны содержать ни одного предложения о жилье        |

Сценарий: Примемение фильтра к результатам поиска жилья
  Допустим я - обычный пользователь сайта
  И я нахожусь на главной странице

  Когда я отправляю форму поиска лотов
  То я должен оказаться на странице результатов поиска лотов
  И результаты поиска должны содержать все предложения о жилье

  Когда я применяю поисковой фильтр "Detached House"
  То результаты поиска должны содержать только следующие предложения о жилье: Res #1, Res #2

