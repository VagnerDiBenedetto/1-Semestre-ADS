-- Aula 11 - 27/04
-- Introdução relacionamento n:n

CREATE DATABASE clinica;  
USE clinica;

CREATE TABLE paciente (
idPaciente int primary key auto_increment,
nome varchar(45));

CREATE TABLE medico (
idMedico int primary key auto_increment,
nome varchar(45),
especialidade varchar(45),
salario decimal(10,2),
constraint chkSalario check (salario >=0)
) auto_increment = 1000;

INSERT INTO paciente VALUES
	(null, 'Julia'),
	(null, 'Jhulia com H'),
	(null, 'Jeremias');
    
INSERT INTO medico VALUES
	(null, 'Julio', 'pediatra',100.99),
	(null, 'Zapatta', 'ortopedista',1.99);
    
-- tabela associativa - consulta
CREATE TABLE consulta (
idConsulta int,
fkPaciente int,
fkMedico int,
dtConsulta datetime default current_timestamp,
constraint fkPacienteConsulta foreign key (fkPaciente)
	references paciente(idPaciente),
constraint fkMedicoConsulta foreign key (fkMedico)
	references medico(idMedico),
constraint pkAssociativa primary key(idConsulta, fkPaciente,fkMedico)
);

SELECT * FROM paciente;
SELECT * FROM medico;

INSERT INTO consulta VALUES
	(1, 1, 1000, default),
	(2, 1, 1000, default),
	(1, 2, 1000, default),
	(1, 2, 1001, default);
    
SELECT * FROM consulta;

SELECT * FROM paciente JOIN consulta
ON idPaciente = fkPaciente
JOIN medico ON idMedico = fkMedico;

SELECT paciente.nome AS Paciente,
medico.nome AS Medico
FROM paciente JOIN consulta
ON idPaciente = fkPaciente
JOIN medico ON idMedico = fkMedico;

SELECT paciente.nome AS Paciente,
medico.nome AS Medico
FROM paciente LEFT JOIN consulta
ON idPaciente = fkPaciente
LEFT JOIN medico ON idMedico = fkMedico;

SELECT paciente.nome AS Paciente,
medico.nome AS Medico
FROM paciente LEFT JOIN consulta
ON idPaciente = fkPaciente
LEFT JOIN medico ON idMedico = fkMedico
WHERE fkMedico is null;

SELECT * FROM medico;

INSERT INTO medico VALUES
	(null, 'Brian', null,2.25),
	(null, 'Matheus', null,2.25);

-- soma
SELECT sum(salario) FROM medico;
SELECT sum(salario) FROM medico WHERE idMedico in (1000,1003);

-- SOMA DOS VALORES DIFERENTES
SELECT sum(DISTINCT salario) FROM medico;
SELECT sum(DISTINCT salario) as SOMA FROM medico;

-- média
SELECT avg(salario) FROM medico;

-- maximo
SELECT MAX(salario) FROM medico;

-- minimo
SELECT MIN(salario) FROM medico;

-- MAIOR E MENOS SALARIO
SELECT max(salario), min(salario) FROM medico;

SELECT SUM(salario) Soma1000e1003,
(SELECT salario FROM medico WHERE idMedico = 1000) as Medico1000,
(SELECT salario FROM medico WHERE idMedico = 1003) as Medico1003 
FROM medico WHERE idMedico in (1000,1003);

-- 1 PACIENTE TEM MUITOS ENDEREÇOS
-- 1 ENDEREÇO É DE MUITOS PACIENTES

CREATE TABLE endereco (
idEnd int primary key auto_increment,
cep char(9) unique,
bairro varchar(45),
cidade varchar(45),
estado char(2)) auto_increment = 5000;

INSERT INTO endereco VALUES
	(null, '01414-905','Cerqueira Cesar','São Paulo', 'SP'),
	(null, '04253-000','Sacomã','São Paulo', 'SP');
    
CREATE TABLE enderecoPaciente (
fkEnd int,
constraint fkEnd foreign key (fkEnd) 
	references endereco(idEnd),
fkPaciente int,
constraint fkPacienteEnd foreign key (fkPaciente)
	references paciente(idPaciente),
constraint pkComposta primary key (fkEnd, fkPaciente),
numEnd varchar(45),
complemento varchar(45),
tipo varchar(45));

SELECT * FROM paciente;
SELECT * FROM endereco;

INSERT INTO enderecoPaciente VALUES
	(5000,1,'595','4º andar', 'apartamento'),
	(5001,1,'1500','10º andar', 'apartamento'),
	(5000,2,'595','6º andar', 'apartamento'),
	(5001,2,'762','próximo ao mercado ABC', 'casa');
    
SELECT * FROM paciente JOIN enderecoPaciente
ON idPaciente = fkPaciente
JOIN endereco ON idEnd = fkEnd;