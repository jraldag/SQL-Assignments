-- 1. How many actors are there with the last name "Wahlberg"?
--       Answer: 2
select count(last_name)
from actor a 
where last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
--       Answer: 5,602
select count(amount)
from payment p 
where amount between 3.99 and 5.99;

-- 3. What film does the store have the most of? (search in inventory)
--       Answer: There are 72 different film_id's that the two stores combined have 8 of
select film_id, count(film_id)
from inventory i 
group by film_id 
order by count(film_id) desc;

-- 4. How many customers have the last name 'William'?
--       Answer: 0
select count(last_name)
from customer c 
where last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
--       Answer: Staff_id '1' sold the most, 8,040
select staff_id, count(staff_id)
from rental r 
group by staff_id 
order by count(staff_id) desc;

-- 6. How many different district names are there?
--       Answer: 378
select count(distinct district)
from address a; 

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
--       Answer: Film_id 508 has the most with 15 actors
select film_id, count(film_id)
from film_actor fa 
group by film_id 
order by count(film_id) desc;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--       Answer: 13
select count(last_name)
from customer c 
where store_id = 1 and last_name like '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
--       Answer: 3 payment amounts, 2.99, 4.99, and 0.99, had a number of rentals above 250 for customers with ids between 380 and 430.
select amount, count(rental_id)
from payment p
where customer_id between 380 and 430
group by amount
having count(rental_id) > 250

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
--       Answer: There are 5 rating categories. PG-13 has the most movies with 223.
select rating, count(rating)
from film f 
group by rating 
order by count(rating) desc;