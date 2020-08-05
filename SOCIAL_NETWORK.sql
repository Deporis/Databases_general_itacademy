DROP DATABASE SOCIAL_NETWORK;
CREATE DATABASE SOCIAL_NETWORK;
USE SOCIAL_NETWORK;
CREATE TABLE user_sn
	(user_id 	INT PRIMARY KEY AUTO_INCREMENT,
    name 	VARCHAR(45) NOT NULL,
    email 	VARCHAR(45) UNIQUE NOT NULL,
    password 	VARCHAR(45) NOT NULL);
CREATE TABLE relationship
	(user_id1 	INT,
    user_id2 	INT, 
    how_tm 	VARCHAR(280) NOT NULL,
    
    PRIMARY KEY (user_id1, user_id2),
    
    FOREIGN KEY (user_id1) REFERENCES user_sn (user_id),
    
    FOREIGN KEY (user_id2) REFERENCES user_sn (user_id)
    );
CREATE TABLE photo_url
	(photo_id 	INT PRIMARY KEY AUTO_INCREMENT,
    URL 	VARCHAR(145) UNIQUE NOT NULL,
    place 	VARCHAR(45) NOT NULL,
    user_id_ph 	INT UNIQUE NOT NULL REFERENCES user_sn (user_id)
    );
INSERT INTO user_sn (name, email, password)
VALUES ("Alfred", "alfred.inga.rios@gmail.com", "alfred1234"),
    ("Silvia", "silro@gmail.com", "silvia1234"),
    ("Diego", "diego@gmail.com", "diego1234"),
    ("Anneka", "anneka@gmail.com", "anneka1234"),
    ("Ariadna", "ariadna@gmail.com", "ariadna1234");
INSERT INTO relationship (user_id1, user_id2, how_tm)
VALUES (1, 2, "They met learning English"),
	(1, 3, "Alfred met Diego when he was born"),
    (2, 5, "They met in London"),
    (3, 5, "They met on a day of Fiestas Patrias");
INSERT INTO photo_url (URL, place, user_id_ph)
VALUES ("https://www.nasa.gov/sites/default/files/50169630453_a7335051bf_k.jpg", "Florida", 1),
	("https://miro.medium.com/max/2560/1*9VrbLFsI8lqLafp7m8o7DQ.png", "Disney", 5),
    ("https://viajes.nationalgeographic.com.es/medio/2019/04/15/istock-467903903_02b50c38_2000x1333.jpg", "Island", 2);
