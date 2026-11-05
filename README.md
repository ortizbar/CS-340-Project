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
   === Users ===
userID | username | email | userRole | createdAt
1 | song_k | song.k@email.com | Admin | 2026-01-10 09:15:00
2 | bassong_m | bassong.m@email.com | Field Agent | 2026-02-03 14:30:00
3 | grace_n | grace.n@email.com | Field Agent | 2026-02-18 08:45:00
4 | kam_t | kam.t@email.com | Contributor | 2026-03-22 17:00:00

=== Locations ===
locationID | locationName | latitude | longitude | isVerified | locationStatus | lastUpdatedAt
1 | Mbay Central Borehole | 8.67000000 | 15.97000000 | 1 | Operational | 2026-03-01 10:00:00
2 | Bangui Community Clinic | 4.39470000 | 18.55820000 | 1 | Operational | 2026-03-05 11:30:00
3 | Sarh Emergency Hub | 9.15000000 | 18.39000000 | 0 | Under Maintenance | 2026-04-12 09:20:00
4 | Kikwit Health Post | -5.04100000 | 18.81600000 | 1 | Operational | 2026-04-20 14:45:00
5 | Berberati River Water Point | 4.26100000 | 15.79200000 | 0 | Unavailable | 2026-05-02 16:10:00

=== Categories ===
categoryID | categoryName | description
1 | Water Point | Pumps, wells, and other sources of clean drinking water
2 | Medical Facility | Clinics, health posts, and hospitals
3 | Emergency Hub | Locations that coordinate emergency response and supplies
4 | Shelter | NULL

=== Reviews ===
reviewID | locationID | userID | rating | commentText | createdAt
1 | 1 | 2 | 5 | Pump works well and the water is clear. | 2026-04-02 10:20:00
2 | 2 | 2 | 4 | Staff were helpful but the wait was long. | 2026-04-15 13:10:00
3 | 1 | 3 | 3 | NULL | 2026-05-01 09:00:00
4 | 4 | 4 | 2 | Ran out of basic supplies during my visit | 2026-05-20 16:45:00

=== LocationCategories ===
locationCategoryID | locationName | categoryName
1 | Mbay Central Borehole | Water Point
2 | Bangui Community Clinic | Medical Facility
3 | Sarh Emergency Hub | Emergency Hub
4 | Sarh Emergency Hub | Shelter
5 | Kikwit Health Post | Medical Facility
6 | Berberati River Water Point | Water Point

=== SavedLocations ===
savedLocationID | userID | username | locationID | locationName | savedAt
1 | 2 | bassong_m | 1 | Mbay Central Borehole | 2026-04-01 08:00:00
2 | 2 | bassong_m | 2 | Bangui Community Clinic | 2026-04-01 08:05:00
3 | 2 | bassong_m | 3 | Sarh Emergency Hub | 2026-04-02 11:30:00
4 | 3 | grace_n | 1 | Mbay Central Borehole | 2026-04-10 12:00:00
5 | 4 | kam_t | 1 | Mbay Central Borehole | 2026-05-05 15:20:00

=== SavedLocations after CREATE ===
savedLocationID | userID | username | locationID | locationName | savedAt
1 | 2 | bassong_m | 1 | Mbay Central Borehole | 2026-04-01 08:00:00
2 | 2 | bassong_m | 2 | Bangui Community Clinic | 2026-04-01 08:05:00
3 | 2 | bassong_m | 3 | Sarh Emergency Hub | 2026-04-02 11:30:00
4 | 3 | grace_n | 1 | Mbay Central Borehole | 2026-04-10 12:00:00
5 | 4 | kam_t | 1 | Mbay Central Borehole | 2026-05-05 15:20:00
7 | 1 | song_k | 4 | Kikwit Health Post | 2026-11-05 16:59:49


=== SavedLocations after UPDATE ===
savedLocationID | userID | username | locationID | locationName | savedAt
1 | 2 | bassong_m | 1 | Mbay Central Borehole | 2026-04-01 08:00:00
2 | 2 | bassong_m | 2 | Bangui Community Clinic | 2026-04-01 08:05:00
3 | 2 | bassong_m | 3 | Sarh Emergency Hub | 2026-04-02 11:30:00
4 | 3 | grace_n | 1 | Mbay Central Borehole | 2026-04-10 12:00:00
5 | 4 | kam_t | 1 | Mbay Central Borehole | 2026-05-05 15:20:00
7 | 1 | song_k | 5 | Berberati River Water Point | 2026-11-05 16:59:49


=== SavedLocations after DELETE ===
savedLocationID | userID | username | locationID | locationName | savedAt
1 | 2 | bassong_m | 1 | Mbay Central Borehole | 2026-04-01 08:00:00
2 | 2 | bassong_m | 2 | Bangui Community Clinic | 2026-04-01 08:05:00
3 | 2 | bassong_m | 3 | Sarh Emergency Hub | 2026-04-02 11:30:00
4 | 3 | grace_n | 1 | Mbay Central Borehole | 2026-04-10 12:00:00
5 | 4 | kam_t | 1 | Mbay Central Borehole | 2026-05-05 15:20:00


# Originality and acknowledgments:
All decisions regarding database design, SQL implementation, Python code integration, testing, and documenation were completed by the authors.
 # AI Usage:
       - SQL syntax debugging
       - Review schema consistency
       - Troubleshooting python and mySQL connection issues
