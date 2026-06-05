-- =====================================================
-- HR ANALYTICS PROJECT
-- Employee Attrition Analysis
-- Author: Rishu Raj
-- =====================================================


-- =====================================================
-- QUERY 1: View Sample Employee Records
-- Business Purpose:
-- Understand dataset structure and validate data.
-- =====================================================

SELECT *
FROM employees
LIMIT 10;



-- =====================================================
-- QUERY 2: Total Employees
-- Business Purpose:
-- Determine overall workforce size.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM employees;



-- =====================================================
-- QUERY 3: Overall Attrition Rate
-- Business Purpose:
-- Calculate percentage of employees who left.
-- =====================================================

SELECT
ROUND(
100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate
FROM employees;



-- =====================================================
-- QUERY 4: Department-wise Attrition Analysis
-- Business Purpose:
-- Identify departments with highest employee turnover.
-- =====================================================

SELECT
Department,
COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY Department

ORDER BY attrition_rate DESC;



-- =====================================================
-- QUERY 5: Job Role Attrition Analysis
-- Business Purpose:
-- Identify job roles with highest attrition risk.
-- =====================================================

SELECT
JobRole,
COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY JobRole

ORDER BY attrition_rate DESC;



-- =====================================================
-- QUERY 6: Overtime Impact on Attrition
-- Business Purpose:
-- Measure effect of overtime on employee turnover.
-- =====================================================

SELECT
OverTime,
COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY OverTime;



-- =====================================================
-- QUERY 7: Job Satisfaction Analysis
-- Business Purpose:
-- Understand relationship between satisfaction
-- and employee attrition.
-- =====================================================

SELECT
JobSatisfaction,
COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY JobSatisfaction

ORDER BY JobSatisfaction;



-- =====================================================
-- QUERY 8: Salary Band Analysis
-- Business Purpose:
-- Determine whether lower salaries contribute
-- to attrition.
-- =====================================================

SELECT

CASE
WHEN MonthlyIncome < 3000 THEN 'Low Salary'
WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Salary'
ELSE 'High Salary'
END AS SalaryBand,

COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY SalaryBand

ORDER BY attrition_rate DESC;



-- =====================================================
-- QUERY 9: Age Band Attrition Analysis
-- Business Purpose:
-- Identify employee age groups with highest risk.
-- =====================================================

SELECT

CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
ELSE '50+'
END AS AgeBand,

COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY AgeBand

ORDER BY attrition_rate DESC;



-- =====================================================
-- QUERY 10: Tenure Band Analysis
-- Business Purpose:
-- Analyze attrition across employee tenure groups.
-- =====================================================

SELECT

CASE
WHEN YearsAtCompany <= 2 THEN '0-2 Years'
WHEN YearsAtCompany <= 5 THEN '3-5 Years'
WHEN YearsAtCompany <= 10 THEN '6-10 Years'
ELSE '10+ Years'
END AS TenureBand,

COUNT(*) AS employees,

ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS attrition_rate

FROM employees

GROUP BY TenureBand

ORDER BY attrition_rate DESC;



-- =====================================================
-- QUERY 11: High-Risk Employee Identification
-- Business Purpose:
-- Identify employees with multiple attrition
-- risk factors.
-- =====================================================

SELECT
EmployeeNumber,
Age,
JobRole,
MonthlyIncome,
OverTime,
JobSatisfaction

FROM employees

WHERE OverTime = 'Yes'
AND JobSatisfaction <= 2

ORDER BY MonthlyIncome;



-- =====================================================
-- QUERY 12: Average Salary by Department
-- Business Purpose:
-- Compare compensation across departments.
-- =====================================================

SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS avg_salary

FROM employees

GROUP BY Department

ORDER BY avg_salary DESC;