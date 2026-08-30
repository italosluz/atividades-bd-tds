USE cadastro;

-- Lista com todas os estudantes que se identicam com o sexo feminino
SELECT * FROM estudantes WHERE sexo = 'F';

-- Lista com todos os estudantes que nasceram entre 1/jan/2000 e 31/dez/2016
SELECT * 
FROM estudantes 
WHERE data_nascimento BETWEEN 
    '2000/01/01' 
    AND 
    '2016/12/31' 
        ORDER BY data_nascimento;

-- Lista dos estudantes do sexo masculino e que trabalham com TI
SELECT * FROM estudantes 
WHERE sexo = 'm' 
    AND (
        profissao LIKE '%Programa%' 
    OR  profissao LIKE '%Desen%'
    OR  profissao LIKE '%Computa%')
    ORDER BY profissao;
    
-- Lista das mulheres que nasceram no Brasil e que iniciam o nome com a letra J
SELECT * FROM estudantes
WHERE sexo = 'F'
    AND nacionalidade = "Brasil"
    AND nome LIKE "J%";

-- Uma lista com nome e nacionalidade dos homens que tem 'silva' no nome, não nasceram no Brasil e pesam menos que 100 kg

SELECT * FROM estudantes
WHERE sexo = 'm'
    AND(
        nome LIKE '% silva'
    OR  nome LIKE '% silva %')
        AND nacionalidade != 'Brasil'
        AND peso < '100';

-- Maior altura entre os estudantes homens que moram no Brasil
SELECT MAX(altura) FROM estudantes
WHERE sexo = 'm'
AND   nacionalidade = 'Brasil';

-- Média de peso dos estudantes cadastrados
SELECT AVG(peso) FROM estudantes;

-- Menor peso entre as mulheres que nasceram entre 1/jan/1990  e 31/dez/2000 e fora do Brasil
SELECT MIN(peso) FROM estudantes
WHERE sexo = 'f'
AND
   (data_nascimento BETWEEN
        '1990-01-10'
        AND
        '2000-12-31')
AND
    nacionalidade != 'Brasil';

-- Quantidade de mulheres que possuem mais de 1.70
SELECT COUNT(*) FROM estudantes 
WHERE sexo = 'f'
AND   altura >= '1.70';
