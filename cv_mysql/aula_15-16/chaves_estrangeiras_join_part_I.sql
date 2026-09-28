USE cadastro;

DESCRIBE estudantes;

/*

A - Atomicidade
C - Consistência
I - Isolamento
D - Durabilidade

*/

-- Adiciona a coluna
ALTER TABLE estudantes ADD COLUMN curso_preferido INT;
-- Adiciona a coluna (agora) como chave primária (MUL, chave múltipla)
ALTER TABLE estudantes ADD FOREIGN KEY (curso_preferido) REFERENCES cursos(id);

SELECT * FROM estudantes;
SELECT * FROM cursos;

-- Atualiza o dado de uma linha da coluna curso preferido onde o id do aluno for 60
UPDATE estudantes 
SET 
    curso_preferido = '30'
WHERE
    id = '60';

-- Dará erro por conta da integridade referencial, pois já existe a relação entre um estudante e o curso que seria deletado.
DELETE FROM cursos WHERE id = '30';
-- Consegui apagar sem problemas. Não pode-se modificar um campo se ele for afetar a transação (ACID) pois geraria inconsistência.
DELETE FROM cursos WHERE id = '29';

