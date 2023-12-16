-- Aula 10

CREATE DATABASE natacao;

USE natacao;

CREATE TABLE treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
dtNasc date,
fkExperiente int,
constraint fkExperiente foreign key (fkExperiente)
	references treinador(idTreinador));
    
ALTER TABLE treinador auto_increment = 10;

INSERT INTO treinador VALUES
	(NULL, 'Kaline', '1956-10-10', null),
	(NULL, 'Marcela', '2000-10-10', 10),
	(NULL, 'Thiago Gomes', '2000-10-11', 10),
	(NULL, 'Rayssa', '2000-10-12', 10),
	(NULL, 'Vera', '2020-10-12', null);
    
SELECT * FROM treinador;

SELECT n.nome as NomeNovato,
e.nome as NomeExperiente
FROM treinador as n
JOIN treinador as e
ON n.fkExperiente = e.idTreinador;

CREATE TABLE nadador (
idNadador int primary key auto_increment,
nome varchar(45),
cep char(8), -- + num + complemento = atributo composto
num varchar(45),
complemento varchar(45),
fkTreinador int,
constraint fkNadadorTreinador foreign key (fkTreinador)
	references treinador(idTreinador)) auto_increment = 100;
    
INSERT INTO nadador (nome, fkTreinador) VALUES
	('Roberta', 11), 
	('Leonardo', 11), 
	('Murilo', null);
    
SELECT * FROM nadador;

SELECT n.nome as NomeNadador,
t.nome as NomeTreinador,
e.nome as NomeExperiente
FROM treinador as t
JOIN treinador as e
ON t.fkExperiente = e.idTreinador
JOIN nadador as n
ON n.fkTreinador = t.idTreinador;

SELECT * FROM nadador RIGHT JOIN treinador
	ON idTreinador = fkTreinador;
    
SELECT * FROM nadador LEFT JOIN treinador
	ON idTreinador = fkTreinador;