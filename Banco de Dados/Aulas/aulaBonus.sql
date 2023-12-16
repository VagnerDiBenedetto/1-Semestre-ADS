-- AULA BÔNUS
CREATE DATABASE ads1;
USE ads1;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date);

INSERT INTO pessoa VALUES
	(null, 'Fernando', '2000-01-11'),
	(null, 'Ferdinando', '2001-03-13'),
	(null, 'Felipe', '2002-02-14');

SELECT * FROM pessoa;
    
CREATE TABLE login (
idLogin int,
fkPessoa int,
primary key (idLogin, fkPessoa),
foreign key (fkPessoa) references pessoa(idPessoa),
username varchar(45) UNIQUE NOT NULL,
senha varchar(200) NOT NULL);

INSERT INTO login VALUES
	(1000,1,'fefe', sha2('fe@123', 256));
    
SELECT * FROM login;

-- FUNCTION (minha primeira função validando se o login e senha estão corretos)
DELIMITER $  
 CREATE FUNCTION fun_valida_usuario
	(p_username VARCHAR(45), p_senha VARCHAR(200) ) 
RETURNS INT(1)  
DETERMINISTIC
 BEGIN  
 DECLARE l_ret INT(1) DEFAULT 0;  
     SET l_ret = IFNULL((SELECT DISTINCT 1 FROM login WHERE username = p_username  
                       AND senha = SHA2(p_senha,256)),0);                           
 RETURN l_ret;  
 END$  
 DELIMITER ;  
 
  SELECT fun_valida_usuario('fefe','1234') as Validou;
  SELECT fun_valida_usuario('fefe','fe@123') as Validou;
  
  -- para ficar bonito...
  SELECT CASE 
	WHEN fun_valida_usuario('fefe','1234') = 1 
    THEN 'Login realizado com sucesso'
    ELSE 'Login ou senha incorreta' END Validação;
    
  SELECT CASE 
	WHEN fun_valida_usuario('fefe','fe@123') = 1 
    THEN 'Login realizado com sucesso'
    ELSE 'Login ou senha incorreta' END Validação;