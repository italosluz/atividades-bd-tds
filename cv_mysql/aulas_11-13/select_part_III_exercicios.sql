/* EXERCÍCIOS DE SELECT (PART. III) DO CURSO EM VÍDEO */

-- Uma lista com as profissões e seus respectivos quantitativos

SELECT 
    profissao, COUNT(*) AS quantidade
FROM
    estudantes
GROUP BY profissao
ORDER BY quantidade DESC;

-- Quantos homens e quantas mulheres nasceram após 1/jan/2003

SELECT 
    sexo, COUNT(*) AS quantidade
FROM
    estudantes
WHERE
    data_nascimento > '2003-01-01'
GROUP BY sexo
ORDER BY quantidade DESC;

-- Uma lista de pessoas que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. Só nos interessam os países que tiveram mais de 3 pessoas com essas nacionalidade

SELECT 
    nacionalidade, COUNT(*) AS quantidade
FROM
    estudantes
WHERE
    nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING quantidade > 3;

-- Uma lista agrupada pela altura das pessoas, mostrando quantas pessoas pesam mais de 80 kg e que estão acima da média de altura de todos os cadastrados

SELECT 
    AVG(altura)
FROM
    estudantes;

SELECT 
    altura, COUNT(*) AS quantidade
FROM
    estudantes
WHERE
    peso > 80
GROUP BY altura
HAVING altura > (SELECT 
        AVG(altura)
    FROM
        estudantes)
ORDER BY quantidade DESC;

