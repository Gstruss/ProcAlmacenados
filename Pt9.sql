create database Personas;
use Personas;



DELIMITER //
CREATE PROCEDURE actualizarColumnaEdad()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE userID INT;
    DECLARE cur CURSOR FOR SELECT id FROM Info;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO userID;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        UPDATE Info SET edad = calcularEdad(fecha_nacimiento) WHERE id = userID;
    END LOOP;
    
    CLOSE cur;
END //
DELIMITER ;

