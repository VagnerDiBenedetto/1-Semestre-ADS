-- Aula 11
-- Relacionamento n:n
-- Tabela associativa

CREATE DATABASE consultaMedica;
USE consultaMedica;

CREATE TABLE paciente (
idPaciente int primary key auto_increment,
nome varchar(45));

INSERT INTO paciente (nome) VALUES
	('Mônica'),
	('Cascão'),
	('Cebolinha');
    
CREATE TABLE medico (
idMedico int primary key auto_increment,
nome varchar(45),
salario decimal(10,2)) auto_increment = 100;

INSERT INTO medico (nome, salario) VALUES
	('Bidu', 1000.99),
	('Mauricio', 5000.99),
	('Franjinha', 10.99);
    
-- criar a tabela associativa
CREATE TABLE consulta (
idConsulta int,
fkPaciente int,
fkMedico int,
primary key (idConsulta, fkPaciente, fkMedico),
dtConsulta datetime,
foreign key (fkPaciente) 
	references paciente(idPaciente),
foreign key (fkMedico)
	references medico(idMedico));
    
INSERT INTO consulta VALUES
	(1,1,100, '2023-11-01 13:00:00'),
	(2,1,100, '2023-11-08 13:00:00'),
	(1,1,101, '2023-11-01 15:00:00');
    
SELECT paciente.nome as Paciente,
medico.nome as Medico,
dtConsulta
FROM paciente JOIN consulta
	ON idPaciente = fkPaciente
    JOIN medico
    ON idMedico = fkMedico;
    
SELECT * FROM medico JOIN consulta
	ON idMedico = fkMedico;
    
SELECT * FROM medico JOIN consulta
	ON idMedico = fkMedico 
    WHERE dtConsulta LIKE '2023-11-01%';
    
SELECT ifnull(paciente.nome, 'Sem paciente') Paciente,
ifnull(medico.nome, 'Sem médico') as Medico
FROM medico LEFT JOIN consulta
	ON idMedico = fkMedico
LEFT JOIN paciente
	ON idPaciente = fkPaciente 
    WHERE idConsulta is null
UNION
SELECT ifnull(paciente.nome, 'Sem paciente') Paciente,
ifnull(medico.nome, 'Sem médico') as Medico
FROM medico RIGHT JOIN consulta
	ON idMedico = fkMedico
	RIGHT JOIN paciente
	ON idPaciente = fkPaciente 
    WHERE idConsulta is null;
    
-- Funções matemáticas
-- max()
SELECT max(salario) FROM medico;

-- min()
SELECT min(salario) FROM medico;

SELECT max(salario) as Maior,
min(salario) as Menor
FROM medico;    

-- sum()
SELECT sum(salario) FROM medico;

-- avg()
SELECT AVG(salario) FROM medico;

SELECT avg(salario) FROM medico 
	WHERE idMedico in (100,101);
    
-- round()
-- truncate()
SELECT avg(salario) Média, round(avg(salario),2) Arredondada FROM medico;
SELECT avg(salario) Média, truncate(avg(salario),2) Arredondada FROM medico;

INSERT INTO medico VALUES
	(NULL, 'Fernanda', 2300.09);

INSERT INTO medico VALUES
	(NULL, 'Fernanda', null);

    
-- distinct
SELECT distinct nome from medico;

-- count
select count(*) from consulta;

select count(*), dtConsulta from consulta
	group by dtConsulta;
    
INSERT INTO consulta values
	(1,2,101, '2023-11-01 13:00:00');