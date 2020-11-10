## Ejercicios Sesión 03
USE classicmodels;

### Para estas consultas usa RIGHT JOIN
# Obten el código de producto, nombre de producto y descripción de todos los productos.
SELECT p.productCode, p.productName, p.productDescription
FROM classicmodels.products p;

# Obten el número de orden, estado y costo total de cada orden.
SELECT o.orderNumber, o.status, SUM(od.priceEach) total
FROM classicmodels.orderdetails od
RIGHT JOIN classicmodels.orders o
  ON od.orderNumber = o.orderNumber
GROUP BY o.orderNumber, o.status;

# Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.
SELECT o.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM classicmodels.products p
RIGHT JOIN classicmodels.orderdetails od
  ON p.productCode = od.productCode
RIGHT JOIN classicmodels.orders o
  ON od.orderNumber = o.orderNumber;

# Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
SELECT od.orderNumber, p.productName, p.MSRP, od.priceEach
FROM classicmodels.products p
RIGHT JOIN classicmodels.orderdetails od
  ON p.productCode = od.productCode;

### Para estas consultas usa LEFT JOIN
# Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
SELECT c.customerNumber, c.customerName, o.orderNumber, c.state
FROM classicmodels.customers c
LEFT JOIN classicmodels.orders o
  ON c.customerNumber = o.customerNumber;

# Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, c.customerName
FROM classicmodels.customers c
LEFT JOIN classicmodels.orders o
  ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;

# Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM classicmodels.employees e
LEFT JOIN classicmodels.customers c
  ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN classicmodels.payments p
  ON c.customerName = p.customerNumber;

### Para estas consultas usa RIGHT JOIN

# Repite los ejercicios 5 a 7 usando RIGHT JOIN.

# Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.