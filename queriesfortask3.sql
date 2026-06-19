CREATE DATABASE task3;
USE task3;
SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales,
    SUM(Profit) AS Monthly_Profit
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;
SELECT
    t1.Month,
    t1.Monthly_Sales,
    ROUND(
        (t1.Monthly_Sales - t2.Monthly_Sales)
        / t2.Monthly_Sales * 100,2
    ) AS Growth_Percentage
FROM
(
    SELECT MONTH(Order_Date) Month,
           SUM(Sales) Monthly_Sales
    FROM orders
    GROUP BY Month
) t1
JOIN
(
    SELECT MONTH(Order_Date) Month,
           SUM(Sales) Monthly_Sales
    FROM orders
    GROUP BY Month
) t2
ON t1.Month=t2.Month+1;
SELECT
    Order_ID,
    Sales,
    CASE
        WHEN Sales > 1000 THEN 'High Value'
        WHEN Sales BETWEEN 500 AND 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Order_Type
FROM orders;
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
HAVING Total_Profit < 10000;
DESC orders;
DESC customers;
ALTER TABLE customers
CHANGE COLUMN `ï»¿Customer ID` Customer_ID TEXT;
SELECT
    c.Region,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
HAVING Total_Profit < 10000;
SELECT
    c.Region,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
HAVING Total_Profit < 10000;
SELECT
    c.Region,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region;
SELECT
    c.Region,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Profit ASC;
