-- Домашняя работа 3
USE lesson1;
CREATE TABLE IF NOT EXISTS staff
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
	firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL (8,2),
    age INT
); 
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES 
    ('Вася', 'Петров', 'Начальник', 40, 100000, 60), 
	('Петр', 'Власов', 'Начальник', 8, 70000, 30), 
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),  
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35), 
	('Иван', 'Иванов', 'Рабочий', 40, 30000, 59), 
	('Петр', 'Петров', 'Рабочий', 20, 25000, 40), 
    ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),  
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28), 
    ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25), 
	('Максим', 'Максимов', 'Рабочий', 2, 11000, 22), 
    ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),  
    ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    
SELECT *
FROM staff;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
SELECT *
FROM staff
ORDER BY salary DESC;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: возрастания
SELECT *
FROM staff
ORDER BY salary;

-- Выведите 5 максимальных заработных плат (saraly)
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5; -- Выведет первые 5 строк в отсортированном множестве

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
	post AS "Специальность",
    SUM(salary) AS "Сумарная ЗП по отделу"
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT 
	post AS "Специальность",
    COUNT(post) AS "кол-во Рабочиx в возрасте от 24 до 49 лет"
FROM staff
WHERE post = "Рабочий" AND age >=24 AND  age <=49 -- до формирование группы
GROUP BY post;

-- вывести двух рабочих в возрасте 24-49 с максимальной зп
SELECT *
FROM staff
WHERE post = "Рабочий" AND age >=24 AND  age <=49 -- до формирование группы
ORDER BY salary DESC
LIMIT 2;

-- Найдите количество специальностей
SELECT  COUNT(distinct post) AS "Количество специальностей в организации"
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
SELECT 
	post,
    AVG(age)
FROM staff
GROUP BY post
HAVING AVG(age) <=30; -- до формирование группы
