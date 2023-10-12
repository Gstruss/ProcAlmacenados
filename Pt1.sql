DELIMITER //
CREATE PROCEDURE helloWorld()
BEGIN
    SELECT '¡Hola mundo!';
END //
DELIMITER ;
CALL helloWorld();