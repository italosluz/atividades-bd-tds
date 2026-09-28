USE pre_vest;

-- Atualizando o telefone e residência da aluna Julia
UPDATE usuario 
SET telefone = '11999990000', residencia = 'Bairro Universitário, 150' 
WHERE nome = 'Julia Discente';

-- Melhorando o título do primeiro tema
UPDATE tema_redacao 
SET titulo = 'A evolução da inteligência artificial e seus impactos no trabalho' 
WHERE id = 1;

-- Corrigindo a referência de um texto
UPDATE texto_motivador 
SET referencia = 'IBGE, Dados Atualizados 2023' 
WHERE id_tema = 1 AND ordem = 2;

-- Corrigindo o texto de uma redação enviada
UPDATE redacao 
SET conteudo_texto = 'A revolução tecnológica atual, impulsionada pela IA...' 
WHERE id = 1;

-- Cancelando um simulado que estava em andamento
UPDATE simulado 
SET status_simulado = 'cancelado' 
WHERE id = 2;

-- Adicionando a sigla do órgão responsável
UPDATE provedor 
SET nome = 'ENEM (MEC/INEP)' 
WHERE nome = 'ENEM';

-- Aumentando a dificuldade de uma questão
UPDATE questao 
SET dificuldade = 4 
WHERE id = 1;

-- Adicionando a unidade de medida numa alternativa matemática
UPDATE alternativa 
SET conteudo = '12 cm' 
WHERE id_questao = 2 AND conteudo = '12';

-- Expandindo a descrição da matéria
UPDATE conteudo 
SET descricao = 'Estudo de figuras planas, espaciais e cálculo de áreas.' 
WHERE id = 2;

-- Alterando a matéria vinculada a uma questão (de Biologia para Literatura)
UPDATE questao_conteudo 
SET id_conteudo = 1 
WHERE id_questao = 3;

-- Ajustando o título do material
UPDATE material_apoio 
SET titulo = 'Vídeo Completo: Romantismo' 
WHERE id = 1;

-- Marcando uma questão como desconsiderada/anulada em um simulado
UPDATE simulado_questao 
SET desconsiderado = TRUE 
WHERE id_simulado = 1 AND id_questao = 2;