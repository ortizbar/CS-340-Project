# A Thousand Lives Bookstore Database 
# Authors: 
- Ruth Ortiz Barron
- Rachelle Brown Rodriguez
  
# Description: 
A Thousand Lives is a small local bookstore database provides an organized way to track customer information, maintain a catalog, classify books by genre, employee sales, and store information about multi-item transactions. This project includes a mySQL database, an application-tier Python class, SQL queries, and a test driver.

# Project Files:
- DDL.sql
- DML.sql
- driver_script.py
- python_app_tier.py

# Software Requirements:
- Python
- XAMPP (mySQL and phpMyAdmin)
- my-sql-connector python
- Visual Studio Code recommneded

# Set Up:
# 1. Start XAMPP
  - Apache
  - mySQL
   
# 2. Open phpMyAdmin
   
# 3. Create Database
   example: cs340_ortizbar_bookstore
   
# 4. Import DDL.sql
   - Select the database.
   - Click Import.
   - Upload DDL.sql.
   - Click Go.
    
# 5. Verify Tables
The following tables should be created:
- customers
- employees
- genres
- books
- sales
- sale_items

# 6. Application Tier Setup
The Python application tier is implemented in:
python_app_tier.py
  
This class:
- Manages database connections
- Executes SQL queries
- Provides controlled access to bookstore data

# 7. Open a terminal in the project directory and run:
Shell
[python driver_script.py]

# 8. Expected Output:

CUSTOMERS
[(1, 'Parker', 'Brown', 'p.brown@yeehaw.com'), (2, 'Skye', 'Cantu', 'skye.c@yeehaw.com'), (3, 'Dierks', 'Hays', 'Dierks.Hays@yeehaw.com'), (4, 'Susan', 'Anderson', 'S.Anderson@yeehaw.com'), (5, 'Kayla', 'Smith', 'K.Smith@yeehaw.com')]

EMPLOYEES
[(1, 'Rachelle', 'Smith'), (2, 'Ruth', 'Brown'), (3, 'Lonnie', 'Cantu')]

GENRES
[(1, 'Children'), (2, 'Young Adult'), (3, 'Thriller'), (4, 'Romance'), (5, 'Horror'), (6, 'Western')]

BOOKS
[(1, 'Charlottes Web', 'E. B. White', Decimal('20.00'), 1), (2, 'Diary of a Wimpy Kid', 'Jeff Kinney', Decimal('5.00'), 2), (3, 'Verity', 'Colleen Hoover', Decimal('12.00'), 3), (4, 'Orphan X', 'Gregg Hurwitz', Decimal('15.00'), 4), (5, 'Never Lie', 'Freida McFadden', Decimal('16.00'), 5), (6, 'The Shining', 'Stephen King', Decimal('17.00'), 6), (7, 'Gone Girl', 'Gillian Flynn', Decimal('9.99'), 3), (8, 'Lonesome Dove', 'Larry McMurtry', Decimal('16.99'), 6), (9, 'True Grit', 'Charles Portis', Decimal('10.00'), 6), (10, 'The Lion at Bay', 'Robert Wisehart', Decimal('25.00'), 4)]

SALES
[(1, 1, 1, datetime.datetime(2026, 10, 1, 10, 15), Decimal('27.00')), (2, 2, 2, datetime.datetime(2026, 10, 2, 14, 30), Decimal('31.00')), (3, 3, 3, datetime.datetime(2026, 10, 3, 9, 45), Decimal('17.00')), (4, 4, 1, datetime.datetime(2026, 10, 4, 16, 10), Decimal('26.98')), (5, 5, 2, datetime.datetime(2026, 10, 5, 11, 20), Decimal('35.00'))]

SALE ITEMS
[(1, 1, 2, 1, Decimal('5.00')), (2, 1, 3, 1, Decimal('12.00')), (3, 1, 9, 1, Decimal('10.00')), (4, 2, 4, 1, Decimal('15.00')), (5, 2, 5, 1, Decimal('16.00')), (6, 3, 6, 1, Decimal('17.00')), (7, 4, 7, 1, Decimal('9.99')), (8, 4, 8, 1, Decimal('16.99')), (9, 5, 1, 1, Decimal('20.00')), (10, 5, 2, 1, Decimal('5.00')), (11, 5, 3, 1, Decimal('10.00'))]

ADD SALE ITEMS
Rows added: 1

SALE ITEMS AFTER INSERT
[(1, 1, 2, 1, Decimal('5.00')), (2, 1, 3, 1, Decimal('12.00')), (3, 1, 9, 1, Decimal('10.00')), (4, 2, 4, 1, Decimal('15.00')), (5, 2, 5, 1, Decimal('16.00')), (6, 3, 6, 1, Decimal('17.00')), (7, 4, 7, 1, Decimal('9.99')), (8, 4, 8, 1, Decimal('16.99')), (9, 5, 1, 1, Decimal('20.00')), (10, 5, 2, 1, Decimal('5.00')), (11, 5, 3, 1, Decimal('10.00')), (12, 1, 1, 2, Decimal('20.00'))]

UPDATE SALE ITEMS
Rows updated: 1

SALE ITEMS AFTER UPDATE
[(1, 1, 2, 1, Decimal('5.00')), (2, 1, 3, 1, Decimal('12.00')), (3, 1, 9, 1, Decimal('10.00')), (4, 2, 4, 1, Decimal('15.00')), (5, 2, 5, 1, Decimal('16.00')), (6, 3, 6, 1, Decimal('17.00')), (7, 4, 7, 1, Decimal('9.99')), (8, 4, 8, 1, Decimal('16.99')), (9, 5, 1, 1, Decimal('20.00')), (10, 5, 2, 1, Decimal('5.00')), (11, 5, 3, 1, Decimal('10.00')), (12, 1, 1, 3, Decimal('20.00'))]

DELETE SALE ITEMS
Rows deleted: 1

SALE ITEMS AFTER DELETE
[(1, 1, 2, 1, Decimal('5.00')), (2, 1, 3, 1, Decimal('12.00')), (3, 1, 9, 1, Decimal('10.00')), (4, 2, 4, 1, Decimal('15.00')), (5, 2, 5, 1, Decimal('16.00')), (6, 3, 6, 1, Decimal('17.00')), (7, 4, 7, 1, Decimal('9.99')), (8, 4, 8, 1, Decimal('16.99')), (9, 5, 1, 1, Decimal('20.00')), (10, 5, 2, 1, Decimal('5.00')), (11, 5, 3, 1, Decimal('10.00'))]


# Originality and acknowledgments:
All decisions regarding database design, SQL implementation, Python code integration, testing, and documenation were completed by the authors.
 # AI Usage:
       - SQL syntax debugging
       - Review schema consistency
       - Troubleshooting python and mySQL connection issues
