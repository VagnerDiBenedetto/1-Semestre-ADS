-- Correção do exercício Treinador x Nadador

-- Bora lá

CREATE DATABASE natacao;

USE natacao;

CREATE TABLE treinador (
idTreinador int primary key auto_increment,
nome varchar(45), -- + sobrenome = atributo composto
sobrenome varchar(45),
telCel char(14), -- + telComercial = atributo multivalorado
telComercial char(15),
fkOrientador int,
constraint fkRecursiva foreign key (fkOrientador)
	references treinador(idTreinador)
);

-- Cadastrar um Treinador Orientador = fk is null
INSERT INTO treinador VALUES
	(null, 'Azul', 'Marinho','(11)98765-1234', null, null);
    
SELECT * FROM treinador;

-- Cadastrar os treinadores orientados pelo Treinador 1
INSERT INTO treinador VALUES
	(null, 'Rosa', 'Pink', null, null, 1),
	(null, 'Preto', 'Fosco', null, '(48)3369-5566', 1);
    
SELECT * FROM treinador JOIN treinador as orientador
	ON orientador.idTreinador = treinador.fkOrientador;
-- A pergunta do dia é: quem tem a fk????????

CREATE TABLE nadador (
idNadador int auto_increment,
nome varchar(45),
dtNasc DATE,
fkTreinador int,
constraint fkNadadorTreinador foreign key (fkTreinador)
	references treinador(idTreinador),
constraint pkComposta primary key (idNadador, fkTreinador)
) auto_increment = 100;

INSERT INTO nadador VALUES 
	(null, 'Batman','1934-01-01', 1),
	(null, 'SpiderMan','1956-01-01', 2),
	(null, 'Mulher Maravilha','1933-01-01', 3);
    
SELECT * FROM nadador;

SELECT nadador.nome as NomeNadador,
treinador.nome as NomeTreinador,
orientador.nome as NomeOrientador
FROM nadador JOIN treinador
	ON nadador.fkTreinador = treinador.idTreinador
    JOIN treinador as orientador
    ON treinador.fkOrientador = orientador.idTreinador;
 
-- Exemplo dado na lousa - recursividade ou auto_relacionamento
CREATE TABLE aluno (
idAluno int primary key auto_increment,
nome varchar(45),
fkMonitor int,
constraint fkAlunoMonitor foreign key (fkMonitor)
	references aluno(idAluno)
);

-- Cadastrando o monitor
INSERT INTO aluno VALUES
	(null, 'Ben 10', null);
    
INSERT INTO aluno VALUES
	(null, 'Ben SuperShock', 1),
	(null, 'Ben NãoShock', 1),
	(null, 'Ben HiperShock', 2);
    
SELECT * FROM aluno;

SELECT * FROM aluno JOIN aluno as monitor
	on aluno.fkMonitor = monitor.idAluno;
