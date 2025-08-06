
-- Online Store Database Schema and Queries

-- Table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Table: Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

-- Table: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Table: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample Inserts
INSERT INTO Customers (name, email, phone, address) VALUES
('Anil Kumar', 'anil@gmail.com', '9876543210', 'Hyderabad');

INSERT INTO Categories (category_name) VALUES
('Electronics'), ('Books'), ('Clothing');

INSERT INTO Products (name, price, stock, category_id) VALUES
('Smartphone', 15000.00, 50, 1),
('Python Programming', 500.00, 100, 2),
('T-shirt', 300.00, 200, 3);

-- Sample Queries

-- 1. List All Products with Category Name
SELECT p.name AS product, c.category_name, p.price, p.stock
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

-- 2. Retrieve Orders of a Customer
SELECT o.order_id, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Anil Kumar';

-- 3. Update Stock After Purchase
UPDATE Products
SET stock = stock - 2
WHERE product_id = 1;

-- 4. Total Sales by Date
SELECT order_date, SUM(total_amount) AS total_sales
FROM Orders
GROUP BY order_date;

-- 5. List Orders with Payment Info
SELECT o.order_id, o.order_date, p.payment_method, p.amount_paid
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id;
