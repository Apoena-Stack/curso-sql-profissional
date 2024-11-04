CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Salas
CREATE TABLE IF NOT EXISTS Salas (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    capacidade INT NOT NULL
);

-- Tabela Filmes
CREATE TABLE IF NOT EXISTS Filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    duracao TIME
);

-- Tabela Sessoes
CREATE TABLE IF NOT EXISTS Sessoes (
    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT NOT NULL,
    id_sala INT NOT NULL,
    horario DATETIME NOT NULL,
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme),
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

-- Tabela Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_sessao INT NOT NULL,
    data_reserva DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_sessao) REFERENCES Sessoes(id_sessao)
);

-- Tabela Assento_Reservado
CREATE TABLE IF NOT EXISTS Assento_Reservado (
    id_assento_reservado INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    id_assento INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

-- Tabela Assentos
CREATE TABLE IF NOT EXISTS Assentos (
    id_assento INT AUTO_INCREMENT PRIMARY KEY,
    id_sala INT NOT NULL,
    numero_assento VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);


-- Inserir dados na tabela Clientes
INSERT INTO Clientes (nome) VALUES
('João Silva'),
('Maria Santos'),
('Carlos Oliveira'),
('Ana Souza'),
('Pedro Lima');

-- Inserir dados na tabela Salas
INSERT INTO Salas (capacidade) VALUES
(100),
(150),
(200),
(80),
(120);

-- Inserir dados na tabela Filmes
INSERT INTO Filmes (titulo, genero, duracao) VALUES
('O Senhor dos Anéis', 'Aventura', '03:30:00'),
('Matrix', 'Ficção Científica', '02:16:00'),
('Titanic', 'Romance', '03:14:00'),
('Vingadores: Ultimato', 'Ação', '03:01:00'),
('A Origem', 'Suspense', '02:28:00');

-- Inserir dados na tabela Sessoes
INSERT INTO Sessoes (id_filme, id_sala, horario) VALUES
(1, 1, '2024-10-10 14:00:00'),
(2, 2, '2024-10-11 16:00:00'),
(3, 3, '2024-10-12 18:00:00'),
(4, 4, '2024-10-13 20:00:00'),
(5, 5, '2024-10-14 22:00:00');

-- Inserir dados na tabela Reservas
-- Inserir dados na tabela Reservas
INSERT INTO Reservas (id_cliente, id_sessao, data_reserva) VALUES
(1, 1, '2024-09-20'), -- João Silva
(1, 2, '2024-09-21'), -- João Silva (mais uma reserva)
(2, 2, '2024-09-21'), -- Maria Santos
(2, 3, '2024-09-22'), -- Maria Santos (mais uma reserva)
(3, 3, '2024-09-22'), -- Carlos Oliveira
(4, 4, '2024-09-23'), -- Ana Souza
(4, 5, '2024-09-24'), -- Ana Souza (mais uma reserva)
(5, 5, '2024-09-24'); -- Pedro Lima


-- Inserir dados na tabela Assentos
INSERT INTO Assentos (id_sala, numero_assento) VALUES
(1, 'A1'),
(2, 'B2'),
(3, 'C3'),
(4, 'D4'),
(5, 'E5');

-- Inserir dados na tabela Assento_Reservado
INSERT INTO Assento_Reservado (id_reserva, id_assento) VALUES
(1, 1), -- João Silva, Assento A1
(1, 2), -- João Silva, Assento B2
(2, 3), -- João Silva, Assento C3
(2, 4), -- Maria Santos, Assento D4
(3, 5), -- Carlos Oliveira, Assento E5
(4, 1), -- Ana Souza, Assento A1
(4, 2), -- Ana Souza, Assento B2
(4, 3), -- Ana Souza, Assento C3
(5, 4); -- Pedro Lima, Assento D4


-- Mostrar todos os dados da tabela Clientes
SELECT * FROM Clientes;

-- Mostrar todos os dados da tabela Salas
SELECT * FROM Salas;

-- Mostrar todos os dados da tabela Filmes
SELECT * FROM Filmes;

-- Mostrar todos os dados da tabela Sessoes
SELECT * FROM Sessoes;

-- Mostrar todos os dados da tabela Reservas
SELECT * FROM Reservas;

-- Mostrar todos os dados da tabela Assentos
SELECT * FROM Assentos;

-- Mostrar todos os dados da tabela Assento_Reservado
SELECT * FROM Assento_Reservado;
