-- read Customers

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customers;

-- read Employees

SELECT
    employee_id,
    first_name,
    last_name
FROM employees;

-- read Genres

SELECT
    genre_id,
    genre_type
FROM genres;

--read Books

SELECT
    book_id,
    title,
    author,
    price,
    genre_id
FROM books;

-- read Sales

SELECT
    sale_id,
    customer_id,
    employee_id,
    sale_date,
    total_price
FROM sales;

-- read Sale_items

SELECT
    sale_item_id,
    sale_id,
    book_id,
    quantity,
    unit_price
FROM sale_items;
