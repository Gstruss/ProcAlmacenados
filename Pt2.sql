DELIMITER $$
CREATE PROCEDURE obtenerNota(
    IN nota FLOAT
)
BEGIN
    DECLARE mensaje VARCHAR(100);
    
    IF nota >= 0 AND nota < 5 THEN
        SET mensaje = 'Insuficiente';
    ELSEIF nota >= 5 AND nota < 6 THEN
        SET mensaje = 'Aprobado';
    ELSEIF nota >= 6 AND nota < 7 THEN
        SET mensaje = 'Bien';
    ELSEIF nota >= 7 AND nota < 9 THEN
        SET mensaje = 'Notable';
    ELSEIF nota >= 9 AND nota <= 10 THEN
        SET mensaje = 'Sobresaliente';
    ELSE
        SET mensaje = 'Nota no válida';
    END IF;
    
    SELECT mensaje AS 'Resultado';
END$$

DELIMITER ;
CALL obtenerNota(10);
