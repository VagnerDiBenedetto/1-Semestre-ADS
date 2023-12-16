-- Aula 2
-- Se não existir o banco de dados
-- CREATE DATABASE nomeBD;

-- Já existe o banco de dados?
-- Sim
-- Então utilize o bd
USE bd1adsc;

-- VARCHAR (CARACTER QUE VARIA) NOME
-- CHAR (ELE NÃO VARIA) RA

CREATE TABLE aluno (
ra char(8) primary key,
nome VARCHAR(50),
bairro VARCHAR(50));

DESCRIBE aluno;

INSERT INTO aluno VALUES 
	('01232999', 'Vivian Silva', 'Sacomã'),
    ('01232998', 'Murilo', 'Paraíso'),
    ('01232997', 'Marcelo', 'Consolação');
    
SELECT * FROM aluno;

-- COMANDOS DDL - DEFINIÇÃO DA ESTRUTURA DA TABELA
-- CREATE TABLE
-- ALTER TABLE 
	-- ADICIONAR COLUNA 
    -- EXCLUIR UMA COLUNA
    -- MODIFICAR UMA COLUNA
    -- RENOMEAR UMA COLUNA

-- ADICIONAR UMA COLUNA
ALTER TABLE aluno ADD COLUMN email VARCHAR(100);

DESCRIBE aluno;

SELECT * FROM aluno;

-- atualizar o dado
-- update
UPDATE aluno SET email = 'marcelo@sptech.school'
	WHERE ra = '01232997';
    
-- voltando aos comandos ddl
-- EXCLUIR UMA COLUNA
ALTER TABLE aluno DROP COLUMN email;

DESCRIBE aluno;

-- modificar uma coluna
ALTER TABLE aluno MODIFY COLUMN nome varchar(75);

-- renomear uma coluna
ALTER TABLE aluno RENAME COLUMN nome TO nomeCompleto;

-- EXCLUIR UMA TABELA
-- DROP TABLE nomeTabela;

SELECT * FROM aluno;
-- brincar com os selects
-- EXIBIR OS NOMES QUE COMEÇAM COM M
SELECT nomeCompleto FROM aluno 
	WHERE nomeCompleto LIKE 'M%';
    
-- EXIBIR OS NOMES QUE TERMINAM COM O
SELECT * FROM aluno
	WHERE nomeCompleto LIKE '%O';
    
-- EXIBIR OS NOMES QUE CONTEM A
SELECT * FROM aluno
	WHERE nomeCompleto LIKE '%A%';
    
-- EXIBIR O SOBRENOME QUE COMEÇA COM S
SELECT * FROM aluno
	WHERE nomeCompleto LIKE '% S%';
    
-- EXIBIR O NOME ONDE A TERCEIRA LETRA É R
SELECT * FROM aluno
	WHERE nomeCompleto LIKE '__R%';
    
-- EXIBIR O NOME ONDE A PENULTIMA LETRA É L
SELECT * FROM aluno
	WHERE nomeCompleto LIKE '%L_';
    
SELECT * FROM aluno;

-- ordenar decrescente pelo bairro
SELECT * FROM aluno ORDER BY bairro DESC;

INSERT INTO aluno VALUES
	('01232996', 'Pedro', 'Centro');
    
SELECT * FROM aluno ORDER BY nomeCompleto;
SELECT * FROM aluno ORDER BY nomeCompleto DESC;

-- EXCLUIR UMA LINHA/TUPLA
-- NÃO EXISTE UPDATE NEM DELETE SEM WHERE
DELETE FROM aluno WHERE ra = '01232999';
SELECT * FROM aluno;