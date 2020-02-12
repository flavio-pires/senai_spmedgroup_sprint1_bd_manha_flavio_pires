--CRIAR O BANCO DE DADOS COM O NOME DO PROJETO
CREATE DATABASE spmedicalgroup_manha;
GO

--DEFINIR O BANCO DE DADOS QUE SERÁ UTILIZADO
USE spmedicalgroup_manha;
GO

--CRIAR AS TABELAS DO BANCO DE DADOS
CREATE TABLE Clinica (
	IdClinica            INT PRIMARY KEY IDENTITY,
	NomeFantasia         VARCHAR (255) NOT NULL UNIQUE,
	CNPJ		         VARCHAR (50) NOT NULL UNIQUE,
	RazaoSocial			 VARCHAR (255) NOT NULL UNIQUE,
	EnderecoClinica		 VARCHAR (255) NOT NULL,
	HorarioFuncionamento VARCHAR (255) NOT NULL
);
GO

CREATE TABLE TipoUsuario (
	IdTipoUsuario	  INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Especialidade (
	IdEspecialidade   INT PRIMARY KEY IDENTITY,
	NomeEspecialidade VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Situacao (
	IdSituacao     INT PRIMARY KEY IDENTITY,
	TituloSituacao VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Usuario (
	IdUsuario     INT PRIMARY KEY IDENTITY,
	NomeUsuario   VARCHAR (255) NOT NULL UNIQUE,
	Email         VARCHAR (255) NOT NULL UNIQUE,
	Senha         VARCHAR (255) NOT NULL,

	IdClinica     INT FOREIGN KEY REFERENCES Clinica (IdClinica),
	IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);
GO

CREATE TABLE Paciente (
	IdPaciente       INT PRIMARY KEY IDENTITY,
	RG				 VARCHAR (15) NOT NULL UNIQUE,
	CPF				 INT NOT NULL UNIQUE,
	Telefone	     INT,
	DataNascimento   DATETIME2,
	EnderecoPaciente VARCHAR (255),

	IdUsuario		 INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
);
GO

CREATE TABLE Medico (
	IdMedico	    INT PRIMARY KEY IDENTITY,
	CRM			    VARCHAR (20) NOT NULL UNIQUE,

	IdUsuario	    INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade (IdEspecialidade)
);
GO

CREATE TABLE Consulta (
	IdConsulta   INT PRIMARY KEY IDENTITY,
	Descricao    VARCHAR (255),
	DataConsulta DATETIME2,

	IdMedico	 INT FOREIGN KEY REFERENCES Medico (IdMedico),
	IdPaciente   INT FOREIGN KEY REFERENCES Paciente (IdPaciente),
	IdSituacao   INT FOREIGN KEY REFERENCES Situacao (IdSituacao)
);
GO

--INSERIR DADOS NAS TABELAS
INSERT INTO Clinica (NomeFantasia,CNPJ,RazaoSocial,EnderecoClinica,HorarioFuncionamento)
VALUES ('Clinica Possarle','86.400.902/0001-30','SP Medical Group','Av. Barão Limeira, 532, São Paulo, SP','Comercial');
GO

INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES ('Administrador'),
	   ('Médico'),
	   ('Paciente');
GO

INSERT INTO Especialidade (NomeEspecialidade)
VALUES ('Acupuntura'),
	   ('Anestesiologia'),
	   ('Angiologia'),
	   ('Cardiologia'),
	   ('Cirurgia Cardiovascular'),
	   ('Cirurgia da Mão'),
	   ('Cirurgia do Aparelho Digestivo'),
	   ('Cirurgia Geral'),
	   ('Cirurgia Pediátrica'),
	   ('Cirurgia Plástica'),
	   ('Cirurgia Torácica'),
	   ('Cirurgia Vascular'),
	   ('Dermatologia'),
	   ('Radioterapia'),
	   ('Urologia'),
	   ('Pediatria'),
	   ('Psiquiatria');
GO

INSERT INTO Situacao (TituloSituacao)
VALUES ('Realizada'),
	   ('Agendada'),
	   ('Cancelada');
GO

INSERT INTO Usuario (NomeUsuario, Email, Senha, IdTipoUsuario, IdClinica)
VALUES ('Administrador','adm@spmedicalgroup.com.br','adm123', 1, 1),
	   ('Ricardo Lemos','ricardo.lemos@spmedicalgroup.com.br','ricardo123', 2, 1),
	   ('Roberto Possarle','roberto.possarle@spmedicalgroup.com.br','roberto123', 2, 1),
	   ('Helena Strada','helena.souza@spmedicalgroup.com.br','helena123', 2, 1),
	   ('Ligia','ligia@gmail.com','ligia123', 3, 1),
	   ('Alexandre','alexandre@gmail.com','alexandre123', 3, 1),
	   ('Fernando','fernando@gmail.com','fernando123', 3, 1),
	   ('Henrique','henrique@gmail.com','henrique123', 3, 1),
	   ('João','joao@gmail.com','joao123', 3, 1),
	   ('Bruno','bruno@gmail.com','bruno123', 3, 1),
	   ('Mariana','mariana@outlook.com','mariana123', 3, 1);
GO

INSERT INTO Medico (CRM, IdUsuario, IdEspecialidade)
VALUES ('54356-SP', 2, 2),
	   ('53452-SP', 3, 17),
	   ('65463-SP', 4, 16);
GO

INSERT INTO Paciente (RG, CPF, Telefone, DataNascimento, EnderecoPaciente, IdUsuario)
VALUES ('43522543-5','94839859000','11 3456-7654','13/10/1983','Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000', 5),
	   ('32654345-7','73556944057','11 98765-6543','23/07/2001','Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200', 6),
	   ('54636525-3','16839338002','11 97208-4453','10/10/1978','Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200', 7),
	   ('54366362-5','14332654765','11 3456-6543','13/10/1985','R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030', 8),
	   ('t32544444-1','91305348010','11 7656-6377','27/08/1975','R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380', 9),
	   ('54566266-7','79799299004','11 95436-8769','21/03/1972','Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001', 10),
	   ('54566266-8','13771913039','','05/03/2018','R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140', 11);
GO

INSERT INTO Consulta (Descricao, DataConsulta, IdMedico, IdPaciente, IdSituacao)
VALUES ('Verificação de febre do filho','20/01/2020  15:00:00', 3, 7, 1),
	   ('','06/01/2020  10:00:00', 2, 2, 3),
	   ('Indícios de loucura','07/02/2020  11:00:00', 2, 3, 1),
	   ('Sintomas de depressão','06/02/2018  10:00:00', 2, 2, 1),
	   ('','07/02/2019  11:00:45', 1, 4, 3),
	   ('Vacinaçao do filho contra Sarampo','08/03/2020  15:00:00', 3, 7, 2);
GO

--DQL
SELECT * FROM Clinica;
SELECT * FROM TipoUsuario;
SELECT * FROM Especialidade;
SELECT * FROM Usuario;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Consulta;
SELECT * FROM Situacao;