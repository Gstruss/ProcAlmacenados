use Supermerca2;

DELIMITER //
CREATE PROCEDURE funcionIVA(IN idProducto INT)
BEGIN
    DECLARE precioProducto FLOAT;
    DECLARE totalConIVA FLOAT;
    
    -- Obtener el precio del producto según su ID
    SELECT precio INTO precioProducto FROM producto WHERE idprod = idProducto;
    
    -- Calcular el total con el incremento del IVA del 13%
    SET totalConIVA = precioProducto + (precioProducto * 0.13);
    
    -- Mostrar el resultado
    SELECT 'Total con IVA: ' AS 'Mensaje', totalConIVA AS 'Total';
END //
DELIMITER ;

CALL funcionIVA(1);
-- EL producto 1 es la leche que cuesta sin IVA $2.000