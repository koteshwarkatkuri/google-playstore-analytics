-- ================================================
-- Google Play Store Analysis — SQL Queries
-- Database: PostgreSQL
-- Author: Koteshwar Katkuri
-- ================================================


DROP TABLE playstore;
CREATE TABLE playstore (
    App TEXT,
    Category VARCHAR(100),
    Rating FLOAT,
    Reviews BIGINT,
    Size VARCHAR(50),
    Installs BIGINT,
    Type VARCHAR(20),
    Price FLOAT,
    Content_Rating VARCHAR(50),
    Genres VARCHAR(100),
    Last_Updated DATE,
    Current_Ver VARCHAR(100),
    Android_Ver VARCHAR(100)
);
select count(*) from playstore;

#Q1. What is the average rating of apps on the Play Store?
SELECT 
    ROUND(AVG(Rating)::numeric, 2) AS average_rating
FROM playstore;

#Q2 — What percentage of apps are free vs paid?
SELECT 
Type,
COUNT(*) AS app_count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM playstore), 2) AS percentage
FROM playstore
GROUP BY Type
ORDER BY app_count DESC;

#Q3 — What is the most common app category?
SELECT 
Category,
COUNT(*) AS app_count
FROM playstore
GROUP BY Category
ORDER BY app_count DESC
LIMIT 1;

#Q4 — Which top 10 categories have the highest number of apps?
SELECT 
Category,
COUNT(*) AS app_count
FROM playstore
GROUP BY Category
ORDER BY app_count DESC
LIMIT 10;

#Q5 —What is the distribution of content ratings?
SELECT 
Content_Rating,
COUNT(*) AS app_count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM playstore), 2) AS percentage
FROM playstore
GROUP BY Content_Rating
ORDER BY app_count DESC;

#Q6 — Which categories have the highest average rating?

SELECT 
Category,
ROUND(AVG(Rating)::numeric, 2) AS avg_rating,
COUNT(*) AS total_apps
FROM playstore
GROUP BY Category
ORDER BY avg_rating DESC
LIMIT 10;

#Q7 — Do free apps have better ratings than paid apps?

SELECT 
Type,
ROUND(AVG(Rating)::numeric, 2) AS avg_rating,
COUNT(*) AS total_apps
FROM playstore
GROUP BY Type
ORDER BY avg_rating DESC;

#Q8 — Which categories have the highest average installs?

SELECT 
Category,
ROUND(AVG(Installs)::numeric, 0) AS avg_installs,
COUNT(*) AS total_apps
FROM playstore
GROUP BY Category
ORDER BY avg_installs DESC
LIMIT 10;

#Q9 — Free apps vs paid apps install comparison?

SELECT 
Type,
ROUND(AVG(Installs)::numeric, 0) AS avg_installs,
MAX(Installs) AS max_installs,
MIN(Installs) AS min_installs
FROM playstore
GROUP BY Type
ORDER BY avg_installs DESC;

#Q10 — Which categories have the most paid apps?

SELECT 
Category,
COUNT(*) AS paid_app_count
FROM playstore
WHERE Type = 'Paid'
GROUP BY Category
ORDER BY paid_app_count DESC
LIMIT 10;

#Q11 — What is the average price of paid apps by category?

SELECT 
Category,
ROUND(AVG(Price)::numeric, 2) AS avg_price,
COUNT(*) AS paid_app_count
FROM playstore
WHERE Type = 'Paid'
GROUP BY Category
ORDER BY avg_price DESC
LIMIT 10;

#Q12 — Which are the top 10 most installed apps?

SELECT 
App,
Category,
Type,
Installs,
Rating
FROM playstore
ORDER BY Installs DESC
LIMIT 10;

#Q13 — Full category wise business summary?

SELECT 
Category,
COUNT(*) AS total_apps,
ROUND(AVG(Rating)::numeric, 2) AS avg_rating,
ROUND(AVG(Installs)::numeric, 0) AS avg_installs,
SUM(CASE WHEN Type = 'Free' THEN 1 ELSE 0 END) AS free_apps,
SUM(CASE WHEN Type = 'Paid' THEN 1 ELSE 0 END) AS paid_apps,
ROUND(AVG(Price)::numeric, 2) AS avg_price
FROM playstore
GROUP BY Category
ORDER BY avg_installs DESC;