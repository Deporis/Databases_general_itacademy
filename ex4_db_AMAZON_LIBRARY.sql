DROP DATABASE AMAZON_LIBRARY;
CREATE DATABASE AMAZON_LIBRARY;
USE AMAZON_LIBRARY;
CREATE TABLE author
	(author_name VARCHAR(45) PRIMARY KEY,
    address VARCHAR(45) DEFAULT NULL,
    quantity INT NOT NULL);
CREATE TABLE books
	(title VARCHAR(45) PRIMARY KEY,
    stock INT,
    sold INT,
    price REAL NOT NULL,
    author_book VARCHAR(45) REFERENCES author (author_name));
CREATE TABLE users
	(email VARCHAR(45) PRIMARY KEY,
    username VARCHAR(45) UNIQUE NOT NULL,
    password VARCHAR(45) UNIQUE NOT NULL);
CREATE TABLE bill
	(email_user VARCHAR(45) REFERENCES users (email),
    title_book VARCHAR(45) REFERENCES books (title),
    quantity INT,
    PRIMARY KEY (email_user, title_book));
INSERT INTO author (author_name, address, quantity)
	VALUES ("Álex Rovira", "Barcelona", 2),
    ("Bernardo Stamateas", "Floresta", 2),
    ("Juan Marsé", "Barcelona", 1),
    ("Jules Verne", "Nantes", 3);
INSERT INTO books (title, stock, sold, price, author_book)
	VALUES ("Gente Tóxica", 12, 6, 12.99, "Bernardo Stamateas"),
    ("Últimas tardes con Teresa", 15, 5, 8.00, "Juan Marsé"),
    ("Journey to the Center of the Earth", 12, 20, 9.99, "Jules Verne"),
    ("La Buena Suerte", 3, 18, 12.99, "Álex Rovira"),
    ("From the Earth to the Moon", 7, 12, 10.99, "Jules Verne"),
    ("The Mysterious Island", 3, 6, 10.99, "Jules Verne"),
    ("Nudos Mentales", 10, 3, 12.99, "Fernando Stamateas"),
    ("La Brújula Interior", 10, 4, 9.99, "Álex Rovira");
INSERT INTO users (email, username, password)
	VALUES ("alfred.inga.rios@gmail.com", "Alfred19", "alfred1234"),
    ("alfreeed21@gmail.com", "Alfreeed19", "alfreeed1234"),
    ("flygon-19@hotmail.com", "Flygon19", "flygon1234");
INSERT INTO bill (email_user, title_book, quantity)
	VALUES ("alfred.inga.rios@gmail.com", "La Buena Suerte", 2),
    ("alfred.inga.rios@gmail.com", "Nudos Mentales", 1),
    ("flygon19@hotmail.com", "Journey to the Center of the Earth", 1),
    ("alfreeed21@gmail.com", "Últimas tardes con Teresa", 2);