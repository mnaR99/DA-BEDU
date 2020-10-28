# Sesión 01: Fundamentos de SQL

USE tienda;
SHOW TABLES;
DESCRIBE articulo;
DESCRIBE empleado;
DESCRIBE puesto;
DESCRIBE venta;

SELECT * 
FROM empleado;

SELECT nombre 
FROM empleado;

SELECT nombre, 
  apellido_paterno 
FROM empleado;

SELECT * 
FROM empleado
WHERE apellido_paterno = 'Risom';

SELECT * 
FROM empleado
WHERE id_empleado = 10;

SELECT * 
FROM empleado
WHERE id_puesto > 100;

SELECT * 
FROM empleado
WHERE id_puesto >= 100 
  AND id_puesto <= 200;

SELECT * 
FROM empleado
WHERE id_puesto = 100 
  OR id_puesto = 200;

SELECT * 
FROM empleado
WHERE id_puesto IN (100,200,300);

## RETO 2
# ¿Cuál es el nombre de los empleados con el puesto 4?
SELECT nombre
FROM empleado
WHERE id_puesto = 4;

# ¿Qué puestos tienen un salario mayor a $10,000?
SELECT * 
FROM puesto
WHERE salario > 10e3;

# ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
SELECT *
FROM articulo
WHERE precio > 1e3 
  AND iva > 100;

# ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * 
FROM venta
WHERE id_articulo IN (135, 963) 
  AND id_empleado IN (835, 369);

## RETO 3
# Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
SELECT * 
FROM puesto
ORDER BY salario DESC
LIMIT 5;	
