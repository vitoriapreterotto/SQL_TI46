USE MASTER

CREATE DATABASE LojaDB
GO

USE LojaDB;
GO

CREATE TABLE Categoria (
CategoriaID int identity primary key,
NomeCategoria varchar(100) not null,
Descricao text not null,
);

CREATE TABLE Produto (
ProdutoID int identity primary key,
Nome varchar(100) not null,
CategoriaID int not null,
Quantidade int not null,
PrecoUnitario decimal not null,
FOREIGN KEY (CategoriaID) REFERENCES Categoria (CategoriaID)
);

CREATE TABLE Cliente (
ClienteID int identity primary key,
Nome varchar(100) not null,
Email varchar(100) not null,
Endereco varchar(100) not null,
Telefone varchar(15) not null
);

CREATE TABLE Pedido (
PedidoID int identity primary key,
ClienteID int not null,
DataPedido date not null,
StatusPedido varchar(100) not null,
FOREIGN KEY (ClienteID) REFERENCES Cliente (ClienteID)
);

CREATE TABLE ItemPedido (
ItemID int identity primary key,
PedidoID int not null,
ProdutoID int not null,
Quantidade int not null,
PrecoUnitario varchar(100) not null;,
FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

INSERT INTO Categoria VALUES ('Eletrônicos','Smartphones, Televisão, Tablets, Consoles e Notebooks'),
							 ('Casa e decoração','Cama, Mesa, Banho, Eletroportáteis, Banheiro & Lavanderia'),
							 ('Beleza e cuidados pessoais','Maquiagem, Perfumes, Cabelos, Filtros solares');

INSERT INTO Produto VALUES ('iPhone 14 de 128 GB - Roxo', 1, '10','4199.00'),
						   ('Toalha de rosto Scala', 2, '25','14.90'),
						   ('Gel Facial Shiseido', 3,'15','246.05');

INSERT INTO Cliente VALUES ('Vitória Preterotto','vitoria@gmail.com','Av. Senac, 111 - Jundiaí/SP','19 91199 1119'),
						   ('Felipe Martins','felipe.rocha@gmail.com','Rua da Liberdade, 250 - Curitiba/PR','41 99888 8899'),
						   ('Ana Clara Silva','anasilva02@gmail.com','Rua das Flores, 123 - São Paulo/SP','11 98765 4321');
						    
INSERT INTO Pedido VALUES (5,'10/25/2024','Aguardando pagamento'),
						  (6,'10/30/2024','Concluído'),
						  (7,'11/01/2024','Em separação');

INSERT INTO ItemPedido VALUES (2, 5, '2','246.05'),
							  (3, 3, '1','4199.00'),
							  (4, 4, '5','14.90');

select * from Categoria;
select * from Produto;
select * from Cliente;
select * from Pedido;
select * from ItemPedido;

ALTER TABLE ItemPedido
DROP COLUMN PrecoUnitario;

ALTER TABLE ItemPedido
ADD PrecoUnitario varchar(100) not null;