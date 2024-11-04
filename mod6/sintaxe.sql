SELECT * FROM colaboradores;


-- CTE (Common Table Expression) // sintaxe

WITH colaboradores_cte AS (
    SELECT id_colaborador, nome, salario, id_departamento
    FROM colaboradores
)

SELECT * FROM colaboradores_cte;

WITH colaboradores_cte AS (
    SELECT nome, salario
    FROM colaboradores
)

SELECT * FROM colaboradores_cte;



-- Quantidade de colaboradores por departamento

WITH colabs_por_dpto AS (
    SELECT id_departamento, COUNT(*) AS total_colabs
    FROM colaboradores
    GROUP BY id_departamento
)

SELECT d.nome_departamento, c.total_colabs
FROM colabs_por_dpto c
JOIN departamentos d ON c.id_departamento = d.id_departamento;


--  Sálario médio por departamento 

WITH media_salarios AS (
    SELECT id_departamento, AVG(salario) AS salario_medio
    FROM colaboradores
    GROUP BY id_departamento
)
SELECT d.nome_departamento, m.salario_medio
FROM media_salarios m
JOIN departamentos d on m.id_departamento = d.id_departamento;