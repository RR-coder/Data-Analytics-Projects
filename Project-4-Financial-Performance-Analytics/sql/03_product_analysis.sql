-- Category Performance

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM finance_analytics
GROUP BY Category
ORDER BY Revenue DESC;


-- Top 10 Most Profitable Products

SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;


-- Bottom 10 Products

SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY `Product Name`
ORDER BY Profit ASC
LIMIT 10;


-- Sub-Category Performance

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS Revenue,
    ROUND(SUM(Profit),2) AS Profit
FROM finance_analytics
GROUP BY `Sub-Category`
ORDER BY Profit DESC;