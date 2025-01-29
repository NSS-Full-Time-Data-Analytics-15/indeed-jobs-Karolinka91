SELECT * 
FROM winter_games;

SELECT COUNT(DISTINCT COUNTRY_ID )
FROM summer_games;

----------------------------Q1 1)	How many unique countries are in the summer games table? -203


SELECT COUNT(DISTINCT country_id)
FROM winter_games;


----------------------------Q2 2)	How may unique countries are in the winter games table? -78

SELECT MAX(height) - MIN(height) AS height_diff
FROM athletes;

-----------------------------Q3 3)	What is the difference in cm between the tallest and shortest athlete? -75 cm

SELECT MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age
FROM athletes;

------------------------------Q4 4)	What is the Min, Max, and Mean age of athletes? min age -13, max age -55, average age - 25

SELECT COUNT(DISTINCT event)
FROM summer_games
WHERE sport = 'Gymnastics';

------------------------------Q5 5)	How many unique gymnastics events are held during the Summer Olympics? - 14
