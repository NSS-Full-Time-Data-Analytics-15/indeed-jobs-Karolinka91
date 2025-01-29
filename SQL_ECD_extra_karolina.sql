SELECT *
FROM ecd;

SELECT COUNT(DISTINCT county_tier), county_tier
FROM ecd
GROUP BY county_tier;
---------------------------------------Q1 1)	How many unique county tiers are there? -4

SELECT
COUNT(CASE WHEN county_tier = 1 THEN county_tier END) AS tier_1,
COUNT(CASE WHEN county_tier = 2 THEN county_tier END) AS tier_2
FROM ecd;


-----------------------------------------Q2 2)	Are there more county tier 1 companies or county tier 2 companies? tier 1 - 380, tier 2 - 289

SELECT SUM(new_jobs)
FROM ecd;



------------------------------------------Q3 3)	What is the total number of new jobs created in this table? - 137425

SELECT SUM(new_jobs)
FROM ecd
WHERE county = 'Davidson';


-------------------------------------------Q4 4)	What is the total number of new jobs created in this table in Davidson County? -20450


SELECT MIN(landed) AS earliest_landed_date, county, grants_total
FROM ecd
GROUP BY county, grants_total
ORDER BY earliest_landed_date
LIMIT 1;

SELECT Min(landed)
FROM ecd; --checking

--------------------------------------------Q5 5)	Write a query that only returns the earliest landed date and its county and grants_total. - 2011-01-01 MADISON , $60.000.00

SELECT DISTINCT company, project_type
FROM ecd
WHERE project_type ILIKE '%expansion%';





--------------------------------------------Q6 6)	How many unique companies have a project_type that includes ‘expansion’.  - 591 (rows total)

