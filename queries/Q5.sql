-- What is the average spending time for user for our ecommerce?
SELECT 
    ROUND(AVG(EXTRACT(EPOCH FROM (delivered_date - order_date)) / 3600), 2) AS average_spending_time_hours,
	ROUND(AVG(EXTRACT(EPOCH FROM (delivered_date - order_date)) / 3600/24), 2) AS average_spending_time_days
FROM 
    fact_orders
WHERE 
    delivered_date IS NOT NULL 
    AND order_date IS NOT NULL;
