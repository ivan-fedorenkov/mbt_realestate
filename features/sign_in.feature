# language: ru

Функционал: Вход в учётную запись
  Для того чтобы получить доступ к защищенным ресурсам сайта
  Как администратор
  Я должен иметь возможность подтвердить свою личность

Сценарий: Вход в учётную запись через форму в меню навигации
  Допустим на сайте существует учётная запись:
  | email     | admin@mbt-realestate.com  |
  | password  | password                  |
  
  Допустим я нахожусь на главной странице
  
  Когда я заполняю поля формы входа в учётную запись следующими данными:
  | Email     | admin@mbt-realestate.com  |
  | Password  | password                  |
  
  То я должен оказаться на главной странице
  И я должен увидеть приветственное сообщение