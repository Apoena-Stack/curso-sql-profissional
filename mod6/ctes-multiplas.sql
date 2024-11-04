-- Colaboradores com salário acima da média


WITH salario_medio AS (
    SELECT AVG(salario) AS media_salarial
    FROM colaboradores
),
colaboradores_acima_media AS (
    SELECT c.nome, c.salario, d.nome_departamento
    FROM colaboradores c
    JOIN departamentos d ON c.id_departamento = d.id_departamento
    WHERE c.salario > (SELECT media_salarial FROM salario_medio)
 )
 SELECT * FROM colaboradores_acima_media;


-- Diferença entre o maior e o menor salário por departamento

WITH salario_departamento AS (
    SELECT id_departamento,
        MAX(salario) AS maior_salario,
        MIN(salario) AS menor_salario
    FROM colaboradores
    GROUP BY id_departamento
),
diferenca_salarial AS (
    SELECT id_departamento,
        (maior_salario - menor_salario) AS diferenca
    FROM salario_departamento
)
SELECT d.nome_departamento, ds.diferenca
FROM diferenca_salarial ds
JOIN departamentos d ON ds.id_departamento = d.id_departamento;


