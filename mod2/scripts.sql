CREATE TABLE Filmes (

    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50), 
    duracao TIME NOT NULL

);


CREATE TABLE Clientes (

    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Salas (

    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    capacidade INT NOT NULL
);

CREATE TABLE Sessoes (

    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT,
    id_sala INT,
    horario DATETIME NOT NULL,
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme),
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)

);


CREATE TABLE Assentos (

    id_assento INT AUTO_INCREMENT PRIMARY KEY,
    id_sala INT,
    numero_assento VARCHAR(10) NOT NULL, 
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

CREATE TABLE Reservas (

    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_sessao INT,
    data_reserva DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_sessao) REFERENCES Sessoes(id_sessao)

);

CREATE TABLE Assento_Reservado (

    id_assento_reservado INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    id_assento INT,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva),
    FOREIGN KEY (id_assento) REFERENCES Assentos(id_assento)

);




INSERT INTO Filmes (titulo, genero, duracao)
VALUES ('Matrix', 'Sci-Fi', '02:16:00');


INSERT INTO Clientes (nome, email)
VALUES ('João', 'joao@email.com');


INSERT INTO Salas (capacidade)
VALUES (200);

INSERT INTO Sessoes (id_filme, id_sala, horario)
VALUES (1,1, '2024-10-15 15:30:00');

INSERT INTO Assentos (id_assento, id_sala, numero_assento)
VALUES
(1,1, 'A1'),
(2,1, 'A2'),
(3,1, 'A3');

INSERT INTO Reservas (id_reserva, id_cliente, id_sessao, data_reserva)
VALUES (1, 1, 1, '2024-10-15');

INSERT INTO Assento_Reservado (id_assento_reservado, id_reserva, id_assento)
VALUES (1,1,1);


-- Lista de todos os filmes com suas sessões, sala e horário.

SELECT
    Filmes.titulo AS Filme,
    Sessoes.horario AS Horario,
    Salas.capacidade AS Capacidade_sala
FROM
    Sessoes
JOIN Filmes ON Sessoes.id_filme = Filmes.id_filme
JOIN Salas ON Sessoes.id_sala = Salas.id_sala;



-- Lista de clientes, reservas com filme, sessão e data.

SELECT
    Clientes.nome AS Cliente,
    Filmes.titulo AS Filme,
    Sessoes.horario AS Horario,
    Reservas.data_reserva AS Data_reserva
FROM
    Reservas
JOIN Clientes ON Reservas.id_cliente = Clientes.id_cliente
JOIN Sessoes ON Reservas.id_sessao = Sessoes.id_sessao
JOIN Filmes ON Sessoes.id_filme = Filmes.id_filme;


-- Listar todos assentos reservados por cliente, incluindo numero do assento e a sala.

SELECT
    Clientes.nome AS Cliente,
    Salas.id_sala AS Sala,
    Assentos.numero_assento AS Assento
FROM
    Assento_Reservado
JOIN Reservas ON Assento_Reservado.id_reserva = Reservas.id_reserva
JOIN Clientes ON Reservas.id_cliente = Clientes.id_cliente
JOIN Assentos ON Assento_Reservado.id_assento = Assentos.id_assento
JOIN Salas ON Assentos.id_sala = Salas.id_sala;

