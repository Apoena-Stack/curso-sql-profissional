-- Funções de Agregação

-- AVG - Média

SELECT AVG(preco) AS media_preco FROM Produtos;


-- Contagem / Count
SELECT COUNT(*) AS total_clientes FROM Clientes;


-- Group Concat

SELECT GROUP_CONCAT(nome ORDER BY nome SEPARATOR ',') AS todos_os_nomes 
FROM Clientes; 

-- Maxima

SELECT MAX(preco)  AS maior_preço
FROM Produtos;

-- Minima

SELECT MIN(preco) AS menor_preço 
FROM Produtos;

-- Soma

SELECT SUM(valor_venda) AS total FROM Vendas;