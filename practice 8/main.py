import psycopg2
conn = psycopg2.connect(
   host="localhost",
   database="phonebook_db",
   user="postgres",
   password="123"
)
cur = conn.cursor()
print("PHONEBOOK STARTED")
# =====================
def add(name, phone):
   cur.execute("INSERT INTO contacts(name, phone) VALUES (%s, %s)", (name, phone))
   conn.commit()
   print("ADDED")
# =====================
def delete(value):
   cur.execute("DELETE FROM contacts WHERE name=%s OR phone=%s", (value, value))
   conn.commit()
   print("DELETED")
# =====================
def show():
   cur.execute("SELECT * FROM contacts")
   for row in cur.fetchall():
       print(row)
# =====================
while True:
   print("\n1 - add")
   print("2 - delete")
   print("3 - show")
   print("0 - exit")
   choice = input("Choose: ")
   if choice == "1":
       name = input("Name: ")
       phone = input("Phone: ")
       add(name, phone)
   elif choice == "2":
       value = input("Name or phone to delete: ")
       delete(value)
   elif choice == "3":
       show()
   elif choice == "0":
       break
conn.close()