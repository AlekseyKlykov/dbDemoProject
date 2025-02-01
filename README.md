<h1>Урок №6 Java-приложение в Docker</h1>

<h4>
В рамках данного урока было реализовано spring web приложение с операциями чтения и вставки в бд Postgres.
В БД Postgres уже есть 2 таблицы с тестовыми записями в базе demoDB:
  User - таблица с УЗ пользователей
  UserRole - таблица с группами доступа 
Приложение и субд размещены в разных контейнерах. Для создания контейнеров необходимо:
1. Выполнить команду для создания контейнера c Postgres(ничего не менять) run --name pg-docker -p 8006:5432  alekseyklykov/springwebpg
порт 8006 - это внешний порт через который можно подключиться через pgAdmin
порт 5432 - это внутренний порт, он нужен для того чтобы "общаться" между контейнерами
  <br>
Логин: usr
Пароль: pwd
  <br>
2. Выполнить команду(ничего не менять) docker run --name springwebproject -p 8090:8090 alekseyklykov/springwebdemo:latest
  <br>
3. Необходимо создать сеть и добавить в нее 2 вышеперечисленных контейнера для того чтобы они могли обмениваться сообщениями
  <br>
  docker network create springwebdemo-network - для создания сети
  <br>
  docker network connect springwebdemo-network pg-docker - для добавления в сеть контейнер c Postgres
  <br>
  docker network connect springwebdemo-network springwebproject - для добавления контейнера с web-приложением
  <br>
Будем считать, что вышеперечисленные пункты были выполнены.
  <br>
Для проверки функционирования web приложения введем в адресную строку http://localhost:8090/users
После ввода и нажатия кнопки Enter должно отобразится приветсвие 
![image](https://github.com/user-attachments/assets/c1c2bfb7-a071-4ab9-b02a-0e142ad6f79a)
<br>

Для проверки функционирования БД, а также функционирования связи между двумя контейнерами обратимся к БД и попробуем считать информацию о пользователе
<br>
Введем в адресную строку http://localhost:8090/users/s_pupkin
В ответ мы должны получить информацию о пользователе
![image](https://github.com/user-attachments/assets/7ad7e042-fabe-4bd2-9031-6df8318032f1)

Для проверки вставки данных в таблицу введем в адресную строку http://localhost:8090/users/CreateUser?lastName=Krivonogov&firstName=Sergey&login=s_krivonogov&password=kriv123&active=1&role=1
<br>
В ответ отобразится сообщение:
<br>
![image](https://github.com/user-attachments/assets/aed94fdd-2b4b-4f2b-8ad1-732a0e588ba2)

Если попробовать создать данного пользователя повторно(с одинаковым логином), то сервер вернет сообщение:
<br>
![image](https://github.com/user-attachments/assets/123e941e-c54a-4114-833a-4c846841168e)
При передачи ссылки  в адресную строку сервер вернет сообщение:
<br>
![image](https://github.com/user-attachments/assets/baaa96a4-9a70-48a6-b81c-dd75eef0f7c0)





  
</h4>

