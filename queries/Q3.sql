SELECT 
    payment_type, 
    COUNT(order_id) AS total_orders
FROM 
    fact_orders
WHERE 
	payment_type IS NOT NULL
GROUP BY 
    payment_type
ORDER BY 
    total_orders DESC;
