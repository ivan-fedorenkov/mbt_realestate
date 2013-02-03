# language: ru

@require-seed-data
Функционал: Поиск лотов
  Для того чтобы привлекать новых клиентов 
  Пользователи должны иметь возможность искать лоты, используя форму поиска

Предыстория:
  Допустим на сайте размещены следующие лоты:
    
    | Title     | Type          | Location  | Price |

    | Res #1    | Residential   | Larnaca   | 1000  |
    | Res #2    | Residential   | Nicosia   | 2000  |
    | Res #3    | Residential   | Famagusta | 3000  |
    | Res #4    | Residential   | Larnaca   | 2500  |
    | Res #5    | Residential   | Larnaca   | 3500  |

    | Inv #1    | Investment    | Paphos    | 1000  |
    | Inv #2    | Investment    | Limassol  | 2000  |
    | Inv #3    | Investment    | Larnaca   | 3000  |

    | Pl #1     | Plot          | Larnaca   | 1000  |
    | Pl #2     | Plot          | Nicosia   | 2000  |
    | Pl #3     | Plot          | Paphos    | 3000  |

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
  | Buy a residential         | All      | 0          | No limit | должны содержать все предложения о жилье                 |
  | Invest money in something | All      | 0          | No limit | должны содержать все предложения для инвестирования      |
  | Buy a land or plot        | All      | 0          | No limit | должны содержать все предложения о покупке земли         |

  | Buy a residential         | Nicosia  | 0          | No limit | должны содержать следующие предложения о жилье: Res #2   |
  | Buy a residential         | Larnaca  | 0          | No limit | должны содержать следующие предложения о жилье: Res #1, Res #4, Res #5 |
  | Buy a residential         | Larnaca  | 1000       | 2500     | должны содержать следующие предложения о жилье: Res #1, Res #4 |
  | Buy a residential         | All      | 3000       | No limit | должны содержать следующие предложения о жилье: Res #3, Res #5 |
  | Buy a residential         | All      | 5000       | No limit | не должны содержать ни одного предложения о жилье        |

