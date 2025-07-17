-- 1) Switch to your target database
create database HrAnalytics
USE HrAnalytics;
GO

-- 2) Drop table if exists (optional)
IF OBJECT_ID(N'dbo.HR_Attrition_Unclean', N'U') IS NOT NULL
    DROP TABLE dbo.HR_Attrition_Unclean;
GO

-- 3) Create table with all columns as VARCHAR(MAX)
CREATE TABLE dbo.HR_Attrition_Unclean (
    EmployeeID               VARCHAR(MAX),
    Age                      VARCHAR(MAX),
    Department               VARCHAR(MAX),
    Education                VARCHAR(MAX),
    JobRole                  VARCHAR(MAX),
    Gender                   VARCHAR(MAX),
    MonthlyIncome            VARCHAR(MAX),
    DateOfJoining            VARCHAR(MAX),
    OverTime                 VARCHAR(MAX),
    BusinessTravel           VARCHAR(MAX),
    MaritalStatus            VARCHAR(MAX),
    YearsAtCompany           VARCHAR(MAX),
    DistanceFromHome         VARCHAR(MAX),
    PerformanceRating        VARCHAR(MAX),
    TrainingTimesLastYear    VARCHAR(MAX),
    JobSatisfaction          VARCHAR(MAX),
    WorkLifeBalance          VARCHAR(MAX),
    EnvironmentSatisfaction  VARCHAR(MAX),
    YearsSinceLastPromotion  VARCHAR(MAX),
    YearsWithCurrManager     VARCHAR(MAX),
    JobInvolvement           VARCHAR(MAX),
    Attrition                VARCHAR(MAX),
    StockOptionLevel         VARCHAR(MAX),
    PercentSalaryHike        VARCHAR(MAX),
    TotalWorkingYears        VARCHAR(MAX)
);
GO

-- 4) Bulk-load the CSV file
--    Ensure the SQL Server service account has read access to the file path below.
BULK INSERT dbo.HR_Attrition_Unclean
FROM N'C:\Data  Analytics\data analytics 2025\Sql Project\Hr Attrition\unclean_hr_attrition_dataset.csv'
WITH
(
    FIRSTROW            = 2,           -- skip header row
    FIELDTERMINATOR     = ',',         -- CSV delimiter
    ROWTERMINATOR       = '0x0a',      -- newline
    CODEPAGE            = '65001',      -- UTF-8
    DATAFILETYPE        = 'char',
    KEEPNULLS                          -- preserve empty strings as NULL
);
GO

-- 5) Verify
SELECT TOP 10 * FROM dbo.HR_Attrition_Unclean;
