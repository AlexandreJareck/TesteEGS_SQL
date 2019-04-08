CREATE DATABASE BaseProdutoPedido

--DDL
USE BaseProdutoPedido

CREATE TABLE Pedido (

idPedido INT PRIMARY KEY,
NomeCliente VARCHAR(75) NOT NULL,
DataPedido DateTime NOT NULL,
ValorTotalPedido DECIMAL(8,2) NOT NULL
)

CREATE TABLE Produto(
idProduto INT PRIMARY KEY,
NomeProduto VARCHAR(50) NOT NULL,
ValorProduto DECIMAL(8,2) NOT NULL

)

CREATE TABLE Produto_Pedido (
idProd INT FOREIGN KEY REFERENCES Produto (IdProduto),
idPed INT FOREIGN KEY REFERENCES Pedido (IdPedido),
qtdProduto INT NOT NULL,
PRIMARY KEY (idProd, idPed)
)

-- DML
SELECT *FROM Produto

-- Inserir um produto na tabela de produtos
INSERT INTO Produto (idProduto, NomeProduto, ValorProduto)
VALUES (1,'Teclado',97.85)

INSERT INTO Produto (idProduto, NomeProduto, ValorProduto)
VALUES (2,'Mause',65.33)
INSERT INTO Produto (idProduto, NomeProduto, ValorProduto)
VALUES (3,'Pen Drive 4GB',25.55)

--Modificar o valor do produto na tabela de produtos
UPDATE Produto
SET ValorProduto = 85.35 WHERE idProduto = 2

--Excluir um produto pelo identificador do produto
DELETE FROM Produto
WHERE idProduto = 1

SELECT * FROM Pedido

--Inserir um pedido na tabela de pedidos
INSERT INTO Pedido (idPedido, NomeCliente, DataPedido, ValorTotalPedido) 
VALUES (1,'Alexandre Jareck',GETDATE(), 105.99)

INSERT INTO Pedido (idPedido, NomeCliente, DataPedido, ValorTotalPedido) 
VALUES (2,'João Silva',GETDATE(), 203.98)

INSERT INTO Pedido (idPedido, NomeCliente, DataPedido, ValorTotalPedido) 
VALUES (3,'Joaquim Barbosa', GETDATE(), 85.35)



-- Modificar a data\hora do pedido na tabela de pedidos
UPDATE Pedido 
SET DataPedido =  DATEADD(DAY, -30, getdate()) WHERE idPedido = 1

UPDATE Pedido 
SET DataPedido =  DATEADD(Hour, - 44, getdate()) WHERE idPedido = 2

UPDATE Pedido 
SET DataPedido =  DATEADD(DAY, -8, getdate()) WHERE idPedido = 3
UPDATE Pedido 
SET DataPedido =  DATEADD(Hour, -10, getdate()) WHERE idPedido = 3

-- Excluir um pedido pelo identificador do pedido
DELETE FROM Pedido
WHERE idPedido = 1

SELECT * FROM Produto_Pedido

 -- Inserir um produto no pedido com quantidade 5
INSERT INTO Produto_Pedido
(idProd,idPed,qtdProduto)
VALUES (2, 2, 5)

-- DQL

-- Buscar os pedidos mais recentes ordenado pela data e hora do pedido

SELECT * FROM Pedido
ORDER BY DataPedido DESC

-- Buscar os produtos com menor valor

SELECT * FROM Produto
ORDER BY ValorProduto ASC


