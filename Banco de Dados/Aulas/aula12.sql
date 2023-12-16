-- AULA 12
-- CORREÇÃO EXERCÍCIO CLIENTE X VENDA X PRODUTO

CREATE DATABASE revendedor;
USE revendedor;

CREATE TABLE cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
fkIndicador int, -- recursividade
constraint fkAutoRelacionamento foreign key (fkIndicador)
	references cliente(idCliente));
    
INSERT INTO cliente VALUES
	(null, 'Cassio', 'cassio@gmail.com', null),
	(null, 'Endrick', 'endrick@gmail.com', null),
	(null, 'Gabigol', 'gabigol@gmail.com', 2),
	(null, 'Marta', 'marta@gmail.com', 3),
	(null, 'Formiga', 'formiga@gmail.com', 4);
    
SELECT * FROM cliente;

SELECT cliente.nome AS indicado,
indicador.nome AS indicador
FROM cliente JOIN cliente as indicador
ON cliente.fkIndicador = indicador.idCliente;

INSERT INTO cliente VALUES
	(null, 'Pedro', null, 3);
    
CREATE TABLE venda (
idVenda int,
fkCliente int,
primary key (idVenda, fkCliente),
dtVenda date,
totalVenda decimal(10,2),
tipoVenda varchar(45), 
constraint chkTipoVenda check (tipoVenda in ('Digital', 'Física')),
constraint fkCliente foreign key (fkCliente)
	references cliente(idCliente));
    
-- excluir uma constraint
-- ALTER TABLE venda DROP CONSTRAINT chkTipoVenda;

describe venda;

INSERT INTO venda VALUES
	(1, 1, '2023-11-08', 200.10, 'Digital'),
	(1, 2, '2023-11-08', 300.10, 'Física'),
	(1, 3, '2023-11-08', 499.90, 'Física');
    
SELECT * FROM venda;

SELECT * FROM cliente JOIN venda
	ON idCliente = fkCliente;
    
SELECT * FROM cliente LEFT JOIN venda
	ON idCliente = fkCliente
    WHERE idVenda is null;
    
CREATE TABLE produto (
idProduto int primary key auto_increment,
nome varchar(45),
preco decimal(5,2),
validade date) auto_increment = 100;

INSERT INTO produto VALUES
	(null, 'Gol Endrick', 99.99, '2024-11-08'),
	(null, 'Gol Gabigol', 199.99, '2023-11-08'),
	(null, 'Gol Pedro', 299.99, '2023-11-08');
    
SELECT * FROM produto;

CREATE TABLE carrinho (
fkVenda int,
fkVendaCliente int,
fkProduto int,
primary key (fkVenda, fkVendaCliente, fkProduto),
desconto double,
qtdProduto int,
constraint fkVenda foreign key (fkVenda)
	references venda(idVenda),
constraint fkVendaCliente foreign key (fkVendaCliente)
	references venda(fkCliente),
constraint fkProduto foreign key (fkProduto)
	references produto(idProduto));
    
INSERT INTO carrinho VALUES
	(1,1,100, null, 1),
	(1,1,101, null, 2);
    
SELECT * FROM carrinho;

SELECT cliente.nome as Cliente,
venda.idVenda,
carrinho.qtdProduto,
produto.preco
FROM cliente JOIN venda
ON idCliente = fkCliente
JOIN carrinho
ON fkCliente = fkVendaCliente and idVenda = fkVenda
JOIN produto
ON idProduto = fkProduto;

-- FUNÇÕES MATEMÁTICAS
SELECT max(preco) from produto;
SELECT min(preco) from produto;
SELECT sum(preco) from produto;
SELECT avg(preco) from produto;
SELECT truncate(avg(preco),2) from produto;
SELECT round(avg(preco),2) from produto;
SELECT round(avg(preco),2) from produto JOIN carrinho
	on idProduto = fkProduto
    JOIN venda 
    ON idVenda = fkVenda and fkCliente = fkVendaCliente
    JOIN cliente
    ON idCliente = fkCliente
	WHERE cliente.nome = 'Cassio';

SELECT preco * qtdProduto from produto JOIN carrinho
	ON idProduto = fkProduto;
    
SELECT count(idProduto) FROM produto
	where preco > (select avg(preco) from produto);
    
SELECT nome, preco FROM produto
	WHERE preco = (select max(preco) from produto);
    
SELECT validade,count(idProduto) FROM produto
	GROUP BY validade;