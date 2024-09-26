create database car_sales;
use car_sales;
create table sales (Manufacturer varchar(20) not null ,
	Model	varchar(20) not null,
    Sales_in_thousands	decimal (5,4) not null,
    year_resale_value	decimal(5,4) not null,
    Vehicle_type	varchar(30) not null,
    Price_in_thousand decimal(5,4) not null,
	Engine_size	decimal(5,4) not null,
    Horsepower	int not null,
    Wheelbase decimal(5,4) not null,
    Width	decimal(5,4) not null,
    Length	decimal(5,4) not null,
    Curb_weight	decimal(5,4) not null,
    Fuel_capacity decimal(5,4) not null,
    Fuel_efficiency	int not null,
    Latest_Launch	date not null,
    Power_perf_factor decimal(10,9) not null
    );
    
    -- 1. SELECT FULL TABLE
    SELECT * FROM SALES;
     
	-- 2. CREATE DUPLICATE TABLE
    CREATE TABLE sales_copy AS SELECT * FROM sales;
    
    -- 3. Find Total number of manufactuer in the car_sales
    SELECT MANUFACTURER, COUNT(*) AS TOTAL_MANUFACTURE
    FROM SALES
    GROUP BY MANUFACTURER
    ORDER BY MANUFACTURER DESC;

    -- 4.calculate the average price of vehicles for each manufacturer in the sales table?
    SELECT MANUFACTURER, AVG(SALES_IN_THOUSANDS) AS AVG_SALES
    FROM SALES
    GROUP BY MANUFACTURER ;
    
    -- 5.count the number of occurrences of each vehicle type in the sales table?
    SELECT VEHICLE_TYPE, COUNT(*) AS VECHILE_COUNT
    FROM SALES
    GROUP BY VEHICLE_TYPE;
    
    -- 6. calculate the average price of vehicles for each vehicle type in the sales table?
    SELECT VEHICLE_TYPE , AVG(SALES_IN_THOUSANDS) AS MEAN_PRICE
    FROM SALES
    GROUP BY VEHICLE_TYPE;
    
   -- 7. Find the Vehicle with the Highest Price
    SELECT *
	FROM sales
	ORDER BY Price_in_thousand DESC
	LIMIT 1;
    
	-- 8. Vehicles with Prices Greater than the Average Price
    SELECT * 
    FROM SALES
    WHERE SALES_IN_THOUSANDS > (SELECT AVG(SALES_IN_THOUSANDS)
								FROM SALES);

   -- 9. Find Vehicles Older than the Latest Launch Date
   SELECT *
	FROM sales
	WHERE Latest_Launch < (SELECT MAX(Latest_Launch) FROM sales
	);
    
    -- 10. Manufacturers with Vehicles Below Average Price
    SELECT DISTINCT Manufacturer, MODEL
	FROM sales
	WHERE Manufacturer NOT IN (SELECT Manufacturer
								FROM sales
								WHERE Price_in_thousand > (SELECT AVG(Price_in_thousand) 	
															FROM sales ));

-- 11.Count of Vehicles by Manufacturer with SALES_COPY Table
	SELECT S.MANUFACTURER, COUNT(SC.MANUFACTURER) AS VEHICLE
	FROM SALES S 
	JOIN SALES_COPY SC ON S.MANUFACTURER = SC.MANUFACTURER
	GROUP BY S.MANUFACTURER;

-- 12. Compare Average Horsepower Between Original and Duplicate Tables
	SELECT s.Manufacturer, s.Horsepower AS Sales_Horsepower, sc.Horsepower AS Sales_Copy_Horsepower
	FROM sales s
	INNER JOIN sales_copy sc
	ON s.Manufacturer = sc.Manufacturer;



-- Explanation:

-- Basic Queries: These retrieve counts, averages, and other statistics about the dataset.
-- Subqueries: These demonstrate more complex queries that depend on other queries.
 -- Joins: These show how to combine data from the original and duplicate tables for deeper insights.
-- Advanced Queries: These perform aggregate functions and more complex data manipulations.

 


   