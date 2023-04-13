use sakila;
-- TODO : -- Her filmin yanına aktorünün adını ve soyadını yazdırınız. 

select title , actor.first_name, actor.last_name
from film
left join film_actor ON film.film_id=film_actor.film_id
left join actor ON film_actor.actor_id=actor.actor_id;

-- TODO : -- Soru : Hangi aktörün(adı ve soyadı) kaç filmi olduğunu bulunuz.

select actor.first_name, actor.last_name,film_actor.film_id
from film
left join film_actor ON film.film_id=film_actor.film_id
left join actor ON film_actor.actor_id=actor.actor_id
order by actor.first_name,actor.last_name,film_actor.film_id;

-- TODO : -- Soru : Hangi kategoriden kaç film olduğunu bulunuz

select name,title
from category 
left join film_category ON category.category_id=film_category.category_id
left join film ON film_category.film_id=film.film_id
order by name,title;

-- TODO : -- Soru : Bütün filmlerin title ını ve hangi kategoride olduğunun listesini yazdırınız.

select title,name
from category 
left join film_category ON category.category_id=film_category.category_id
left join film ON film_category.film_id=film.film_id
order by title,name;

-- TODO : -- Günün Sorusu : Her kategoriden kaç film olduğunu ve en son satıra toplam film sayısını ekleyiniz.

select name,title
from category 
left join film_category ON category.category_id=film_category.category_id
left join film ON film_category.film_id=film.film_id
union
select 'Toplam', count(*) from film;

-- TODO : -- Soru : Hangi aktör kaç filmde oynamıştır?

select actor.first_name, actor.last_name,title
from film
left join film_actor ON film.film_id=film_actor.film_id
left join actor ON film_actor.actor_id=actor.actor_id
order by actor.first_name,actor.last_name,title;


