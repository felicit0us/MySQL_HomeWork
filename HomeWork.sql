
-- 1 Выведите только чётные числа от 1 до 10.


DELIMITER //

CREATE PROCEDURE EvenNumbers(IN N INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(1000) DEFAULT '';
    
    WHILE i <= N DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, ' ', i, ',');
        END IF;
        SET i = i + 1;
    END WHILE;
    
      
    SELECT result;
END //

DELIMITER ;

DROP PROCEDURE EvenNumbers;

CALL EvenNumbers(10);

-- 2. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.

DELIMITER //

CREATE FUNCTION ConvertSeconds(seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    DECLARE result VARCHAR(100);

    SET days = seconds DIV 86400;
    SET hours = (seconds % 86400) DIV 3600;
    SET minutes = (seconds % 3600) DIV 60;
    SET remaining_seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');

    RETURN result;
END //

DELIMITER ;

DROP FUNCTION ConvertSeconds;

SELECT ConvertSeconds(123456);

