--DEFINIR O BANCO DE DADOS QUE SERÁ UTILIZADO
USE spmedicalgroup_manha;
GO

--INSERIR DADOS NAS TABELAS
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

INSERT INTO Cidade (NomeCidade)
VALUES ('São Paulo'),
	   ('Barueri'),
	   ('Ribeirão Pires');
GO

INSERT INTO Estado (NomeEstado)
VALUES ('São Paulo');
GO

INSERT INTO Endereco (NomeLogradouro, NumeroLogradouro, Bairro, CEP, IdCidade, IdEstado)
VALUES ('Alameda Barão de Limeira', 532, 'Santa Cecília', '01202-001', 1, 1),
	   ('Rua Estado de Israel', 240, 'Vila Mariana', '04022-000', 1, 1),
	   ('Avenida Paulista', 1578, 'Bela Vista', '01310-200', 1, 1),
	   ('Avenida Ibirapuera', 2927, 'Indianópolis', '04029-200', 1, 1),
	   ('Rua Vitória', 120, 'Vila São Jorge', '06402-030', 2, 1),
	   ('Rua Ver. Geraldo de Camargo', 66, 'Santa Luzia', '09405-380', 3, 1),
	   ('Alameda Dos Arapanés', 945, 'Indianópolis', '04524-001', 1, 1),
	   ('Rua São Antônio', 232, 'Vila Universal', '06407-140', 2, 1);
GO

INSERT INTO Clinica (NomeFantasia, CNPJ, RazaoSocial, HorarioAbertura, HorarioFechamento, IdEndereco)
VALUES ('Clinica Possarle','86.400.902/0001-30','SP Medical Group', '8:00', '18:00', 1);
GO

INSERT INTO Usuario (Email, Senha, IdTipoUsuario, IdClinica)
VALUES ('adm@spmedicalgroup.com.br','adm123', 1, 1),
	   ('ricardo.lemos@spmedicalgroup.com.br','ricardo123', 2, 1),
	   ('roberto.possarle@spmedicalgroup.com.br','roberto123', 2, 1),
	   ('helena.souza@spmedicalgroup.com.br','helena123', 2, 1),
	   ('ligia@gmail.com','ligia123', 3, 1),
	   ('alexandre@gmail.com','alexandre123', 3, 1),
	   ('fernando@gmail.com','fernando123', 3, 1),
	   ('henrique@gmail.com','henrique123', 3, 1),
	   ('joao@gmail.com','joao123', 3, 1),
	   ('bruno@gmail.com','bruno123', 3, 1),
	   ('mariana@outlook.com','mariana123', 3, 1);
GO

INSERT INTO Medico (NomeMedico, CRM, IdUsuario, IdEspecialidade)
VALUES ('Ricardo Lemos', '54356-SP', 2, 2),
	   ('Roberto Possarle', '53452-SP', 3, 17),
	   ('Helena Strada', '65463-SP', 4, 16);
GO

INSERT INTO Paciente (NomePaciente, RG, CPF, Telefone, DataNascimento, IdUsuario, IdEndereco)
VALUES ('Ligia', '435225435','94839859000','1134567654','13/10/1983', 5, 2),
	   ('Alexandre', '326543457','73556944057','11987656543','23/07/2001', 6, 3),
	   ('Fernando', '546365253','16839338002','11972084453','10/10/1978', 7, 4),
	   ('Henrique', '543663625','14332654765','1134566543','13/10/1985', 8, 5),
	   ('João', 't325444441','91305348010','1176566377','27/08/1975', 9, 6),
	   ('Bruno', '545662667','79799299004','11954368769','21/03/1972', 10, 7),
	   ('Mariana', '545662668','13771913039','','05/03/2018', 11, 8);
GO

INSERT INTO Consulta (Descricao, DataConsulta, HorarioConsulta, IdMedico, IdPaciente, IdSituacao)
VALUES ('Verificação de febre do filho', '20/01/2020', '15:00', 3, 7, 1),
	   ('', '06/01/2020', '10:00', 2, 2, 3),
	   ('Indícios de loucura', '07/02/2020', '11:00', 2, 3, 1),
	   ('Sintomas de depressão', '06/02/2018', '10:00', 2, 2, 1),
	   ('', '07/02/2019', '11:00', 1, 4, 3),
	   ('Vacinaçao do filho contra Sarampo', '08/03/2020', '15:00', 3, 7, 2);
GO
