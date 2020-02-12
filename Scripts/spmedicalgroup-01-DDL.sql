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
	CPF				 VARCHAR (50) NOT NULL UNIQUE,
	Telefone	     VARCHAR (50),
	DataNascimento   DATE,
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
