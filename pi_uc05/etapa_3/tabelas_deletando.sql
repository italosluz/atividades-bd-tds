USE pre_vest;

-- Apagando a resposta da questão 2 do simulado 1
DELETE FROM simulado_questao 
WHERE id_simulado = 1 AND id_questao = 2;

-- Apagando o artigo de Geometria
DELETE FROM material_apoio 
WHERE id = 2;

-- Desvinculando a Questão 1 do Conteúdo 1
DELETE FROM questao_conteudo 
WHERE id_questao = 1 AND id_conteudo = 1;

-- Excluindo uma alternativa errada específica
DELETE FROM alternativa 
WHERE id_questao = 1 AND conteudo = 'Foco no subconsciente humano.';

-- Apagando a redação em imagem enviada pelo Lucas
DELETE FROM redacao 
WHERE id = 2;

-- Apagando o gráfico motivador do tema 1
DELETE FROM texto_motivador 
WHERE id_tema = 1 AND ordem = 2;

-- Para apagar o Tema 2, precisamos apagar seus textos motivadores antes
DELETE FROM texto_motivador WHERE id_tema = 2;
DELETE FROM tema_redacao WHERE id = 2;

-- Para apagar o Simulado 2, apagamos suas questões respondidas antes
DELETE FROM simulado_questao WHERE id_simulado = 2;
DELETE FROM simulado WHERE id = 2;

-- Para apagar a Questão 3, excluímos suas alternativas antes e seus filhos
DELETE FROM alternativa WHERE id_questao = 3;
DELETE FROM questao_conteudo WHERE id_questao = 3;
DELETE FROM simulado_questao WHERE id_questao = 3;
DELETE FROM questao WHERE id = 3;

-- Como já retiramos a Questão 3 (que era de Biologia), podemos excluir o conteúdo Biologia
DELETE FROM conteudo 
WHERE id = 3;

-- A UNICAMP não possui questões cadastradas no nosso script, então a exclusão é direta
DELETE FROM provedor 
WHERE nome = 'UNICAMP';

-- Diretor não criou temas nem questões, então podemos excluí-lo diretamente
DELETE FROM usuario 
WHERE id = 1 AND categoria = 'diretor';