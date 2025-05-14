CREATE DATABASE users_adverts;


CREATE TABLE users(
date DATE,	
user_id	VARCHAR(50),
view_adverts INT
);

SELECT * FROM users;

-- TASK 1 
#1 Напишите запрос SQL, выводящий одним числом количество уникальных пользователей в этой таблице в период с 2023-11-07 по 2023-11-15.

SELECT COUNT(DISTINCT(user_id)) AS unique_users 
FROM users
WHERE DATE BETWEEN '2023-11-07' AND '2023-11-15';

#2 Определите пользователя, который за весь период посмотрел наибольшее количество объявлений. 

SELECT user_id, SUM(view_adverts) AS total_views
FROM users
GROUP BY user_id
ORDER BY total_views DESC
LIMIT 1;

#3 Определите день с наибольшим средним количеством просмотренных рекламных объявлений на пользователя, но учитывайте только дни с более чем 500 уникальными пользователями.

SELECT date,
AVG(view_adverts) AS avg_views,
COUNT(DISTINCT user_id) AS unique_users
FROM users
GROUP BY date
HAVING unique_users > 500
ORDER BY avg_views DESC
LIMIT 1;

#4 Напишите запрос возвращающий LT (продолжительность присутствия пользователя на сайте) по каждому пользователю. Отсортировать LT по убыванию.

SELECT user_id, COUNT(DISTINCT date) AS LT
FROM users
GROUP BY user_id
ORDER BY LT DESC;

#5 Для каждого пользователя подсчитайте среднее количество просмотренной рекламы за день, а затем выясните, у кого самый высокий средний показатель среди тех, кто был активен как минимум в 5 разных дней.
SELECT user_id,
SUM(view_adverts) / COUNT(DISTINCT date) AS avg_ads_per_day,
COUNT(DISTINCT date) AS active_days
FROM users
GROUP BY user_id
HAVING active_days >= 5
ORDER BY avg_ads_per_day DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------------------------------------
-- TASK №2
CREATE DATABASE mini_project;
USE mini_project;

CREATE TABLE T_TAB1 (
    ID INT PRIMARY KEY,
    GOODS_TYPE VARCHAR(50),
    QUANTITY INT,
    AMOUNT INT,
    SELLER_NAME VARCHAR(50)
);


CREATE TABLE T_TAB2 (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SALARY INT,
    AGE INT
);

INSERT INTO T_TAB1 (ID, GOODS_TYPE, QUANTITY, AMOUNT, SELLER_NAME) VALUES
(1, 'MOBILE PHONE', 2, 400000, 'MIKE'),
(2, 'KEYBOARD', 1, 10000, 'MIKE'),
(3, 'MOBILE PHONE', 1, 50000, 'JANE'),
(4, 'MONITOR', 1, 110000, 'JOE'),
(5, 'MONITOR', 2, 80000, 'JANE'),
(6, 'MOBILE PHONE', 1, 130000, 'JOE'),
(7, 'MOBILE PHONE', 1, 60000, 'ANNA'),
(8, 'PRINTER', 1, 90000, 'ANNA'),
(9, 'KEYBOARD', 2, 10000, 'ANNA'),
(10, 'PRINTER', 1, 80000, 'MIKE');

SELECT * FROM t_tab1;

INSERT INTO T_TAB2 (ID, NAME, SALARY, AGE) VALUES
(1, 'ANNA', 110000, 27),
(2, 'JANE', 80000, 25),
(3, 'MIKE', 120000, 25),
(4, 'JOE', 70000, 24),
(5, 'RITA', 120000, 29);

SELECT * FROM t_tab2;


-- После создания базы данных и таблиц, выполните следующие задания:

#1 Напишите запрос, который вернёт список уникальных категорий товаров (GOODS_TYPE). Какое количество уникальных категорий товаров вернёт запрос?

SELECT DISTINCT(GOODS_TYPE)  AS dist_goods_types 
FROM t_tab1;

SELECT COUNT(DISTINCT GOODS_TYPE) AS COUNT FROM T_TAB1;

#2 Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных мобильных телефонов. Какое суммарное количество и суммарную стоимость вернул запрос?
SELECT * FROM t_tab2;

SELECT GOODS_TYPE,SUM(QUANTITY) AS total_quantity,
SUM(AMOUNT) AS total_amount
FROM t_tab1
WHERE GOODS_TYPE = 'MOBILE PHONE';


#3 Напишите запрос, который вернёт список сотрудников с заработной платой > 100000. Какое кол-во сотрудников вернул запрос?

SELECT * FROM t_tab2
WHERE SALARY > 100000;

SELECT COUNT(*) FROM t_tab2
WHERE SALARY > 100000;

#4 Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, а также минимальную и максимальную заработную плату.

SELECT 
	MIN(AGE) AS min_age,
	MAX(AGE) AS max_age,
	MIN(SALARY) AS min_salary,	
	MAX(SALARY) AS max_salary
FROM t_tab2;

#5 Напишите запрос, который вернёт среднее количество проданных клавиатур и принтеров.

SELECT * FROM t_tab1;

SELECT AVG(QUANTITY) AS avg_quantity
FROM T_TAB1
WHERE GOODS_TYPE IN ('KEYBOARD', 'PRINTER');

#6 Напишите запрос, который вернёт имя сотрудника и суммарную стоимость проданных им товаров.

SELECT SELLER_NAME,SUM(AMOUNT) AS total_sales
FROM t_tab1 
GROUP BY SELLER_NAME;

#7 Напишите запрос, который вернёт имя сотрудника, тип товара, кол-во товара, стоимость товара, заработную плату и возраст сотрудника MIKE.

SELECT t1.SELLER_NAME,
	t1.GOODS_TYPE,
	t1.QUANTITY,
    t1.AMOUNT,
    t2.salary,
    t2.age
FROM t_tab1 t1
JOIN t_tab2 T2 
ON t1.SELLER_NAME = t2.name
WHERE t1.SELLER_NAME = 'MIKE';

#8 Напишите запрос, который вернёт имя и возраст сотрудника, который ничего не продал. Сколько таких сотрудников?

SELECT 
t2.NAME, t2.AGE
FROM T_TAB2 t2
LEFT JOIN T_TAB1 t1 ON t2.NAME = t1.SELLER_NAME
WHERE t1.ID IS NULL;

SELECT COUNT(*) AS Count
FROM T_TAB2 t2
LEFT JOIN T_TAB1 t1 
    ON t2.NAME = t1.SELLER_NAME
WHERE t1.ID IS NULL;

#9 Напишите запрос, который вернёт имя сотрудника и его заработную плату с возрастом меньше 26 лет? Какое количество строк вернул запрос?

SELECT name, salary FROM t_tab2
WHERE AGE < 26;

SELECT COUNT(*) AS COUNT 
FROM t_tab2
WHERE AGE < 26;

#10 Сколько строк вернёт следующий запрос:
SELECT * FROM T_TAB1 t
JOIN T_TAB2 t2 ON t2.name = t.seller_name
WHERE t2.name = 'RITA';

# ANSWER:0 потому что она ничего не продавала


--------------------------------------------------------------------------------------------------------------------------

-- TASK 3 
CREATE DATABASE test_db;

create table audiobooks (
	uuid varchar(8), 			       	-- audiobook id 
	duration int, 				       	-- duration of audiobook in seconds 
	title varchar(65)					-- audiobook title 
);

create table audio_cards(
  id int,  					           	-- audiobook added to users libriary 
  user_id int,  				       	-- id of card owner 
  state varchar(9),						-- state of card 
  progress int,  				       	-- users current progress seconds 
  audiobook_uuid varchar(8) 	 		-- audiobook id 
 ); 

create table listenings (
  id int,  								-- record of user listened to audiobook 
  user_id int,  				       	-- listener id 
  position_from int, 			     	-- started listening from second 
  position_to int,  			     	-- finished listening to second 
  speed_multiplier float,  		 		-- speed of listening 
  audiobook_uuid varchar(8), 	 		-- audio book id 
  os_name varchar(8), 			   		-- operation system 
  is_test int, 					       	-- is test record or not 
  started_at timestamp,        			-- started listening 
  finished_at timestamp        			-- finished listening 
 );
 
 
 -----------------------------------------------------------------------------------------------------------------------------------

#1 Выведите сколько пользователей добавили книгу 'Coraline', сколько пользователей прослушало больше 10%. 

-- a) Пользователи, добавившие 'Coraline'
SELECT COUNT(DISTINCT ac.user_id) AS users_added
FROM audio_cards ac
JOIN audiobooks ab 
ON ac.audiobook_uuid = ab.uuid
WHERE ab.title = 'Coraline';

-- b) Пользователи, прослушавшие более 10% книги 'Coraline'

SELECT * FROM listenings;

SELECT COUNT(DISTINCT l.user_id) AS users_listened_more_than_10
FROM listenings l
JOIN audiobooks ab
ON l.audiobook_uuid = ab.uuid
WHERE ab.title = 'Coraline'
AND (l.position_to - l.position_from) > ab.duration * 0.10;


SELECT COUNT(DISTINCT ac.user_id) AS users_added_Coraline, COUNT(DISTINCT users_listened.user_id) AS users_listened_more_than_10_percent_of_Coraline
FROM audio_cards ac
JOIN audiobooks ab ON ac.audiobook_uuid = ab.uuid
LEFT JOIN (SELECT l.user_id, l.audiobook_uuid
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE ab.title = 'Coraline'
GROUP BY l.user_id, ab.duration, l.audiobook_uuid
HAVING SUM(l.position_to - l.position_from) > 0.1 * ab.duration)
AS users_listened ON ac.user_id = users_listened.user_id
WHERE ab.title = 'Coraline';


#2 По каждой операционной системе и названию книги выведите количество пользователей, сумму прослушивания в часах, не учитывая тестовые прослушивания. 
SELECT l.os_name,
ab.title,
COUNT(DISTINCT l.user_id) AS user_count,
ROUND(SUM((l.position_to - l.position_from) / 3600.0), 2) AS total_listening_hours
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE l.is_test = 0
GROUP BY l.os_name, ab.title
ORDER BY total_listening_hours DESC;

#3 Найдите книгу, которую слушает больше всего людей. 

SELECT ab.title, COUNT(DISTINCT l.user_id) AS listeners
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
GROUP BY ab.title
ORDER BY listeners DESC
LIMIT 1;


#4 Найдите книгу, которую чаще всего дослушивают до конца.

SELECT ab.title, COUNT(*) AS completed_count
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE l.position_to = ab.duration
GROUP BY ab.title
ORDER BY completed_count DESC
LIMIT 1;