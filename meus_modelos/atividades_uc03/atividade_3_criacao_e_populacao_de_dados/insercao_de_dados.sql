USE PlataformaJogos;

-- Selecione todos os usuários cadastrados após 01 de março de 2023;
SELECT * FROM Usuario WHERE data_cadastro > "2023-03-01";

-- Selecione todos os jogos com preço superior a 100.00;
SELECT * FROM Jogo WHERE preco > 100;

-- Encontre todas as desenvolvedoras que foram fundadas depois do ano 2000;
SELECT * FROM Desenvolvedora WHERE ano_fundacao > 2000;

-- Liste todos os jogos da desenvolvedora "Valve Corporation";
SELECT Desenvolvedora.nome, Jogo.titulo FROM Desenvolvedora 
    INNER JOIN Jogo ON Jogo.id_desenvolvedora = Desenvolvedora.id
    WHERE Desenvolvedora.nome = "Valve Corporation";

-- Calcule o preço médio dos jogos na plataforma;
SELECT AVG(preco) FROM Jogo;

-- Calcule o preço total dos jogos comprados pelo usuário "Carlos Silva";
SELECT AVG(Jogo.preco) AS "total_preco" from Usuario 
    INNER JOIN Biblioteca ON Biblioteca.id_usuario = Usuario.id
    INNER JOIN Jogo ON Biblioteca.id_jogo = Jogo.id
    WHERE Usuario.nome = "Carlos Silva";
    
-- Encontre o jogo mais caro da desenvolvedora "Rockstar Games";
SELECT Jogo.titulo, Jogo.preco, Desenvolvedora.nome
FROM Jogo
INNER JOIN Desenvolvedora
    ON Jogo.id_desenvolvedora = Desenvolvedora.id
WHERE Desenvolvedora.nome = 'Rockstar Games'
ORDER BY Jogo.preco DESC
LIMIT 1;

-- Liste todos os jogos na categoria "RPG";
SELECT Jogo.titulo, Categoria.nome FROM JogoCategoria
    INNER JOIN Jogo ON JogoCategoria.id_jogo = Jogo.id
    INNER JOIN Categoria ON JogoCategoria.id_categoria = Categoria.id
    WHERE Categoria.nome = "RPG";
    
-- Liste todos os usuários e os jogos que eles possuem na biblioteca;;
SELECT Usuario.nome, Jogo.titulo FROM Biblioteca
    INNER JOIN Usuario ON Biblioteca.id_usuario = Usuario.id
    INNER Join Jogo ON Biblioteca.id_jogo = Jogo.id;

-- Encontre o número total de jogos na plataforma desenvolvidos por estúdios dos EUA.
SELECT COUNT(*) AS "total_jogos_eua" FROM Jogo
    INNER JOIN Desenvolvedora ON Jogo.id_desenvolvedora = Desenvolvedora.id WHERE Desenvolvedora.pais = "EUA";
