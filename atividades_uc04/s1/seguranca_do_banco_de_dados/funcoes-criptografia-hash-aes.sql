CREATE DATABASE cripto_ex;
USE cripto_ex;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(25),
    senha TEXT
)  DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

-- Assim a senha fica amostra, não possui nenhum tipo de criptografia
INSERT INTO usuario (nome, senha) VALUE ('Usuário I', 'SenacEaD_2026');

-- Senha criptografada com hash MD5 (32 caracteres)
INSERT INTO usuario (nome, senha) VALUE ('Usuário II', md5('SenacEaD_2026'));

-- Senha criptografada com hash SHA (SHA1)
INSERT INTO usuario (nome, senha) VALUE ('Usuário III', sha('SenacEaD_2026'));
INSERT INTO usuario (nome, senha) VALUE ('Usuário IV', sha1('SenacEaD_2026'));

-- Senha criptografada com SHA2 256 (opções: 224, 256, 384, 512)
INSERT INTO usuario (nome, senha) VALUE ('Usuário V', sha2('SenacEaD_2026', 256));

-- Senha criptografada com AES (falha)
INSERT INTO usuario (nome, senha) VALUE ('Usuário VI', aes_encrypt('SenacEaD_2026', 'chave-privada'));
-- adicionando uma coluna compatível com tipo de dado
ALTER TABLE usuario ADD senha_aes VARBINARY(100);
-- adicionando senha na coluna compatível
INSERT INTO usuario (nome, senha_aes) VALUE ('Usuário VI', aes_encrypt('SenacEaD_2026', 'chave-privada'));
-- descriptografando a senha AES (falha)
SELECT nome, aes_decrypt(senha_aes, 'chave-privada') FROM usuario WHERE senha_aes IS NOT NULL;
-- precisa-se converter o valor em caracteres e usar o CAST
SELECT nome, CAST(aes_decrypt(senha_aes, 'chave-privada') AS CHAR(225)) FROM usuario WHERE senha_aes IS NOT NULL;

SELECT * FROM usuario;
