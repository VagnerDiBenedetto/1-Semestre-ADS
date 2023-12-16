-- criar usuário empresario
create user 'empresario'@'localhost' 
	identified by 'basquete';

-- permissões do usuário
-- permitir apenas select
grant SELECT on sptechc.* 
	to 'empresario'@'localhost';
    
/*grant SELECT, UPDATE, DELETE, INSERT on sptechc.* 
	to 'empresario'@'localhost';*/

flush privileges;

-- retirar as permissões
revoke SELECT on sptechc.* 
	from 'empresario'@'localhost';
    
flush privileges;

-- permitir todos os comandos
grant ALL PRIVILEGES on sptechc.* 
	to 'empresario'@'localhost';
    
-- confirmar as permissões
flush privileges;

-- excluir o usuário
-- drop user 'empresario'@'localhost';