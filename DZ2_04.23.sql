-- Урок 2. SQL – создание объектов, простые запросы выборки
/* 
Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE DATABASE IF NOT EXISTS lesson1;
USE lesson1;
CREATE TABLE IF NOT EXISTS sales
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
	order_date DATE,
    count_product INT
); 

INSERT sales (order_date, count_product)
VALUES 
    ('2022-01-01', 156), 
	('2022-01-02', 180),
    ('2022-01-03', 21), 
	('2022-01-04', 124),
    ('2022-01-05', 341);
    
SELECT *
FROM sales;

SELECT 
		id AS "id заказа",
        IF (count_product < 100, "Маленький заказ",
			IF(count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ"))
		AS "Тип заказа"
FROM sales;

CREATE TABLE IF NOT EXISTS orders
(
    id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(45),
    amount DECIMAL (11,2),
    order_status VARCHAR(45)
); 

INSERT orders (employee_id, amount, order_status)
VALUES 
    ('e03', 15.00, 'OPEN'), 
	('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'), 
	('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    
SELECT *
FROM orders;

/*
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/
SELECT employee_id, order_status,
CASE order_status
    WHEN "OPEN" THEN 'Order is in open state'
    WHEN "CLOSED" THEN 'Order is closed'
    ELSE 'Order is cancelled'
END AS full_order_status
FROM orders;