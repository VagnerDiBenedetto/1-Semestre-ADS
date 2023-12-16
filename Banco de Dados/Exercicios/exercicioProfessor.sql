USE sptechc;
SHOW TABLES;

-- AULA 4
CREATE TABLE professor (
id int primary key auto_increment,
nome varchar(50) NOT NULL, 
cpf char(11) UNIQUE, -- ÚNICO.
email varchar(40) DEFAULT 'Sem e-mail',
dtAtual DATETIME default current_timestamp
);

DESCRIBE professor;

INSERT INTO professor (nome) VALUES
	('Frizza'),
    ('Vivian'),
    ('Marise');
    
SELECT * FROM professor;

ALTER TABLE professor ADD COLUMN funcao varchar(40);

ALTER TABLE professor ADD constraint chkFuncao
	CHECK (funcao IN ('Monitor', 'Titular'));
    
SELECT * FROM professor;

UPDATE professor SET email = 'vivian@sptech',
	funcao = 'Titular' 
		WHERE id = 2;
        
SELECT funcao FROM professor
	WHERE nome = 'Vivian';
    
-- apelidos - apelidar um campo - ALIAS
SELECT funcao AS Função FROM professor;

SELECT nome, funcao AS 'Função marota'
	FROM professor
		WHERE nome = 'Vivian';
        
SELECT nome AS nomeCompleto, funcao AS 'Função marota'
	FROM professor
		WHERE nome = 'Vivian';
        
SELECT nome, funcao FROM professor;

-- concatenar CONCAT()
SELECT concat(nome, funcao) FROM professor;
SELECT concat(nome,' ', funcao) FROM professor;
SELECT concat('O nome do professor é ',
	nome,' ', funcao) FROM professor;
    
SELECT concat('O nome do professor é ',
	nome,' ', 'e sua função é ', funcao) AS FRASE 
		FROM professor;