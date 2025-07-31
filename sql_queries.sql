
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

-- SUBCONSULTAS BÁSICAS (SUBQUERIES)
-- BASIC SUBQUERIES

-- Muestra empleados cuyo salario es mayor que el salario medio.
-- Shows employees whose salary is greater than the average salary.
SELECT nombre, salario
FROM empleados
WHERE salario > (
  SELECT AVG(salario)
  FROM empleados
);

-- Muestra productos cuyo precio es igual al precio más alto.
-- Shows products with the highest price.
SELECT nombre, precio
FROM productos
WHERE precio = (
  SELECT MAX(precio)
  FROM productos
);

-- Muestra ventas realizadas por el cliente con ID 123.
-- Shows sales made by the client with ID 123.
SELECT *
FROM ventas
WHERE cliente_id = (
  SELECT id
  FROM clientes
  WHERE id = 123
);

-- Muestra empleados del departamento que tiene más empleados.
-- Shows employees from the department with the most employees.
SELECT *
FROM empleados
WHERE departamento_id = (
  SELECT departamento_id
  FROM empleados
  GROUP BY departamento_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-- CREAR TABLAS E INSERTAR DATOS (CREATE TABLE & INSERT INTO)
-- CREATING TABLES AND INSERTING DATA

-- Crea una tabla de empleados.
-- Creates an employees table.
CREATE TABLE empleados (
  id INT,
  nombre STRING,
  salario FLOAT64,
  departamento_id INT,
  fecha_contratacion DATE
);

-- Inserta algunos empleados de ejemplo.
-- Inserts sample employees.
INSERT INTO empleados (id, nombre, salario, departamento_id, fecha_contratacion)
VALUES
  (1, 'Laura Pérez', 2500, 1, '2023-03-15'),
  (2, 'Carlos Gómez', 3200, 2, '2022-11-20'),
  (3, 'María Sánchez', 1800, 1, '2024-01-10'),
  (4, 'David Ruiz', 4000, 3, '2021-07-01');

-- Crea una tabla de departamentos.
-- Creates a departments table.
CREATE TABLE departamentos (
  id INT,
  nombre STRING
);

-- Inserta algunos departamentos de ejemplo.
-- Ins

-- FUNCIONES MATEMÁTICAS BÁSICAS (ROUND, ABS, CEIL, FLOOR)
-- BASIC MATH FUNCTIONS (ROUND, ABS, CEIL, FLOOR)

-- Redondea el salario de cada empleado a 0 decimales.
-- Rounds each employee's salary to 0 decimal places.
SELECT nombre, ROUND(salario) AS salario_redondeado
FROM empleados;

-- Muestra el valor absoluto de las diferencias salariales con respecto a 3000.
-- Shows the absolute difference between salaries and 3000.
SELECT nombre, ABS(salario - 3000) AS diferencia
FROM empleados;

-- Muestra el salario redondeado hacia arriba.
-- Shows the salary rounded up.
SELECT nombre, CEIL(salario) AS salario_arriba
FROM empleados;

-- Muestra el salario redondeado hacia abajo.
-- Shows the salary rounded down.
SELECT nombre, FLOOR(salario) AS salario_abajo
FROM empleados;
