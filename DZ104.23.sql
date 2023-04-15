/* 
Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
*/
USE lesson1;

CREATE TABLE IF NOT EXISTS Model_phone
(
    id INT PRIMARY KEY AUTO_INCREMENT, -- PK = NOT NULL  , UNIQUE
    product_name VARCHAR(45) COMMENT 'Название мобильного телефона',
    manufacturer VARCHAR(45) COMMENT 'Производитель', 
    product_count INT COMMENT 'Количество товарных позиций на складе',
    price DECIMAL (11,2) COMMENT 'Цена за единицу товара'
); 

INSERT model_phone (product_name, manufacturer, product_count, price)
VALUES 
    ("IPhone X", "Apple", 3, 76000.00), 
	("IPhone 8", "Apple", 2, 51000.00),
    ("Galaxy S9", "Samsung", 2, 56000.00), 
	("Galaxy S8", "Samsung", 1, 41000.00),
    ("P20 Pro", "Xiaomi", 5, 36000.00);
    
SELECT *
FROM model_phone;

-- 2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT product_name, manufacturer, price
FROM model_phone
WHERE product_count > 2;

-- 3.  	Выведите весь ассортимент товаров марки “Samsung”
SELECT product_name
FROM model_phone
WHERE manufacturer = "Samsung";

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT product_name, manufacturer, product_count * price
FROM model_phone
WHERE product_count * price > 100000 AND product_count * price < 145000;

-- 4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
-- 	4.1. Товары, в которых есть упоминание "Iphone"
SELECT *
FROM model_phone
WHERE product_name LIKE "IPhone%";

-- 	4.2. "Galaxy"
SELECT *
FROM model_phone
WHERE product_name LIKE "Galaxy%";

-- 	4.3.  Товары, в которых есть ЦИФРЫ
SELECT *
FROM model_phone
WHERE product_name RLIKE "[0-9]";

-- 	4.4.  Товары, в которых есть ЦИФРА "8"  
SELECT *
FROM model_phone
WHERE product_name RLIKE "[8]";
 




