--How many late delivered order in our ecommerce? Are late order affecting the customer satisfaction?
SELECT 
    CASE 
        WHEN delivered_date > estimated_time_delivery THEN 'Late'
        ELSE 'On-Time'
    END AS delivery_status,
    ROUND(AVG(feedback_score), 2) AS average_feedback_score,
    COUNT(order_id) AS total_orders
FROM 
    fact_orders
WHERE 
    feedback_score IS NOT NULL
    AND delivered_date IS NOT NULL
    AND estimated_time_delivery IS NOT NULL
GROUP BY 
    delivery_status;
