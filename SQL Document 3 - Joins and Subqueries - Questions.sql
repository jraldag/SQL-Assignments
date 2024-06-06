-- 1. List all customers who live in Texas (use JOINs)
--     Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
select first_name, last_name, district 
from customer
inner join address
on customer.address_id = address.address_id 
where district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
--     Answer: There are 1,423 unique payments with an amount above $6.99.
select payment_id, amount, first_name, last_name
from payment
inner join customer
on payment.customer_id = customer.customer_id 
where amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
--     Answer: There are none with a single payment over $175. 
--     Answer: There are seven with a sum of payments over $175: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Peter Menard, Tommy Collazo, Karl Seal
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having SUM(amount) > 175
);


-- 4. List all customers that live in Nepal (use the city table)
--     Answer: Kevin Schuler
select first_name, last_name, country
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id
where country = 'Nepal';


-- 5. Which staff member had the most transactions?
--     Answer: Jon Stephens
select staff.staff_id, first_name, last_name, count(payment_id)
from staff
inner join payment
on staff.staff_id = payment.staff_id 
group by staff.staff_id
order by count(payment_id) desc;


-- 6. How many movies of each rating are there?
--     Answer: PG-13 = 223, NC-17 = 210, R = 195, PG = 194, G = 178
select rating, count(rating)
from film
group by rating
order by count(rating) desc;


-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
--     Answer: There are 539 customers who made one ore more payments above $6.99 (first query below)
--     Answer: There are 130 customers who made just a single payment above $6.99 (second query below).
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);


select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id
	having count(amount) = 1
)
group by customer_id;


-- 8. How many free rentals did our stores give away?
--     Answer: 24
select count(rental_id)
from payment
where amount = 0;

