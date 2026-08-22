/* CRIANDO A BASE DE DADOS E TABELAS */

CREATE DATABASE IF NOT EXISTS cadastro;
USE cadastro;

CREATE TABLE estudantes(

id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
profissao VARCHAR(60),
data_nascimento DATE,
-- Permite ao usuário escolher o gênero
sexo ENUM("M", "F", "Outro", "Prefiro não responder"),
-- Terá 5 caracteres númericos e desses 5, após a vírgulos dois serão decimais
peso DECIMAL(5, 2),
altura DECIMAL(3, 2),
nacionalidade VARCHAR(60)

);

CREATE TABLE cursos(

id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(60),
descricao VARCHAR(120),
carga_horaria INT UNSIGNED CHECK (carga_horaria > 0),
total_aulas INT UNSIGNED CHECK (total_aulas > 0),
ano INT UNSIGNED CHECK (ano >= 2020 AND ano <= 2026)

);
