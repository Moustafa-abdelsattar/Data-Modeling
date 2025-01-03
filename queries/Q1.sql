--When is the peak season of our ecommerce ?
SELECT 
    TO_CHAR(order_date, 'Month') AS month, 
    EXTRACT(MONTH FROM order_date) AS month_number,
    COUNT(order_id) AS total_orders
FROM 
    fact_orders
GROUP BY 
    TO_CHAR(order_date, 'Month'), 
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    total_orders DESC;
