create database Supermerca2;
use Supermerca2;
create table producto(idprod int primary key, nombrepro varchar(20), precio float, idtipopro int);
create table tipoproducto(idtipopro int primary key, nombretipopro varchar(20));
ALTER TABLE producto ADD CONSTRAINT fkproytipo FOREIGN KEY (idtipopro) REFERENCES tipoproducto (idtipopro);
insert into tipoproducto values(1, 'Lacteos'),(2,'Carnes'),(3,'Verduras');
insert into producto values(1,'leche',2000,1),(2,'queso',3500,1),(3,'yogurt',5000,1),(4,'chiguiro',15000,2),(5,'lechuga',900,3);

DELIMITER $$
CREATE PROCEDURE preciosProductos(IN nombreTipo VARCHAR(20), OUT precioMax FLOAT, OUT precioMin FLOAT, OUT precioPromedio FLOAT)
BEGIN
    SELECT MAX(precio) INTO precioMax FROM producto p
    INNER JOIN tipoproducto tp ON p.idtipopro = tp.idtipopro
    WHERE tp.nombretipopro = nombreTipo;

    SELECT MIN(precio) INTO precioMin FROM producto p
    INNER JOIN tipoproducto tp ON p.idtipopro = tp.idtipopro
    WHERE tp.nombretipopro = nombreTipo;

    SELECT AVG(precio) INTO precioPromedio FROM producto p
    INNER JOIN tipoproducto tp ON p.idtipopro = tp.idtipopro
    WHERE tp.nombretipopro = nombreTipo;
END$$
DELIMITER ;

SET @maxPrecio = 0;
SET @minPrecio = 0;
SET @promedioPrecio = 0;

CALL preciosProductos('Lacteos', @maxPrecio, @minPrecio, @promedioPrecio);
SELECT @maxPrecio AS PrecioMaximo, @minPrecio AS PrecioMinimo, @promedioPrecio AS PrecioPromedio;