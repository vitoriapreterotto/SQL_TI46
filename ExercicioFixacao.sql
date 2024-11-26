USE MASTER

CREATE DATABASE CadastroClientes;
GO

USE CadastroClientes;
GO

CREATE TABLE Cadastro(
Cliente_ID int identity primary key,
NomeCliente varchar(100) not null,
Endereco varchar(100) not null,
Cidade varchar(100) not null,
TelefoneContato varchar(15)
);


SELECT * FROM Cadastro;