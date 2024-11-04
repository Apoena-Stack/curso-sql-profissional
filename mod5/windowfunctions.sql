-- Window Function com Soma/Contagem
-- Total de Assentos reservados por cliente e no geral


SELECT c.nome, COUNT(ar.id_assento) AS assentos_reservados, 
SUM(COUNT(ar.id_assento)) OVER () AS total_assentos_reservados 
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente
JOIN Assento_Reservado ar ON r.id_reserva = ar.id_reserva
GROUP BY c.nome;

-- Partition By
-- Total de Assentos Reservados por Sala de Cinema

SELECT s.id_sala, COUNT(ar.id_assento) AS assentos_reservados,
SUM(COUNT(ar.id_assento)) OVER (PARTITION BY s.id_sala) AS total_por_sala
FROM Sessoes ss
JOIN Salas s ON ss.id_sala = s.id_sala
JOIN Reservas r ON ss.id_sessao = r.id_sessao
JOIN Assento_Reservado ar ON r.id_reserva = ar.id_reserva
GROUP BY s.id_sala;


-- Row Number
-- Numero de linha da reserva por sessao

SELECT c.nome, r.data_reserva,
    ROW_NUMBER() OVER (PARTITION BY r.id_sessao ORDER BY r.data_reserva DESC) AS numero_linha
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente;

-- RANK / DENSE RANK
-- Quantidade de assentos reservados por cliente rankeado


SELECT c.nome, COUNT(ar.id_assento) AS assentos_reservados,
    RANK() OVER (ORDER BY COUNT(ar.id_assento) DESC) AS rank_reservas,
    DENSE_RANK() OVER (ORDER BY COUNT(ar.id_assento) DESC) AS dense_rank_reservas
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente
JOIN Assento_Reservado ar ON r.id_reserva = ar.id_reserva
GROUP BY c.nome;

-- LAG E LEAD
-- Reservas anteriores e posteriores de cada cliente

SELECT c.nome, r.data_reserva,
    LAG(r.data_reserva, 1) OVER (ORDER BY r.data_reserva) AS reserva_anterior,
    LEAD(r.data_reserva, 1) OVER (ORDER BY r.data_reserva) AS reserva_posterior
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente;

