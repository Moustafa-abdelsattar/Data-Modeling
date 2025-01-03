--How many installment is usually done when paying in the ecommerce?
SELECT 
    ROUND(AVG(payment_installments)::NUMERIC, 2) AS average_installments
FROM 
    fact_orders;
