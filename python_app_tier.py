import mysql.connector

class BookstoreDB:

    def __init__(self,
        host = "localhost",
        user = "root",
        password = "",
        database = "cs340_ortibar_bookstore"):
         self.db = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )

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
    
    def add_sale_item(self, sale_id, book_id, quantity, unit_price):
        cursor = self.db.cursor()
        query = """
            INSERT INTO sale_items (sale_id, book_id, quantity, unit_price)
            VALUES (%s, %s, %s, %s) """

        cursor.execute(query, (sale_id, book_id, quantity, unit_price))
        self.db.commit()
        rows = cursor.rowcount
        cursor.close()

        return rows

    def update_sale_item(self, sale_item_id, sale_id, book_id, quantity, unit_price ):
        cursor = self.db.cursor()
        query = """
            UPDATE sale_items
            SET sale_id = %s,
                book_id = %s,
                quantity = %s,
                unit_price = %s
            WHERE sale_item_id = %s
        """

        cursor.execute(query, (sale_id, book_id, quantity, unit_price, sale_item_id))
        self.db.commit()
        rows = cursor.rowcount
        cursor.close()
        
        return rows

    def delete_sale_item(self, sale_item_id):
        cursor = self.db.cursor()
        query = """ 
            DELETE FROM sale_items
            WHERE sale_item_id = %s
        """
        
        cursor.execute(query, (sale_item_id,))
        self.db.commit()
        rows = cursor.rowcount
        cursor.close()
            
        return rows

    def close(self):
        self.db.close()