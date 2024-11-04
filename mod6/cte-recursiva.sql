--CTE Recursiva 

-- Como é a estrutura de depêndencia entre os projetos da empresa?
-- Qual nível hierárquico cada projeto se encontra?

-- projetos | dependencias_projetos



WITH RECURSIVE projetos_dependencias AS (
    -- BASE/âncora / define-se o ponto de partida da recursividade

    SELECT 
        p.id_projeto
        , p.nome_projeto
        , CAST(NULL AS CHAR(100)) AS projeto_pai,
        1 AS nivel
    FROM projetos p
    LEFT JOIN dependencias_projetos dp ON p.id_projeto = dp.id_projeto_dependente
    WHERE dp.id_projeto_dependente IS NULL -- PROJETO SEM DEPENCIA

    UNION ALL

    -- Recursividade CTE 

    SELECT p.id_projeto, p.nome_projeto,
        CAST(pd.nome_projeto AS CHAR(100)) AS projeto_pai,
        pd.nivel + 1
    FROM projetos p 
    INNER JOIN dependencias_projetos dp ON p.id_projeto = dp.id_projeto_dependente
    INNER JOIN projetos_dependencias pd ON dp.id_projeto = pd.id_projeto
)

SELECT id_projeto, nome_projeto, projeto_pai, nivel
FROM projetos_dependencias
ORDER BY nivel, nome_projeto;
