/*SCRIPT Banco de Dados da Loja de Eletrônicos
AUTORA:NAIRA SILVA GAMA
*/

--Criando tabelas do banco da loja de eletrônicos

--Criando a tabela produto
CREATE TABLE PRODUTO(
	Cod_produto INT NOT NULL,
	Nome_produto VARCHAR(50) NOT NULL,
	Cod_categoria INT NOT NULL,
	Categoria VARCHAR NOT NULL,
	Valor DECIMAL (10, 2) NOT NULL,
	Quantidade_estoque INT NOT NULL DEFAULT 0,
	Cod_fornecedor INT,
	PRIMARY KEY (Cod_produto),
	FOREIGN KEY (Cod_fornecedor) REFERENCES FORNECEDOR (Cod_fornecedor),
	FOREIGN KEY (Cod_categoria) REFERENCES CATEGORIA (Cod_categoria)
);

--Criando a tabela Categoria
CREATE TABLE CATEGORIA(
	Cod_categoria INT NOT NULL,
	Categoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(Cod_categoria)
);

--Criando a tabela Fornecedor
CREATE TABLE FORNECEDOR(
	Cod_fornecedor INT NOT NULL,
	Nome_fornecedor VARCHAR NOT NULL,
	Telefone_fornecedor VARCHAR(15),
	Cidade VARCHAR (30),
	Estado VARCHAR (2),
	PRIMARY KEY(Cod_fornecedor)
);

--Criando a tabela Cliente
CREATE TABLE CLIENTE(
	Cod_cliente INT NOT NULL,
	Nome_cliente VARCHAR(50) NOT NULL,
	Telefone_cliente VARCHAR (15),
	PRIMARY KEY(Cod_cliente)
);

--Criando a tabela Cliente_PF(Cliente Pessoa Física)
CREATE TABLE CLIENTE_PF(
	Cod_cliente INT NOT NULL,
	Cpf CHAR(11) UNIQUE,
	PRIMARY KEY(Cpf),
	FOREIGN KEY(Cod_cliente) REFERENCES CLIENTE(Cod_cliente)
);

--Criando a tabela Cliente_PJ(Cliente Pessoa Jurídica)
CREATE TABLE CLIENTE_PJ(
	Cod_cliente INT NOT NULL,
	Cnpj CHAR(14) UNIQUE,
	PRIMARY KEY(Cnpj),
	FOREIGN KEY(Cod_cliente) REFERENCES CLIENTE(Cod_cliente)
);

--Criando a tabela Entradas
CREATE TABLE ENTRADAS(
	Cod_entrada INT NOT NULL,
	Cod_produto INT NOT NULL,
	Cod_fornecedor INT,
	Quantidade INT NULL,
	Data_entrada DATE NOT NULL,
	PRIMARY KEY(Cod_entrada),
	FOREIGN KEY(Cod_produto) REFERENCES PRODUTO(Cod_produto),
	FOREIGN KEY(Cod_fornecedor) REFERENCES FORNECEDOR(Cod_fornecedor)
);

--Criando a tabela Saídas
CREATE TABLE SAIDAS(
	Cod_saida INT NOT NULL,
	Cod_produto INT NOT NULL,
	Cod_cliente INT NOT NULL,
	Quantidade INT NULL,
	Data_saida DATE,
	FOREIGN KEY(Cod_cliente) REFERENCES CLIENTE(Cod_cliente),
	FOREIGN KEY(Cod_produto) REFERENCES PRODUTO(Cod_produto)
);

--Inserindo os dados na tabelas

--Inserindo dados na tabela Produto
INSERT INTO PRODUTO
VALUES
(1, 'Smartphone', 1, 'Dispositivo móvel', 1500.00, 50, 2),
(2, 'Notebook', 2, 'Computadores', 3900.00, 25, 5),
(3, 'Tablet', 1, 'Dispositivo móvel', 810.00, 30, 3),
(4, 'Mouse', 3, 'Acessórios', 30.99, 73, 1),
(5, 'Teclado', 3, 'Acessórios',45.50, 69, 1),
(6, 'Desktop', 2, 'Computadores', 2350.00, 5, 5),
(7, 'Cabo USB', 3, 'Acessórios', 25.50, 12, 1),
(8, 'Webcam', 3, 'Acessórios', 190.00, 3, 1),
(9, 'SmartTV', 4, 'Televisor', 3600.00, 15, 3),
(10, 'Smartwatch', 1, 'Dispositivo móvel', 454.99, 20, 4),
(11, 'Fone', 5, 'Áudio', 99.90, 18, 4),
(12, 'Videogame', 6, 'Jogos', 3670.00, 2, 2),
(13, 'Caixa de som', 5, 'Áudio', 385.00, 10, 2),
(14, 'Roteador', 7, 'Equipamento de Rede', 270.90, 4, 2),
(15, 'Câmera Digital', 8, 'Vídeo e fotografia', 245.89, 2, 2);

--Inserindo dados na tabela Categoria
INSERT INTO CATEGORIA
VALUES
(1, 'Dispositivo móvel'),
(2, 'Computadores'),
(3, 'Acessórios'),
(4, 'Televisor'),
(5, 'Áudio'),
(6, 'Jogos'),
(7, 'Equipamento de Rede'),
(8, 'Vídeo e fotografia');

--Inserindo dados na tabela Fornecedor
INSERT INTO FORNECEDOR
VALUES
(1, 'ABC Acessórios', 989898989, 'Salvador', 'BA'),
(2, 'ABC Informática', 998899889, 'Manaus', 'AM'),
(3, 'JL Eletrônicos', 987987987, 'Salvador', 'BA'),
(4, 'Lima Eletrônicos', 889988998, 'Curitiba', 'PR'),
(5, 'Casa da Informática', 999997777, 'Curitiba', 'PR');

--Inserindo dados da tabela Cliente
INSERT INTO CLIENTE
VALUES
(1, 'Carolina Silva', 999999999),
(2, 'Marcos da Silva', 888999777),
(3, 'José Batista', 889977665),
(4, 'Mariana Galvão', 999900008),
(5, 'Murilo Moreira', 992233445),
(6, 'X Gamer', 556677889),
(7, 'Eletrônicos e Acessórios', 977777777),
(8, 'Silveira Eletrônicos', 988888888),
(9, 'Ferreira Informática', 888888888),
(10, 'Souza Dispositivos', 995555555);

--Inserindo dados da tabela Cliente_PF
INSERT INTO CLIENTE_PF
VALUES
(1, 90000000009),
(2, 87787787787),
(3, 99999999999),
(4, 88888888888),
(5, 77777777777);

--Inserindo dados da tabela Cliente_PJ
INSERT INTO CLIENTE_PJ
VALUES
(6, 80008000800080),
(7, 70007000700070),
(8, 55555555555555),
(9, 12341234123123),
(10, 88008800880088);

--Inserindo dados da tabela Entradas
INSERT INTO ENTRADAS
VALUES
(1, 15, 2, 10, '10/05/2023'),
(2, 4, 1, 10, '04/05/2023'),
(3, 12, 2, 5, '10/05/2023'),
(4, 1, 2, 8, '18/05/2023'),
(5, 2, 5, 20,'18/05/2023'),
(6, 9, 2, 12, '18/05/2023'),
(7, 14, 1, 5, '04/05/2023'),
(8, 10, 4, 5, '21/05/2023'),
(9, 3, 3, 25, '30/05/2023'),
(10, 5, 1, 15, '06/05/2023');

--Inserindo dados da tabela Saídas
INSERT INTO SAIDAS
VALUES
(1, 5, 4, 1, '01/05/2023'),
(2, 1, 5, 1, '01/05/2023'),
(3, 8, 6, 2, '01/05/2023'),
(4, 12, 10, 1, '03/05/2023'),
(5, 6, 7, 1, '03/05/2023'),
(6, 4, 1, 3, '10/05/2023'),
(7, 4, 3, 2, '04/05/2023'),
(8, 3, 2, 1, '04/05/2023'),
(9, 7, 5, 2, '18/05/2023'),
(10, 7, 4, 1, '18/05/2023'),
(11, 5, 9, 2, '26/05/2023'),
(12, 1, 8, 2, '21/05/2023'),
(13, 1, 7, 1, '07/05/2023'),
(14, 2, 6, 1, '07/05/2023'),
(15, 2, 2, 1,'15/05/2023');

--Consultando tabelas para visualização
SELECT * FROM PRODUTO
SELECT * FROM CATEGORIA
SELECT * FROM FORNECEDOR
SELECT * FROM CLIENTE
SELECT * FROM CLIENTE_PF
SELECT * FROM CLIENTE_PJ
SELECT * FROM ENTRADAS
SELECT * FROM SAIDAS

--Consultas mais complexas

/*JOIN para unir os produtos e seus fornecedores. Consulta 
importante para compreender quais são os fornecedores e quais 
produtos eles vendem para a loja de eletrônicos.*/

SELECT P.Nome_produto, E.Quantidade, F.Nome_fornecedor
From ENTRADAS E
JOIN PRODUTO P ON E.Cod_produto = P.Cod_produto
JOIN FORNECEDOR F ON E.Cod_fornecedor = F.Cod_fornecedor;

/*SUM, MAX, MIN e AVG para calcular a soma, o valor máximo, o mínino 
e a média de preço dos Produto da loja. Consulta importante para o controle
financeiro da loja. 
*/
SELECT SUM(valor), MAX(valor), MIN(valor), AVG(valor)
From PRODUTO;

/*COUNT para contar o número de clientes PF.
Esta consulta é relevante para entender qual o público que 
realiza compras na loja e tomar a melhores decisões com relação
as vendas.
*/
SELECT COUNT (*)
FROM CLIENTE_PF;

/*GROUP BY e HAVING para verificar o nome dos produtos 
que possuem valor maior que 1800. Esta é uma consulta importante 
para compreender o valor dos produtos disponíveis no estoque da loja. 
*/
SELECT P.Nome_produto, valor
from PRODUTO P
GROUP BY P.Nome_produto
HAVING valor >= 1800;

/*WHERE e LIKE para visualizar o nome e a cidade dos
fornecedores da Estado da BA. Importante para verificação da
localização dos fornecedores.
*/
SELECT nome_fornecedor, cidade
FROM FORNECEDOR
WHERE estado LIKE '%BA';

/*Consulta envolvendo múltiplas tabelas, que permite verificar 
o nome do cliente, o produto que ele adquiriu, a quantidade e a data da compra.
Esta é uma consulta importante para o controle e compreensão das vendas feitas durante 
o mês.
*/
SELECT C.Nome_cliente, P.Nome_produto, S.Quantidade, S.Data_saida
FROM SAIDAS S
JOIN CLIENTE C ON S.Cod_cliente = C.Cod_cliente
JOIN PRODUTO P on S.Cod_produto = P.Cod_produto;


