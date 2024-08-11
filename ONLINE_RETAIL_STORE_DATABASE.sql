--ONLINE RETAIL STORE DATABASE
CREATE DATABASE Online_Retail_Store_Database ;
USE  Online_Retail_Store_Database ;
--1. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL
);

--2. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    country VARCHAR(50)
);

--3. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

--4. Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--5. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    amount_paid DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

--Inserting Data for 10 Customers
INSERT INTO Customers (first_name, last_name, email, phone, address, city, state, zip_code, country) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak St', 'Springfield', 'IL', '62701', 'USA'),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '789 Pine St', 'Springfield', 'IL', '62701', 'USA'),
('Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', '321 Maple St', 'Springfield', 'IL', '62701', 'USA'),
('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234', '654 Cedar St', 'Springfield', 'IL', '62701', 'USA'),
('Diana', 'Wilson', 'diana.wilson@example.com', '678-901-2345', '987 Birch St', 'Springfield', 'IL', '62701', 'USA'),
('Ethan', 'Martinez', 'ethan.martinez@example.com', '789-012-3456', '159 Spruce St', 'Springfield', 'IL', '62701', 'USA'),
('Fiona', 'Garcia', 'fiona.garcia@example.com', '890-123-4567', '753 Willow St', 'Springfield', 'IL', '62701', 'USA'),
('George', 'Hernandez', 'george.hernandez@example.com', '901-234-5678', '852 Fir St', 'Springfield', 'IL', '62701', 'USA'),
('Hannah', 'Lopez', 'hannah.lopez@example.com', '012-345-6789', '456 Ash St', 'Springfield', 'IL', '62701', 'USA');

--Inserting Data for 10 Products
INSERT INTO Products (product_name, category, description, price, quantity_in_stock) VALUES
('Laptop', 'Electronics', '15-inch laptop with 16GB RAM', 999.99, 50),
('Smartphone', 'Electronics', 'Latest model smartphone with 128GB storage', 799.99, 100),
('Headphones', 'Electronics', 'Noise-cancelling over-ear headphones', 199.99, 75),
('Coffee Maker', 'Home Appliances', 'Automatic coffee maker with grinder', 89.99, 30),
('Blender', 'Home Appliances', 'High-speed blender for smoothies', 49.99, 40),
('Desk Chair', 'Furniture', 'Ergonomic office chair', 129.99, 20),
('Gaming Console', 'Electronics', 'Latest gaming console', 499.99, 25),
('Wireless Mouse', 'Electronics', 'Ergonomic wireless mouse', 29.99, 60),
('LED Monitor', 'Electronics', '27-inch LED monitor', 299.99, 35),
('Smartwatch', 'Electronics', 'Fitness smartwatch with heart rate monitor', 199.99, 80);

--Placing an Order
INSERT INTO Orders (customer_id, total_price) 
VALUES (1, 199.99);  -- Replace with actual customer_id and total_price

-- Assuming the order_id generated is 1, add items to Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price) 
VALUES (1, 1, 2, 99.99);  -- Replace with actual order_id, product_id, quantity, and price

--Processing Payment
INSERT INTO Payments (order_id, payment_method, amount_paid) 
VALUES (1, 'Credit Card', 199.99);  -- Replace with actual order_id, payment_method, and amount_paid

--Viewing Customer Order History
SELECT o.order_id, o.order_date, oi.product_id, p.product_name, oi.quantity, oi.price
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id  
JOIN Products p ON oi.product_id = p.product_id
WHERE o.customer_id = 1;  -- Replace with the actual customer_id
--Retrieve All Products in an Order
SELECT o.order_id, o.order_date, o.total_price, COUNT(oi.order_item_id) AS item_count
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE o.customer_id = 1  -- Replace with the actual customer_id
--GROUP BY o.order_id; in a specific order.
SELECT p.product_name, oi.quantity, oi.price
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 1;  -- Replace with the actual order_id



