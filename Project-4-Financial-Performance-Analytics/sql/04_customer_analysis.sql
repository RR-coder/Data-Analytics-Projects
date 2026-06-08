-- Revenue by Segment

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY Segment
ORDER BY Revenue DESC;


-- Top 10 Customers by Revenue

SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS Revenue
FROM finance_analytics
GROUP BY `Customer Name`
ORDER BY Revenue DESC
LIMIT 10;


-- Top 10 Customers by Profit

SELECT
    `Customer Name`,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY `Customer Name`
ORDER BY Profit DESC
LIMIT 10;


-- Customer Count by Segment

SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Customers
FROM finance_analytics
GROUP BY Segment;