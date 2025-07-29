
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


-- FUNCIONES AGREGADAS Y AGRUPAMIENTO (GROUP BY, COUNT, AVG, SUM)

-- Cuenta cuántos empleados hay en total.
-- Counts how many employees there are in total.
SELECT COUNT(*) AS total_empleados FROM empleados;

-- Calcula el salario medio de todos los empleados.
-- Calculates the average salary of all employees.
SELECT AVG(salario) AS salario_medio FROM empleados;

-- Suma el importe total de las ventas realizadas.
-- Sums the total amount of sales made.
SELECT SUM(importe) AS total_ventas FROM ventas;

-- Muestra el número de empleados por departamento.
-- Displays the number of employees per department.
SELECT departamento, COUNT(*) AS numero_empleados
FROM empleados
GROUP BY departamento;

-- Muestra el salario medio por departamento.
-- Shows the average salary per department.
SELECT departamento, AVG(salario) AS salario_medio
FROM empleados
GROUP BY departamento;

-- JOIN
-- Une empleados con sus departamentos y muestra nombre del empleado y nombre del departamento.
SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id;

-- Muestra todos los empleados y, si existen, sus proyectos asignados.
SELECT empleados.nombre, proyectos.nombre AS proyecto
FROM empleados
LEFT JOIN proyectos ON empleados.id = proyectos.empleado_id;

-- Muestra los productos y los proveedores correspondientes.
SELECT productos.nombre AS producto, proveedores.nombre AS proveedor
FROM productos
INNER JOIN proveedores ON productos.proveedor_id = proveedores.id;


