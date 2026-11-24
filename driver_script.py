from python_app_tier import BookstoreDB

db = BookstoreDB(
    host = "localhost",
    user = "root",
    password = "",
    database = "cs340_ortizbar_bookstore"
)

print("RESET DATABASE")
db.reset_database()
print("DATABASE RESET COMPLETE")

print("CUSTOMERS")
print(db.get_customers())

print("\nEMPLOYEES")
print(db.get_employees())

print("\nGENRES")
print(db.get_genres())

print("\nBOOKS")
print(db.get_books())

print("\nSALES")
print(db.get_sales())

print("\nSALE ITEMS")
print(db.get_sale_items())

print("\nADD SALE ITEMS")
db.add_sale_item(1, 1, 2, 20.00)
new_id = db.get_sale_items()[-1][0]  # Get the last inserted sale_item_id

print("\nSALE ITEMS AFTER INSERT")
print(db.get_sale_items())

print("\nUPDATE SALE ITEMS")
db.update_sale_item(new_id, 1, 1, 3, 20.00)

print("\nSALE ITEMS AFTER UPDATE")
print(db.get_sale_items())

print("\nDELETE SALE ITEMS")
db.delete_sale_item(new_id)

print("\nSALE ITEMS AFTER DELETE")
print(db.get_sale_items())

db.close()
