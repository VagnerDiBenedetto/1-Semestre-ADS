/* Criar um banco de dados AlunoProjeto no MySQL, selecionar esse
banco de dados e executar as instruções relacionadas a seguir.
*/ 
CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

-- - Criar as tabelas equivalentes à modelagem. 
CREATE TABLE projeto (
idProjeto INT PRIMARY KEY AUTO_INCREMENT,
nomeProjeto VARCHAR(45),
descProjeto VARCHAR(45)
);

CREATE TABLE aluno (
ra VARCHAR(20) PRIMARY KEY,
nome VARCHAR(45), -- + sobrenome = atributo composto
sobrenome VARCHAR(45),
tel_cel CHAR(14), -- telefone + tel_fixo + tel_contato = atributo multivalorado
tel_fixo CHAR(13),
tel_contato CHAR(14),
alunoRepresentante VARCHAR(20),
CONSTRAINT fkRecursivaAluno FOREIGN KEY (alunoRepresentante)
	REFERENCES aluno (ra),
fkProjeto INT,
CONSTRAINT fkPro FOREIGN KEY (fkProjeto)
	REFERENCES projeto (idProjeto)
);

CREATE TABLE acompanhante (
idAcompanhante INT AUTO_INCREMENT,
nome VARCHAR(45), -- + sobrenome = atributo composto
sobrenome VARCHAR(45),
tipoRelacao VARCHAR(45),
fkAluno VARCHAR(20),
CONSTRAINT constAluno FOREIGN KEY (fkAluno) 
	REFERENCES aluno(ra),
CONSTRAINT pkAlunoAcompanhante PRIMARY KEY(idAcompanhante,fkAluno)
)AUTO_INCREMENT = 100;

desc aluno;

-- Inserir dados nas tabelas.
INSERT INTO projeto VALUES 
	( NULL , 'QualiTyBeef' , 'Sistema de Monitoramento de carne'),
	( NULL , 'Latech' , 'Sistema de Monitoramento de leite');
    
    
INSERT INTO aluno (ra, nome, sobrenome, alunoRepresentante, fkProjeto) VALUES
	('0123' , 'Evilin' , 'Santos' , NULL , 1),
	('0124' , 'Tomas' , 'Gomes' , '0123' , 2),
	('0125' , 'Vinicius' , 'Souza' , NULL , 2),
	('0126' , 'Messi' , 'Pereira' , '0124' , 2);

INSERT INTO acompanhante (nome, sobrenome, tipoRelacao, fkAluno) VALUES
	('Larissa' , 'Santos' , 'Mãe' , '0123'),
    ('Julio' , 'Tomas' , 'Pai', '0125'),
    ('Tuilio' , 'Pereira' , 'Tio' , '0126');
    
-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM projeto;
SELECT * FROM aluno;
SELECT * FROM acompanhante;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da
-- criação.
/*
ALTER TABLE aluno ADD COLUMN alunoRepresentante VARCHAR(20),
ADD CONSTRAINT fkRecursivaAluno FOREIGN KEY (alunoRepresentante)
	REFERENCES aluno (ra);
ALTER TABLE aluno ADD COLUMN fkProjeto INT,
ADD CONSTRAINT fkPro FOREIGN KEY (fkProjeto)
	REFERENCES projeto (idProjeto); 
    
ALTER TABLE acompanhante ADD COLUMN fkAluno VARCHAR(20),
ADD CONSTRAINT constAluno FOREIGN KEY (fkAluno) 
	REFERENCES aluno(ra),
ADD CONSTRAINT pkAlunoAcompanhante PRIMARY KEY(fkAluno); */

-- Exibir os dados dos alunos e dos projetos correspondentes.
SELECT * FROM aluno JOIN projeto
	ON idProjeto = fkProjeto;
    
-- Exibir os dados dos alunos e dos seus acompanhantes.
SELECT * FROM aluno JOIN acompanhante 
	ON fkAluno = ra;

-- Exibir os dados dos alunos e dos seus representantes.
SELECT * FROM aluno JOIN aluno AS representante
	ON representante.ra = aluno.alunoRepresentante;

/* Exibir os dados dos alunos e dos projetos correspondentes, mas somente
de um determinado projeto (indicar o nome do projeto na consulta). */ 
SELECT * FROM aluno JOIN projeto
	ON idProjeto = fkProjeto 
		WHERE nomeProjeto = 'Latech';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus
-- acompanhantes.
SELECT * FROM aluno JOIN projeto 
	ON idProjeto = fkProjeto 
		JOIN acompanhante
			ON ra = fkAluno;
----------------------------------------------------------------------------------------------------
-- a) Criar um banco de dados chamado Campanha.
CREATE DATABASE Campanha;

-- b) Selecionar esse banco de dados.
USE Campanha;

-- c) Criar as tabelas correspondentes à sua modelagem.
CREATE TABLE organizador(
idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45), -- + sobrenome = atributo composto
sobrenome VARCHAR(45),
rua VARCHAR(45), -- + bairro = atributo composto
bairro VARCHAR(45),
email VARCHAR(45),
organizador_orientador INT,
CONSTRAINT fkorientador_orientador FOREIGN KEY (organizador_orientador) 
REFERENCES organizador(idOrganizador)
)AUTO_INCREMENT = 30;


CREATE TABLE campanha (
idCampanha INT PRIMARY KEY AUTO_INCREMENT,
categoria_doacao VARCHAR(45),
instituicao1 VARCHAR(45), -- + instituicao2 = multivalorado
instituicao2 VARCHAR(45),
dataFinal DATE,
fkOrganizador INT,
CONSTRAINT fkCampanhaOrganizar FOREIGN KEY (fkOrganizador)
REFERENCES organizador(idOrganizador) 
)AUTO_INCREMENT = 500;

/* d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para
algum organizador, e mais de um organizador novato sendo orientado por algum
organizador mais experiente. */ 

INSERT INTO organizador (nome, sobrenome, bairro, organizador_orientador)VALUES 
	('Alessandro' , 'Pereira' , 'Santa Rita' , NULL),
	('Tulio' , 'Santos' , 'Cristal' , NULL),
	('Julia' , 'Gomes' , 'Vila Heliópolis' , NULL),
	('Pedro' , 'Souza' , 'Novo Buritizal' , 31),
	('Karen' , 'Silva' , 'Terra Azul' , 30),
	('Lucas' , 'Sousa' , 'Teresina' , 32),
	('Jorge' , 'Freitas' , 'Paulista' , 30);
    
   
INSERT INTO campanha (categoria_doacao, instituicao1, fkOrganizador) VALUES
	('Higiene' , 'Cruz Vermelha' , 30 ),
	('Alimento' , 'Luz do Amanhã' , 32),
	('Higiene Pessoal' , 'Cruz Vermelha' , 30),
	('Roupas' , 'Cruz Vermelha' , 33),
	('Higiene Pessoal' , 'Luz do Amanhã' , 32 ),
	('Calçados' , 'Luz do Amanhã' , 31);
    

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM organizador;
SELECT * FROM campanha;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da
-- criação das tabelas.

/* ALTER TABLE organizador ADD COLUMN organizador_orientador INT,
ADD CONSTRAINT fkorientador_orientador FOREIGN KEY (organizador_orientador) 
REFERENCES organizador(idOrganizador);

ALTER TABLE campanha ADD COLUMN fkOrganizador INT,
ADD CONSTRAINT fkorientador FOREIGN KEY (fkOrganizador)
REFERENCES organizador(idOrganizador) ; */

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT * FROM organizador JOIN campanha
	ON idOrganizador = fkOrganizador;
    
-- h) Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas.
SELECT * FROM organizador JOIN campanha
	ON idOrganizador = fkOrganizador
		WHERE nome = 'Alessandro';
	
-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos
-- organizadores orientadores.
SELECT * 
FROM organizador JOIN organizador AS organizador_orienta 
	ON organizador_orienta.idOrganizador = organizador.organizador_orientador;
    
/*j) Exibir os dados dos organizadores novatos e os dados dos respectivos
organizadores orientadores, porém somente de um determinado organizador
orientador (informar o nome do organizador orientador na consulta).
*/
SELECT organizador.nome AS NomeOrganizador,
organizador.bairro AS BairroOrganizador,
organizador.idOrganizador,
orientador.nome AS NomeOrientador,
orientador.bairro AS BairroOrientador
FROM organizador JOIN organizador AS Orientador
ON  Orientador.idOrganizador = organizador.organizador_orientador
	 WHERE organizador.nome  = 'Pedro';
     
SELECT novato.nome AS NomeOrganizador,
novato.bairro AS BairroOrganizador,
novato.idOrganizador,
experiente.nome AS NomeOrientador,
experiente.bairro AS BairroOrientador
FROM organizador as novato JOIN organizador AS experiente
ON  experiente.idOrganizador = novato.organizador_orientador
	 WHERE organizador.nome  = 'Pedro';

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas
-- campanhas organizadas e os dados dos respectivos organizadores orientadores.
SELECT novato.nome as Novato,
experiente.nome as Experiente
FROM organizador AS novato JOIN campanha
	ON novato.idOrganizador = campanha.fkOrganizador
    JOIN organizador AS experiente
    ON novato.organizador_orientador = experiente.idOrganizador;

SELECT novato.nome as Novato,
experiente.nome as Experiente
FROM organizador AS novato JOIN campanha
	ON novato.idOrganizador = campanha.fkOrganizador
    JOIN organizador AS experiente
    ON novato.organizador_orientador = experiente.idOrganizador
    WHERE experiente.nome = 'Tulio';