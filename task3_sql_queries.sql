SELECT * 
FROM customers
WHERE country = 'India'
ORDER BY name;

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

SELECT c.name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o 
ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE total_amount > 50000
);

SELECT AVG(total_amount) AS average_revenue
FROM orders;

CREATE VIEW customer_order_summary AS
SELECT c.name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;