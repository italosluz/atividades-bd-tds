USE cadastro;

SELECT * from estudantes;

SELECT 
    nome, curso_preferido
FROM
    estudantes;

SELECT 
    nome, ano
FROM
    cursos;

-- Juntando a tabela estudantes com a tabela cursos,
-- mas só juntou de forma bruta, fazendo com que cada
-- linha da tabela estudantes ficasse com os todos os cursos

SELECT 
    estudantes.nome,
    estudantes.curso_preferido,
    cursos.nome,
    cursos.ano
FROM
    estudantes
        JOIN
    cursos;

-- Eu tenho que usar o ON para dar sentido ao JOIN, pois
-- será onde o id de uma tabela se relacionará com a chave
-- primária de outra tabela

SELECT 
    e.nome, c.nome, c.ano
FROM
    estudantes AS e
        JOIN
    cursos AS c ON c.id = curso_preferido;

-- O inner join ou simplesmente JOIN considera apenas as ligações
-- tem-se também o outer join que considera as tabelas nulas de
-- ligações, de fora, podendo ser preferenciais tanto da esquerda
-- quando da diretita (as tabelas)

SELECT 
    e.nome, c.nome, c.ano
FROM
    estudantes AS e
        LEFT JOIN -- Deu preferência a tabela estudantes, mostrando todos os estudantes, até os sem curso
    cursos AS c ON c.id = curso_preferido;

-- O uso de OUTER é facultativo

SELECT 
    e.nome, c.nome, c.ano
FROM
    estudantes AS e
        RIGHT OUTER JOIN -- Deu preferência a tabela cursos, mostrando todos os cursos, até os sem estudantes
    cursos AS c ON c.id = curso_preferido;

