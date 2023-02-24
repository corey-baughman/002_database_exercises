use farmers_market;

SELECT * FROM customer AS c
RIGHT JOIN customer_purchases AS cp
ON c.customer_id = cp.customer_id;

SELECT * FROM customer_purchases AS cp
LEFT JOIN customer AS c
ON c.customer_id = cp.customer_id;