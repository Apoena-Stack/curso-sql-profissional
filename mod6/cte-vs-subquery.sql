-- CTE vs Subquery

-- Salário Total por DPTO


--Subconsulta/subquery

SELECT d.nome_departamento, (

    SELECT SUM(salario)
    FROM colaboradores c
    WHERE c.id_departamento = d.id_departamento
) AS salario_total
FROM departamentos d;

-- CTE

WITH total_salario AS (
    SELECT id_departamento, SUM(salario) AS salario_total
    FROM colaboradores
    GROUP BY id_departamento
)

SELECT d.nome_departamento, t.salario_total
FROM total_salario t
JOIN departamentos d ON t.id_departamento = d.id_departamento;