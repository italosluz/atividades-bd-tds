USE InvestimentosDB;

-- Criando usuários
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'qwerty';
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'asdfgh';

SELECT `Host`, `User` FROM mysql.user;

-- Criando papéis (conjunto de permissões)
CREATE ROLE 'user_crud', 'user_viewer';

-- Atribuindo as permissões de crud ao usuário crud
GRANT INSERT, SELECT, UPDATE, DELETE ON InvestimentosDB.* TO 'user_crud'; 
-- Atribuindo a permissão de ler, ao usuário de consulta
GRANT SELECT ON InvestimentosDB.* TO 'user_viewer';

-- Removendo todos os privilégio desses usuários (garantia)
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario1'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario2'@'localhost';

-- Atribuindo os devidos papéis aos usuários
GRANT 'user_crud' TO 'usuario1'@'localhost';
GRANT 'user_viewer' TO 'usuario2'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'usuario1'@'localhost';

SELECT * FROM mysql.user;
