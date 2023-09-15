UML

Entities:
Client
Attributes: ID (Primary Key), Name, Address, Phone, Email
Associations: One-to-Many with Order History
Menu Item
Attributes: ID (Primary Key), Name, Description, Price
Associations: Many-to-Many with Order (a menu item can be in multiple orders, and an order can contain multiple menu items)
Delivery Person
Attributes: ID (Primary Key), Name, Phone
Associations: One-to-Many with Order (a delivery person can deliver multiple orders)
Order
Attributes: ID (Primary Key), Order Date, Estimated Delivery Time, Status
Associations: Many-to-One with Client, Many-to-Many with Menu Item, Many-to-One with Delivery Person




Tables Database : 

clients table with columns: client_id, name, address, phone, email
menu_items table with columns: menu_item_id, name, description, price
delivery_people table with columns: delivery_person_id, name, phone
orders table with columns: order_id, order_date, estimated_delivery_time, status, client_id, delivery_person_id
order_menu_items table (junction table for the many-to-many relationship between orders and menu_items) with columns: order_id, menu_item_id

SQL Script : 

-- Create the ExpressFood database
CREATE DATABASE ExpressFood;

-- Use the ExpressFood database
USE ExpressFood;

-- Create the clients table
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY, (VARCHAR too)
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(255)
);

-- Create the menu_items table
CREATE TABLE menu_items (
    menu_item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Create the delivery_people table
CREATE TABLE delivery_people (
    delivery_person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15)
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL,
    estimated_delivery_time DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    client_id INT NOT NULL,
    delivery_person_id INT,
    FOREIGN KEY (client_id) REFERENCES clients (client_id),
    FOREIGN KEY (delivery_person_id) REFERENCES delivery_people (delivery_person_id)
);

-- Create the order_menu_items table (junction table for the many-to-many relationship)
CREATE TABLE order_menu_items (
    order_id INT,
    menu_item_id INT,
    PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);

/* DETAILS: 

Clients Table:
Purpose: The clients table stores information about ExpressFood clients or customers who place orders for meals.
Fields:
client_id: A unique identifier for each client (primary key).
name: The name of the client.
address: The client's address.
phone: The client's phone number.
email: The client's email address.
Menu Items Table:
Purpose: The menu_items table contains details about the different daily menu items offered by ExpressFood.
Fields:
menu_item_id: A unique identifier for each menu item (primary key).
name: The name of the menu item.
description: A description of the menu item.
price: The price of the menu item.
Delivery People Table:
Purpose: The delivery_people table stores information about the delivery personnel who bike the food to the customers' residences.
Fields:
delivery_person_id: A unique identifier for each delivery person (primary key).
name: The name of the delivery person.
phone: The phone number of the delivery person.
Orders Table:
Purpose: The orders table keeps track of customer orders, including order details and delivery information.
Fields:
order_id: A unique identifier for each order (primary key).
order_date: The date and time when the order was placed.
estimated_delivery_time: The estimated time for the meal's delivery.
status: The status of the order (e.g., Pending, Delivered).
client_id: A foreign key linking the order to the client who placed it.
delivery_person_id: A foreign key linking the order to the delivery person responsible for the delivery.
Order Menu Items Table (Junction Table):
Purpose: The order_menu_items table is a junction table that facilitates the many-to-many relationship between orders and menu items. It allows associating multiple menu items with each order.
Fields:
order_id: A foreign key referencing the order to which menu items belong.
menu_item_id: A foreign key referencing the menu items included in the order.
The combination of order_id and menu_item_id forms the primary key to ensure uniqueness.


SYNTHAXE POUR CREER DES TABLES : 

INSERT INTO clients (client_id, name , address, phone, email) VALUES (1, "test name", "test add", "228282829", "test@mail.com");

WEBSITE : https://www.w3schools.com/mysql/mysql_insert.asp

node

Install MySQL 

create a folder from terminal 
Create a seed file with .sql ending
Copy and paset 3 - 5 insert statements for the table or multiple tables
Get the path of that file
run the seed file using the source command
https://dev.mysql.com/doc/refman/8.0/en/mysql-batch-commands.html

*/ 

INSERT INTO clients (name, address, phone, email) VALUES
    ('John Doe', '123 Main Street', '555-123-4567', 'john@example.com'),
    ('Alice Smith', '456 Elm Avenue', '555-987-6543', 'alice@example.com'),
    ('Bob Johnson', '789 Oak Road', '555-111-2222', 'bob@example.com'),
    ('Eva Martinez', '567 Pine Lane', '555-333-4444', 'eva@example.com'),
    ('Michael Lee', '890 Cedar Drive', '555-555-5555', 'michael@example.com'),
    ('Sara Wilson', '234 Birch Street', '555-777-8888', 'sara@example.com'),
    ('Daniel Brown', '678 Redwood Avenue', '555-999-0000', 'daniel@example.com'),
    ('Sophia Davis', '456 Spruce Lane', '555-222-3333', 'sophia@example.com'),
    ('William Wilson', '987 Elm Street', '555-444-5555', 'william@example.com'),
    ('Emma Harris', '123 Maple Road', '555-666-7777', 'emma@example.com');

INSERT INTO delivery_people (name, phone) VALUES
    ('David Miller', '555-111-2222'),
    ('Maria Sanchez', '555-333-4444'),
    ('James Clark', '555-555-5555'),
    ('Olivia Turner', '555-777-8888'),
    ('Daniel Brown', '555-999-0000');

INSERT INTO menu_items (name, description, price) VALUES
    ('Spaghetti Bolognese', 'Classic Italian pasta dish', 12.99),
    ('Chicken Caesar Salad', 'Fresh greens with grilled chicken', 10.49);
