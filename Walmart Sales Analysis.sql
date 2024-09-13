CREATE DATABASE WALMARTSALES
USE WALMARTSALES
SELECT * FROM Sales
-------------------------- create the time_of_day column----------------------------------------------------------------
SELECT
    [time],
    (CASE
        WHEN [time] BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN [time] BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM sales;
ALTER TABLE sales ADD time_of_day VARCHAR(20);
UPDATE sales
SET time_of_day = (
    CASE
        WHEN [time] BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN [time] BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
);
------------------------------------------------- create day_name column -----------------------------------------------
SELECT
    date,
    DATENAME(WEEKDAY, date) AS day_name
FROM sales;
ALTER TABLE sales ADD  day_name VARCHAR(10);

UPDATE sales
SET day_name = DATENAME(WEEKDAY, date);

------------------------------------------------ create month_name column------------------------------------------------
SELECT
    date,
    DATENAME(MONTH, date) AS month_name
FROM sales;
ALTER TABLE sales ADD month_name VARCHAR(10);

UPDATE sales
SET month_name = DATENAME(MONTH, date);