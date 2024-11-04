-- Criar a tabela de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL
);

-- Criar a tabela de Produtos
CREATE TABLE IF NOT EXISTS Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(100)
);

-- Criar a tabela de Vendas
CREATE TABLE IF NOT EXISTS Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    valor_venda DECIMAL(10, 2) NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Criar a tabela de Projetos
CREATE TABLE IF NOT EXISTS Projetos (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);

-- Inserir dados na tabela de Clientes
INSERT INTO Clientes (nome, sobrenome, email, data_nascimento) VALUES
('João', 'Silva', 'joao.silva@example.com', '1990-01-15'),
('Maria', 'Santos', 'maria.santos@example.com', '1985-06-22'),
('Carlos', 'Oliveira', 'carlos.oliveira@example.com', '1992-03-05');

-- Inserir dados na tabela de Produtos
INSERT INTO Produtos (nome, preco, categoria) VALUES
('Produto A', 50.00, 'Categoria 1'),
('Produto B', 30.50, 'Categoria 2'),
('Produto C', 20.00, 'Categoria 1');

-- Inserir dados na tabela de Vendas
INSERT INTO Vendas (id_cliente, valor_venda, data_venda) VALUES
(1, 100.00, '2024-09-20'),
(2, 150.00, '2024-09-21'),
(1, 200.00, '2024-09-22');

-- Inserir dados na tabela de Projetos
INSERT INTO Projetos (nome_projeto, data_inicio, data_fim) VALUES
('Projeto Alpha', '2024-01-01', '2024-12-31'),
('Projeto Beta', '2024-02-01', '2024-11-30');

-- Verificar Tabelas Criadas

SELECT 
    (SELECT COUNT(*) FROM Clientes) AS total_clientes,
    (SELECT COUNT(*) FROM Produtos) AS total_produtos,
    (SELECT COUNT(*) FROM Vendas) AS total_vendas,
    (SELECT COUNT(*) FROM Projetos) AS total_projetos;












