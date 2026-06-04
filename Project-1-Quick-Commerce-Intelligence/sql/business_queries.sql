-- Total Revenue
SELECT
SUM(final_amount) AS total_revenue
FROM quick_commerce;

-- Total Orders
SELECT
COUNT(order_id) AS total_orders
FROM quick_commerce;

-- Average Delivery Time
SELECT
ROUND(AVG(delivery_time),2) AS avg_delivery_time
FROM quick_commerce;

-- Revenue by City
SELECT
city,
SUM(final_amount) AS revenue
FROM quick_commerce
GROUP BY city
ORDER BY revenue DESC;

-- Orders by Hour
SELECT
order_hour,
COUNT(order_id) AS total_orders
FROM quick_commerce
GROUP BY order_hour
ORDER BY order_hour;

-- Peak Hour Analysis
SELECT
CASE
WHEN order_hour BETWEEN 8 AND 10 THEN 'Morning Peak'
WHEN order_hour BETWEEN 13 AND 14 THEN 'Afternoon Peak'
WHEN order_hour BETWEEN 19 AND 21 THEN 'Evening Peak'
ELSE 'Non Peak'
END AS peak_period,
COUNT(order_id) AS orders_count
FROM quick_commerce
GROUP BY peak_period;