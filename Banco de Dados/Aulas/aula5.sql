-- Aula 5 - modelagem de dados
-- existem 3 tipos de relacionamento
	-- 1:1 
    -- 1:n onde a chave estrangeira vai aonde está o n
    -- n:n 

CREATE DATABASE luanSantana;
USE luanSantana;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
)auto_increment = 1000;

INSERT INTO empresa VALUES
	(null, 'C6Bank', 'Andresa'),
    (null, 'Safra', 'Rafael');
    
SELECT * FROM empresa;

CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
bairro varchar(45),
fkEmpresa int,
constraint fkEmp foreign key (fkEmpresa)
	references empresa(idEmpresa)
);

INSERT INTO aluno VALUES
	('01232999', 'Luan Santana', 'Alphaville', 1000),
    ('01232998', 'Amanda', 'Alphaville', 1000),
    ('01232997', 'Luca', 'Campo Limpo', 1001);
    
SELECT * FROM aluno;

-- EXIBIR OS ALUNOS E SUA RESPECTIVA EMPRESA
SELECT * FROM empresa JOIN aluno
	ON fkEmpresa = idEmpresa;
    
-- todo JOIN tem ON
-- o ON é o nome na aliança
-- senão, eu namoro todos que tem aliança sem nome
-- EXIBIR APENAS O CAMPO NOME DO ALUNO E O NOME DA EMPRESA
SELECT aluno.nome,
	empresa.nome
    FROM empresa JOIN aluno
    ON idEmpresa = fkEmpresa;
    
SELECT aluno.nome AS NomeAluno,
	empresa.nome AS 'Nome Empresa'
    FROM empresa JOIN aluno
    ON idEmpresa = fkEmpresa;
    
SELECT a.nome AS NomeAluno,
	e.nome AS 'Nome Empresa'
    FROM empresa AS e JOIN aluno AS a
    ON idEmpresa = fkEmpresa;
    
SELECT a.nome AS NomeAluno,
	e.nome AS 'Nome Empresa'
    FROM empresa AS e JOIN aluno AS a
    ON idEmpresa = fkEmpresa
    WHERE e.nome = 'C6Bank';
    
-- ALTER TABLE aluno ADD constraint fkEmp
-- foreign key (fkEmpresa) references empresa(idEmpresa);






