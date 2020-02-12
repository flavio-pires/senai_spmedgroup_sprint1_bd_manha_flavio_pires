--DEFINIR O BANCO DE DADOS QUE SERÁ UTILIZADO
USE spmedicalgroup_manha;
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

SELECT CONVERT (VARCHAR(10),DataNascimento,103)
FROM Paciente;
