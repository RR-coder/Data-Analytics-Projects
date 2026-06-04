-- Total Transactions
SELECT COUNT(*) AS total_transactions
FROM upi_fraud_transactions;

-- Fraud Transactions
SELECT SUM(fraud_flag) AS fraud_transactions
FROM upi_fraud_transactions;

-- Fraud Rate
SELECT
ROUND(
100.0 * SUM(fraud_flag) / COUNT(*),
2
) AS fraud_rate
FROM upi_fraud_transactions;

-- Top Fraud Cities
SELECT
city,
SUM(fraud_flag) AS fraud_cases
FROM upi_fraud_transactions
GROUP BY city
ORDER BY fraud_cases DESC;

-- Fraud by Payment Method
SELECT
payment_method,
SUM(fraud_flag) AS fraud_cases
FROM upi_fraud_transactions
GROUP BY payment_method
ORDER BY fraud_cases DESC;

-- Top Risk Merchants
SELECT
merchant_id,
SUM(risk_score) AS total_risk
FROM upi_fraud_transactions
GROUP BY merchant_id
ORDER BY total_risk DESC
LIMIT 10;

-- Fraud By Hour
SELECT
hour_of_day,
SUM(fraud_flag) AS fraud_cases
FROM upi_fraud_transactions
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- High Risk Transactions
SELECT COUNT(*)
FROM upi_fraud_transactions
WHERE risk_level='High';