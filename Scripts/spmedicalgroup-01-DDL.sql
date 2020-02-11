--criar o banco de dados com o nome do projeto
CREATE DATABASE spmedicalgroup_manha;
GO

--define o banco de dados que será utilizado
USE spmedicalgroup_manha;
GO

--criar as tabelas do banco de dados
CREATE TABLE Clinica (
	IdClinica            INT PRIMARY KEY IDENTITY,
	NomeFantasia         VARCHAR (255) NOT NULL UNIQUE,
	CNPJ		         CHAR (14) NOT NULL UNIQUE,
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