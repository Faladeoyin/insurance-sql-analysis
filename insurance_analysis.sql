USE [Health Analytics]
GO  

-- Show all tables in the current database
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT TOP 20 * 
FROM dbo.insurance;



SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'insurance';



SELECT COUNT(*) AS TotalRows
FROM dbo.insurance;


SELECT AVG(charges) AS AverageCharges
FROM dbo.insurance

SELECT smoker, AVG(charges) AS AverageChargesBySmokers
from dbo.insurance
group by smoker;

-- 1. Average charges by smoking status and region
SELECT region, smoker, AVG(charges) AS avg_charges
FROM dbo.insurance
GROUP BY region, smoker
ORDER BY avg_charges DESC;

-- 2. Top 5 highest charges
SELECT TOP 5 *
FROM dbo.insurance
ORDER BY charges DESC;

-- 3. Correlation proxy: charges vs. age (basic trend check)
SELECT age, AVG(charges) AS avg_charges
FROM dbo.insurance
GROUP BY age
ORDER BY age;

-- 4. Gender distribution of policyholders
SELECT sex, COUNT(*) AS total
FROM dbo.insurance
GROUP BY sex;

-- 5. Average BMI by number of children
SELECT children, AVG(bmi) AS avg_bmi
FROM dbo.insurance
GROUP BY children
ORDER BY children;

-- 6. Using a window function: rank patients by charges
SELECT age, sex, charges,
       RANK() OVER (ORDER BY charges DESC) AS rank_by_charges
FROM dbo.insurance;
