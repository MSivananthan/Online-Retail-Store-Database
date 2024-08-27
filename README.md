Name      : M Sivananthan 
<BR>
Company: CODTECH IT SOLUTIONS
<BR>
Intern ID : CT08DS6401
<BR>
Domain  : SQL
<BR>
Duration: Augest to September 2024
<BR>
Mentor : Muzammil Ahmed


---

<h1>Online Retail Store Database<\h1>

This repository contains the database design and SQL queries for an online retail store, focusing on managing products, customers, orders, and payments. The project includes complex queries and a robust database design to support comprehensive retail operations.

## Table of Contents

- [Introduction](#introduction)
- [Project Objectives](#project-objectives)
- [Features](#features)
- [Database Schema](#database-schema)
- [Installation](#installation)
- [Usage](#usage)
- [SQL Queries](#sql-queries)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

## Introduction

The Online Retail Store Database is developed to handle the complexities of managing an online retail business. It includes a well-designed schema for storing and managing information about products, customers, orders, and payments. This project is ideal for developers and students interested in understanding advanced database concepts and SQL queries.

## Project Objectives

- Design a comprehensive database schema for an online retail store.
- Implement tables for products, customers, orders, and payments.
- Develop SQL queries to manage customer orders and payment processing.
- Enable complex queries to extract meaningful insights and generate reports.

## Features

- **Customer Management**: Store and retrieve customer information, including order history and payment records.
- **Product Catalog**: Maintain a detailed catalog of products with pricing, stock levels, and categories.
- **Order Processing**: Efficiently handle order placements, updates, and tracking.
- **Payment Processing**: Securely store and process payment transactions.
- **Advanced Queries**: Perform complex queries for reporting and analysis.

## Database Schema

The database schema consists of the following primary tables:

1. **Customers**
   - `customer_id` (Primary Key)
   - `name`
   - `email`
   - `phone`
   - `address`
   - `created_at`
   - `updated_at`
   <img src="Screenshot (180).png">

2. **Products**
   - `product_id` (Primary Key)
   - `name`
   - `category`
   - `price`
   - `stock_quantity`
   - `description`
   - `created_at`
   - `updated_at`
   <img src="Screenshot (181).png">

3. **Orders**
   - `order_id` (Primary Key)
   - `customer_id` (Foreign Key)
   - `order_date`
   - `status`
   - `total_amount`

   <img src="Screenshot (182).png">
4. **OrderItems**
   - `order_item_id` (Primary Key)
   - `order_id` (Foreign Key)
   - `product_id` (Foreign Key)
   - `quantity`
   - `price`
   <img src="Screenshot (183).png">
5. **Payments**
   - `payment_id` (Primary Key)
   - `order_id` (Foreign Key)
   - `payment_date`
   - `amount`
   - `payment_method`
   <img src="Screenshot (184).png">

## Installation

Follow these steps to set up the database on your local environment:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/online-retail-store-database (https://github.com/MSivananthan/CODTECH-TASK03).git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd online-retail-store-database
   ```

3. **Set up the database**:
   - Ensure you have a running instance of MySQL or PostgreSQL.
   - Create a new database:
     ```sql
     CREATE DATABASE retail_store;
     ```

4. **Import the database schema**:
   - Use the provided SQL script to create tables and relationships:
     ```sql
     mysql -u username -p retail_store < schema.sql
     ```
     Or for PostgreSQL:
     ```sql
     psql -U username -d retail_store -f schema.sql
     ```

5. **Load sample data** (optional):
   - Insert sample data to test the database:
     ```sql
     mysql -u username -p retail_store < sample_data.sql
     ```
     Or for PostgreSQL:
     ```sql
     psql -U username -d retail_store -f sample_data.sql
     ```

## Usage

This database serves as a backend for managing an online retail store. It supports operations like customer management, order processing, and payment handling. The SQL queries provided can be used to perform various tasks and extract insights.

## SQL Queries

Here are some sample SQL queries included in the project:

- **Place a new order**:
  ```sql
  INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES (?, ?, ?, ?);
  ```
 <img src="Screenshot (185).png">

- **Process a payment**:
  ```sql
  INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (?, ?, ?, ?);
  ```
 <img src="Screenshot (186).png">
 
- **Retrieve customer order history**:
  ```sql
  SELECT Orders.order_id, Orders.order_date, Orders.total_amount
  FROM Orders
  WHERE Orders.customer_id = ?;
  ```
  <img src="Screenshot (187).png">

- **Calculate total sales by product**:
  ```sql
  SELECT Products.name, SUM(OrderItems.quantity * OrderItems.price) AS total_sales
  FROM OrderItems
  JOIN Products ON OrderItems.product_id = Products.product_id
  GROUP BY Products.name;
  ```
  <img src="Screenshot (188).png">
  <img src="Screenshot (189).png">
  <img src="Screenshot (190).png">
  <img src="Screenshot (191).png">
 

## Contributing

Contributions are welcome to enhance this project. To contribute:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch-name`.
3. Make your changes and commit them: `git commit -m 'Add new feature'`.
4. Push to the branch: `git push origin feature-branch-name`.
5. Submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact

For questions, suggestions, or feedback, please contact us at:

- **Name**: M Sivananthan
- **Email**: sivananthan46m.com
- **LinkedIn**: [linkdin/sivananathanm](www.linkedin.com/in/sivananthanm)


## Acknowledgments

We extend our gratitude to the open-source community for their invaluable tools and resources. Special thanks to contributors and database enthusiasts who continually work to improve database technologies and practices.

