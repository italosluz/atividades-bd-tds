USE pre_vest;

-- 1. Povoando Usuários (Diretor, Docentes e Discentes)
INSERT INTO usuario (id, nome, data_nascimento, residencia, telefone, email, rg, cpf, genero, categoria, senha) VALUES 
(1, 'Carlos Diretor', '1980-05-15', 'Rua Central, 100', '11988887777', 'carlos.diretor@email.com', '11111111111', '11111111111', 'masculino', 'diretor', 'senha123'),
(2, 'Ana Docente', '1990-08-22', 'Av Paulista, 200', '11977776666', 'ana.prof@email.com', '22222222222', '22222222222', 'feminino', 'docente', 'senha123'),
(3, 'Marcos Docente', '1985-03-10', 'Rua das Flores, 45', '11966665555', 'marcos.prof@email.com', '33333333333', '33333333333', 'masculino', 'docente', 'senha123'),
(4, 'Julia Discente', '2005-11-30', 'Bairro Universitário, 10', '11955554444', 'julia.aluna@email.com', '44444444444', '44444444444', 'feminino', 'discente', 'senha123'),
(5, 'Lucas Discente', '2006-02-14', 'Vila Nova, 33', '11944443333', 'lucas.aluno@email.com', '55555555555', '55555555555', 'masculino', 'discente', 'senha123');

-- 2. Povoando Temas de Redação (Criado apenas por docentes)
INSERT INTO tema_redacao (id, id_usuario, categoria_usuario, titulo) VALUES 
(1, 2, 'docente', 'Os impactos da inteligência artificial no mercado de trabalho'),
(2, 3, 'docente', 'A importância da preservação dos biomas brasileiros');

-- 3. Povoando Textos Motivadores (Ordem de 1 a 5)
INSERT INTO texto_motivador (id_tema, ordem, conteudo, referencia) VALUES 
(1, 1, 'Segundo especialistas, a IA substituirá tarefas repetitivas, mas criará novas demandas...', 'Revista Tecnologia Hoje, 2023'),
(1, 2, 'Gráfico mostrando o crescimento de vagas no setor de tecnologia.', 'IBGE, 2022'),
(2, 1, 'O desmatamento na Amazônia e no Cerrado afeta diretamente o regime de chuvas...', 'Ministério do Meio Ambiente');

-- 4. Povoando Redações (Enviadas apenas por discentes)
INSERT INTO redacao (id, id_tema, id_usuario, categoria_usuario, tipo_envio, conteudo_texto, url_imagem) VALUES 
(1, 1, 4, 'discente', 'texto', 'A revolução tecnológica atual, liderada pela inteligência artificial, traz desafios e oportunidades...', NULL),
(2, 2, 5, 'discente', 'imagem', NULL, 'https://storage.exemplo.com/redacoes/aluno5_tema2.jpg');

-- 5. Povoando Simulados (Realizados por discentes)
INSERT INTO simulado (id, id_usuario, categoria_usuario, quantidade_questoes, tempo_pretendido_min, status_simulado) VALUES 
(1, 4, 'discente', 90, 240, 'concluido'),
(2, 5, 'discente', 45, 120, 'em andamento');

-- 6. Povoando Provedores de Questões
INSERT INTO provedor (id, nome) VALUES 
(1, 'ENEM'),
(2, 'FUVEST'),
(3, 'UNICAMP');

-- 7. Povoando Questões (Cadastradas por docentes)
INSERT INTO questao (id, id_provedor, id_usuario, categoria_usuario, ano, dificuldade, enunciado, texto_apoio) VALUES 
(1, 1, 2, 'docente', 2022, 3, 'Qual a principal característica do Romantismo no Brasil?', 'Leia o poema "Canção do Exílio" de Gonçalves Dias para responder.'),
(2, 2, 3, 'docente', 2023, 5, 'Calcule a área do triângulo retângulo com catetos 3 e 4.', NULL),
(3, 1, 2, 'docente', 2021, 2, 'A respeito da fotossíntese, é correto afirmar que:', 'A fotossíntese é um processo essencial para a vida na Terra.');

-- 8. Povoando Alternativas para as Questões
-- Alternativas da Questão 1 (Literatura)
INSERT INTO alternativa (id_questao, conteudo, correta) VALUES 
(1, 'Racionalidade e objetividade.', FALSE),
(1, 'Nacionalismo e exaltação da natureza.', TRUE),
(1, 'Foco no subconsciente humano.', FALSE),
(1, 'Crítica social rigorosa e pessimismo.', FALSE);

-- Alternativas da Questão 2 (Matemática)
INSERT INTO alternativa (id_questao, conteudo, correta) VALUES 
(2, '5', FALSE),
(2, '6', TRUE),
(2, '7', FALSE),
(2, '12', FALSE);

-- Alternativas da Questão 3 (Biologia)
INSERT INTO alternativa (id_questao, conteudo, correta) VALUES 
(3, 'Ocorre apenas durante a noite.', FALSE),
(3, 'Consome oxigênio e libera gás carbônico.', FALSE),
(3, 'Produz glicose e libera oxigênio.', TRUE),
(3, 'É realizada exclusivamente por fungos.', FALSE);

-- 9. Povoando Conteúdos (Matérias/Assuntos)
INSERT INTO conteudo (id, nome, descricao) VALUES 
(1, 'Literatura Brasileira', 'Estudo dos movimentos literários no Brasil.'),
(2, 'Geometria Plana', 'Estudo de figuras bidimensionais e cálculo de áreas.'),
(3, 'Biologia Celular', 'Estudo do funcionamento e organelas das células.');

-- 10. Relacionando Questões aos Conteúdos (N:N)
INSERT INTO questao_conteudo (id_questao, id_conteudo) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- 11. Povoando Materiais de Apoio
INSERT INTO material_apoio (id_questao, titulo, url, tipo) VALUES 
(1, 'Resumo Romantismo', 'https://youtube.com/exemplo-romantismo', 'vídeo'),
(2, 'Fórmulas de Geometria', 'https://blog.exemplo.com/geometria', 'artigo');

-- 12. Relacionando Questões aos Simulados realizados
-- Simulado 1 (Julia Discente) acertou a Q1 e errou a Q2
INSERT INTO simulado_questao (id_simulado, id_questao, desconsiderado, acerto) VALUES 
(1, 1, FALSE, TRUE),
(1, 2, FALSE, FALSE);

-- Simulado 2 (Lucas Discente) acertou a Q3
INSERT INTO simulado_questao (id_simulado, id_questao, desconsiderado, acerto) VALUES 
(2, 3, FALSE, TRUE);