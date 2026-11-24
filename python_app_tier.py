import mysql.connector

class BookstoreDB:

    def __init__(self,
        host = "localhost",
        user = "root",
        password = "",
        database = "cs340_ortizbar_bookstore"):
         self.db = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )

# read customers

    def get_customers(self):
        cursor = self.db.cursor()
        query = """
            SELECT
                customer_id,
                first_name,
                last_name,
                email
            FROM customers
            ORDER BY customer_id; """
    
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        return results

# read employees

    def get_employees(self):

        cursor = self.db.cursor()
        query = """
            SELECT
                employee_id,
                first_name,
                last_name
            FROM employees
            ORDER BY employee_id; """
    
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        return results

# read genres

    def get_genres(self):
        cursor = self.db.cursor()
        query = """
            SELECT
                genre_id,
                genre_type
            FROM genres
            ORDER BY genre_id; """
    
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        return results

# read books

    def get_books(self):
        cursor = self.db.cursor()
        query = """
            SELECT
                book_id,
                title,
                author,
                price,
                genre_id
            FROM books
            ORDER BY book_id; """
    
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        return results

# read sales

    def get_sales(self):
        cursor = self.db.cursor()
        query = """
            SELECT
                sale_id,
                customer_id,
                employee_id,
                sale_date,
                total_price
            FROM sales
            ORDER BY sale_id; """
    
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        return results
# read sale_items
 
    def get_sale_items(self):
        cursor = self.db.cursor()
        query = """
            SELECT
                sale_item_id,
                sale_id,
                book_id,
                quantity,
                unit_price
            FROM sale_items
            ORDER BY sale_item_id; """
    
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        return results

#reset database using stored procedure

    def reset_database(self):
        cursor = self.db.cursor()
        cursor.callproc('sp_ResetBookstoreDB')
        
        self.db.commit()
        cursor.close()

        return True

#create sale_item using stored procedure
   
    def add_sale_item(self, sale_id, book_id, quantity, unit_price):
        cursor = self.db.cursor()

        cursor.callproc('create_sale_item', [sale_id, book_id, quantity, unit_price])

        self.db.commit()
        cursor.close()

        return True

# update sale_item using stored procedure

    def update_sale_item(self, sale_item_id, sale_id, book_id, quantity, unit_price ):
        cursor = self.db.cursor()

        cursor.callproc('update_sale_item', [sale_item_id, sale_id, book_id, quantity, unit_price])

        self.db.commit()
        cursor.close()
        
        return True
    
# delete sale_item using stored procedure

    def delete_sale_item(self, sale_item_id):
        cursor = self.db.cursor()

        cursor.callproc('delete_sale_item', [sale_item_id])

        self.db.commit()
        cursor.close()
            
        return True

# close the database connection

    def close(self):
        self.db.close()
