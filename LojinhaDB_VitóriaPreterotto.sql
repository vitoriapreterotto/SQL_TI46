USE MASTER

CREATE DATABASE LojinhaDB
GO

USE LojinhaDb;
GO

CREATE TABLE Categoria (
CategoriaID int identity primary key,
NomeCategoria varchar(100) not null
);

CREATE TABLE Loja (
LojaID int identity primary key,
NomeLoja varchar(100) not null,
EnderecoLoja varchar(100) not null
);

CREATE TABLE Produtos (
ProdutosID int identity primary key,
NomeProduto varchar(100) not null,
Preco decimal not null,
CategoriaID int not null,
FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

CREATE TABLE Cliente (
ClienteID int identity primary key,
Nome varchar(100) not null,
Email varchar(100) not null,
Telefone varchar(15) not null
);

INSERT INTO Categoria (NomeCategoria) VALUES 
('Eletr�nicos'),
('Roupas'),
('Sa�de e cuidados pessoais');

INSERT INTO Loja (NomeLoja, EnderecoLoja) VALUES
('Loja Valinhos','Rua Ant�nio Carlos, 301 - Centro, Valinhos'),
('Loja Jundia�','Av. da Liberdade, 1458 - Jardim Bot�nico, Jundia�'),
('Loja Campinas','Rua Ernesto Lu�s de Oliveira, 65 - Vila 31 de Mar�o, Campinas');

INSERT INTO Produtos (NomeProduto, Preco, CategoriaID) VALUES
('Smartphone Samsung Galaxy S24','6174.05', 1),
('Camiseta Linkin Park Official, From Zero Tour','150.00',2),
('Protetor solar Sallve FPS50','69.90',3);

INSERT INTO Cliente (Nome, Email, Telefone) VALUES 
('Vit�ria Preterotto','vitoriapreterotto@gmail.com','19 978456123'),
('Amanda Silva','amanda0208@gmail.com','11 963850741'),
('Jos� Carlos Santos','joseclsantos@gmail.com','11 974185263');


select * from Categoria;
select * from Loja;
select * from Produtos;
select * from Cliente;


--Selecione todos os produtos com suas respectivas categorias usando um `INNER JOIN`. 
SELECT Produtos.NomeProduto, Produtos.Preco, C.NomeCategoria FROM Produtos
INNER JOIN Categoria C on Produtos.CategoriaID = C.CategoriaID;


--Selecione todos os clientes com suas informa��es pessoais
select * from Cliente;

--Selecione todas as lojas com seus nomes e endere�os
select * from Loja;

--Selecione apenas os produtos pertencentes a uma categoria espec�fica
SELECT Produtos.NomeProduto, Produtos.Preco FROM Produtos
INNER JOIN Categoria C on Produtos.CategoriaID = C.CategoriaID
WHERE C.NomeCategoria = 'Sa�de e cuidados pessoais';


--Atualize o pre�o de um produto espec�fico
UPDATE Produtos
SET Preco = '39.90'
WHERE NomeProduto = 'Protetor solar Sallve FPS50';

--Atualize o endere�o de uma loja espec�fica
UPDATE Loja
SET EnderecoLoja = 'R. Vicente Magaglio, 50 - Jardim Paulista I, Jundia�'
WHERE NomeLoja = 'Loja Jundia�';

--Atualize o nome de uma categoria
UPDATE Categoria
SET NomeCategoria = 'Sa�de e beleza'
WHERE NomeCategoria = 'Sa�de e cuidados pessoais';



--Exclua um produto espec�fico da tabela `Produtos`. 
DELETE FROM Produtos
WHERE NomeProduto = 'Camiseta Linkin Park Official, From Zero Tour';

--Exclua um cliente pelo nome
DELETE FROM Cliente
WHERE Nome = 'Vit�ria Preterotto';


--Adicione uma nova coluna em `Produtos` para armazenar a quantidade de estoque
ALTER TABLE Produtos
ADD QntProdutos int;


--Adicione uma nova coluna em `Cliente` para armazenar a data de cadastro
ALTER TABLE Cliente
ADD DataCadastro date;



--Crie uma nova tabela chamada `Pedidos` para registrar pedidos feitos por clientes, 
--incluindo refer�ncias para `Cliente` e `Produtos` com chaves estrangeiras.
CREATE TABLE Pedidos (
PedidosID int identity primary key,
ClienteID int not null,
ProdutoID int not null,
FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutosID)
);

select * from Pedidos

--Insira dados de exemplo na tabela `Pedidos`, associando clientes a produtos adquiridos
INSERT INTO Pedidos (ClienteID, ProdutoID) VALUES 
(2,1),
(3,3),
(2,3);

--Selecione todos os pedidos, incluindo informa��es do cliente e do produto adquirido usando `INNER JOIN`
SELECT Pedidos.PedidosID, Cliente.Nome, Produtos.NomeProduto
FROM Pedidos
INNER JOIN Cliente C on Pedidos.ClienteID = C.ClienteID
INNER JOIN Produtos P on Pedidos.ProdutoID = 