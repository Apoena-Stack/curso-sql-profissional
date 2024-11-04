-- FUNÇÕES DATA HORA


-- Verificar data e hora do momento

SELECT NOW() AS datahora;

-- Verificar data

SELECT CURDATE() AS data;

-- Verificar horario

SELECT CURTIME() AS hora;

-- Formatar Data

SELECT DATE_FORMAT(data_nascimento, '%d/%m/%Y') AS data_formatada
FROM Clientes;


-- Calcular diferença entre datas

SELECT DATEDIFF('2024-10-06','2023-12-25') AS diferenca;


-- Adicionar intervalo

SELECT DATE_ADD(CURDATE(), INTERVAL 10 DAY) AS data_futura;

-- Subtrair intervalo

SELECT DATE_SUB(CURDATE(), INTERVAL 15 DAY) AS data_passado;

