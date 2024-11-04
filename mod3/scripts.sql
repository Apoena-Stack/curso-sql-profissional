

-- Subconsultas: O nome do cliente mais recente a fazer uma reserva no Cinema

SELECT nome
FROM Clientes
WHERE id_cliente = (SELECT MAX(id_cliente) FROM Reservas);


-- Subconsultas não correlacionadas
-- Lista de emails dos clientes // filtro: parametro de data;

SELECT nome, email
FROM Clientes
WHERE id_cliente IN (SELECT id_cliente FROM Reservas WHERE data_reserva > '2024-09-01');


-- Subconsulta correlacionada
-- Lista dos clientes // filtro: parametro de data;

SELECT nome
FROM Clientes c
WHERE EXISTS (
    SELECT 1
    FROM Reservas r
    WHERE r.id_cliente = c.id_cliente
    AND r.data_reserva > '2024-09-01'
);


CREATE VIEW Reservas_Recentes AS
SELECT c.nome, r.data_reserva
FROM Clientes c
JOIN Reservas r ON c.id_cliente = r.id_cliente
WHERE r.data_reserva > '2024-09-01';

SELECT * FROM Reservas_Recentes;
