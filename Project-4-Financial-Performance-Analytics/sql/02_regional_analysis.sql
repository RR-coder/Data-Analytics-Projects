-- Revenue by Region

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Revenue
FROM finance_analytics
GROUP BY Region
ORDER BY Revenue DESC;


-- Profit by Region

SELECT
    Region,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY Region
ORDER BY Profit DESC;


-- Profit Margin by Region

SELECT
    Region,
    ROUND(
        (SUM(Profit) / SUM(Sales))*100,
        2
    ) AS Profit_Margin
FROM finance_analytics
GROUP BY Region
ORDER BY Profit_Margin DESC;