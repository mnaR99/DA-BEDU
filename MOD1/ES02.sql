## Ejercicios Sesión 02
USE classicmodels;

# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
SELECT em.employeeNumber, em.lastName, em.firstName 
FROM classicmodels.employees AS em
WHERE em.firstName LIKE 'A%';

# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
SELECT em.employeeNumber, em.lastName, em.firstName 
FROM classicmodels.employees AS em
WHERE em.lastName LIKE '%on';

# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT em.employeeNumber, em.lastName, em.firstName 
FROM classicmodels.employees AS em
WHERE em.firstName LIKE '%on%';

# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.
SELECT em.employeeNumber, em.lastName, em.firstName 
FROM classicmodels.employees AS em
WHERE em.firstName LIKE 'T_m';

# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT em.employeeNumber, em.lastName, em.firstName 
FROM classicmodels.employees AS em
WHERE em.firstName NOT LIKE 'B%';

# Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
SELECT pr.productCode, pr.productName
FROM classicmodels.products AS pr
WHERE pr.productCode LIKE '%!_20%' ESCAPE '!';
 
# Dentro de la tabla orderdetails, obten el total de cada orden.
SELECT od.orderNumber, SUM(od.priceEach) AS tot_order
FROM classicmodels.orderdetails AS od
GROUP BY od.orderNumber;

# Dentro de la tabla orders obten el número de órdenes por año.
SELECT YEAR(ord.orderDate) AS year, COUNT(*) AS n_orders
FROM classicmodels.orders AS ord
GROUP BY YEAR(ord.orderDate);

# Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT em.lastName, em.firstName
FROM classicmodels.employees AS em
WHERE em.officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');

# Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT pm.customerNumber, pm.checkNumber, pm.amount
FROM classicmodels.payments AS pm
ORDER BY pm.amount DESC
LIMIT 1;

# Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT pm.customerNumber, pm.checkNumber, pm.amount
FROM classicmodels.payments AS pm
WHERE pm.amount > (SELECT AVG(amount) FROM payments);

# Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT cus.customerName
FROM classicmodels.customers AS cus 
WHERE cus.customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);

# Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT MAX(odd.quantityOrdered) AS max_q, MIN(odd.quantityOrdered) AS min_q, AVG(odd.quantityOrdered) AS avg_q
FROM classicmodels.orderdetails AS odd;

# Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
SELECT ord.status, COUNT(*) AS n_orders
FROM classicmodels.orders AS ord
GROUP BY ord.status;
