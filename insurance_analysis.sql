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