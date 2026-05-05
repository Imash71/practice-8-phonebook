# 📞 PhoneBook Project (Practice 8)
## 📌 Description
This project is a simple PhoneBook application developed for Practice 8.  
It demonstrates the use of **PostgreSQL functions and stored procedures** together with **Python (psycopg2)** for database interaction.
The system allows users to:
- Add contacts
- Delete contacts
- Search contacts
- Display all contacts
- Work with PostgreSQL functions and procedures
---
## ⚙️ Technologies Used
- Python
- PostgreSQL
- psycopg2
- PL/pgSQL
---
## 🗄️ Database Structure
Table: `contacts`
| Field | Type          | Description        |
|------|---------------|--------------------|
| id   | SERIAL        | Primary key        |
| name | VARCHAR(100)  | Contact name       |
| phone| VARCHAR(20)   | Phone number       |
---
## 🧠 SQL Features Implemented
### Functions:
- Search contacts by name or phone
- Pagination (LIMIT / OFFSET)
### Procedures:
- Insert or update contact (UPSERT)
- Delete contact by name or phone
---
## 🚀 How to Run
### 1. Create database in PostgreSQL
```sql
CREATE DATABASE phonebook_db;
