use master
go

create database ConsultorioMedico;
go

use ConsultorioMedico;
go

create table Paciente (
IdPaciente int identity primary key,
Nome varchar(255) not null,
DataNascimento date not null,
Endereco varchar(255) not null,
Telefone varchar(15) not null
);

create table Medico (
IdMedico int identity primary key,
NomeMedico varchar(255) not null,
CRM int not null,
IdEspecialidade int
);

create table Especialidade (
IdEspecialidade int identity primary key,
Descricao varchar(255) not null
);

create table Consulta (
IdConsulta int identity primary key,
IdPaciente int not null,
IdMedico int not null,
DataConsulta date not null,
Observacoes text not null
);


ALTER TABLE Medico
ADD FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade(IdEspecialidade);

ALTER TABLE Consulta
ADD FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente);

ALTER TABLE Consulta
ADD FOREIGN KEY (IdMedico) REFERENCES Medico(IdMedico);

INSERT INTO Paciente VALUES 
('Vitória Preterotto','07/02/2002','Louveira/SP', '19 99718875'),
('Silvana Santos','07/10/1989','Jundiai/SP', '19 799456123'),
('Clara Batista','01/01/2010','Jundiai/SP', '19 95279875'),
('João Luan','08/07/1999','Varzea Paulista/SP', '11 963852741')

INSERT INTO Especialidade VALUES 
('Cardiogia'),
('Pediatra'),
('Psiquiátra')

INSERT INTO Medico (NomeMedico, CRM) VALUES 
('Luana Silva','15287'),
('Fabricio Santos','74185'),
('Rebecca Pereira','85296')

INSERT INTO Consulta (IdPaciente, IdMedico, DataConsulta, Observacoes) VALUES
(1, 3, '11/07/2024', 'Levar antigos medicamentos'),
(2, 1, '11/01/2024','Trazer exames'),
(3, 2, '11/04/2024', 'Vir acompanhado por responsáveis'),
(4, 1, '11/05/2024', 'Consulta de retorno')


select C.IdPaciente, P.Nome, C.IdMedico, M.NomeMedico, C.DataConsulta from Consulta C
INNER JOIN Paciente P on P.IdPaciente = C.IdPaciente
INNER JOIN Medico M on M.IdMedico = C.IdMedico



select * from Paciente;
select * from Especialidade;
select * from Medico;
select * from Consulta


ALTER TABLE Consulta
ADD DataConsulta date;

ALTER TABLE Consulta
DROP COLUMN DataConsulta;