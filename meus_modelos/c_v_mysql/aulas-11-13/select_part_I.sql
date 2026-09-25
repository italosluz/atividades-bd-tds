SELECT * FROM estudantes;
SELECT * FROM cursos;

/* SELECIONANDO COLUNAS */

-- Ordena pelo ano, DESC inverte, ou seja, de baixo p/ cima
SELECT * FROM cursos ORDER BY ano DESC;
/* 
exibe apenas as colenas selecionadas
primeiro ordena por ano de forma 
ascendente e depois ordena por nome em
ordem alfabética
*/
SELECT ano, nome, carga_horaria FROM cursos ORDER BY ano DESC, nome;

/* SELECIONANDO LINHAS */

-- Onde o valor da coluna ano for 2026, ordenará por nome
SELECT * FROM cursos WHERE ano = '2026' ORDER BY nome;

-- Posso filtrar a coluna sem aparecer no RESULTSET
SELECT nome, descricao FROM cursos WHERE ano <= '2025' ORDER BY ano DESC, nome;

/* SELECIONANDO INTERVALOS */
-- Intervalo do total de aulas entre 20 a 30
SELECT * FROM cursos WHERE total_aulas BETWEEN '20' AND '30' ORDER BY nome;

/* SELECIONAND VALORES */
-- Se o valor corresponde aos valores dentro dos parenteses IN
SELECT id, nome, ano  FROM cursos WHERE ano IN (2024, 2026) ORDER BY nome;

/* COMBINANDO TESTES */
-- AND, OR, NOT
SELECT * FROM cursos WHERE carga_horaria > 35 AND ano = 2026 ORDER BY nome;
