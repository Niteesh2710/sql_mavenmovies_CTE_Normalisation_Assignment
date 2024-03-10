use mavenmovies;
-- CTE Basics
-- write a query using a CTE TO RETRIEVE the disnct list of actor names and number of film they haVe acted
-- in from the actor and film_actor table??
select*from actor;
with my_cte as (
select actor.* , count(film_id) from film_actor inner join actor on actor.actor_id=film_actor.actor_id 
group by actor_id)
select*from my_cte;
-- CTE with JOINS 
-- create a CTE that combines information from the film and language table to display the film_title ,
-- language name and rental_rate??
with my_cte as (
select title , rental_rate , name from language join film on language.language_id=
film.language_id)
select*from my_cte; 
-- CTE for aggregation 
-- Write a query using a CTE TO Find the total revenue(sum of payments) from the 
-- customer and payment table??
with my_cte as (
select sum(amount) from payment inner join customer on 
payment.customer_id=customer.customer_id)
select*from my_cte;
-- CTE for DATE Calculation
-- Write a query using a CTE to find the total number of rental made each month 
-- considering the rental date from the rental table ??
with my_cte as(
select month(rental_date) , count(rental_id) from rental group by month(rental_date))
select*from my_cte;
-- CTE for pivot operations
-- use a CTE to pivot the data from the payment table to display the total payment made by each customer
-- in separate columns for different payment method??
with my_cte as(
select customer_id , sum(amount) from payment group by customer_id)
select*from my_cte;
-- CTE with window Functions
-- Utilize a CTE with Window Function to rank films based on their rental_duration from the film table??
with my_cte as(
select title , rental_duration, rank() over (partition by rental_duration) from film)
select*from my_cte;
-- CTE and Self Join 
-- Create a CTE to generate a report showing pairs of actors who have appeared in the same film together,
-- using the film_actor table??
with my_cte as(
select T1.film_id from film_actor as T1 , film_actor as T2 where T1.film_id=T2.film_id
)  
select*from my_cte;
-- First Normal Form(1NF)
-- Identify a Table in sakila database that violates 1NF. Explain how would you normalise it to 
-- achieve 1NF??

-- Answer 

-- Tables in sakila database that violates 1NF are actor_award , film table.
-- In (actor_award) table multivalued attributes are present in (awards) column. In order to normalise it 
-- to 1NF we should have to make different columns of different award names(Emmy, Oscar, Tony).
-- Similarly in (Film) Table under (special_features) column aslo multivalued attributes are present and 
-- in order to normalise it to 1NF we should have to make different columns of different special features
-- that is (deleted scenes, Behind the scenes, Trailors, Commentaries etc.)

-- Second Normal Form(2NF)
-- Choose a table in sakilla database and describe how would you determine whether it is in 2NF.
-- If it violates 2NF Explain the steps tpo normalize it??

-- Answer

-- In order to achieve 2NF the table should be in 1NF and no partial dependency shuld be present.
-- In sakilla database table that violates 2NF is (customer) in order to make it normalise we should have 
-- to remove (partial dependency) of the table by creating new table of (store).
-- secondly the table that violates 2NF is (film_actor) table.

-- Third Normal Form(3NF)
-- Identify a table in sakilla database that Violates 3NF. Describe the transitive Dependencies Present 
-- and outline the steps to normalize it to 3NF??

-- Answer
 
-- Table that violates 3NF is (payment table). In order to achieve 3NF Normalised form table should be 
-- in 2NF form and then we can achieve 3NF form by removing tansitive Dependency.
-- In (Payment) Table (amount) Column is not directly depend on payment_id as it shows Transitive Dependency 
-- that's Why we should have to make a new table with rental_id and amount where amount column will not
-- show transitive dependency on payment_id.

-- Normalization Process
-- Take a Specific Table in Sakilla and guide through the process of normalizing it from the initial 
-- Unnormalized form up to atleast 2NF??

-- Answer

-- Lets take the (film) table from the sakilla database and in order to,
-- normalised it to 1NF form: 
-- Firstly, Remove the Multivalued Attributes from the coulmn of Title and special 
-- Features and we have to make individual columns of Title_First_Name , Title_last_Name and same with 
-- Special_feature Column make individual Column of all Special_features in order to achieve 1NF Form.
-- normalised it to 2NF form:
-- Now, after 1NF form is achieved then we should have to make it normalise to 2NF form and for that 
-- we should have to make different table of rental_duration , rental_rate , length , replacement_cost 
-- and rating as these all shows partial dependency that is repeating values so in order to achieve 
-- 2NF position once have to make different tables of these columns to remove partial dependencies.

 
 



  
