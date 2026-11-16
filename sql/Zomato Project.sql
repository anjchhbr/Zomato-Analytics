CREATE DATABASE zomato_project;

USE zomato_project;

CREATE TABLE restaurants (
    RestaurantID INT,
    RestaurantName VARCHAR(255),
    CountryCode INT,
    City VARCHAR(100),
    Address VARCHAR(500),
    Locality VARCHAR(255),
    LocalityVerbose VARCHAR(255),
    Longitude DECIMAL(12,8),
    Latitude DECIMAL(12,8),
    Cuisines VARCHAR(500),
    Currency VARCHAR(100),
    Has_Table_booking VARCHAR(10),
    Has_Online_delivery VARCHAR(10),
    Is_delivering_now VARCHAR(10),
    Switch_to_order_menu VARCHAR(10),
    Price_range INT,
    Votes INT,
    Average_Cost_for_two DECIMAL(10,2),
    Rating DECIMAL(3,1),
    Datekey_Opening VARCHAR(20)
);

DESCRIBE restaurants;

SELECT COUNT(*) AS Total_Rows 
FROM restaurants;

SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:/Users/anjal/Downloads/Zomato Analyticss/Zomato_Restaurants.csv'
INTO TABLE restaurants
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * 
FROM restaurants 
LIMIT 10;

SELECT COUNT(*) AS Total_Restaurants
FROM restaurants;
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'zomato_project'
AND TABLE_NAME = 'restaurants';

SELECT RestaurantID, COUNT(*) AS Count
FROM restaurants
GROUP BY RestaurantID
HAVING COUNT(*) > 1;

SELECT
    SUM(RestaurantID IS NULL) AS Missing_RestaurantID,
    SUM(RestaurantName IS NULL) AS Missing_RestaurantName,
    SUM(City IS NULL) AS Missing_City,
    SUM(Cuisines IS NULL) AS Missing_Cuisines,
    SUM(Rating IS NULL) AS Missing_Rating,
    SUM(Votes IS NULL) AS Missing_Votes
FROM restaurants;

SELECT
    MIN(Rating) AS Minimum_Rating,
    MAX(Rating) AS Maximum_Rating,
    AVG(Rating) AS Average_Rating
FROM restaurants;

SELECT
    MIN(Price_range) AS Minimum_Price_Range,
    MAX(Price_range) AS Maximum_Price_Range
FROM restaurants;

SELECT
    Price_range,
    COUNT(*) AS Restaurant_Count
FROM restaurants
GROUP BY Price_range
ORDER BY Price_range;

SELECT
    COUNT(DISTINCT City) AS Total_Cities
FROM restaurants;

SELECT
    City,
    COUNT(*) AS Restaurant_Count
FROM restaurants
GROUP BY City
ORDER BY Restaurant_Count DESC
LIMIT 10;

SELECT
    Cuisines,
    COUNT(*) AS Restaurant_Count
FROM restaurants
GROUP BY Cuisines
ORDER BY Restaurant_Count DESC
LIMIT 10;

SELECT
    SUM(Latitude IS NULL) AS Null_Latitude,
    SUM(Latitude = 0) AS Zero_Latitude,
    SUM(Longitude IS NULL) AS Null_Longitude,
    SUM(Longitude = 0) AS Zero_Longitude
FROM restaurants;

CREATE TABLE restaurants_backup AS
SELECT *
FROM restaurants;

SELECT COUNT(*) AS Backup_Rows
FROM restaurants_backup;

TRUNCATE TABLE restaurants;

DROP DATABASE zomato_project;

-- Q1. Country Map Table

CREATE TABLE country_map (
    CountryCode INT,
    Country VARCHAR(100)
);

DESCRIBE country_map;

INSERT INTO country_map (CountryCode, Country)
VALUES
(1, 'India'),
(14, 'Australia'),
(30, 'Brazil'),
(37, 'Canada'),
(94, 'Indonesia'),
(148, 'New Zealand'),
(162, 'Philippines'),
(166, 'Qatar'),
(184, 'Singapore'),
(189, 'South Africa'),
(191, 'Sri Lanka'),
(208, 'Turkey'),
(214, 'United Arab Emirates'),
(215, 'United Kingdom'),
(216, 'United States');

SELECT *
FROM country_map
ORDER BY CountryCode;

SELECT
    r.RestaurantID,
    r.RestaurantName,
    r.CountryCode,
    c.Country
FROM restaurants r
LEFT JOIN country_map c
    ON r.CountryCode = c.CountryCode
LIMIT 10;

-- Q2. Calendar Table 

SELECT Datekey_Opening
FROM restaurants
LIMIT 10;

CREATE TABLE calendar (
    Datekey_Opening VARCHAR(20),
    Date_Value DATE,
    Year INT,
    Monthno INT,
    Monthfullname VARCHAR(20),
    Quarter VARCHAR(2),
    YearMonth VARCHAR(10),
    Weekdayno INT,
    Weekdayname VARCHAR(20),
    FinancialMonth INT,
    FinancialQuarter VARCHAR(2)
);

INSERT INTO calendar (
    Datekey_Opening,
    Date_Value
)
SELECT DISTINCT
    Datekey_Opening,
    STR_TO_DATE(Datekey_Opening, '%Y_%c_%e')
FROM restaurants
WHERE Datekey_Opening IS NOT NULL
  AND Datekey_Opening <> '';
  
  SELECT *
FROM calendar
LIMIT 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE calendar
SET Year = YEAR(Date_Value);
SELECT
    Datekey_Opening,
    Date_Value,
    Year
FROM calendar
LIMIT 10;

UPDATE calendar
SET Monthno = MONTH(Date_Value);
SELECT
    Datekey_Opening,
    Date_Value,
    Year,
    Monthno
FROM calendar
LIMIT 10;

UPDATE calendar
SET Monthfullname = MONTHNAME(Date_value);
SELECT 
Datekey_Opening,
Date_Value,
Year,
Monthno,
Monthfullname
FROM calendar
LIMIT 10;

UPDATE calendar
SET Quarter = CONCAT('Q', QUARTER(Date_Value));
SELECT 
Datekey_Opening,
Date_Value,
Year,
Monthno,
Monthfullname,
Quarter
FROM calendar
LIMIT 10;

UPDATE calendar
SET YearMonth = DATE_FORMAT(Date_Value, '%Y-%b');
SELECT
    Datekey_Opening,
    Date_Value,
    Year,
    Monthno,
    Monthfullname,
    Quarter,
    YearMonth
FROM calendar
LIMIT 10;

UPDATE calendar
SET Weekdayno = WEEKDAY(Date_Value) + 1;
UPDATE calendar
SET Weekdayname = DAYNAME(Date_Value);
SELECT
    Datekey_Opening,
    Date_Value,
    Year,
    Monthno,
    Monthfullname,
    Quarter,
    YearMonth,
    Weekdayno,
    Weekdayname
FROM calendar
LIMIT 10;

UPDATE calendar
SET FinancialMonth =
    CASE
        WHEN Monthno >= 4 THEN Monthno - 3
        ELSE Monthno + 9
    END;
    UPDATE calendar
SET FinancialQuarter =
    CASE
        WHEN Monthno BETWEEN 4 AND 6 THEN 'FQ1'
        WHEN Monthno BETWEEN 7 AND 9 THEN 'FQ2'
        WHEN Monthno BETWEEN 10 AND 12 THEN 'FQ3'
        WHEN Monthno BETWEEN 1 AND 3 THEN 'FQ4'
    END;
    ALTER TABLE calendar
MODIFY FinancialQuarter VARCHAR(3);
SELECT
    Datekey_Opening,
    Date_Value,
    Monthno,
    FinancialMonth,
    FinancialQuarter
FROM calendar
LIMIT 20;

SELECT *
FROM calendar
ORDER BY Date_Value
LIMIT 20;
SELECT COUNT(*) AS Calendar_Rows
FROM calendar;

-- Q3. Resturants based on City and Country

SELECT
    c.Country,
    r.City,
    COUNT(*) AS Restaurant_Count
FROM restaurants r
LEFT JOIN country_map c
    ON r.CountryCode = c.CountryCode
GROUP BY c.Country, r.City
ORDER BY Restaurant_Count DESC;

-- Top 10 City-Country Combination

SELECT
    c.Country,
    r.City,
    COUNT(*) AS Restaurant_Count
FROM restaurants r
LEFT JOIN country_map c
    ON r.CountryCode = c.CountryCode
GROUP BY c.Country, r.City
ORDER BY Restaurant_Count DESC
LIMIT 10;

-- Restaurants based on Country

SELECT 
    c.Country, COUNT(*) AS Restaurant_Count
FROM
    restaurants r
        LEFT JOIN
    country_map c ON r.CountryCode = c.CountryCode
GROUP BY c.Country
ORDER BY Restaurant_Count DESC;

-- Q4. Restaurants Opening based on Year,Quarter,Month

SELECT
    c.Year,
    COUNT(*) AS Restaurant_Count
FROM restaurants r
JOIN calendar c
    ON r.Datekey_Opening = c.Datekey_Opening
GROUP BY c.Year
ORDER BY c.Year;

SELECT
    c.Year,
    c.Quarter,
    COUNT(*) AS Restaurant_Count
FROM restaurants r
JOIN calendar c
    ON r.Datekey_Opening = c.Datekey_Opening
GROUP BY c.Year, c.Quarter
ORDER BY c.Year, c.Quarter;

SELECT 
    c.Year,
    c.Monthno,
    c.Monthfullname,
    COUNT(*) AS Restaurant_Count
FROM restaurants r
JOIN calendar c
  ON r.Datekey_Opening=c.Datekey_Opening 
GROUP BY
     c.Year,c.Monthno,c.Monthfullname
ORDER BY c.Year, c.Monthno;

-  Q5. Restaurants based on Average Rating

SELECT 
   Rating,
   COUNT(*) AS Restaurant_count 
FROM restaurants
WHERE  Rating IS NOT NULL
GROUP BY Rating
ORDER BY Rating;


-- Rating Distribution

SELECT
    Rating_Bucket,
    COUNT(*) AS Restaurant_Count
FROM (
    SELECT
        CASE
            WHEN Rating < 2.0 THEN '0-1.9'
            WHEN Rating < 3.0 THEN '2.0-2.9'
            WHEN Rating < 4.0 THEN '3.0-3.9'
            WHEN Rating < 4.5 THEN '4.0-4.4'
            WHEN Rating <= 5.0 THEN '4.5-5.0'
        END AS Rating_Bucket
    FROM restaurants
    WHERE Rating IS NOT NULL
) AS rating_data
GROUP BY Rating_Bucket
ORDER BY
    CASE Rating_Bucket
        WHEN '0-1.9' THEN 1
        WHEN '2.0-2.9' THEN 2
        WHEN '3.0-3.9' THEN 3
        WHEN '4.0-4.4' THEN 4
        WHEN '4.5-5.0' THEN 5
    END;
    
    -- Q6. Restaurants based on Average Price

SELECT
    MIN(Average_Cost_for_two) AS Minimum_Price,
    MAX(Average_Cost_for_two) AS Maximum_Price,
    AVG(Average_Cost_for_two) AS Average_Price
FROM restaurants
WHERE Average_Cost_for_two IS NOT NULL;

SELECT
    Price_Bucket,
    COUNT(*) AS Restaurant_Count
FROM (
    SELECT
        CASE
            WHEN Average_Cost_for_two <= 500 THEN '0-500'
            WHEN Average_Cost_for_two <= 1000 THEN '501-1000'
            WHEN Average_Cost_for_two <= 2000 THEN '1001-2000'
            WHEN Average_Cost_for_two <= 5000 THEN '2001-5000'
            ELSE '5001+'
        END AS Price_Bucket
    FROM restaurants
    WHERE Average_Cost_for_two IS NOT NULL
) AS price_data
GROUP BY Price_Bucket
ORDER BY
    CASE Price_Bucket
        WHEN '0-500' THEN 1
        WHEN '501-1000' THEN 2
        WHEN '1001-2000' THEN 3
        WHEN '2001-5000' THEN 4
        WHEN '5001+' THEN 5
    END;
    
    -- Q7. Restaurants based on Table Booking

SELECT
    Has_Table_booking,
    COUNT(*) AS Restaurant_Count
FROM restaurants
GROUP BY Has_Table_booking;

SELECT
    Has_Table_booking,
    COUNT(*) AS Restaurant_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM restaurants),
        2
    ) AS Percentage
FROM restaurants
GROUP BY Has_Table_booking;

-- Q8. Restaurants based on Online Delivery

SELECT
    Has_Online_delivery,
    COUNT(*) AS Restaurant_Count
FROM restaurants
GROUP BY Has_Online_delivery;

SELECT
    Has_Online_delivery,
    COUNT(*) AS Restaurant_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM restaurants),
        2
    ) AS Percentage
FROM restaurants
GROUP BY Has_Online_delivery;
