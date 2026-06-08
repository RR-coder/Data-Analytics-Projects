-- Total Revenue

SELECT
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM finance_analytics;


-- Total Profit

SELECT
    ROUND(SUM(Profit),2) AS Total_Profit
FROM finance_analytics;


-- Profit Margin %

SELECT
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM finance_analytics;


-- Total Orders

SELECT
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM finance_analytics;


-- Average Order Value

SELECT
    ROUND(
        SUM(Sales) /
        COUNT(DISTINCT `Order ID`),
        2
    ) AS Average_Order_Value
FROM finance_analytics;