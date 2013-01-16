#language: ru

@admins-only
Функционал: Создание статей
  Для того чтобы упростить работу со статическими (текстовыми) материалами на сайте
  Как администратор
  Я должен иметь возможность редактировать их в специальном разделе
  
Предыстория:
  Допустим на сайте существует статья с заголовком "Какая-то умная статья"
  
  Допустим я нахожусь на главной странице панели администратора
  И перехожу в раздел администрирования статей 
  
Сценарий: Редактирование существующей статьи
  Когда я перехожу по ссылке "Edit" статьи "Какая-то умная статья"  
  То я должен оказаться на странице редактирования этой статьи
    
  Когда я изменяю название статьи на "Глупая статья"
  И оставляю остальные поля формы без изменений
  
  То я должен оказаться на странице просмотра изменяемой статьи
  Но её название должно измениться на "Глупая статья"