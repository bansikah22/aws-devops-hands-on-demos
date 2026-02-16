Project: FeliniFoods – Food Delivery Website Database
DIT Database Project
Goal: Build a simple relational database for a food delivery platform where customers place orders for combo meals (pre-packaged food sets).
Tables & Structure (Relational Design)

Customers (Stores user information)
customer_id → PK (INT, AUTO_INCREMENT)
name → VARCHAR(100) NOT NULL
address → VARCHAR(255) NOT NULL
contact → VARCHAR(50) NOT NULL (e.g., phone or email)

Combos (or "ComboMeals" – Pre-defined meal combos available for order)
combo_id → PK (INT, AUTO_INCREMENT)
name → VARCHAR(100) NOT NULL (e.g., "Chicken Delight Combo")
price → DECIMAL(10,2) NOT NULL
(Optional: description, image_url, etc.)

Orders (Records each customer's order)
order_id → PK (INT, AUTO_INCREMENT)
combo_id → FK REFERENCES Combos(combo_id)
customer_id → FK REFERENCES Customers(customer_id)
order_time → DATETIME NOT NULL (when the order was placed)


Relationships (Crow's Foot Notation Summary)

One-to-Many between Customers and Orders:
One customer can place many orders
Each order belongs to one customer
Cardinality: Customers (1) → Orders (many) → Symbol: ||------o< (or similar: one mandatory to zero-or-many)

One-to-Many between Combos and Orders:
One combo can be ordered many times
Each order is for one combo (simple model – no quantity or multiple items per order yet)
Cardinality: Combos (1) → Orders (many) → Symbol: ||------o<


This is a classic one-to-many setup on both sides (no many-to-many yet, keeping it simple like your notes).
ERD Visual Examples (similar food delivery / ordering systems in Crow's Foot notation):
```mermaid
erDiagram
    CUSTOMERS ||--|{ ORDERS : "places"
    COMBOS ||--|{ ORDERS : "contains"

    CUSTOMERS {
        int customer_id PK
        varchar(100) name
        varchar(255) address
        varchar(50) contact
    }

    COMBOS {
        int combo_id PK
        varchar(100) name
        decimal(10,2) price
    }

    ORDERS {
        int order_id PK
        int combo_id FK
        int customer_id FK
        datetime order_time
    }
```




Your project matches the pattern: Customer places Order → Order references Combo (like Product/Menu item).
SQL Creation Script (MySQL – Putting It All Together)
SQL-- Create the database
CREATE DATABASE felinifoods;
USE felinifoods;

-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact VARCHAR(50) NOT NULL
);

-- Combos table
CREATE TABLE Combos (
    combo_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Orders table (with foreign keys)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    combo_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (combo_id) REFERENCES Combos(combo_id)
        ON DELETE RESTRICT,          -- Don't allow deleting a combo if orders exist
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE            -- If customer deleted, remove their orders
);
Next Steps for the Project (Using What We've Learned)

Insert Sample Data (CRUD – Create)SQLINSERT INTO Customers (name, address, contact) 
VALUES ('Tandap', 'Douala City Center', '+237 123 456 789');

INSERT INTO Combos (name, price) 
VALUES ('Catfish & Plantain Combo', 4500.00),
       ('Jollof Rice Special', 3500.00);

INSERT INTO Orders (customer_id, combo_id) 
VALUES (1, 1), (1, 2);
Query Examples (Read + Join + Filter/Sort)
All orders with customer & combo details:SQLSELECT o.order_id, c.name AS customer, cm.name AS combo, cm.price, o.order_time
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Combos cm ON o.combo_id = cm.combo_id
ORDER BY o.order_time DESC
LIMIT 5;
Most recent orders first (like your previous notes):SQLSELECT * FROM Orders ORDER BY order_time DESC LIMIT 3;

Improvements You Can Add Later
Add quantity to Orders (if one order can have multiple combos → many-to-many with junction table)
Add status (pending, delivered, etc.)
Add delivery partner table
Indexes on order_time, customer_id for faster queries
MongoDB version if you want NoSQL (embed combos in orders)


This is a solid, functional starting schema — exactly the kind of one-to-many relational design we've practiced with mratube. Great choice for a DIT project!