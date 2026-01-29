CREATE TABLE IF NOT EXISTS ecommerce_orders (
    order_id INT PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    product VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);