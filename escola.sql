USE MASTER

CREATE DATABASE EscolaDB
GO

USE EscolaDB;
GO

CREATE TABLE Curso (
Curso_ID int identity primary key,
Nome varchar(100) not null,
Descricao text not null,
Carga_Horaria int not null
);

CREATE TABLE Aluno (
Aluno_ID int identity primary key,
Nome varchar (100) not null,
Data_Nascimento date not null,
Email varchar (100) not null
);

CREATE TABLE Instrutor (
Instrutor_ID int identity primary key,
Nome varchar (100) not null,
Especialidade varchar (100) not null
);

CREATE TABLE Turma (
Turma_ID int identity primary key,
Curso_ID int not null,
Instrutor_ID int not null,
Data_Inicio date not null,
Data_Fim date not null,
FOREIGN KEY (Curso_ID) REFERENCES Curso (Curso_ID),
FOREIGN KEY (Instrutor_ID) REFERENCES Instrutor (Instrutor_ID)
);

CREATE TABLE Matricula (
Matricula_ID int identity primary key,
Aluno_ID int not null,
Turma_ID int not null,
Data_Matricula date not null,
FOREIGN KEY (Aluno_ID) REFERENCES Aluno (Aluno_ID),
FOREIGN KEY (Turma_ID) REFERENCES Turma (Turma_ID)
);


INSERT INTO Curso VALUES ('Informática','Desenvolvimento de banco de dados', 1000)

INSERT INTO Aluno VALUES ('Vitória Preterotto','07/02/2002', 'vitoria@gmail.com')

INSERT INTO Instrutor VALUES ('Marcos Cozatti','Técnico de T.I')

INSERT INTO Turma VALUES (2, 1, '10/11/2023','07/02/2025').

INSERT INTO Matricula VALUES (1, 1, '01/01/2023')

select * from Curso;
select * from Aluno;
select * from Instrutor;
select * from Turma;
select * from Matricula;