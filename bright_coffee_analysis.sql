-- this code is just to see whether the table has been loaded correctly and that i can read it properly

SELECT *
FROM workspace.default.bright_coffee_shop_analysis_case_study_1
LIMIT 10;

-- With this code I aim to see when the recording of the data started. They started collecting the data on 2023/01/01 
SELECT MIN(transaction_date) start_date
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

-- When was the last date they recorded the data? 2023/06/30
SELECT MAX(transaction_date) AS latest_date
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
-----------------------------------------------------------------
-- 1 Date Range Checked - 6 months
-----------------------------------------------------------------

-------------------------------------------------
-- 2. Checking the names of the different stores
------------------------------------------------
-- we have 3 stores and their names are Lower Manhattan, Hell's Kitchen, Astoria
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
-------------------------------------------------
-- 3. Checking products sold at our stores
------------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

SELECT DISTINCT product_type
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

SELECT DISTINCT product_category AS category,
product_detail AS product_name
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

-------------------------------------------------
-- 1. Checking product prices
------------------------------------------------
SELECT MIN(unit_price) As cheapest_price
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

SELECT MAX(unit_price) As expensive_price
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

------------------------------------------------
SELECT
COUNT(*) AS number_of_rows,
COUNT(DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT product_id) AS number_of_products,
COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
------------------------------------------------
SELECT *
FROM workspace.default.bright_coffee_shop_analysis_case_study_1
LIMIT 10;

SELECT transaction_id,
transaction_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
transaction_qty*unit_price AS revenue_per_tnx
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
-----------------------------------------------------
SELECT COUNT(*)
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;


SELECT
transaction_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
COUNT(DISTINCT transaction_id) AS Number_of_sales,
SUM(transaction_qty*unit_price) AS revenue_per_day
FROM workspace.default.bright_coffee_shop_analysis_case_study_1
GROUP BY transaction_date, 
Day_name,
Month_name;