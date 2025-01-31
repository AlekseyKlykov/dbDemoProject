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
Логин: usr
Пароль: pwd
2. Выполнить команду(ничего не менять) docker run --name springwebproject -p 8090:8090 alekseyklykov/springwebdemo:latest
3. Необходимо создать сеть и добавить в нее 2 вышеперечисленных контейнера для того чтобы они могли обмениваться сообщениями
  docker network create springwebdemo-network - для создания сети
  docker network connect springwebdemo-network pg-docker - для добавления в сеть контейнер c Postgres
  docker network connect springwebdemo-network springwebproject - для добавления контейнера с web-приложением
Будем считать, что вышеперечисленные пункты были выполнены.
Для проверки функционирования web приложения введем в адресную строку http://localhost:8090/users
После ввода и нажатия кнопки Enter должно отобразится приветсвие 
![image](https://github.com/user-attachments/assets/c1c2bfb7-a071-4ab9-b02a-0e142ad6f79a)

Для проверки функционирования БД, а также функционирования связи между двумя контейнерами обратимся к БД и попробуем считать информацию о пользователе
Введем в адресную строку http://localhost:8090/users/s_pupkin
В ответ мы должны получить информацию о пользователе
![image](https://github.com/user-attachments/assets/7ad7e042-fabe-4bd2-9031-6df8318032f1)

Для проверки вставки данных в таблицу введем в адресную строку http://localhost:8090/users/CreateUser?lastName=Kovalev&firstName=Evgeniy&login=e_kovalev&password=ekovaalev123&active=1&role=1
В ответ никаких сообщений не отобразится. После ввода ссылки выше можно выполнить первую команду, а именно запросить вывести на экран пользователя 


  
</h4>

