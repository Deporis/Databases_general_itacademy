DROP DATABASE PAINTING_SHOP;
CREATE DATABASE PAINTING_SHOP;
USE PAINTING_SHOP;
CREATE TABLE quadre
	(quadre_id INT PRIMARY KEY AUTO_INCREMENT,
    nom_quadre VARCHAR(45),
    autor VARCHAR(45),
    preu REAL,
    dni_comprador CHAR(9) REFERENCES comprador (dni_comprador)
    );
CREATE TABLE comprador
	(dni_comprador CHAR(9) PRIMARY KEY,
    nom VARCHAR(45),
    cognom VARCHAR(45),
    ciutat VARCHAR(45)
    );
INSERT INTO quadre (nom_quadre, autor, preu, dni_comprador)
VALUES ("La Gioconda", "Leonardo da Vinci", "730000000.0", "12345678T"),
    ("La noche estrellada", "Vincent van Gogh", NULL, "12345678S"),
    ("El beso", "Gustav Klimt", "107000000.0", NULL),
    ("Guernica", "Pablo Picasso", "753000000.0", "12345678A"),
    ("Las meninas", "Diego Velázquez", NULL, "12345678C"),
    ("La última cena", "Leonardo da Vinci", NULL, NULL),
    ("Terraza de café por la noche", "Vincent van Gogh", NULL, "12345678S"),
    ("La joven de la perla", "Johannes Vermeer", "7800000.0", "12345678T"),
    ("Impresión, sol naciente", "Claude Monet", NULL, NULL),
    ("El nacimiento de Venus", "Sandro Botticelli", NULL, "12345678S"),
    ("El jardín de las delicias", "El bosco", NULL, NULL),
    ("La dama del armiño", "Leonardo da Vinci", "350000000.0", NULL);
INSERT INTO comprador (dni_comprador, nom, cognom, ciutat)
VALUES ("12345678A", "Alfred", "In", "Barcelona"),
	("12345678S", "Sílvia", "Ro", "L'Hospitalet de Llobregat"),
    ("12345678C", "Cristina", "Su", "Barcelona"),
    ("12345678T", "Toni", "Ro", "L'Hospitalet de Llobregat");