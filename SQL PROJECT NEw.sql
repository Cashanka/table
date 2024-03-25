create database Sales_Management;
use Sales_Management;

-- Table for customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Table for sales representatives
CREATE TABLE SalesRepresentatives (
    representative_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_information VARCHAR(255)
);


-- Table for sales transactions
CREATE TABLE SalesTransactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    customer_id INT,
    product_id INT,
    quantity_sold INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);




	INSERT INTO Customers (customer_id, name, email, address) VALUES
    (1, 'Adesewa Adekunle', 'adesewa@gmail.com', '1 ABC Street, Lagos'),
    (2, 'Olumide Bakare', 'olumide@gmail.com', '2 XYZ Avenue, Abuja'),
    (3, 'Tolulope Lawal', 'tolulope@gmail.com', '3 PQR Road, Ibadan'),
    (4, 'Chinedu Okoro', 'chinedu@gmail.com', '4 LMN Close, Port Harcourt'),
    (5, 'Folake Adebayo', 'folake@gmail.com', '5 DEF Estate, Enugu'),
    (6, 'Adeola Okafor', 'adeola@gmail.com', '6 GHI Lane, Kano'),
    (7, 'Bolaji Ojo', 'bolaji@gmail.com', '7 JKL Crescent, Benin'),
    (8, 'Kemi Yusuf', 'kemi@gmail.com', '8 RST Street, Kaduna'),
    (9, 'Segun Ojo', 'segun@gmail.com', '9 UVW Avenue, Jos'),
    (10, 'Yemi Oni', 'yemi@gmail.com', '10 EFG Close, Owerri');




INSERT INTO Products (product_id, name, category, price)
VALUES
    (1, 'Soap', 'Toiletries', 10.00),
    (2, 'Toothpaste', 'Toiletries', 5.00),
    (3, 'Shampoo', 'Toiletries', 15.00),
    (4, 'Dishwasher', 'Kitchen', 20.00),
    (5, 'Laundry Detergent', 'Household Cleaning', 25.00),
    (6, 'Trash Bags', 'Household Cleaning', 8.00),
    (7, 'Broom', 'Household Cleaning', 12.00);



INSERT INTO SalesRepresentatives (representative_id, name, contact_information)
VALUES
    (1, 'Tunde Adewale', '08012345678'),
    (2, 'Bimpe Oni', '08087654321'),
    (3, 'Jide Akin', '08023456789'),
    (4, 'Nkechi Udo', '08098765432'),
    (5, 'Emeka Nwosu', '08034567890'),
    (6, 'Funke Odusanya', '08087654321'),
    (7, 'Chidi Obi', '08045678901'),
    (8, 'Bola Ajayi', '08098765432'),
    (9, 'Aisha Abdullahi', '08056789012'),
    (10, 'Segun Oladele', '08023456789');



-- Inserting data into the SalesTransactions table
INSERT INTO SalesTransactions (transaction_id, transaction_date, customer_id, product_id, quantity_sold, total_amount)
VALUES 
    (1, '2024-03-01', 1, 1, 5, 100.00),
    (2, '2024-03-02', 1, 3, 3, 75.00),
    (3, '2024-03-03', 1, 2, 2, 50.00),
    (4, '2024-03-04', 4, 5, 1, 20.00),
    (5, '2024-03-05', 5, 7, 4, 120.00),
    (6, '2024-03-06', 6, 4, 2, 60.00),
    (7, '2024-03-07', 7, 6, 3, 90.00),
    (8, '2024-03-08', 8, 1, 6, 150.00),
    (9, '2024-03-09', 9, 3, 2, 50.00),
    (10, '2024-03-10', 1, 2, 1, 25.00),
    (11, '2024-03-11', 2, 4, 3, 75.00),
    (12, '2024-03-12', 2, 5, 2, 60.00),
    (13, '2024-03-13', 4, 6, 4, 120.00),
    (14, '2024-03-14', 4, 7, 2, 60.00),
    (15, '2024-03-15', 5, 1, 3, 75.00),
    (16, '2024-03-16', 6, 2, 2, 50.00),
    (17, '2024-03-17', 7, 3, 1, 25.00),
    (18, '2024-03-18', 5, 4, 5, 125.00),
    (19, '2024-03-19', 5, 5, 2, 60.00),
    (20, '2024-03-20', 2, 6, 3, 90.00);
    
    
    -- SQL queries

-- a. Adding a new sales transaction to the system.
INSERT INTO SalesTransactions (transaction_id, transaction_date, customer_id, product_id, quantity_sold, total_amount)
VALUES (21, '2024-03-24', 1, 1, 5, 100.00);


-- b. Updating the product associated with a sales transaction.
UPDATE SalesTransactions
SET product_id = 2
WHERE transaction_id = 1;

-- c. Recording customer details for a sales transaction.
INSERT INTO Customers (customer_id, name, email, address)
VALUES (11, 'Ngozi Adekunle', 'ngozi@example.com', '123 Main Street, Lagos');

-- d. Finding the total number of sales transactions for each product category.
SELECT category, COUNT(*) AS total_transactions
FROM Products
JOIN SalesTransactions ON Products.product_id = SalesTransactions.product_id
GROUP BY category;

-- e. Retrieving the names of customers who made purchases in a specific month.
SELECT DISTINCT Customers.name
FROM Customers
JOIN SalesTransactions ON Customers.customer_id = SalesTransactions.customer_id
WHERE MONTH(SalesTransactions.transaction_date) = 3; 


