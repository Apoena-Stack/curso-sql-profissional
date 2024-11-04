-- Tabela de Colaboradores
CREATE TABLE colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    salario DECIMAL(10, 2),
    id_departamento INT
);

-- Tabela de Departamentos
CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

-- Tabela de Projetos
CREATE TABLE projetos (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome_projeto VARCHAR(100),
    id_departamento INT
);

-- Tabela de Dependências entre Projetos (um projeto pode depender de outro)
CREATE TABLE dependencias_projetos (
    id_projeto INT,
    id_projeto_dependente INT,
    PRIMARY KEY (id_projeto, id_projeto_dependente),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto),
    FOREIGN KEY (id_projeto_dependente) REFERENCES projetos(id_projeto)
);



-- Inserir dados na tabela de Departamentos (com mais departamentos)
INSERT INTO departamentos (nome_departamento) VALUES
('TI'), 
('Recursos Humanos'), 
('Financeiro'), 
('Marketing'), 
('Operações'), 
('Vendas'), 
('Pesquisa e Desenvolvimento');

-- Inserir dados na tabela de Colaboradores (com mais colaboradores)
INSERT INTO colaboradores (nome, salario, id_departamento) VALUES
('Ana', 5000.00, 1),
('Bruno', 7000.00, 1),
('Carla', 4000.00, 2),
('Daniel', 4500.00, 2),
('Eva', 8000.00, 3),
('Felipe', 6200.00, 4),
('Gabriela', 5500.00, 5),
('Henrique', 4800.00, 6),
('Isabela', 9100.00, 7),
('João', 7500.00, 7);

-- Inserir dados na tabela de Projetos (com mais projetos)
INSERT INTO projetos (nome_projeto, id_departamento) VALUES
('Sistema de Gestão', 1),
('Portal de RH', 2),
('Sistema de Orçamento', 3),
('Campanha de Marketing Digital', 4),
('Sistema de Gestão de Operações', 5),
('Portal de Vendas Online', 6),
('Pesquisa de Inteligência Artificial', 7);

-- Inserir dependências entre os projetos
INSERT INTO dependencias_projetos (id_projeto, id_projeto_dependente) VALUES
(1, 2),  -- 'Sistema de Gestão' depende de 'Portal de RH'
(3, 1),  -- 'Sistema de Orçamento' depende de 'Sistema de Gestão'
(4, 5),  -- 'Campanha de Marketing Digital' depende de 'Sistema de Gestão de Operações'
(6, 4),  -- 'Portal de Vendas Online' depende de 'Campanha de Marketing Digital'
(7, 6);  -- 'Pesquisa de IA' depende de 'Portal de Vendas Online'
