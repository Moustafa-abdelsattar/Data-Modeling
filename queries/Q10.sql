SELECT 
    u.customer_state AS state,
    ROUND(AVG(ABS(EXTRACT(EPOCH FROM (delivered_date - estimated_time_delivery)) / 86400)), 2) AS avg_delivery_difference_days,
    CASE 
        WHEN AVG(EXTRACT(EPOCH FROM (delivered_date - estimated_time_delivery)) / 86400) > 0 THEN 'Late'
        ELSE 'Early'
    END AS delivery_status
FROM 
    fact_orders o
JOIN 
    dim_users u ON o.user_name = u.user_name
WHERE 
    delivered_date IS NOT NULL 
    AND estimated_time_delivery IS NOT NULL
GROUP BY 
    u.customer_state

