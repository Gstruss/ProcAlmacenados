create database Supermerca;
use Supermerca;
create table producto(idprod int primary key, nombrepro varchar(20), idtipopro int);
create table tipoproducto(idtipopro int primary key, nombretipopro varchar(20));
ALTER TABLE producto ADD CONSTRAINT fkproytipo FOREIGN KEY (idtipopro) REFERENCES tipoproducto (idtipopro);
insert into tipoproducto values(1, 'Lacteos'),(2,'Carnes'),(3,'Verduras');
insert into producto values(1,'leche',1),(2,'queso',1),(3,'pollo',2),(4,'chiguiro',2),(5,'lechuga',3);

DELIMITER $$
CREATE PROCEDURE cantProductos(IN tipo_producto VARCHAR(20), OUT cantidad INT)
BEGIN
    SELECT COUNT(*) INTO cantidad
    FROM producto p
    INNER JOIN tipoproducto tp ON p.idtipopro = tp.idtipopro
    WHERE tp.nombretipopro = tipo_producto;
END$$
DELIMITER ;

CALL cantProductos('Lacteos', @resultado);
SELECT @resultado;