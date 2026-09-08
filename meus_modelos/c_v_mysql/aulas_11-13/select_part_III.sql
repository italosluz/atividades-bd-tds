USE cadastro;

-- Aqui não importa quantos cursos tem cada carga horária
SELECT DISTINCT
    carga_horaria
FROM
    cursos
ORDER BY carga_horaria;

/* AGRUPANDO REGISTROS */

-- Agora, caso importe saber o valor, temos que agrupar

SELECT 
    carga_horaria
FROM
    cursos
GROUP BY carga_horaria;

/* AGRUPANDO & AGREGANDO */


-- O COUNT() conta quantos registros ocorreram, se estão agrupados, conta quantos registros estão agrupados.
SELECT 
    carga_horaria, COUNT(nome) AS 'quantidade'
FROM
    cursos
GROUP BY carga_horaria
ORDER BY carga_horaria;

SELECT 
    carga_horaria, COUNT(*)
FROM
    cursos
WHERE
    carga_horaria > 40
GROUP BY carga_horaria
ORDER BY COUNT(*) DESC;

-- Com o having, pode-se selecionar quem será agrupado pelo comando select
-- Também com o AS eu posso renomear algo e usá-lo ao meu bel prazer
SELECT 
    carga_horaria, COUNT(*) AS quantidade
FROM
    cursos
GROUP BY carga_horaria
HAVING quantidade >= 4 ORDER BY quantidade DESC;

SELECT 
    ano, COUNT(*) AS quant
FROM
    cursos
GROUP BY ano
HAVING quant >= 4
ORDER BY quant DESC;

SELECT AVG(carga_horaria) FROM cursos;

-- Eu posso misturar e combinar um select em outro, nesse contexto agrupará somente quem tem o valor de carga horária acima da média
SELECT 
    carga_horaria, COUNT(*) AS quant
FROM
    cursos
WHERE
    ano > 2024
GROUP BY carga_horaria
HAVING carga_horaria > (SELECT 
        AVG(carga_horaria)
    FROM
        cursos)
ORDER BY quant DESC;

