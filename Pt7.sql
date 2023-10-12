create database Personal;
use Personal;
create table info(idinfo int primary key, nombre varchar(20), apellido varchar(20), fecha_nacimiento date);
insert into info values(1, 'Yaharra', 'Rubio', '2004-01-15');

ALTER TABLE Info ADD COLUMN edad INT AS (YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento));

select * from info;