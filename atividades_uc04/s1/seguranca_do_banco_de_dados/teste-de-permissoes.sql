-- Logado como usuário teste
USE cadastro;

SELECT 
    *
FROM
    cursos;
    
-- Inserindo uma linha na tabela
INSERT INTO cursos (nome, descricao, carga_horaria, total_aulas, ano) VALUES ('Javascript orientado a objetos', 'Curso gratuito de JavaScript', 40, 4, 2026);
-- Deletando uma linha na tabela
DELETE FROM cursos WHERE cursos.nome = 'Javascript orientado a objetos';
-- Deletando uma tabela (dará erro de permissões)
DROP TABLE cursos;