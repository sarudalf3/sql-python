-- 1. What query would you run to get all the countries that speak Slovene? 
-- Your query should return the name of the country, language and language
-- percentage. Your query should arrange the result by language percentage 
-- in descending order. 
select name, language, percentage FROM countries a, languages b WHERE a.id=b.country_id
and language = 'Slovene' order by percentage desc;

-- 2. What query would you run to display the total number of cities for each 
-- country? Your query should return the name of the country and the total 
-- number of cities. Your query should arrange the result by the number of 
-- cities in descending order.
select a.name, count(b.id) as num_cities from countries a, cities b WHERE a.id=b.country_id
group by a.name order by num_cities desc;

-- 3. What query would you run to get all the cities in Mexico with a population 
-- of greater than 500,000? Your query should arrange the result by population 
-- in descending order.
select b.name, b.population from countries a, cities b WHERE a.id=b.country_id
and a.name='Mexico' and b.population > 500000 order by b.population desc;

-- 4. What query would you run to get all languages in each country with a percentage 
-- greater than 89%? Your query should arrange the result by percentage in descending 
-- order. 
select a.name, b.language, b.percentage from countries a, languages b WHERE a.id=b.country_id
and  b.percentage > 89 order by b.percentage desc; 

-- 5. What query would you run to get all the countries with Surface Area below 501 
-- and Population greater than 100,000? 
select distinct name, surface_area, population from countries where surface_area < 501
and population > 100000;

-- 6. What query would you run to get countries with only Constitutional Monarchy 
-- with a capital greater than 200 and a life expectancy greater than 75 years? 
select name, government_form, capital, life_expectancy from countries
where government_form LIKE 'Constitutional Monarchy' and capital > 200 and 
life_expectancy > 75;

-- 7. What query would you run to get all the cities of Argentina inside the 
-- Buenos Aires district and have the population greater than 500, 000? The
-- query should return the Country Name, City Name, District and Population. 
select a.name, b.name, b.district, b.population from countries a, cities b
WHERE a.id=b.country_id and b.district= 'Buenos Aires' and b.population > 500000; 

-- 8. What query would you run to summarize the number of countries in each region? 
-- The query should display the name of the region and the number of countries. 
-- Also, the query should arrange the result by the number of countries in
-- descending order.
Select region, count(*) from countries 
GROUP BY region order by count(*) desc; 