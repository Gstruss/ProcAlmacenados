create database Empresa;
use Empresa;
create table sucursal(idsucursal int primary key, idpais int);
create table paissucursal(idpais int primary key, nombrepais varchar(30));
ALTER TABLE sucursal ADD CONSTRAINT fkpaisysucu FOREIGN KEY (idpais) REFERENCES paissucursal (idpais);
insert into paissucursal values(1,'Colombia'),(2,'Perú'),(3,'Ecuador');
insert into sucursal values(1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,3),(8,3);

DELIMITER //
CREATE PROCEDURE ObtenerSucu(IN nombre_pais VARCHAR(30))
BEGIN
    SELECT s.*
    FROM sucursal s
    INNER JOIN paissucursal ps ON s.idpais = ps.idpais
    WHERE ps.nombrepais = nombre_pais;
END //
DELIMITER ;
CALL ObtenerSucu('Colombia');