DROP PROCEDURE IF EXISTS sp_ResetBookstoreDB;

DELIMITER //
CREATE PROCEDURE sp_ResetBookstoreDB()
BEGIN

SET FOREIGN_KEY_CHECKS = 0;

    DROP TABLE IF EXISTS sale_items;
    DROP TABLE IF EXISTS sales;
    DROP TABLE IF EXISTS books;
    DROP TABLE IF EXISTS employees;
    DROP TABLE IF EXISTS customers;
    DROP TABLE IF EXISTS genres;

    CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    email varchar(240) NOT NULL UNIQUE,
    PRIMARY KEY (customer_id)
);
    CREATE TABLE employees(
    employee_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    PRIMARY KEY (employee_id)
);
    CREATE TABLE genres(
    genre_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    genre_type varchar(50) NOT NULL,
    PRIMARY KEY (genre_id)
);

    CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT UNIQUE,
    title varchar (240) NOT NULL,
    author varchar(240) NOT NULL,
    price decimal (8, 2) NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (genre_id) 
        REFERENCES genres(genre_id)
        ON DELETE RESTRICT
);

    CREATE TABLE sales (
    sale_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATETIME NOT NULL,
    total_price decimal (19,2) NOT NULL,
    PRIMARY KEY(sale_id),
    FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT,
    FOREIGN KEY (employee_id) 
        REFERENCES employees(employee_id)
        ON DELETE RESTRICT  
);

    CREATE TABLE sale_items(
    sale_item_id INT NOT NULL AUTO_INCREMENT,
    sale_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price decimal (19,2) NOT NULL,
    PRIMARY KEY (sale_item_id),
    FOREIGN KEY (sale_id) 
        REFERENCES sales(sale_id)
        ON DELETE CASCADE,
    FOREIGN KEY (book_id) 
        REFERENCES books(book_id)
        ON DELETE RESTRICT
);

    INSERT INTO customers(customer_id, first_name, last_name, email)
    VALUES 
    (1, 'Parker', 'Brown', 'p.brown@yeehaw.com'),
    (2, 'Skye', 'Cantu','skye.c@yeehaw.com'),
    (3, 'Dierks', 'Hays', 'Dierks.Hays@yeehaw.com'),
    (4, 'Susan', 'Anderson', 'S.Anderson@yeehaw.com'),
    (5, 'Kayla', 'Smith', 'K.Smith@yeehaw.com');
 
    INSERT INTO employees(employee_id, first_name, last_name)
    VALUES
    (1, 'Rachelle',	'Smith'),
    (2, 'Ruth', 'Brown'),
    (3,	'Lonnie', 'Cantu');

    INSERT INTO genres(genre_type)
    VALUES
    ('Children'),
    ('Young Adult'),
    ('Thriller'),
    ('Romance'),
    ('Horror'),
    ('Western');

    INSERT INTO books(title, author, price, genre_id)
    VALUES
    ('Charlottes Web', 'E. B. White', 20.00, 1), 
    ('Diary of a Wimpy Kid', 'Jeff Kinney', 5.00, 2), 
    ('Verity', 'Colleen Hoover', 12.00, 3),
    ('Orphan X', 'Gregg Hurwitz', 15.00, 4), 
    ('Never Lie', 'Freida McFadden', 16.00, 5), 
    ('The Shining', 'Stephen King', 17.00, 6), 
    ('Gone Girl', 'Gillian Flynn',	10.00, 3), 
    ('Lonesome Dove', 'Larry McMurtry', 17.00, 6),
    ('True Grit', 'Charles Portis', 10.00, 6), 
    ('The Lion at Bay', 'Robert Wisehart', 25.00, 4);

    INSERT INTO sales(customer_id, employee_id, sale_date, total_price)
    VALUES
    (1, 1, '2026-10-01 10:15:00', 27.00),
    (2, 2, '2026-10-02 14:30:00', 31.00),
    (3, 3, '2026-10-03 09:45:00', 17.00),
    (4, 1, '2026-10-04 16:10:00', 26.98),
    (5, 2, '2026-10-05 11:20:00', 35.00);

    INSERT INTO sale_items (sale_id, book_id, quantity, unit_price)
    VALUES
    (1, 2, 1, 5.00),
    (1, 3, 1, 12.00),
    (1, 9, 1, 10.00),

    (2, 4, 1, 15.00),
    (2, 5, 1, 16.00),

    (3, 6, 1, 17.00),

    (4, 7, 1, 10.00),
    (4, 8, 1, 17.00),

    (5, 1, 1, 20.00),
    (5, 2, 1, 5.00),
    (5, 3, 1, 10.00);

    SET FOREIGN_KEY_CHECKS = 1;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS create_sale_item;

DELIMITER //

CREATE PROCEDURE create_sale_item(
    IN p_sale_id INT,
    IN p_book_id INT,
    IN p_quantity INT,
    IN p_unit_price DECIMAL(19,2)
)

BEGIN
INSERT INTO sale_items (
    sale_id,
    book_id,
    quantity,
    unit_price
) VALUES (
    p_sale_id,
    p_book_id,
    p_quantity,
    p_unit_price
);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS update_sale_item;

-- update_sale_item
DELIMITER //
CREATE PROCEDURE update_sale_item(
    IN p_sale_item_id INT,
    IN p_sale_id INT,
    IN p_book_id INT,
    IN p_quantity INT,
    IN p_unit_price DECIMAL(19,2)
)
BEGIN
    UPDATE sale_items
    SET
        sale_id = p_sale_id,
        book_id = p_book_id,
        quantity = p_quantity,
        unit_price = p_unit_price
WHERE sale_item_id = p_sale_item_id;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS delete_sale_item;

-- delete_sale_item
DELIMITER //
CREATE PROCEDURE delete_sale_item(
    IN p_sale_item_id INT
)
BEGIN
    DELETE FROM sale_items
    WHERE sale_item_id = p_sale_item_id;
END //

DELIMITER ;
