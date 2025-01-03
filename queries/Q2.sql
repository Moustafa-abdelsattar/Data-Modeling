--What time users are most likely make an order or using the ecommerce app?
SELECT 
    TO_CHAR(order_date, 'HH12 AM') AS hour_of_day, 
    COUNT(order_id) AS total_orders
FROM 
    fact_orders
GROUP BY 
    TO_CHAR(order_date, 'HH12 AM'), 
    EXTRACT(HOUR FROM order_date)
ORDER BY 
    total_orders DESC;

