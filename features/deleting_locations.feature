# language: ru

@admins-only
Функционал: Удаление регионов
  Для того чтобы упростить работу с регионами
  Как администратор сайта
  Я должен иметь возможность удалять их в специальном разделе
  
Сценарий: Удаление существующего региона
  Допустим на сайт были добавлены следующие регионы:
    | Название региона  |
    | Larnaca           |
    | Nicosia           |

  Допустим я нахожусь на главной странице панели администратора
  И перехожу в раздел редактирования регионов
  
  Когда я перехожу по ссылке "Delete" региона "Larnaca"
  То я должен увидеть сообщение об успехе
  И я не должен видеть этот регион в списке регионов
  Но я должен видеть "Nicosia"