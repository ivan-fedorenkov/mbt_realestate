# language: ru

@admins-only
Функционал: Редактирование предложений о жилье
  Для того чтобы упростить работу с предложениями о жилье
  Как администратор
  Я должен иметь возможность редактировать их в специальном разделе
  

Предыстория:
  Допустим на сайте размещено преложение о жилье "East Beach, Limassol"

  Допустим я нахожусь на главной странице панели администратора
  И перехожу в раздел предложений о жилье
  
Сценарий: Редактирование существующего предложения
  Когда я перехожу по ссылке "Edit" предложения о жилье "East Beach, Limassol"
  То я должен оказаться на странице редактирования этого предложения о жилье
  
  Когда я изменяю название предложения на "New residential title"
  И оставляю остальные поля формы без изменений
  
  То я должен оказаться на странице этого предложения о жилье панели администратора
  Но его название должно измениться на "New residential title"

Сценарий: Добавление характеристик к предложению
  Допустим я нахожусь на странице редактирования предложения о жилье "East Beach, Limassol"
  Когда я заполняю поле "Дополнительные характеристики" значением "Feature #1: option #1, option#2; Feature #2: option #1"
  И оставляю остальные поля формы без изменений
  То я должен увидеть сообщение об успехе
  
  Когда я перехожу на страницу предложения о жилье "East Beach, Limassol"
  То я должен видеть все добавленные дополнительные характеристики