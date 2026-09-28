USE cadastro;

-- Criando o relacionamento n:n (todos para todos)
CREATE TABLE estudante_assiste_curso (
    id INT NOT NULL AUTO_INCREMENT,
    data_assistido DATE,
    id_estudante INT,
    id_curso INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_estudante)
        REFERENCES estudantes (id),
    FOREIGN KEY (id_curso)
        REFERENCES cursos (id)
)  DEFAULT CHARSET=UTF8MB4;

-- Populando a tabela criada do relacionamento n:n
INSERT INTO estudante_assiste_curso 
	VALUES 
(DEFAULT, '2024-03-01', '1', '2'),
(DEFAULT, '2025-01-01', '3', '5');

SELECT 
    *
FROM
    estudante_assiste_curso;

/* JUNÇÕES */

-- Forma simplificada de dizer 'AS', só colocar o apelido depois do nome
-- Esse SELECT junta estudantes a estudante_assiste_curso, onde o id do
-- estudante da tablea estudantes for igual na outra tabela, constará aqui
SELECT 
    e.nome, a.id_curso
FROM
    estudantes e
        JOIN
    estudante_assiste_curso a ON e.id = a.id_estudante
ORDER BY e.nome;

-- Dois JOIN em um mesmo comando
SELECT 
    e.id, e.nome, a.data_assistido, c.nome, c.ano
FROM
    estudantes e
        JOIN
    estudante_assiste_curso a ON e.id = a.id_estudante
        JOIN
    cursos c ON c.id = a.id_curso
ORDER BY e.nome;

-- É a mesma coisa caso começarmos com a tabela todos para todos

SELECT e.id, e.nome, a.data_assistido, c.nome, c.ano
	FROM 
		estudante_assiste_curso a 
    JOIN
		estudantes e ON a.id_estudante = e.id 
    JOIN 
		cursos c ON a.id_curso = c.id;


