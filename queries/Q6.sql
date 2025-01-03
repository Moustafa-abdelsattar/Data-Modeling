--What is the frequency of purchase on each state?
SELECT 
    u.customer_state AS state, 
    COUNT(o.order_id) AS Purchase_Frequency
FROM 
    fact_orders o
JOIN 
	dim_users u
ON 
	o.user_name=u.user_name
GROUP BY 
    u.customer_state
ORDER BY 
    Purchase_Frequency DESC;
