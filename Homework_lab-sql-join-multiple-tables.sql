#Write a query to display for each store its store ID, city, and country.
SELECT S.store_id,C.city, country.country 
FROM store S
INNER JOIN address A ON A.address_id=S.address_id
INNER JOIN city C ON C.city_id=A.city_id
INNER JOIN country ON country.country_id=c.country_id;


#Write a query to display how much business, in dollars, each store brought in.
SELECT i.store_id, CONCAT('$', FORMAT(sum(p.amount), 2)) AS sales 
FROM payment P
INNER JOIN  rental ON rental.rental_id=P.rental_id
INNER JOIN inventory I ON i.inventory_id=rental.inventory_id
INNER JOIN store_id;

#What is the average running time of films by category?
SELECT category.name, round(avg(film.length),2) as average_running_time
FROM film_category as cat
INNER JOIN film ON film.film_id=cat.film_id
INNER JOIN category ON cat.category_id=category.category_id
GROUP BY cat.category_id;

#Which film categories are longest?
SELECT category.name, round(avg(film.length),2) as average_running_time, rank () over (order by round(avg(film.length),2) desc) as rank_length
FROM film_category as cat
INNER JOIN film ON film.film_id=cat.film_id
INNER JOIN category ON cat.category_id=category.category_id
GROUP BY cat.category_id;


#Display the most frequently rented movies in descending order.
SELECT F.title, count(rental_id), rank () over ( order by count(rental_id) desc) as number_of_rents
FROM rental Rent
INNER JOIN inventory I on I.inventory_id=Rent.inventory_id
INNER JOIN FILM F on F.film_ID=I.film_id
GROUP BY F.title;

#List the top five genres in gross revenue in descending order.
SELECT Cat.name, sum(P.amount) as revenue
FROM payment P
	INNER JOIN rental R ON R.rental_id=P.rental_id
	INNER JOIN inventory I ON I.inventory_id=R.inventory_id
	INNER JOIN film_category F_cat on F_cat.film_id=I.film_id
	INNER JOIN category Cat on Cat.category_id=F_cat.category_id
GROUP by Cat.name
ORDER BY revenue desc
LIMIt 5;


#Is "Academy Dinosaur" available for rent from Store 1?
SELECT F.title, I.store_id FROM inventory I
INNER JOIN film F ON F.film_id=I.film_id
WHERE f.title like '%Academy Dinosaur%' and I.store_id=1
GROUP BY F.title, I.store_id;

