-- Aula 3
-- DDL: comandos que definem a estrutura da tabela
	-- ALTER TABLE: ADD COLUMN, DROP COLUMN, 
			-- MODIFY COLUMN, RENAME COLUMN
    -- CREATE TABLE
    -- DESCRIBE
    -- TRUNCATE TABLE
    -- DROP TABLE

-- DML: comandos que manipulam os dados
	-- UPDATE
    -- INSERT
    -- DELETE
	-- SELECT

-- CRIAR O BANCO DE DADOS
CREATE DATABASE sprint1;

USE sprint1;

DROP TABLE revista;    

-- CRIAR A TABELA REVISTA
CREATE TABLE revista (
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30));

-- INSERIR DADOS SEM A CATEGORIA
INSERT INTO revista VALUES
	(null, 'Capricho', ''), -- valor branco
    (null, 'Veja', null); -- valor é nulo
    
INSERT INTO revista (nome) VALUES
	('Quatro Rodas'),
    ('Recreio');
    
SELECT * FROM revista;

UPDATE revista SET categoria = 'Infanto-juvenil'
	WHERE idRevista = 1;
    
-- REALIZAR UMA ATUALIZAÇÃO DA MESMA CATEGORIA EM MAIS DE UM REGISTRO
UPDATE revista SET categoria = 'Diversos'
	WHERE idRevista = 2 OR idRevista = 3;
UPDATE revista SET categoria = 'Notícias'
	WHERE idRevista IN (2,3);

SELECT * FROM revista;

UPDATE revista SET categoria = 'Infantil'
	WHERE idRevista = 4;
    
-- diferente de ...
SELECT * FROM revista WHERE idRevista <> 4;
SELECT * FROM revista WHERE idRevista != 4;

SELECT * FROM revista;

-- criar uma coluna chamada preço
-- tipagem de números
-- inteiros INT
-- DECIMAIS
	-- FLOAT 7 DÍGITOS 12345,67
    -- DOUBLE 15 DÍGITOS 
    -- DECIMAL() 32 DÍGITOS
		-- DECIMAL(5,2) 123,45
        -- DECIMAL(7,4) 123,4567
        -- DECIMAL (6,3) 987,654
        
-- ADICIONAR A COLUNA PREÇO
ALTER TABLE revista ADD COLUMN preco FLOAT;

SELECT * FROM revista;

UPDATE revista SET preco = 1.99
	WHERE idRevista IN (2,4);
    
UPDATE revista SET preco = 21.978
	WHERE idRevista = 3;
    
-- alterar o auto-increment
ALTER TABLE revista auto_increment = 200;

INSERT INTO revista (nome) VALUES
	('Mad');
    
SELECT * FROM revista;

DELETE FROM revista WHERE idRevista = 200;

INSERT INTO revista (nome) VALUES
	('Sptech');
    
-- truncate
-- limpa os dados da tabela
TRUNCATE TABLE revista;

SELECT * FROM revista;

INSERT INTO revista (nome) VALUES
	('Dance');