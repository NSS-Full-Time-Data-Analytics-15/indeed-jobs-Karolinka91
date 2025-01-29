SELECT *
FROM data_analyst_jobs;

SELECT COUNT(*)
FROM data_analyst_jobs; ----------------------------Q2 How many rows are in the data_analyst_jobs table? -1793

SELECT
COUNT(CASE WHEN location = 'TN' THEN location END) as TN_count,
--COUNT(CASE WHEN location = 'KY' THEN location END) as KY_count, (was checking if the answers are right)
COUNT(CASE WHEN location = 'KY' or location = 'TN' THEN location END) as TN_or_KY_count
FROM data_analyst_jobs
WHERE location = 'KY' OR location ='TN'; -------------------------- Q3 How many postings are in Tennessee? (21) How many are there in either Tennessee or Kentucy? (27)

SELECT 
COUNT(CASE WHEN location ='TN' and star_rating > 4 THEN review_count END) as TN_above_4
FROM data_analyst_jobs;  --------------------------------------------------------------- Q4 How many postings in TN have a star rating above 4? -3

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;  ------------------------------------------------ Q5 How many postings in the dataset have a review count between 500 and 1000? -151

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;  ------------------------------------------ Q6 Show the average star rating for companies in each state. The output should show the state as state and the average 
---------------------------------------------------------------------rating for the state as avg_rating. Which state shows the highest average rating? -NE

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;  ----------------------------------------------Q7 Select unique job titles from the data_analyst_jobs table. How many are there? -881

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';  -----------------------------------------------Q8 How many unique job titles are there for California companies? -230


SELECT company, AVG(star_rating) AS avg_star_rating, COUNT(review_count) AS review_counts
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY review_counts DESC;  ------------------------Q9 Find the name of each company and its average star rating for all companies that have more than 5000 reviews
----------------------------------------------------across all locations.
----------------------------------------------------How many companies are there with more that 5000 reviews across all locations?- 71 (rows)


SELECT company, AVG(star_rating) AS avg_star_rating, COUNT(review_count) AS review_counts
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY avg_star_rating DESC;    -------Q10 Add the code to order the query in #9 from highest to lowest average star rating.
                                  -------Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT COUNT(title) AS analyst_jobs
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; -- count of all jobs with word Analyst in it - for Q11 -1669

SELECT COUNT(DISTINCT title) as analyst_jobs
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';  ----- different (distinct) job titles Q11 - 774 

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; -- unique job titles for Q11 (shows the titles)


                                   ------------------ Q11Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';                ------------------ Q12 answer - 4 titles!

SELECT 
COUNT(CASE WHEN title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics' THEN title END) AS not_analyst_jobs
FROM data_analyst_jobs;   ---------------------- not sure how to make this showthe actual title names

SELECT *
FROM data_analyst_jobs;
								   

----------------------------------- Q12 QUESTION: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? - 4 titles
------------------------------------What word do these positions have in common? - they are all visual jobs so Tableau skill is common in them

SELECT *
FROM data_analyst_jobs;

SELECT title, days_since_posting AS hard_to_fill, domain
FROM data_analyst_jobs
WHERE skill = 'SQL' AND domain IS NOT NULL AND days_since_posting > 21
GROUP BY title, hard_to_fill, domain
ORDER BY domain;------ NOT AS GOOD for bonus

SELECT domain, COUNT(*) AS hard_to_fill
FROM data_analyst_jobs
WHERE skill = 'SQL'
AND domain IS NOT NULL
AND days_since_posting > 21
GROUP BY domain
ORDER BY hard_to_fill DESC; ----- GOOD ANSWER FOR BONUS
----------------------------------BONUS You want to understand which jobs requiring SQL are hard to fill. 
----------------------------------Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.