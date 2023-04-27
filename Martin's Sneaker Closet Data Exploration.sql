-- create a table

CREATE TABLE sneakers (
  id INTEGER PRIMARY KEY,
  brand VARCHAR(20) NOT NULL,
  name VARCHAR(20) NOT NULL,
  color VARCHAR(20) NOT NULL,
  purchase_year YEAR NOT NULL,
  cost float NOT NULL
);


-- insert some values
INSERT INTO sneakers VALUES (1, 'Jordan', 'Cement 3', 'black', '2018', 300);
INSERT INTO sneakers VALUES (2, 'Jordan', 'Oreo 4', 'black', 2015, 190 );
INSERT INTO sneakers VALUES (3, 'Jordan', 'Lightning 4', 'yellow', 2022, 220);
INSERT INTO sneakers VALUES (4, 'Jordan', 'Don C 2', 'biege', 2015, 700);
INSERT INTO sneakers VALUES (5, 'Jordan', 'Varsity 6', 'black', 2013, 200);
INSERT INTO sneakers VALUES (6, 'Jordan', 'Travis Scott 6', 'green', 2018, 375);
INSERT INTO sneakers VALUES (7, 'Jordan', 'Travis Scott 6', 'biege', 2021, 340);
INSERT INTO sneakers VALUES (8, 'Jordan', 'Off-White 5', 'yellow', 2022, 800);
INSERT INTO sneakers VALUES (9, 'Nike', 'Yeezy 1 Zen', 'grey', 2015, 1100);
INSERT INTO sneakers VALUES (10, 'Nike', 'Fear of God Raid 1', 'grey', 2019, 175);
INSERT INTO sneakers VALUES (11, 'Nike', 'Dunk mid "Mama Bear"', 'green', 2017, 380);
INSERT INTO sneakers VALUES (12, 'Nike', 'Dunk low "Gibson"', 'brown', 2009, 250);
INSERT INTO sneakers VALUES (13, 'Nike', 'Dunk high "Twin Peak"', 'black', 2010, 180);
INSERT INTO sneakers VALUES (14, 'Nike', 'Dunk high "Lucky 7"', 'gold', 2018, 300);
INSERT INTO sneakers VALUES (15, 'Nike', 'Dunk high "Syracuse"', 'orange', 2022, 180);
INSERT INTO sneakers VALUES (16, 'Nike', 'Dunk low "USC"', 'red', 2022, 220);
INSERT INTO sneakers VALUES (17, 'Nike', 'Dunk high "De La Soul"','green', 2014, 310);
INSERT INTO sneakers VALUES (18, 'Nike', 'Dunk low "De La Soul"', 'green', '2017', 180);
INSERT INTO sneakers VALUES (19, 'Nike', 'Dunk low "Off-White"', 'red', 2018, 425);
INSERT INTO sneakers VALUES (20, 'Jordan', 'Flu Game 12', 'red', 2015, 200);
INSERT INTO sneakers VALUES (21, 'Nike', 'Dunk low "Tiffany Diamond"', 'white', 2017, 250);
INSERT INTO sneakers VALUES (22, 'Nike', 'Supreme Air Bakin', 'white', 2023, 165);
INSERT INTO sneakers VALUES (23, 'Jordan', 'Top 3 1', 'black', 2017, 200);
INSERT INTO sneakers VALUES (24, 'Jordan', 'Orche 1', 'yellow', 2018, 320);
INSERT INTO sneakers VALUES (25, 'Nike', 'Dunk high "Mork n Mindy', 'red', 2009, 500);
INSERT INTO sneakers VALUES (26, 'Nike', 'Dunk high "Dino Jr"', 'grey', 2014, 280);
INSERT INTO sneakers VALUES (27, 'Croc', 'Classic Clog', 'blue', 2019, 40);
INSERT INTO sneakers VALUES (28, 'Croc', ' Classic Clog', 'orange', 2021, 40);
INSERT INTO sneakers VALUES (29, 'Croc', 'Salehe Crocodile', 'green', 2022, 85);
INSERT INTO sneakers VALUES (30, 'New Balance', 'MiUSA Scarlett', 'red', 2022, 260);
INSERT INTO sneakers VALUES (31, 'New Balance', 'Kith Pistacio', 'blue', 2023, 250);
INSERT INTO sneakers VALUES (32, 'New Balance', 'Natural Grey 550', 'grey', 2022, 140);
INSERT INTO sneakers VALUES (33, 'Adidas', 'Foam Runner', 'red', 2022, 200);
INSERT INTO sneakers VALUES (34, 'Adidas', 'Desert Boot', 'biege', 2017, 300);


-- Fetching all values from the table 

SELECT * 
FROM sneakers;

-- How many Nike sneakers do we have?

SELECT COUNT(brand) AS Nike_Count
FROM sneakers
WHERE brand = 'Nike';

--How many Jordan sneakers do we have?

SELECT COUNT (brand) AS Jordan_Count
FROM sneakers
WHERE brand = 'Jordan';

-- What is the oldest shoe we own?

SELECT *
FROM sneakers
ORDER BY purchase_year ASC LIMIT 1;

-- What was our most recent purchase

SELECT *
FROM sneakers
ORDER BY purchase_year DESC LIMIT 1;

-- What was our most expensive shoe?

SELECT brand, name, MAX(cost) AS Highest_Cost
FROM sneakers;

-- What is our cheapest shoe purchased?

SELECT brand, name, MIN(cost) AS Cheapest_Shoe
FROM sneakers;

-- What year did we spend the most on shoes? 

SELECT purchase_year, SUM(Cost) AS SpentPerYear
FROM sneakers
GROUP BY purchase_year 
ORDER BY SpentPerYear DESC LIMIT 1;

-- What year did we buy the most shoes?

SELECT purchase_year, COUNT(name) AS ShoesPerYear
FROM sneakers
GROUP BY purchase_year
ORDER BY ShoesPerYear DESC LIMIT 1;

--What was our average cost per shoe?

Select ROUND(AVG(cost),2) AS AverageCostPerShoe
From sneakers;

--What was our average cost per shoe by brand?

SELECT brand, ROUND(AVG(cost),2) AS AverageCostPerShoe
From sneakers
GROUP BY brand
ORDER BY AverageCostPershoe DESC;


-- What color shoe do we have the most of?

SELECT color, COUNT(color)
FROM sneakers
GROUP BY color 
ORDER BY COUNT(color) DESC;

-- How much total did we spend on sneakers?

SELECT SUM(cost) AS TotalSpent
FROM sneakers;

-- Find names of shoes starting with 'D'

SELECT name
FROM sneakers
WHERE name LIKE 'D%';

-- Find the shoes that cost more than $350 but less than $1000

SELECT *
FROM sneakers 
WHERE cost BETWEEN '350' AND '1000';

-- Find the shoes purchased after 2016

SELECT * 
FROM sneakers
WHERE purchase_year > '2016'
ORDER BY purchase_year ;

-- How many shoes do we have per brand and how much have we spent on each brand?

SELECT brand, COUNT(name) AS CountPerBrand, SUM(cost) AS TotalperBrand
FROM sneakers
GROUP BY brand; 

-- What is the second brand we spend the most money on?

WITH totals AS (
	SELECT brand, SUM(cost) AS TotalperBrand
FROM sneakers
GROUP BY brand 
),
	ranked AS (
Select *, Rank() OVER(ORDER BY TotalPerBrand DESC) AS RANK
FROM totals
)
SELECT * FROM ranked
WHERE RANK = 2;


