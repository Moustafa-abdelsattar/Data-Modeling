-- How long are the delay for delivery / shipping process in each state?
SELECT 
    u.customer_state AS state,
    ROUND(AVG(EXTRACT(EPOCH FROM (delivered_date - pickup_date)) / 86400), 2) AS avg_shipping_time_days
FROM 
    fact_orders o
JOIN 
    dim_users u ON o.user_name = u.user_name
WHERE 
    delivered_date IS NOT NULL 
    AND estimated_time_delivery IS NOT NULL 
    AND pickup_date IS NOT NULL
GROUP BY 
    u.customer_state
ORDER BY 
    avg_shipping_time_days DESC;
