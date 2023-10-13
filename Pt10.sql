DELIMITER $$
CREATE PROCEDURE ObtenerSensoresPorDependencia(IN idDependencia INT)
BEGIN
    SELECT s.*
    FROM Sensores s
    INNER JOIN Dependencia d ON s.iddepe = d.iddepe
    WHERE d.iddepe = idDependencia;
END $$
DELIMITER ;

call ObtenerSensoresPorDependencia(3);