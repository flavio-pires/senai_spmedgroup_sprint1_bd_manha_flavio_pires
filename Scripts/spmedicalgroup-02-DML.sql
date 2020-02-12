--DEFINIR O BANCO DE DADOS QUE SERÁ UTILIZADO
USE spmedicalgroup_manha;
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
VALUES ('435225435','94839859000','1134567654','13/10/1983','Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000', 5),
	   ('326543457','73556944057','11987656543','23/07/2001','Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200', 6),
	   ('546365253','16839338002','11972084453','10/10/1978','Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200', 7),
	   ('543663625','14332654765','1134566543','13/10/1985','R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030', 8),
	   ('t325444441','91305348010','1176566377','27/08/1975','R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380', 9),
	   ('545662667','79799299004','11954368769','21/03/1972','Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001', 10),
	   ('545662668','13771913039','','05/03/2018','R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140', 11);
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

SELECT CONVERT (DATE,'13-10-1983',)
FROM Paciente;
