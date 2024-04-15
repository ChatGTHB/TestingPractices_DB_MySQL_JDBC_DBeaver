 -- Tabloları Birleştirme
 -- 2 Türlü --> 1)- Üst üste   2)- Yan yana
 select * from sakila.city; -- 601
 select * from world.city;  -- 4079
 
 -- 1)- Üst Üste Birleştirme : UNION
 select city from sakila.city 
 union -- Aynı olanlardan sadece birini--> 4004 (Çoklu satırlar için her zaman geçerli değil)
 select name from world.city; 
 
 select city from sakila.city 
 union all -- Tüm kaytları --> 601 + 4079 = 4680
 select name from world.city; 
 
 select *from city where city like 'A%'
 union
 select *from city where city like 'C%';
 
 -- Filmlerin dile göre kaçar tane olduğunu bulunuz. Listeni altına TOPLAM film sayısını ekleyiniz.
 select language_id, count(*) from film group by language_id 
 union
 select 'Toplam',count(*) from film;
 
 -- Soru : sakila.city tablosundan A ile başlayan şehirleri
 --        world.city tablosundan A ile başlayan şehirleri
 --        world_x.city tablosundan A ile başlayan şehirleri leri de listeye ekleyiniz.
 --        a)aynı şehirleri almayınız b)aynı şehirleri alınız

-- a) Aynı şehirler tek kayıt olacak şekilde
select city from sakila.city where city like '%A'
union
select name from world.city where name like '%A'
union
select name from world_x.city where name like '%A';

-- b) Tüm liste olduğu gibi
select city from sakila.city where city like '%A'
union all
select name from world.city where name like '%A'
union all
select name from world_x.city where name like '%A';
 
 -- 2)- Yan Yana Birleştirme : JOIN
select title, language_id from film;
select * from language;

-- Birinci yol
 select title, film.language_id, name
 from film
 left join language ON film.language_id=language.language_id
 order by language_id desc;
 -- language tablosunu film tablosuyla birleştir, left --> Film ana tablo
 
 -- İkinci yol
  select title, film.language_id, name
 from language
 right join film ON language.language_id=film.language_id
 order by language_id desc;
 -- ------------------------------------------------------------------
 select * from address;
 select * from city;
 select * from country;
 
 -- 2 Tabloyu birleştirme
 select address, district, city   -- address.* ,city.* 
 from address
 left join city ON address.city_id=city.city_id;
 
 -- 3 Tabloyu birleştirme
 select address.city_id, country, city, district, address, postal_code   -- address.* ,city.* 
 from address
 left join city ON address.city_id=city.city_id
 left join country ON city.country_id=country.country_id
 order by city_id;
 
 -- Soru : Her şehrin yanına ülkesini yazdırınız
 select city.country_id, country, city
 from city
 left join country ON city.country_id=country.country_id
 order by country_id;
 
  -- Soru : Her müşterinin ad ve soyadının yanına adresini yazdırınız
  select customer.first_name, customer.last_name, address
  from customer
  left join address ON address.address_id=customer.address_id;

  -- Soru : Yukarıdaki sorguyu, tabloya city de eklenecek şekilde düzenleyiniz.
  select customer.first_name, customer.last_name, address, city
  from customer
  left join address ON address.address_id=customer.address_id
  left join city ON city.city_id=address.city_id;
  
  -- Soru : Yukarıdaki sorguyu, tabloya country de eklenecek şekilde düzenleyiniz.
  select customer.first_name, customer.last_name, address, city, country
  from customer
  left join address ON address.address_id=customer.address_id
  left join city ON city.city_id=address.city_id
  left join country ON country.country_id=city.country_id;
  
  -- Soru : Her filmin yanına aktörünün adını ve soyadını yazdırınız.
  select title, actor.first_name, actor.last_name 
  from film
  left join film_actor ON film.film_id=film_actor.film_id
  left join actor ON actor.actor_id=film_actor.actor_id;
 
 -- Soru : Tüm filmlerin title ve kategorilerini yazdırınız.
  select title, category.name
  from film
  left join film_category ON film.film_id=film_category.film_id
  left join category ON category.category_id=film_category.category_id;
  
  -- Soru : Hangi kategoride kaç film olduğunu bulunuz ve en son satıra kaç film olduğunu ekleyiniz.
  select category.name, count(*)
  from film
  left join film_category ON film.film_id=film_category.film_id
  left join category ON category.category_id=film_category.category_id
  group by name
  union
  select 'Toplam',count(*) from film;
  
  -- Hangi aktörün kaç filmi olduğunu bulunuz.
  select actor.first_name, actor.last_name, count(*)
  from film
  left join film_actor ON film.film_id=film_actor.film_id
  left join actor ON actor.actor_id=film_actor.actor_id
  group by first_name;
