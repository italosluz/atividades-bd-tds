USE associacao_kart;

INSERT INTO temporada VALUES (DEFAULT, 1);

INSERT INTO etapa 
    VALUES
        (DEFAULT, "São Paulo", "2024-01-15", "14:00:00", 1),
        (DEFAULT, "Rio de Janeiro", "2024-02-20", "16:00:00", 1),
        (DEFAULT, "Campo Grande", "2024-03-18", "15:00:00", 1),
        (DEFAULT, "Londrina", "2024-04-22", "13:00:00", 1),
        (DEFAULT, "Porto Alegre", "2024-05-10", "10:00:00", 1);

INSERT INTO patrocinio 
    VALUES 
        (DEFAULT, "MotorTech Brasil"),
        (DEFAULT, "Velocidade Extrema"),
        (DEFAULT, "Alta Performance"),
        (DEFAULT, "Turbo Racing"),
        (DEFAULT, "Pneus ProDrive");

INSERT INTO equipe 
    VALUES
        (DEFAULT, "Escuderia Veloz", 1),
        (DEFAULT, "Rápidos e Furiosos", 2),
        (DEFAULT, "Fênix Racing", 3),
        (DEFAULT, "Equipe Tempestade", 4),
        (DEFAULT, "Corredores de Aço", 5);
        
INSERT INTO piloto
    VALUES
        (DEFAULT, 1, "Lucas Andrade", 70.5, TRUE, "Brasil"),
        (DEFAULT, 1, "Renato Figueiredo", 75, FALSE, "Brasil"),
        (DEFAULT, 2, "Mateus Silva", 68, FALSE, "Brasil"),
        (DEFAULT, 2, "Bruno Almeida", 78.3, TRUE, "Brasil"),
        (DEFAULT, 3, "Carla Pereira", 60, TRUE, "Portugal"),
        (DEFAULT, 3, "Gabriela Torres", 58.5, FALSE, "Brasil"),
        (DEFAULT, 4, "João Costa", 80.5, FALSE, "Brasil"),
        (DEFAULT, 4, "Thiago Santos", 72.5, FALSE, "Brasil"),
        (DEFAULT, 5, "Mariana Gomes", 62, TRUE, "Portugal"),
        (DEFAULT, 5, "Beatriz Lopes", 63.2, TRUE, "Portugal");
    
INSERT INTO etapa_tem_piloto 
    VALUES 
        (1, 1),
        (1, 2),
        (1, 3),
        (1, 4),
        (1, 5),
        (1, 6),
        (1, 7),
        (1, 8),
        (1, 9),
        (1, 10);

SELECT * FROM equipe;
SELECT * FROM etapa;
SELECT * FROM etapa_tem_piloto;
SELECT * FROM patrocinio;
SELECT * FROM piloto;
SELECT * FROM temporada;
