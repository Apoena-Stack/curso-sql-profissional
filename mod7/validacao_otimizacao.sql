-- Validação de Duplicidade
-- nomes da empresas

SELECT COUNT(*) AS total
FROM empresas
WHERE nome = 'AlphaTech';

-- Validação de Campos Obrigatórios

SELECT
    CASE
        WHEN nome is NULL THEN 'Nome não pode ser nulo'
        ELSE 'Nome válido.'
    END AS status
FROM colaboradores
WHERE id IN (1,2,3);


-- Validação de Datas
SELECT
    CASE WHEN start_date > end_date THEN 'Data de inicio inválida'
    ELSE 'Data de inicio válida'
    END AS status
FROM projetos
WHERE id IN (1,2,3);



--- OTIMIZAÇÃO

-- Leitura do plano de execução
EXPLAIN SELECT
    c.nome AS colaborador,
    p.nome AS projeto,
    p.budget
FROM colaboradores c
JOIN projetos p ON c.empresa_id = p.empresa_id
WHERE p.budget > 100000;

-- Criar INDEX

CREATE INDEX idx_empresa_id ON projetos(empresa_id);

SHOW INDEX FROM projetos;