DELIMITER $$
CREATE FUNCTION calcularEdad(fechaPasada DATE) RETURNS INT
BEGIN
    DECLARE fechaActual DATE;
    DECLARE edad INT;
    
    SET fechaActual = CURDATE();
    SET edad = TIMESTAMPDIFF(YEAR, fechaPasada, fechaActual);
    
    RETURN edad;
END$$
DELIMITER ;

SELECT calcularEdad('1989-10-03'); -- Ejemplo de uso pasando una fecha como parámetro