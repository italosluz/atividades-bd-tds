USE pre_vest;

CREATE TABLE usuario (
    id 				INT AUTO_INCREMENT NOT NULL,
    nome 			VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    residencia 		VARCHAR(255) NOT NULL,
    telefone 		VARCHAR(11) UNIQUE NOT NULL,
    email 			VARCHAR(255) UNIQUE NOT NULL,
    rg 				VARCHAR(11) UNIQUE NOT NULL,
    cpf 			VARCHAR(11) UNIQUE NOT NULL,
    genero 			ENUM('masculino', 'feminino', 'outro', 'prefiro não dizer') DEFAULT 'prefiro não dizer',
    genero_desc 	VARCHAR(255),
    categoria 		ENUM('discente', 'docente', 'diretor') DEFAULT 'discente',
    senha 			VARCHAR(255) NOT NULL,
    criado_em 		DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- Definindo chave primária
    PRIMARY KEY (id),
    -- O id + categoria devem ser único, nunca repetidos
    CONSTRAINT UQ_UsuarioCategoria UNIQUE (id, categoria)
)  DEFAULT CHARSET=UTF8MB4;

CREATE TABLE tema_redacao (
    id 					INT AUTO_INCREMENT NOT NULL,
    id_usuario 			INT NOT NULL,
    -- Irá trazer da outra tabela a categoria do usuário
    categoria_usuario 	ENUM('discente', 'docente', 'diretor') NOT NULL,
    titulo 				VARCHAR(100) NOT NULL,
    criado_em 			DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- Definindo chave primária
    PRIMARY KEY (id),
    -- Definindo chave estrangeira
    CONSTRAINT FK_UsuarioTemaRedacao FOREIGN KEY (id_usuario , categoria_usuario)
        REFERENCES usuario (id , categoria),
	-- Verificando se o usuário é um docente
    CONSTRAINT CHCK_UsuarioEDocenteTemaRedacao CHECK (categoria_usuario = 'docente')
)  DEFAULT CHARSET=UTF8MB4;

CREATE TABLE texto_motivador (
    id 			INT AUTO_INCREMENT NOT NULL,
    id_tema 	INT NOT NULL,
    ordem 		INT NOT NULL,
    conteudo 	TEXT NOT NULL,
    referencia 	VARCHAR(255) NOT NULL,
    -- Definindo chave primária
    PRIMARY KEY (id),
    -- Definindo chave estrangeira
    CONSTRAINT FK_TemaTextoMotivador FOREIGN KEY (id_tema)
        REFERENCES tema_redacao (id),
	-- Verificando se a ordem (como aparecerá na página) é de 1 a 5
    CONSTRAINT CHCK_ordem CHECK (ordem >= 1 AND ordem <= 5)
)  DEFAULT CHARSET=UTF8MB4;

CREATE TABLE redacao (
id 					INT AUTO_INCREMENT NOT NULL,
id_tema 			INT NOT NULL,
id_usuario 			INT NOT NULL,
categoria_usuario 	ENUM('discente', 'docente', 'diretor') NOT NULL,
tipo_envio 			ENUM('imagem', 'texto') DEFAULT 'texto',
conteudo_texto 		TEXT,
url_imagem 			VARCHAR(255),
enviado_em 			DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Definindo chave primária
PRIMARY KEY (id),
-- Definindo a chave estrangeira referente ao tema
CONSTRAINT FK_TemaRedacao FOREIGN KEY (id_tema) 
	REFERENCES tema_redacao(id),
-- Definindo a chave estrangeira referente ao discente responsável pela redação
CONSTRAINT FK_UsuarioRedacao FOREIGN KEY(id_usuario, categoria_usuario)
	REFERENCES usuario(id, categoria),
-- Verificando se ele é um aluno mesmo
CONSTRAINT CHCK_EDiscenteRedacao CHECK (categoria_usuario = 'discente')
);

CREATE TABLE simulado (
id 						INT AUTO_INCREMENT NOT NULL,
id_usuario 				INT NOT NULL,
categoria_usuario 		ENUM('discente', 'docente', 'diretor') NOT NULL,
quantidade_questoes 	INT NOT NULL,
tempo_pretendido_min	INT DEFAULT 60,
status_simulado			ENUM('em andamento', 'concluido', 'cancelado', 'não iniciado') DEFAULT 'não iniciado',
inciado_em 				DATETIME DEFAULT CURRENT_TIMESTAMP,
finalizado_em 			DATETIME,
-- Definindo chave primária
PRIMARY KEY (id),
-- Definindo chave estrangeira
CONSTRAINT FK_UsuarioSimulado FOREIGN KEY (id_usuario, categoria_usuario) 
	REFERENCES usuario(id, categoria),
-- Verificando se o usuário é um discente
CONSTRAINT CHCK_UsuarioEDiscenteSimulado CHECK (categoria_usuario = 'discente')
);

CREATE TABLE provedor (
id 		INT AUTO_INCREMENT NOT NULL,
nome 	VARCHAR(255) NOT NULL,
-- Definindo chave primária
PRIMARY KEY (id)
);

CREATE TABLE questao (
id 					INT AUTO_INCREMENT NOT NULL,
id_provedor 		INT NOT NULL,
id_usuario 			INT NOT NULL,
categoria_usuario 	ENUM('discente', 'docente', 'diretor') NOT NULL,
ano 				YEAR NOT NULL,
dificuldade 		INT NOT NULL,
enunciado 			TEXT NOT NULL,
texto_apoio 		TEXT,
criado_em 			DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Definindo chave primária
PRIMARY KEY (id),
-- Definindo chave estrangeira referente ao provedor
CONSTRAINT FK_ProvedorQuestao FOREIGN KEY (id_provedor)
	REFERENCES provedor(id),
-- Definindo chave estrangeira referente ao docente cadastrador
CONSTRAINT FK_UsuarioQuestao FOREIGN KEY (id_usuario, categoria_usuario)
	REFERENCES usuario(id, categoria),
-- Verificando se o usuário é um docente
CONSTRAINT CHCK_EDocenteQuestao CHECK (categoria_usuario = 'docente')
);

CREATE TABLE alternativa (
id 			INT AUTO_INCREMENT NOT NULL,
id_questao 	INT NOT NULL,
conteudo 	VARCHAR(500) NOT NULL,
correta 	BOOLEAN DEFAULT FALSE,
-- Definindo chave primária
PRIMARY KEY (id),
-- Definindo chave estrangeira referente a questão
CONSTRAINT FK_QuestaoAlternativa FOREIGN KEY (id_questao)
	REFERENCES questao(id)
);

CREATE TABLE conteudo (
id 			INT AUTO_INCREMENT NOT NULL,
nome 		VARCHAR(255) NOT NULL,
descricao 	TEXT,
-- Definindo chave primária
PRIMARY KEY (id)
);

CREATE TABLE questao_conteudo (
id_questao 	INT NOT NULL,
id_conteudo INT NOT NULL,
-- Fazendo com que as chaves estrangeiras também sejam primárias
PRIMARY KEY (id_questao, id_conteudo),
-- Definindo a chave estrangeira, ligação n:n
CONSTRAINT FK_QuestaoConteudoNN FOREIGN KEY (id_questao)
	REFERENCES questao(id),
CONSTRAINT FK_ConteudoQuestaoNN FOREIGN KEY (id_conteudo)
	REFERENCES conteudo(id)
);

CREATE TABLE material_apoio (
id 			INT AUTO_INCREMENT NOT NULL,
id_questao 	INT NOT NULL,
titulo 		VARCHAR(150) NOT NULL,
url 		VARCHAR(255) NOT NULL,
tipo 		ENUM('artigo', 'vídeo', 'materia') DEFAULT 'artigo',
-- Definindo chave primária
PRIMARY KEY (id),
-- Definindo chave estrangeira referente a questão
CONSTRAINT FK_QuestaoMaterialApoio FOREIGN KEY (id_questao)
	REFERENCES questao(id)
);

CREATE TABLE simulado_questao (
id 				INT AUTO_INCREMENT NOT NULL,
id_simulado 	INT NOT NULL,
id_questao 		INT NOT NULL,
desconsiderado 	BOOLEAN NOT NULL,
acerto 			BOOLEAN NOT NULL,
-- Definindo chave primária
PRIMARY KEY (id),
-- Definindo chave estrangeira referente ao simulado
CONSTRAINT FK_SimuladoSimuladoQuestaoNN FOREIGN KEY (id_simulado)
	REFERENCES simulado(id),
-- Definindo chave estrangeira referente as questões
CONSTRAINT FK_QuestaoSimuladoQuestaoNN FOREIGN KEY (id_questao)
	REFERENCES questao(id)
);

