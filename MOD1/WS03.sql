## Sesión 03: Subconsultas y Joins
USE tienda;

# Reto 1
# ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
SELECT nombre
FROM tienda.empleado
WHERE id_puesto IN (
  SELECT id_puesto 
  FROM tienda.puesto 
  WHERE salario > 10e3
);

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, MIN(n), MAX(n) 
FROM (
  SELECT id_empleado, clave, COUNT(*) as n
  FROM tienda.venta
  GROUP BY id_empleado, clave
  ) AS sub
GROUP BY id_empleado;

# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT DISTINCT clave
FROM tienda.venta
WHERE id_articulo IN (
  SELECT id_articulo 
  FROM tienda.articulo 
  WHERE precio > 5e3
);

# Reto 2
# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT v.id_venta, v.clave, e.nombre, e.apellido_paterno, e.apellido_materno
FROM tienda.venta v 
JOIN tienda.empleado e 
ON v.id_empleado = e.id_empleado;

# ¿Cuál es el nombre de los artículos que se han vendido?
SELECT DISTINCT a.nombre
FROM tienda.venta v
JOIN tienda.articulo a
ON v.id_articulo = a.id_articulo;

# ¿Cuál es el total de cada venta?
SELECT v.clave, SUM(a.precio) as total
FROM tienda.venta v
JOIN tienda.articulo a
ON v.id_articulo = a.id_articulo
GROUP BY v.clave;

## Vistas
CREATE VIEW tickets044 as
  SELECT v.clave, v.fecha, a.nombre as producto, a.precio, e.nombre as empleado
  FROM tienda.venta v
  JOIN tienda.empleado e
    ON v.id_empleado = e.id_empleado
  JOIN tienda.articulo a
    ON v.id_articulo = a.id_articulo;

# Reto 3
# Obtener el puesto de un empleado.
CREATE VIEW empleadospuesto044 as 
SELECT e.id_empleado, e.nombre, e.apellido_paterno, e.apellido_materno, p.nombre as puesto
  FROM tienda.empleado e
  JOIN tienda.puesto p
    ON e.id_puesto = p.id_puesto;

# Saber qué artículos ha vendido cada empleado.
CREATE VIEW ventasempleado044 as
SELECT v.clave, e.nombre, e.apellido_paterno, e.apellido_materno, a.nombre as articulo
  FROM tienda.empleado e
  JOIN tienda.venta v
    ON e.id_empleado = v.id_empleado
  JOIN tienda.articulo a
    ON v.id_articulo = a.id_articulo;

# Saber qué puesto ha tenido más ventas.
CREATE VIEW ventaspuesto044 as
  SELECT p.nombre, COUNT(*) as ventas
  FROM venta v
  JOIN tienda.empleado e
    ON v.id_empleado = e.id_empleado
  JOIN tienda.puesto p
    ON e.id_puesto = p.id_puesto
  GROUP BY p.nombre
  ORDER BY ventas DESC;