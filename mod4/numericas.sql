-- FUNÇÕES NUMERICAS

-- Arredondadmento (ROUND)

SELECT ROUND(preco, 2) AS preco_arredondado
FROM Produtos;

-- Arredondamento "para baixo"

SELECT FLOOR(preco) AS preco_inferior FROM Produtos;

-- Arredondamento "para cima"

SELECT CEIL(preco) AS preco_superior FROM Produtos;

-- Valor Absoluto 

SELECT ABS(-10) AS valor_absoluto;