
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

-- CASE
-- Clasifica empleados según su salario.
SELECT nombre,
  CASE
    WHEN salario >= 4000 THEN 'Alto'
    WHEN salario BETWEEN 2000 AND 3999 THEN 'Medio'
    ELSE 'Bajo'
  END AS nivel_salarial
FROM empleados;

-- Marca ventas como "alta" o "baja" según el importe.
SELECT id_venta, importe,
  CASE
    WHEN importe >= 1000 THEN 'Alta'
    ELSE 'Baja'
  END AS tipo_venta
FROM ventas;

-- CONSULTAS CON FUNCIONES DE FECHA
-- Muestra las ventas realizadas en el año 2024.
SELECT * FROM ventas
WHERE EXTRACT(YEAR FROM fecha) = 2024;

-- Muestra empleados contratados en los últimos 6 meses.
SELECT * FROM empleados
WHERE fecha_contratacion >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH);

-- Agrupa ventas por mes y muestra el total mensual.
SELECT
  FORMAT_DATE('%Y-%m', fecha) AS mes,
  SUM(importe) AS total_mensual
FROM ventas
GROUP BY mes
ORDER BY mes;

-- FILTRADO BÁSICO CON OPERADORES (BETWEEN, IN, LIKE, LIMIT)
-- BASIC FILTERING WITH OPERATORS (BETWEEN, IN, LIKE, LIMIT)

-- Filtra empleados cuyo salario esté entre 2000 y 4000.
-- Filters employees whose salary is between 2000 and 4000.
SELECT nombre, salario
FROM empleados
WHERE salario BETWEEN 2000 AND 4000;

-- Muestra productos que pertenecen a ciertas categorías.
-- Shows products that belong to specific categories.
SELECT nombre, categoria
FROM productos
WHERE categoria IN ('Electrónica', 'Hogar', 'Juguetes');

-- Busca clientes cuyo nombre comience por 'Mar'.
-- Searches for clients whose name starts with 'Mar'.
SELECT nombre
FROM clientes
WHERE nombre LIKE 'Mar%';

-- Busca productos que contengan la palabra 'portátil' en su descripción.
-- Searches for products that contain the word 'portátil' in their description.
SELECT nombre, descripcion
FROM productos
WHERE descripcion LIKE '%portátil%';

-- Muestra los 5 empleados con mayor salario.
-- Displays the 5 employees with the highest salary.
SELECT nombre, salario
FROM empleados
ORDER BY salario DESC
LIMIT 5;