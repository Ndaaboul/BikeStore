-- Find the number of customers in each state
SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieve each customer's order history, including total orders and total amount spent
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS order_count, ROUND(SUM(oi.quantity * oi.list_price), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Calculate total sales for each store
SELECT s.store_name, SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_name
ORDER BY total_sales DESC

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Analyze monthly sales trends by year and month
SELECT DATEPART(YEAR, order_date) AS year, DATEPART(MONTH, order_date) AS month, ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY DATEPART(YEAR, order_date), DATEPART(MONTH, order_date)
ORDER BY year, month

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Identify best-selling products based on quantity sold
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Display inventory levels of products at each store
SELECT s.store_name, p.product_name, st.quantity
FROM stocks st
JOIN stores s ON st.store_id = s.store_id
JOIN products p ON st.product_id = p.product_id
ORDER BY s.store_name, p.product_name

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Calculate total sales made by each staff member
SELECT st.first_name, st.last_name, ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS total_sales
FROM staffs st
JOIN orders o ON st.staff_id = o.staff_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY st.first_name, st.last_name
ORDER BY total_sales DESC

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Count the number of orders handled by each staff member
SELECT st.first_name, st.last_name, COUNT(o.order_id) AS orders_handled
FROM staffs st
JOIN orders o ON st.staff_id = o.staff_id
GROUP BY st.first_name, st.last_name
ORDER BY orders_handled DESC

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Determine minimum stock level needed for products at each store
SELECT 
    st.store_name, 
    pr.product_name,
    SUM(oi.quantity) AS total_sales_quantity,
    SUM(oi.quantity * p.list_price) AS total_sales_amount,
    s.total_quantity AS actual_inventory_level,
    CASE 
        WHEN (s.total_quantity - COALESCE(avg_sales.avg_sales_quantity, 0)) < 0 THEN 0 
        ELSE (s.total_quantity - COALESCE(avg_sales.avg_sales_quantity, 0)) 
    END AS min_stock_needed
FROM (
    SELECT store_id, product_id, SUM(quantity) AS total_quantity
    FROM stocks
    GROUP BY store_id, product_id
) AS s
JOIN stores st ON s.store_id = st.store_id
JOIN products pr ON s.product_id = pr.product_id
LEFT JOIN (
    SELECT 
        oi.product_id, 
        o.store_id, 
        AVG(oi.quantity) AS avg_sales_quantity
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY oi.product_id, o.store_id
) AS avg_sales ON s.product_id = avg_sales.product_id AND s.store_id = avg_sales.store_id
LEFT JOIN order_items oi ON s.product_id = oi.product_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY st.store_name, pr.product_name, s.total_quantity, avg_sales.avg_sales_quantity