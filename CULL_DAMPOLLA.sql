DROP DATABASE CULL_DAMPOLLA;
CREATE DATABASE CULL_DAMPOLLA;
USE CULL_DAMPOLLA;
CREATE TABLE supplier
	(NIF CHAR(9) PRIMARY KEY,
    address VARCHAR(45) NOT NULL,
    country_supp VARCHAR(45) NOT NULL,
    cp INT(5) NOT NULL,
    telephone CHAR(9) NOT NULL,
    fax CHAR(9) DEFAULT NULL
    );
CREATE TABLE employees
	(DNI_employee CHAR(9) PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
    date_recruitment DATETIME NOT NULL
    );
CREATE TABLE client
	(id_client INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    address VARCHAR(45) NOT NULL,
    telephone CHAR(9) NOT NULL,
    email VARCHAR(45)NOT NULL,
    register DATETIME NOT NULL,
    recommendation INT DEFAULT NULL
    );
CREATE TABLE glasses
	(id_glass INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(45) NOT NULL,
    graduation_right REAL NOT NULL,
    graduation_left REAL NOT NULL,
    mount VARCHAR(45) NOT NULL,
    mount_color VARCHAR(45)	NOT NULL,
    glass_color VARCHAR(45) NOT NULL,
    price REAL NOT NULL,
    supplier_nif CHAR(9) REFERENCES supplier (NIF),
    employee_sell CHAR(9) DEFAULT NULL REFERENCES employees (DNI_employee),
	client_buy INT DEFAULT NULL REFERENCES clients (id_client)
    );
INSERT INTO supplier (NIF, address, country_supp, cp, telephone, fax)
VALUES ("12345678A", "Selva de mar", "Spain", 09090, "123456789", DEFAULT),
	("12345678B", "Andorra the old", "Andorra", 08080, "123456788", DEFAULT),
    ("12345678C", "Madrid", "Spain", 07070, "123456787", DEFAULT);
INSERT INTO employees (DNI_employee, name, last_name, date_recruitment)
VALUES ("98765432A", "Sebastian", "A", "2018-05-04"),
	("98765432B", "Olivert", "B", "2018-05-04"),
    ("98765432C", "Penelope", "C", "2019-03-24"),
    ("98765432D", "Rodolfo", "D", "2020-01-15");
INSERT INTO client (name, last_name, address, telephone, email, register, recommendation)
VALUES ("Florentino", "A", "Madrid", "234567890", "florentinoa@gmail.com", "2019-07-05", DEFAULT),
	("Victor", "Valdés", "Barcelona", "234567891", "victorv@gmail.com", "2019-7-24", 1),
    ("Sergi", "B", "Barcelona", "234567892", "sergib@gmail.com", "2019-07-24", 1),
    ("Cristiano", "Ronaldo", "Madrid", "234567893", "cristianoc@gmail.com", "2019-09-15", 2);
INSERT INTO glasses (brand, graduation_right, graduation_left, mount, mount_color, glass_color, price, supplier_nif, employee_sell, client_buy)
VALUES ("Rayban", 4.50, 3.75, "pasta", "green", "white", 99.99, "12345678A", DEFAULT, DEFAULT),
	("Rayban", 9.00, 7.50, "flotant", "black", "black", 199.99, "12345678A", DEFAULT, DEFAULT),
    ("Rayban", 2.25, 1.75, "metalic", "blue", "black", 119.99, "12345678A", "98765432B", 4),
    ("Guess", 2.50, 2.75, "metalic", "yellow", "white", 159.99, "12345678B", DEFAULT, DEFAULT),
    ("Guess", 5.50, 6.00, "pasta", "brown", "black", 119.99, "12345678B", "98765432C", 1),
    ("Oakley", 1.50, 1.75, "flotant", "blue", "black", 89.99, "12345678C", DEFAULT, DEFAULT),
    ("Oakley", 2.50, 2.50, "metalic", "blue", "white", 112.99, "12345678C", DEFAULT, DEFAULT),
    ("Oakley", 3.50, 3.75, "flotant", "black", "white", 39.99, "12345678C", "98765432B", 3),
    ("Hawkers", 3.5, 3.75, "pasta", "black", "white", 59.99, "12345678A", "98765432C", 2);