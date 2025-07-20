
-- CONSULTAS BÁSICAS (SELECT, WHERE)

-- Selecciona todos los registros de la tabla empleados.
-- Selects all records from the employees table.
SELECT * FROM empleados;

-- Selecciona el nombre y el salario de empleados cuyo salario sea mayor a 3000.
-- Selects name and salary of employees whose salary is greater than 3000.
SELECT nombre, salario FROM empleados
WHERE salario > 3000;


-- ORDENAR RESULTADOS (ORDER BY)

-- Muestra todos los productos ordenados por precio de forma descendente.
-- Displays all products ordered by price in descending order.
SELECT * FROM productos
ORDER BY precio DESC;
