USE PlataformaJogos;

-- Selecione todos os usuários cadastrados após 01 de março de 2023;
SELECT * FROM Usuario WHERE data_cadastro > "2023-03-01";

-- Selecione todos os jogos com preço superior a 100.00;
SELECT * FROM Jogo WHERE preco > 100;

-- Encontre todas as desenvolvedoras que foram fundadas depois do ano 2000;
SELECT * FROM Desenvolvedora WHERE ano_fundacao > 2000;

-- Liste todos os jogos da desenvolvedora "Valve Corporation";


-- Calcule o preço médio dos jogos na plataforma;
SELECT AVG(preco) FROM Jogo;

-- Calcule o preço total dos jogos comprados pelo usuário "Carlos Silva";

