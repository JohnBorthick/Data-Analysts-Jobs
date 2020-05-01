--The data for this exercise has been derived from the Indeed Data Scientist/Analyst/Engineer dataset on kaggle.com
--Provide the SQL queries and answers for the following questions/tasks
--using the data_analyst_jobs table you have created in PostgreSQL:


--Q1.  How many rows are in the data_analyst_jobs table?
/*SELECT count(*)
FROM data_analyst_jobs;*/

--1793 rows in the table

--Q2. Write a query to look at just the first 10 rows. 
------What company is associated with the job posting on the 10th row?

/*SELECT *
FROM data_analyst_jobs
LIMIT 10;*/

--ExxonMobile

--Q3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

/*SELECT Count(title),
FROM data_analyst_jobs
WHERE data_analyst_jobs.location = 'TN';*/

--TN = 21

/*SELECT Count(title)
FROM data_analyst_jobs
WHERE data_analyst_jobs.location = 'TN' OR data_analyst_jobs.location = 'KY';*/

--TN OR KY = 27

--Q4. How many postings in Tennessee have a star rating above 4?

/*SELECT title, star_rating, location
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;*/

--3 companies with star_ratings above 4 in TN
--Could have just used Count(title) then kept the FROM, WHERE, and AND statements; streamlined and answers the question 
--without filler, keep computations down. Will not mattter know but later could stop problems before they start.

--Q5. How many postings in the dataset have a review count between 500 and 1000?

/*SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;*/

--151 companies with reviews between 500 and 1000
/*SELECT title, review_count, location, company
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000
AND location = 'TN';*/

--WILLIS TOWERS WATSON is in TN, Business Data Anlyst, 779 reviews

--Q6. Show the average star rating for each state. 
-------The output should show the state as state and the average rating for the state as avg_rating. 
-------Which state shows the highest average rating?

/*SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY AVG(star_rating) DESC;*/

--NE, Nebraska *** NEED HELP *** to figure out the sorting of the AVG(star_rating)
--Cannot nest aggregate functions,
--Figured it out needed to use ORDER BY!!! DO BETTER

--Q7. Select unique job titles from the data_analyst_jobs table. 
------How many are there?

/*SELECT count(DISTINCT title)
FROM data_analyst_jobs;*/

--881

/*SELECT DISTINCT title
FROM data_analyst_jobs;*/

--Q8. How many unique job titles are there for California companies?

/*SELECT COUNT(DISTINCT (title))
FROM data_analyst_jobs
WHERE location = 'CA';*/

--230 different job titles in California, used Count( Distinct of title) with a WHERE clause to find result

--Q9. Find the name of each company and its average star rating for all companies that
-------have more than 5000 reviews across all locations. 
-------How many companies are there with more that 5000 reviews across all locations?

--Ness's Data
/*SELECT DISTINCT company, ROUND(AVG(star_rating),9) AS Avg_rating, review_count
FROM data_analyst_jobs
WHERE review_count >5000
AND company IS NOT NULL
GROUP BY company, review_count
ORDER BY avg_rating DESC;*/

/*SELECT company, ROUND(AVG(star_rating),5)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;*/

--Table pulls up 46 rows but with 2 Walmarts makes 45 companies with over 5000 reviews
--I have 2 Walmarts?? Also two different companies, Capgemini and Capgemini Gov. Solutions: Everything else looks good...

--Q10.  Add the code to order the query in #9 from highest to lowest average star rating. 
----------Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
----------What is that rating?

/*SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;*/

--I feel that I did something wrong here on 9 and 10 My average is the same for six different companies to 9 decimal places
-- GENERAL MOTORS, UNILEVER, MICROSOFT, NIKE, AMERICAN EXPRESS, KAISER PERMANENTE
--adding in the review_count to see reviews changed the amount of rows i recieved...MIGHT HAVE TO CHECK THE !!!**TYPE**!!!
--DO ABOVE LINE FIRST
--MICROSOFT

--Q11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

/*SELECT Count(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';*/
--774=ILIKE;

--Q12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
-------What word do these positions have in common?
/*SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
AND title NOT ILIKE '%Analytics%';*/

--4 titles without Analyst or Analytics all of them Contain Tableau

