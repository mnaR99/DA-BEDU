## Sesión 02: Agrupaciones y subconsultas
USE tienda;

## Uso de LIKE

SELECT * 
FROM empleado 
WHERE nombre LIKE 'M%';

SELECT * 
FROM empleado 
WHERE nombre LIKE '%a';

SELECT * 
FROM empleado 
WHERE nombre LIKE 'M%a';

SELECT * 
FROM empleado 
WHERE nombre LIKE 'M_losa';

## Reto 1
# ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * 
FROM articulo
WHERE nombre LIKE '%Pasta%';

# ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * 
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT nombre 
FROM articulo
WHERE nombre LIKE '%-%';

# ¿Qué puestos incluyen la palabra Designer?
SELECT nombre 
FROM puesto
WHERE nombre LIKE '%Designer%';

# ¿Qué puestos incluyen la palabra Developer?
SELECT nombre
FROM puesto
WHERE nombre LIKE '%Developer%';

## Funciones de agrupamiento

SELECT (1+7)*(10/(6-4));
SELECT AVG(precio) AS avg_precio FROM articulo;
SELECT COUNT(*) AS n_articulos FROM articulo;
SELECT MIN(precio) AS min_precio FROM articulo;
SELECT MAX(precio) AS max_precio FROM articulo;
SELECT SUM(precio) AS sum_precio FROM articulo;

## Reto 2
# ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) AS avg_salario
FROM puesto;

# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) AS n_pasta
FROM articulo
WHERE nombre LIKE '%Pasta%';

# ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) AS min_salario, 
  MAX(salario) AS max_salario
FROM puesto;

# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario) AS suma_salario
FROM puesto
WHERE id_puesto >= (SELECT MAX(id_puesto) - 4 FROM puesto);

## GROUP BY

SELECT nombre, SUM(precio) AS tot_precio
FROM articulo
GROUP BY nombre;

SELECT nombre, COUNT(*) AS cantidad
FROM articulo
GROUP BY nombre
ORDER BY cantidad DESC;

SELECT nombre, MIN(salario) AS min_salario, MAX(salario) AS max_salario 
FROM puesto
GROUP BY nombre;

## RETO 3
# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, COUNT(*) AS n_empleados
FROM puesto
GROUP BY nombre;

# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, SUM(salario) AS tot_salario
FROM puesto
GROUP BY nombre;

# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, COUNT(*) AS n_ventas
FROM venta
GROUP BY id_empleado;

# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, COUNT(*) AS n_ventas
FROM venta
GROUP BY id_articulo;