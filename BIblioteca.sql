USE MASTER

--Criando a base de dadps 
CREATE DATABASE BibliotecaDB
GO

USE BibliotecaDB;
GO
--Criando Tabelas
CREATE TABLE Autores(
AutorID int identity primary key,
NomeCompleto varchar(255) not null,
PaisOrigem varchar(255) not null
);


CREATE TABLE Livros(
LivrosID  int identity primary key,
Titulo varchar(255) not null,
AnoPublicacao varchar(255) not null,
AutorID int not null,
FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE Emprestimos(
EmprestimoID  int identity primary key,
DataEmprestimo date not null,
DataDevolucao date not null,
LivroID int not null,
FOREIGN KEY (LivroID) REFERENCES Livros(LivrosID)
);


INSERT INTO Autores VALUES ('James Dashner','Estados Unidos'),
						  ('Bram Stoker','Irlanda'),
						  ('Dan Gemeinhart','Estados Unidos'),
						  ('Mauricio de Souza','Brasil'),
						  ('Stephen King','Estados Unidos')


INSERT INTO Livros VALUES ('Maze Runner: correr ou morrer',2010, 1),
						  ('Drácula',2020, 2),
						  ('A mais pura verdade', 2015, 3),
						  ('Turma da Mônica Jovem: Mudando o jogo', 2022, 4),
						  ('Misery: Louca obsessão', 2014, 5)

INSERT INTO Emprestimos VALUES ('10/11/2024', '11/06/2024', 1),
								('10/01/2024', '12/23/2024', 2),
								('10/30/2024', '01/19/2025', 3),
								('10/11/2024', '11/28/2024', 4),
								('09/15/2024', '10/31/2024', 5)

DROP TABLE Emprestimos
DROP TABLE Autores
DROP TABLE Livros

SELECT*FROM Autores;
SELECT*FROM Livros;
SELECT*FROM Emprestimos;

SELECT*FROM Emprestimos E
INNER JOIN Livros L on L.LivrosID = E.LivroID
INNER JOIN Autores A on A.AutorID = L.AutorID

SELECT E.EmprestimoID as'ID do Empréstimo', A.NomeCompleto as 'Nome do Autor', L.LivrosID as 'ID do Livro', 
L.AnoPublicacao as 'Ano de Publicação', L.Titulo as 'Título do Livro' FROM Emprestimos E
INNER JOIN Livros L on L.LivrosID = E.LivroID
INNER JOIN Autores A on A.AutorID = L.AutorID