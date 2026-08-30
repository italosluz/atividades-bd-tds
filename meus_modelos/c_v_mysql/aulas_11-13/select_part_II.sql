USE cadastro;

SELECT * FROM cursos;

-- Selecionará todos os cursos que o nome seja igual a 'Docker'
SELECT * FROM cursos WHERE nome = 'Docker';

/* WILDCARDS */

-- Exibirá todos os cursos que o nome começa com a letra P, % substitui vários caracteres ou nenhum caractere
SELECT * FROM cursos WHERE nome LIKE 'P%';

-- Exibirá todos os cursos que terminam com a letra A
SELECT * FROM cursos WHERE nome LIKE '%A';

-- Selecionará todos os cursos que contenham a letra A
SELECT * FROM cursos WHERE nome LIKE '%A%';

-- Selecionará todos os cursos que não contenham a letra A
SELECT * FROM cursos WHERE nome NOT LIKE '%A%';

UPDATE cursos SET nome = "Á ga tê eme êle e CSS" WHERE id = 4;

-- Selecionará todos as instâncias que contenham dados no nome
SELECT * FROM cursos WHERE nome LIKE '%dados%';

-- Selecionará todas as instâncias que comecem com programação e termina no final com a letra A
SELECT * FROM cursos WHERE nome LIKE 'Programa%o%_a';

-- O _ obriga que tenha um caractere, já o % pode conter ou não um caractere
SELECT * FROM cursos WHERE nome LIKE 'De__%';

SELECT * FROM estudantes;

SELECT * FROM estudantes WHERE nome LIKE 'Silv%';

/* DISTINGUINDO */

SELECT DISTINCT carga_horaria FROM cursos ORDER BY carga_horaria;

-- Mostra as nacionalidades, mesmo as repetidas
SELECT nacionalidade FROM estudantes;

-- Mostra as nacionalidades, não contendo as repetições
SELECT DISTINCT nacionalidade FROM estudantes;
SELECT DISTINCT nacionalidade FROM estudantes ORDER BY nacionalidade;

/* FUNÇÕES DE AGREGAÇÃO */

-- Mostrará o total de cursos
SELECT COUNT(nome) FROM cursos;

-- Mostrará a quantidade de cursos acima de 40 horas
SELECT COUNT(*) FROM cursos WHERE carga_horaria > 40;

-- Mostrará a maior carga horária
SELECT MAX(carga_horaria) FROM cursos;

-- Exibirá o curso com maior carga horária
SELECT * FROM cursos ORDER BY carga_horaria DESC LIMIT 1;

-- O outro SELECT precisa estar entre parenteses p/ que o banco de dados entenda que precisa executar primeiro como um valor único (subquery escalar)
SELECT * FROM cursos WHERE carga_horaria = (SELECT MAX(carga_horaria) from cursos);

-- Selecionará todos os cursos de 2025 com os máximos de aula
SELECT * FROM cursos WHERE ano = '2025' AND total_aulas = (SELECT MAX(total_aulas) FROM cursos WHERE ano = '2025');

SELECT * FROM cursos WHERE ano = '2026' AND total_aulas = (SELECT MIN(total_aulas) FROM cursos WHERE ano = '2026');

-- Somará o total de aulas
SELECT SUM(total_aulas) FROM cursos WHERE ano = '2026';

-- Calculará a média de aulas
SELECT AVG(total_aulas) FROM cursos WHERE ano = '2026';

-- Retornará o curso que estiveer entre a média com uma folga de 5 horas
SELECT *
FROM cursos
WHERE ano = '2026'
    AND total_aulas BETWEEN
        (SELECT AVG(total_aulas) FROM cursos WHERE ano = '2026') - 10
        AND
        (SELECT AVG(total_aulas) FROM cursos WHERE ano = '2026') + 10;
        
SELECT * FROM cursos WHERE ano = '2026' AND total_aulas = '40';

