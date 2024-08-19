use AdventureWorksDW2008R2;

/* Q-1: Using the xyz_sales table answer the following question: Number of products sold in the
Central and South regions. Excluding “Salem” and “Alton” city. */

select * from xyz_sales;


select SUM(units) as Sum_Unit from xyz_sales
where region in ('Central', 'South');

select SUM(units) as Sum_Unit from xyz_sales
where region in ('Central', 'South') and City not in ('Salem', 'Alton');

-- ANS: 1199

/* Q-2: Using the vaccinations table answer the following question: Create a report where all the
countries are ranked based on total_vaccinations in their respective continent. */

select * from Vaccinations;

select Country, Continent, Total_Vaccinations, RANK() Over(partition by Country order by total_vaccinations desc)
from Vaccinations;

/* Q-3: Using the vaccinations table answer the following question: Compute the percentage of
total_vaccinations of each country in their respective continents. (3 Marks)
Note: Percentage is given as ( total_vaccinations * 100 / total_vacc_continent ). */

select * from Vaccinations;

select distinct a.Continent, a.Country,
	(select SUM(Total_Vaccinations) from Vaccinations where Continent = a.Continent and Country = a.Country) as Total_Vaccination,
	(select SUM(People_Vaccinated) from Vaccinations where Continent = a.Continent and Country = a.Country) as total_vacc_continent,
	cast((select SUM(People_Vaccinated) from Vaccinations where Continent = a.Continent and Country = a.Country) as float) /
	cast((select SUM(Total_Vaccinations) from Vaccinations where Continent = a.Continent and Country = a.Country)as float) * 100 as Percent_vaccinated
from Vaccinations as a;

/* Q-4: Using the vaccinations table answer the following question: Segment the countries based
on the below criteria
	Total_vaccinations_per_hundred greater than 15 : On-track
	Total_vaccinations_per_hundred between 5 and 15: Need improvement
	Total_vaccinations_per_hundred less than 5: Poor
How many people were vaccinated fully[Sum(people_vaccinated)] including all countries in the
segment ‘On-track’. */

select * from Vaccinations;

select a.Type, SUM(a.people_Vaccinated) from
(select
	country,
	SUM(people_Vaccinated) as people_Vaccinated,
	SUM(total_vaccinations_per_hundred) as total_vaccinations_per_hundred,
	case
		when SUM(total_vaccinations_per_hundred) >= 15 then 'On-track'
		when SUM(total_vaccinations_per_hundred) >= 5 and sum(total_vaccinations_per_hundred) < 15 then 'need improvement'
		when SUM(total_vaccinations_per_hundred) < 5 then 'poor'
end as Type from Vaccinations
group by
	country) as a
	where a.Type = 'On-track'
group by a.Type;

/* Q-5: Using the table supermarket_customer and supermarket_sales, answer the following
question: Which types of customer has a high average customer rating. */

select * from supermarket_customer;
select * from supermarket_sales;

select a.Customer_Type, AVG(b.Customer_Rating) from supermarket_customer a inner join supermarket_sales b on
a.ID = b.ID group by a.Customer_Type order by AVG(b.Customer_Rating) desc;

-- ANS : 7.00521041300588

/* Q-6: Using the table supermarket_customer and supermarket_sales, answer the following
question:
	First, filter the data as per the below criteria:
	Filter the Female who uses Health and beauty products and male who uses Sports and travel
Then find out the total quantity ordered based on customer type. */

select * from supermarket_customer;

select * from supermarket_sales;

select a.Customer_Type, b.Product_Line, a.Gender, SUM(b.Quantity) from supermarket_customer a inner join supermarket_sales b on
a.ID = b.ID
where ( b.Product_Line = 'Sports and travel' and a.Gender = 'Male') or
( b.Product_Line = 'Health and beauty' and a.Gender = 'Female')
group by a.Customer_Type, b.Product_Line, a.Gender;

/* Q-7: Using the table supermarket_customer and supermarket_sales, answer the following
question: Find out total sales based on branch and sort it in descending order. */

select * from supermarket_customer;

select * from supermarket_sales;

select a.Branch, SUM(b.Total) from supermarket_customer a inner join supermarket_sales b on
a.ID = b.ID
group by a.Branch order by SUM(b.Total) desc;

/* Q-8: Using the table supermarket_customer and supermarket_sales, answer the following
question: Find the average unit price of the "Health and beauty" product category. Note: Answer
this question using ‘having’ clause. */

select * from supermarket_customer;

select * from supermarket_sales;

select AVG(a.Unit_Price) as Avg_Unit from supermarket_sales a inner join supermarket_customer b on
a.ID = b.ID group by a.Product_Line having Product_Line = 'Health and beauty';

-- ANS : 54.8544737916244
