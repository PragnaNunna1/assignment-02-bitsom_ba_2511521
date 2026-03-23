--- TABLES CREATION ---
-- CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- SALES REPRESENTATIVES
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- ORDER ITEMS (to handle multiple products per order)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


--- INSERTING EXAMPLE ROWS TO NEW TABLES ---
-- CUSTOMERS
INSERT INTO customers VALUES
('C001','Rahul','rahul@gmail.com','Mumbai'),
('C002','Priya','priya@gmail.com','Delhi'),
('C003','Amit','amit@gmail.com','Mumbai'),
('C004','Neha','neha@gmail.com','Bangalore'),
('C005','Ravi','ravi@gmail.com','Chennai');

-- PRODUCTS
INSERT INTO products VALUES
('P001','Laptop','Electronics',50000),
('P002','Phone','Electronics',25000),
('P003','Shoes','Fashion',3500),
('P004','Watch','Accessories',6000),
('P005','Bag','Accessories',2000);

-- SALES REPS
INSERT INTO sales_reps VALUES
('S001','Arjun','arjun@company.com','Delhi Office'),
('S002','Kiran','kiran@company.com','Mumbai HQ'),
('S003','Rohit','rohit@company.com','Bangalore Office'),
('S004','Meena','meena@company.com','Chennai Office'),
('S005','Anil','anil@company.com','Hyderabad Office');

-- ORDERS
INSERT INTO orders VALUES
('O001','C001','S001','2024-01-10'),
('O002','C002','S002','2024-01-11'),
('O003','C003','S003','2024-01-12'),
('O004','C004','S004','2024-01-13'),
('O005','C005','S005','2024-01-14');

-- ORDER ITEMS
INSERT INTO order_items (order_id, product_id, quantity) VALUES
('O001','P001',1),
('O002','P002',2),
('O003','P003',3),
('O004','P004',1),
('O005','P005',2);