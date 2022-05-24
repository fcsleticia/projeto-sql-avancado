SELECT * FROM tabela_de_clientes;

SELECT CPF, NOME, CIDADE FROM tabela_de_clientes;

SELECT CPF AS IDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('RIO DE JANEIRO', 'SÃO PAULO') 
AND IDADE >= 20;

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('RIO DE JANEIRO', 'SÃO PAULO') 
AND (IDADE >= 19 AND IDADE <=21);

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('RIO DE JANEIRO', 'SÃO PAULO') 
OR (IDADE >= 19 AND IDADE <=21);

SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%MATTOS%';

SELECT DISTINCT BAIRRO, CIDADE FROM tabela_de_clientes WHERE CIDADE = 'RIO DE JANEIRO';

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY BAIRRO;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes WHERE CIDADE = 'RIO DE JANEIRO' GROUP BY BAIRRO;

SELECT CIDADE, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes WHERE CIDADE = 'RIO DE JANEIRO' GROUP BY BAIRRO;

SELECT CIDADE, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY BAIRRO;

SELECT CIDADE, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes 
WHERE CIDADE = 'RIO DE JANEIRO' GROUP BY CIDADE, BAIRRO ORDER BY BAIRRO;

SELECT CIDADE, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes 
WHERE CIDADE = 'RIO DE JANEIRO' GROUP BY CIDADE, BAIRRO HAVING SUM(LIMITE_DE_CREDITO)>=100000 ORDER BY BAIRRO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;

SELECT CPF, NOME, DATA_DE_NASCIMENTO,
CASE 
	WHEN YEAR (DATA_DE_NASCIMENTO) < 1990 THEN 'VELHO'
	WHEN YEAR (DATA_DE_NASCIMENTO) >= 1990 AND YEAR (DATA_DE_NASCIMENTO) <= 1995 THEN 'JOVEM'
	ELSE 'CRIANÇA'
END 
AS FAIXA_ETARIA
FROM tabela_de_clientes
ORDER BY NOME;