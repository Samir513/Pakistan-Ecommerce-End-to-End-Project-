------ Creates a new database to hold our project data.
--CREATE DATABASE PakistanEcommerce2

-------------------------------------------------------
---- 1.2: Define the Table Schema
---- Switch to our new database to work inside it.
--USE PakistanEcommerce2;
--GO

---- Create the main table with robust data types to prevent import errors.
--CREATE TABLE SalesData (
--    Item_ID BIGINT,                      -- Changed to BIGINT for safety
--    Status NVARCHAR(50),                 -- Use NVARCHAR for better character support
--    Created_At DATE,
--    SKU NVARCHAR(500),                   -- Increased length to prevent truncation
--    Price DECIMAL(18, 2),
--    Quantity_Ordered INT,
--    Grand_Total DECIMAL(18, 2),
--    Increment_ID NVARCHAR(50),           -- Use NVARCHAR for IDs with characters
--    Category_Name NVARCHAR(100),
--    Sales_Commission_Code NVARCHAR(500), -- Increased length to prevent truncation
--    Discount_Amount DECIMAL(18, 2),
--    Payment_Method NVARCHAR(50),
--    Working_Date DATE,
--    BI_Status NVARCHAR(50),
--    Monthly_View DECIMAL(18, 2),
--    Year INT,
--    Month INT,
--    Customer_Since DATE,
--    M_Y NVARCHAR(20),
--    FY NVARCHAR(10),
--    Customer_ID BIGINT                   -- Changed to BIGINT for safety
--);
--GO

----------------------------------------------------
----2: Data Imported 
----------------------------------------------------
-- Check 
Select * From Sales
---------------------------------------------------
-- 1. Show the total sales (grand_total) for each year, ordered from newest to oldest

Select
    Year,
    SUM(Grand_Total) as TotalSales
From Sales
Group by Year
Order by Year desc;

------------------------------------

-- 2. Find the average discount_amount for each payment_method, for methods with more than 100 transactions.

Select
    Payment_Method,
    AVG(Discount_Amount) as AverageDiscount
From Sales
Group by Payment_Method
Having COUNT(*) > 100
Order by AverageDiscount desc;

-----------------------------------------------------------
/*
==============================================================
- Quick Fix 
============================================================== 
-- During the import wizard, Quantity_Ordered was accidentally set to nvarchar(500) instead of int */
--ALTER TABLE Sales
--ALTER COLUMN Quantity_Ordered INT;
--GO
--------------------------------------------------------------
-- 3. List the top 5 categories by total quantity ordered.

Select TOP 5
    Category_Name,
    SUM(Quantity_Ordered) as TotalQuantityOrdered
From
    Sales
Group by
    Category_Name
Order by
    TotalQuantityOrdered desc;





------------------------------------------------------------
---4.-- Requirement: Retrieve all orders where the grand_total is greater than the average grand_total of all orders.

Select
    Increment_ID,
    Grand_Total
From
    Sales
Where
    Grand_Total > (Select AVG(Grand_Total) From Sales);

------------------------------------------
-- 5.For each customer, find their first order date (MIN(created_at)) and latest order date (MAX(created_at)).

Select
    Customer_ID,
    MIN(Created_At) as FirstOrderDate,
    MAX(Created_at) as LatestOrderDate
From
    Sales
Where
    Customer_ID != 0 -- Excludes guest or unknown customers
Group by
    Customer_ID
Order by
    Customer_ID

--------------------------------------------
-- 6.Use a window function to assign a RANK() based on grand_total within each category.

Select
    Increment_ID,
    Category_Name,
    Grand_Total,
    Rank() Over(Partition by Category_Name Order by Grand_Total desc) as SalesRankInCategory
From
    Sales;
-------------------------------------------
-- 7. Show the monthly total sales for 2018 only, grouped by M-Y.

Select
    M_Y,
    SUM(Grand_Total) as MonthlySales
From
    Sales
Where
    Year = 2018
Group by
    M_Y
Order by
    MIN(Created_At); -- Sorts the months in chronological order

--------------------------------------
--8.List the increment_id and grand_total of orders with a discount greater than the average discount.

Select
    Increment_ID,
    Grand_Total,
    Discount_Amount
From
    Sales
Where
    Discount_Amount > (Select AVG(Discount_Amount) From Sales Where Discount_Amount > 0);


--------------------------------
-- 9.Show customers who joined before 2017 (Customer_Since < '2017-01-01') and made more than 5 orders.

Select
    Customer_ID,
    COUNT(Increment_ID) as NumberOfOrders,
    MIN(Customer_Since) as JoinDate
From
    Sales
Where
    Customer_Since < '2017-01-01'
Group by
    Customer_ID
Having
    COUNT(Increment_ID) > 5
Order by
    NumberOfOrders desc;

-----------------------------
-- 10.Show customers who joined before 2017 (Customer_Since < '2017-01-01') and made more than 5 orders.

Select
    Customer_ID,
    COUNT(Increment_ID) as NumberOfOrders,
    MIN(Customer_Since) as JoinDate
From
    Sales
Where
    Customer_Since < '2017-01-01'
Group by
    Customer_ID
Having
    COUNT(Increment_ID) > 5
Order by
    NumberOfOrders desc;
---------------------------------------
-- 11.Use DENSE_RANK() to rank payment methods by their total sales amount.

Select
    Payment_Method,
    SUM(Grand_Total) as TotalSales,
    Dense_Rank() Over(Order by SUM(Grand_Total) desc) as SalesRank
From
    Sales
Group by
    Payment_Method;