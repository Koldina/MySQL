USE lesson3;
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE PROCEDURE times_2 (seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE seconds >= 86400 DO
    SET days = seconds / 86400;
    SET seconds = seconds MOD 86400;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET hours = seconds / 3600;
    SET seconds = seconds MOD 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET minutes = seconds / 60;
    SET seconds = seconds MOD 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL times_2(123456);
 
-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DELIMITER %%
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT DEFAULT 1;
    DECLARE result VARCHAR(45) DEFAULT '';
    WHILE n <= 10 DO
        IF n % 2 = 0 THEN
            IF result = '' THEN
                SET result = n;
            ELSE
                SET result = CONCAT(result, ',', n);
            END IF;
        END IF;
        SET n = n + 1;
    END WHILE;
    SELECT result;
END %%
DELIMITER ;

CALL numbers();