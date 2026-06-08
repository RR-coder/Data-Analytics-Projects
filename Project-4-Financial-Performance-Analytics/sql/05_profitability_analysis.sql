-- State Profitability

SELECT
    State,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY State
ORDER BY Profit DESC;


-- Revenue Growth by Year

SELECT
    Year,
    ROUND(SUM(Sales),2) AS Revenue
FROM finance_analytics
GROUP BY Year
ORDER BY Year;


-- Discount Impact

SELECT
    ROUND(Discount,2) AS Discount_Level,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM finance_analytics
GROUP BY Discount
ORDER BY Discount;


-- Orders with Negative Profit

SELECT
    `Order ID`,
    State,
    Category,
    Sales,
    Profit
FROM finance_analytics
WHERE Profit < 0
ORDER BY Profit ASC;