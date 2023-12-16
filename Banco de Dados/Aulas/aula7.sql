USE sptechc;

SHOW TABLES;

CREATE TABLE franquia (
idFranquia int primary key auto_increment,
nome varchar(45),
regiao varchar(45));

INSERT INTO franquia VALUES
	(null, 'Dallas', 'Oeste'),
	(null, 'Chicago', 'Leste');
    
SELECT * FROM franquia;

CREATE TABLE jogador (
idJogador int primary key auto_increment,
nome varchar(45),
posicao varchar(45),
fkFranquia int,
constraint fkFranquiaJogador foreign key (fkFranquia)
	references franquia(idFranquia)
) auto_increment = 1000;

INSERT INTO jogador VALUES
	(null, 'John', 'PF', 1),
	(null, 'Ken', 'SF', 1),
	(null, 'Barbie', 'C', 2),
	(null, 'Bob', 'PG', null);
    
SELECT * FROM jogador;

SELECT * FROM jogador JOIN franquia
	ON idFranquia = fkFranquia;
    
SELECT jogador.nome as JogadorNome,
franquia.nome as FranquiaNome
FROM jogador JOIN franquia
ON jogador.fkFranquia = franquia.idFranquia;

SELECT * FROM jogador LEFT JOIN franquia
	ON idFranquia = fkFranquia
    WHERE fkFranquia is null;

INSERT INTO jogador VALUES
	(NULL, 'Suzy', 'C', NULL);