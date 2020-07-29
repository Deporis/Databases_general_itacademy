DROP DATABASE STUBE;
CREATE DATABASE STUBE;
USE STUBE;
CREATE TABLE user
	(email VARCHAR(45) PRIMARY KEY,
    username VARCHAR(45) UNIQUE NOT NULL,
    password VARCHAR(45) UNIQUE NOT NULL);
CREATE TABLE videos
	(video_id  VARCHAR(45) PRIMARY KEY,
    description VARCHAR(145) DEFAULT NULL,
    title VARCHAR(45) NOT NULL,
    URL VARCHAR(45) UNIQUE NOT NULL,
    email_user VARCHAR(45) REFERENCES user (email));
INSERT INTO user (email, username, password)
VALUES ("alfred.inga.rios@gmail.com", "Alfred19", "alfred1234"),
	("alfreeed21@gmail.com", "Alfreeed19", "alfreeed1234"),
	("flygon-19@hotmail.com", "flygon19", "flygon1234");
INSERT INTO videos (video_id, description, title, URL, email_user)
VALUES ("eWUC5Q0RCAA","Avicci Music", "Seek Bromance", "https://www.youtube.com/watch?v=eWUC5Q0RCAA", "flygon-19@hotmail.com"),
	("EfF9EE6ZR5E", "Daddy Yankee Music", "Sigueme y Te Sigo", "https://www.youtube.com/watch?v=EfF9EE6ZR5E", "alfreeed21@gmail.com"),
    ("zwyKQnbDJRg", "Bee Gees Music", "More Than A Woman", "https://www.youtube.com/watch?v=zwyKQnbDJRg", "alfred.inga.rios@gmail.com"),
    ("4N1iwQxiHrs", "The Outfield Music", "Your Love", "https://www.youtube.com/watch?v=4N1iwQxiHrs", "alfred.inga.rios@gmail.com"),
    ("9TeyuDnwyrw", DEFAULT, "Lovumba", "https://www.youtube.com/watch?v=9TeyuDnwyrw", "alfreeed21@gmail.com"),
    ("lAhHNCfA7NI", "Alexandra Stan Music", "Mr. Saxobeat", "https://www.youtube.com/watch?v=lAhHNCfA7NI", "flygon-19@hotmail.com");