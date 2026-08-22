CREATE DATABASE associacao_kart DEFAULT CHARACTER SET utf8mb4;
USE associacao_kart;

CREATE TABLE temporada(

id INT PRIMARY KEY AUTO_INCREMENT,
numero INT CHECK (numero >= 1)

);

CREATE TABLE patrocinio(

id INT PRIMARY KEY AUTO_INCREMENT,
patrocinador VARCHAR(100) NOT NULL

);

CREATE TABLE etapa(

id INT PRIMARY KEY AUTO_INCREMENT,
localidade TEXT NOT NULL,
agenda DATE NOT NULL,
agenda_horario TIME NOT NULL,
-- chave primária para temporada
id_temporada INT NOT NULL,
FOREIGN KEY (id_temporada) REFERENCES temporada(id)

);

CREATE TABLE equipe(

id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(25) NOT NULL,

-- chave primária para patrocinio que não precisa ser obrigatoriamente preenchida
id_patrocinio INT,
FOREIGN KEY (id_patrocinio) REFERENCES patrocinio(id)

);

CREATE TABLE piloto(

id INT PRIMARY KEY AUTO_INCREMENT,
-- chave primária para equipe
id_equipe INT NOT NULL,
FOREIGN KEY (id_equipe) REFERENCES equipe(id),

nome VARCHAR(100) NOT NULL,
peso DECIMAL(6, 2) NOT NULL,
capitao BOOLEAN NOT NULL,
nacionalidade VARCHAR(50) NOT NULL

);

CREATE TABLE etapa_tem_piloto(
/* ligacao n:n entre etapa e piloto */

id_etapa INT NOT NULL,
id_piloto INT NOT NULL,

PRIMARY KEY (id_etapa, id_piloto),

FOREIGN KEY (id_etapa) REFERENCES etapa(id),
FOREIGN KEY (id_piloto) REFERENCES piloto(id)

);

SHOW TABLES;

DESC equipe;
DESC etapa;
DESC etapa_tem_piloto;
DESC patrocinio;
DESC piloto;
DESC temporada;   
