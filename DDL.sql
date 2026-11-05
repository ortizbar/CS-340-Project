-- CS 340 Team 27 Project
-- Created by: Ruth Ortiz Barron and Rachelle Brown Rodriguez



SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

-- Drop Tables
DROP TABLE IF EXISTS sale_items;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS genres;

-- Customers Table
CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    email varchar(240) NOT NULL UNIQUE,
    PRIMARY KEY (customer_id)
);

-- Employees Table
CREATE TABLE employees(
    employee_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    PRIMARY KEY (employee_id)
);

-- Genres Table
CREATE TABLE genres(
    genre_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    genre_type varchar(50) NOT NULL,
    PRIMARY KEY (genre_id)
);

-- Books Table
CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    title varchar (240) NOT NULL,
    author varchar(240) NOT NULL,
    price decimal (8, 2) NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATETIME NOT NULL,
    total_price decimal (19,2) NOT NULL,
    PRIMARY KEY(sale_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Sale_items Table
CREATE TABLE sale_items(
    sale_item_id INT NOT NULL AUTO_INCREMENT,
    sale_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price decimal (19,2) NOT NULL,
    PRIMARY KEY (sale_item_id),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Customers
INSERT INTO customers(customer_id, first_name, last_name, email)
VALUES 
(1, 'Parker', 'Brown', 'p.brown@yeehaw.com'),
(2, 'Skye', 'Cantu','skye.c@yeehaw.com'),
(3, 'Dierks', 'Hays', 'Dierks.Hays@yeehaw.com'),
(4, 'Susan', 'Anderson', 'S.Anderson@yeehaw.com'),
(5, 'Kayla', 'Smith', 'K.Smith@yeehaw.com');

-- Empployees 
INSERT INTO employees(employee_id, first_name, last_name)
VALUES
(1, 'Rachelle',	'Smith'),
(2, 'Ruth', 'Brown'),
(3,	'Lonnie', 'Cantu');

-- Genres
INSERT INTO genres(genre_type)
VALUES
('Children'),
('Young Adult'),
('Thriller'),
('Romance'),
('Horror'),
('Western');

-- Books
INSERT INTO books(title, author, price, genre_id)
VALUES
('Charlottes Web', 'E. B. White', 20.00, 1), 
('Diary of a Wimpy Kid', 'Jeff Kinney', 5.00, 2), 
('Verity', 'Colleen Hoover', 12.00, 3),
('Orphan X', 'Gregg Hurwitz', 15.00, 4), 
('Never Lie', 'Freida McFadden', 16.00, 5), 
('The Shining', 'Stephen King', 17.00, 6), 
('Gone Girl', 'Gillian Flynn',	9.99, 3), 
('Lonesome Dove', 'Larry McMurtry', 16.99, 6),
('True Grit', 'Charles Portis', 10.00, 6), 
('The Lion at Bay', 'Robert Wisehart', 25.00, 4);

-- Sales
INSERT INTO sales(customer_id, employee_id, sale_date, total_price)
VALUES
(1, 1, '2026-10-01 10:15:00', 27.00),
(2, 2, '2026-10-02 14:30:00', 31.00),
(3, 3, '2026-10-03 09:45:00', 17.00),
(4, 1, '2026-10-04 16:10:00', 26.98),
(5, 2, '2026-10-05 11:20:00', 35.00);

-- Sales Items
INSERT INTO sale_items (sale_id, book_id, quantity, unit_price)
VALUES
(1, 2, 1, 5.00),
(1, 3, 1, 12.00),
(1, 9, 1, 10.00),

(2, 4, 1, 15.00),
(2, 5, 1, 16.00),

(3, 6, 1, 17.00),

(4, 7, 1, 9.99),
(4, 8, 1, 16.99),

(5, 1, 1, 20.00),
(5, 2, 1, 5.00),
(5, 3, 1, 10.00);

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
