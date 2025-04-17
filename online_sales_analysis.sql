-- Create the database
DROP DATABASE IF EXISTS online_sales;
CREATE DATABASE online_sales;
USE online_sales;

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    product_id INT NOT NULL
);

-- Change delimiter to create a procedure
DELIMITER $$

-- Stored procedure to generate 1000 rows from Jan 2023 to Dec 2024
CREATE PROCEDURE generate_sample_data()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE fixed_start_date DATE DEFAULT '2023-01-01';
    DECLARE random_amount DECIMAL(10,2);
    DECLARE random_product_id INT;
    DECLARE next_date DATE;

    WHILE i < 1000 DO
        SET random_amount = ROUND(RAND() * (500 - 10) + 10, 2);  -- Amount between 10 and 500
        SET random_product_id = FLOOR(RAND() * 50) + 1;          -- Product ID between 1 and 50
        SET next_date = DATE_ADD(fixed_start_date, INTERVAL i DAY);  -- Ensures date range up to 2025

        IF next_date <= '2024-12-31' THEN
            INSERT INTO orders (order_date, amount, product_id)
            VALUES (next_date, random_amount, random_product_id);
        END IF;

        SET i = i + 1;
    END WHILE;
END $$

-- Reset delimiter
DELIMITER ;

-- Call the procedure to insert the data
CALL generate_sample_data();

SELECT * FROM orders;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
WHERE
    order_date BETWEEN '2023-01-01' AND '2024-12-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;
