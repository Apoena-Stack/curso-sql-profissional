-- Funções String


-- Concat()

SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo FROM Clientes;


-- LENGHT()

SELECT nome, LENGTH(nome) AS tamanho_nome FROM Clientes;

-- LOWER()

SELECT nome, LOWER(nome) AS nome_minusculo FROM Clientes;

-- UPPER()

SELECT nome, UPPER(nome) AS nome_minusculo FROM Clientes;

-- SUBSTRING()

SELECT SUBSTRING(nome, 2,4) AS substring_nome FROM Clientes;

-- TRIM()

SELECT TRIM('a' FROM nome) AS nome_trimado FROM Clientes;

-- REPLACE()

SELECT email ,REPLACE(email, '@', '[at]') AS email_modificado FROM Clientes;