-- Which logistic route that have heavy traffic in our ecommerce?
SELECT 
    s.seller_city AS seller_city, 
    u.customer_city AS customer_city, 
    COUNT(o.order_id) AS total_orders
FROM 
    fact_orders o
JOIN 
    dim_sellers s ON o.seller_id = s.seller_id
JOIN 
    dim_users u ON o.user_name = u.user_name
GROUP BY 
    s.seller_city, u.customer_city
ORDER BY 
    total_orders DESC
LIMIT 20;
