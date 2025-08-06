#  Online Store Database Management System

This project is developed as part of my Brainwave Matrix Solutions Internship. It models an **Online Store** using a relational database to manage products, customers, orders, and payments.

---

##  Objective
Design and implement a relational database for an online store to efficiently manage:
- Customer data
- Product inventory
- Orders and their details
- Payment transactions

---

##  Entity-Relationship Overview

### Entities:
- **Customers**: Stores customer information
- **Products**: Items available for purchase
- **Categories**: Classification for products
- **Orders**: Customer orders with date and total
- **OrderDetails**: Line items in an order (product & quantity)
- **Payments**: Payment details for each order


---

##  Database Tables

Each table includes appropriate primary and foreign keys:
- `Customers(customer_id, name, email, phone, address)`
- `Categories(category_id, category_name)`
- `Products(product_id, name, price, stock, category_id)`
- `Orders(order_id, customer_id, order_date, total_amount)`
- `OrderDetails(order_detail_id, order_id, product_id, quantity, price)`
- `Payments(payment_id, order_id, payment_date, payment_method, amount_paid)`

---

##  SQL File

The full SQL file is provided in:  
📄 `online_store_database.sql`

It includes:
- Table creation statements
- Sample insert data
- Key SELECT, UPDATE, and JOIN queries

---

##  Key SQL Queries

- List all products with category names
- Retrieve orders for a specific customer
- Update stock after purchase
- Total daily sales calculation
- Orders with payment information

---

##  Conclusion

This project demonstrates :
- Designing normalized relational databases
- Writing SQL queries for real-world tasks
- Mapping relationships between data entities

---

 **Report**: `Online_Store_DB_Report.pdf`  
 **ER Diagram**: `Online_Store_ER_Diagram.png`

# By:
Jyotshna Komma
B.Tech 