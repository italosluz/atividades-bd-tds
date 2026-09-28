USE pre_vest;

-- Seleciona todos os usuários cadastrados
SELECT * FROM usuario;

-- Seleciona apenas os alunos (discentes) que nasceram a partir dos anos 2000
SELECT nome, email, data_nascimento 
FROM usuario 
WHERE categoria = 'discente' AND data_nascimento >= '2000-01-01';

-- Seleciona todos os temas de redação
SELECT * FROM tema_redacao;

-- Seleciona os temas criados por um professor específico (Ex: Ana Docente, id = 2)
SELECT usuario.nome, tema_redacao.titulo, tema_redacao.criado_em 
FROM tema_redacao
JOIN usuario ON id_usuario = usuario.id
WHERE usuario.nome = 'Ana Docente';

-- Seleciona todos os textos motivadores
SELECT * FROM texto_motivador;

-- Seleciona os textos motivadores do tema 1, ordenados por como devem aparecer (ordem)
SELECT ordem, conteudo, referencia 
FROM texto_motivador 
WHERE id_tema = 1 
ORDER BY ordem ASC;

-- Seleciona todas as redações enviadas
SELECT * FROM redacao;

-- Seleciona apenas as redações que foram enviadas no formato de texto (digitadas na plataforma)
SELECT id_usuario, conteudo_texto, enviado_em 
FROM redacao 
WHERE tipo_envio = 'texto';

-- Seleciona todos os simulados
SELECT * FROM simulado;

-- Seleciona os simulados que já foram concluídos
SELECT id_usuario, quantidade_questoes, status_simulado 
FROM simulado 
WHERE status_simulado = 'concluido';

-- Seleciona todos os provedores (bancas/vestibulares)
SELECT * FROM provedor;

-- Seleciona o provedor com um nome específico
SELECT * FROM provedor 
WHERE nome = 'ENEM';

-- Seleciona todas as questões cadastradas
SELECT * FROM questao;

-- Seleciona questões de nível de dificuldade alto (maior ou igual a 3) do ano de 2022 em diante
SELECT enunciado, dificuldade, ano 
FROM questao 
WHERE dificuldade >= 3 AND ano >= 2022;

-- Seleciona todas as alternativas de todas as questões
SELECT * FROM alternativa;

-- Seleciona apenas o gabarito (as alternativas corretas) da questão de ID 1
SELECT conteudo, correta 
FROM alternativa 
WHERE id_questao = 1 AND correta = TRUE;

-- Seleciona todas as matérias/assuntos
SELECT * FROM conteudo;

-- Seleciona conteúdos cujo nome contenha a palavra "Biologia"
SELECT * FROM conteudo 
WHERE nome LIKE '%Biologia%';

-- Seleciona as ligações entre as questões e as matérias (tabela intermediária N:N)
SELECT * FROM questao_conteudo;

-- Seleciona quais conteúdos (assuntos) estão vinculados à questão de ID 2
SELECT * FROM questao_conteudo AS qc
JOIN questao AS q ON qc.id_questao = q.id
JOIN conteudo AS c ON qc.id_conteudo = c.id
WHERE qc.id_questao = 2;

-- Seleciona todos os materiais de apoio
SELECT * FROM material_apoio;

-- Seleciona apenas os materiais de apoio que são em formato de vídeo
SELECT titulo, url 
FROM material_apoio 
WHERE tipo = 'vídeo';

-- Seleciona todas as respostas dadas nos simulados
SELECT * FROM simulado_questao;

-- Seleciona apenas as questões que o aluno acertou no simulado de ID 1
SELECT id_questao, acerto 
FROM simulado_questao 
WHERE id_simulado = 1 AND acerto = TRUE;