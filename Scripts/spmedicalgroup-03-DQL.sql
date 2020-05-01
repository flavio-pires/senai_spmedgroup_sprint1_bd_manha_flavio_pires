--DEFINIR O BANCO DE DADOS QUE SERÁ UTILIZADO
USE spmedicalgroup_manha;
GO

--DQL
SELECT * FROM TipoUsuario;
SELECT * FROM Especialidade;
SELECT * FROM Estado;
SELECT * FROM Cidade;
SELECT * FROM Endereco;
SELECT * FROM Clinica;
SELECT * FROM Usuario;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Consulta;
SELECT * FROM Situacao;

--QUANTIDADE TOTAL DE USUARIOS
SELECT COUNT(*) AS TotalUsuarios FROM Usuario

--CONVERTER A DATA DE NASCIMENTO DO USUARIO PARA O FORMATO MÊS/DIA/ANO
SELECT CONVERT (VARCHAR(10),DataNascimento,110) AS [MM-DD-YYYY]
FROM Paciente;

--MOSTRAR OS NOMES DOS MEDICOS NAS CONSULTAS
SELECT NomeUsuario AS Médico, Descricao, DataConsulta, TituloSituacao, IdPaciente FROM Usuario
INNER JOIN Medico ON Usuario.IdUsuario = Medico.IdUsuario
INNER JOIN Consulta ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Situacao ON Situacao.IdSituacao = Consulta.IdSituacao

--MOSTRAR OS NOMES DOS PACIENTES NAS CONSULTAS
SELECT NomeUsuario AS Paciente, Descricao, DataConsulta, TituloSituacao,IdMedico FROM Usuario
INNER JOIN Paciente ON Usuario.IdUsuario = Paciente.IdUsuario
INNER JOIN Consulta ON Consulta.IdMedico = Paciente.IdPaciente
INNER JOIN Situacao ON Situacao.IdSituacao = Consulta.IdSituacao
