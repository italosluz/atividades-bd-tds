-- Criando um usuário
CREATE USER 'italo'@'localhost' IDENTIFIED BY 'qwerty';

-- Excluindo um usuário
DROP USER 'italo'@'localhost';

-- Recupera todos os usuários cadastrados no banco de dados MySQL
SELECT * FROM mysql.user;
SELECT 
    `Host`, `User`
FROM
    mysql.user;

-- Criando um usuário e definido permissões específicas
CREATE USER 'teste'@'localhost' IDENTIFIED BY '';

-- permitindo a manipulação de dados
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'teste'@'localhost';

-- permitindo a manipulação de tabelas
GRANT CREATE, ALTER, DROP ON *.* TO 'teste'@'localhost';

-- recarrega as config de privilégios
FLUSH PRIVILEGES;

-- Mostra os privilégios do usuário
SHOW GRANTS;

-- especificando o usuário
SHOW GRANTS FOR 'teste'@'localhost';

-- Revogando os privilégios específicos do usuário
REVOKE CREATE, ALTER, DROP ON *.* FROM 'teste'@'localhost';

-- Revogando os privilégios do usuário
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'teste'@'localhost';

-- recarregando
FLUSH PRIVILEGES;

/* ROLES (Papéis, conjuntos de privilégios) */

-- Três papéis, um dev, um p/ leitura e outro p/ escrita
CREATE ROLE 'app_dev', 'app_read', 'app_write', 'app_disable';

-- banco de dados app_db fictício
GRANT ALL ON *.* TO 'app_dev';
GRANT SELECT ON app_db.* TO 'app_read';
GRANT INSERT, UPDATE, DELETE ON app_db.* TO 'app_write';

-- também há como revogar todas as permissões
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'app_disable';

-- Com os conjuntos de privilégios definidos, podemos criar os usuários 
CREATE USER 'usuario_dev'@'localhost';
CREATE USER 'usuario_read'@'localhost';
CREATE USER 'usuario_write'@'localhost';
-- e definir seus papéis
GRANT 'app_dev' TO 'usuario_dev'@'localhost';
GRANT 'app_read' TO 'usuario_dev'@'localhost';
-- permissões de leitura e gravação
GRANT 'app_write', 'app_read' TO 'usuario_write'@'localhost';

-- Excluindo um conjunto de privilégios (ROLE)
DROP ROLE 'app_dev', 'app_read', 'app_write'; -- Revogará todas as permissões concedidadas a contas que tinham essa permissão

SHOW GRANTS FOR 'usuario_dev'@'localhost';

