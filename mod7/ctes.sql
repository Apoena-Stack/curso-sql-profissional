--CTEs

--1. Investimentos

WITH Investimentos AS (

    SELECT
        e.nome AS empresa,
        SUM(p.budget) AS investimento_total
    FROM
        empresas e
    JOIN
        projetos p ON p.empresa_id = e.id
    GROUP BY
        e.nome
)

SELECT
    empresa,
    investimento_total
FROM
    Investimentos
ORDER BY
    investimento_total DESC; 


--2. Resumo dos Licenciamentos

WITH LicenciamentoResumo AS (

    SELECT
        t.nome AS tecnologia,
        COUNT(l.id) AS total_licencas,
        MIN(l.start_date) AS data_inicio,
        MAX(l.end_date) AS data_fim
    FROM
        tecnologias t
    JOIN
        licenciamento l ON l.tecnologia_id = t.id
    GROUP BY
        t.nome
)
SELECT
    tecnologia,
    total_licencas,
    data_inicio,
    data_fim
FROM
    LicenciamentoResumo
ORDER BY
    total_licencas DESC;


-- 3. Analise dos Projetos por Empresa

WITH ProjetosPorEmpresa AS (

    SELECT
        e.nome AS empresa,
        l.entidade_licenciamento AS entidade,
        COUNT(p.id) AS total_projetos
    FROM
        empresas e
    JOIN 
        licenciamento l ON l.empresa_id = e.id
    JOIN
        projetos p ON p.empresa_id =e.id
    GROUP BY
        e.nome, l.entidade_licenciamento
)
SELECT
    empresa,
    entidade,
    total_projetos
FROM
    ProjetosPorEmpresa
ORDER BY
    empresa, total_projetos DESC;



