-- Open Database
.open restaurant.db

-- Create Table

CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS Menu (
  menu_item_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  ingredients VARCHAR(255) NOT NULL,
  PRIMARY KEY (menu_item_id)
);

CREATE TABLE IF NOT EXISTS Orders (
  order_id INT NOT NULL,
  customer_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  order_time TIME NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);

CREATE TABLE IF NOT EXISTS Payments (
  payment_id INT NOT NULL,
  order_id INT NOT NULL,
  payment_type VARCHAR(255) NOT NULL,
  payment_amount DECIMAL(10,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (order_id) REFERENCES Orders (order_id)
);

CREATE TABLE IF NOT EXISTS Employees (
  employee_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL,
  job_title VARCHAR(255) NOT NULL,
  PRIMARY KEY (employee_id)
);

-- INSERT Data in table

INSERT INTO Customers VALUES
  (1 , "John Smith", "123 Main Street", "123-456-7890", "john.smith@example.com"),
  (2 , "Jane Doe", "456 Elm Street", "456-789-0123", "jane.doe@example.com"),
  (3 , "Mike Jones", "789 Oak Street", "789-012-3456", "mike.jones@example.com"),
  (4 , "Sarah Green", "101 Pine Street", "101-234-5678", "sarah.green@example.com"),
  (5 , "David Brown", "202 Maple Street", "202-345-6789", "david.brown@example.com");


INSERT INTO Menu VALUES
  (1 , "Pizza", "A delicious pizza with tomato sauce, cheese, and your choice of toppings.", "$10.00", "Tomato sauce, cheese, pepperoni, sausage, mushrooms, onions, peppers, olives."),
  
  (2 , "Pasta", "A hearty pasta dish with your choice of sauce and protein.", "$12.00", "Pasta, tomato sauce, meatballs, chicken, shrimp, or vegetables."),
  
  (3 , "Salad", "A fresh salad with your choice of greens, vegetables, and dressing.", "$8.00", "Romaine lettuce, tomatoes, cucumbers, carrots, croutons, and your choice of dressing."),
  
  (4 , "Dessert", "A sweet treat to end your meal.", "$6.00", "Chocolate cake, cheesecake, ice cream, or cookies."),
  
  (5 , "Drinks", "A variety of drinks to quench your thirst.", "$2.00 - $5.00", " Coffee, tea, soda, juice, beer, wine, or cocktails.");

INSERT INTO Orders VALUES
  (1 , 1, "2023-06-07", "12:00 PM"),
  (2 , 2, "2023-06-07", "6:00 PM"),
  (3 , 3, "2023-06-08", "1:00 PM"),
  (4 , 4, "2023-06-08", "8:00 PM"),
  (5 , 5, "2023-06-09", "5:00 PM");

INSERT INTO Payments VALUES
  (1 , 1, "Credit card", "$50.00", "2023-06-07"),
  (2 , 2, "Cash", "$30.00", "2023-06-07"),
  (3 , 3, "Check", "$20.00", "2023-06-08"),
  (4 , 4, "Credit card", "$10.00", "2023-06-08"),
  (5 , 5, "Cash", "$5.00", "2023-06-09");

INSERT INTO Employees VALUES
  (1 , "Jane Doe", "456 Elm Street", "456-789-0123", "jane.doe@example.com","Manager"),
  (2 , "Mike Jones", "789 Oak Street", "789-012-3456", "mike.jones@example.com", "Server"),
  (3 , "Sarah Green", "101 Pine Street", "101-234-5678","sarah.green@example.com", "Cook"),
  (4 , "David Brown", "202 Maple Street", "202-345-6789", "david.brown@example.com","cashier");

-- List table in the db
.table ;

-- change display data
.mode column ;

-- (1) Aggregate functions
SELECT
  COUNT(order_id),
  MAX(payment_amount),
  MIN(payment_amount)
FROM Payments ;

-- (2) Join
SELECT 
  Orders.order_id,
  Orders.order_date,
  Payments.payment_type,
  Payments.payment_amount
FROM Orders
JOIN Payments
ON Orders.order_id = Payments.order_id;

-- (3) With (common table expression)
WITH sub1 AS (
    SELECT * FROM Customers
),  sub2 AS (
    SELECT * FROM Orders
)
SELECT 
  sub2.order_id,
  sub1.name,
  sub2.order_time,
  sub1.phone_number
FROM sub1
JOIN sub2
ON sub1.customer_id = sub2.customer_id;

-- (4) Subquery
SELECT * FROM (
SELECT payment_id, payment_type, payment_amount FROM
  (SELECT * FROM Payments)
)
WHERE payment_type = "Credit card"
