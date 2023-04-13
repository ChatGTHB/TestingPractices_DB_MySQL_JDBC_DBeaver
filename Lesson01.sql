use world_x;           -- ben world_x DB sinde çalışıyorum
select * from country;
select * from city;     -- city den her şeyi seç
select code,name from country; -- country den code ve name seç
select id,name from city;
select count(id) from city; -- kaç tane id var
select count(*) from city; -- kaç tane var şehir var
select count(*) as ŞehirSayısı from city; -- şehir sayısı
select distinct(name) from city; -- benzersiz şehir isimleri listesi
select count(distinct(name)) from city; -- benzersiz şehir isimleri sayısı

use sakila;
select * from actor;  -- aktörler
select * from customer; -- müşteriler
select * from address; -- müşterilerin adresleri
select * from city; -- city tanım tablosu
select * from film;  -- film listesi
select * from film_actor; -- film_actor tablosu 

select count(*) from actor; -- actor sayısı
select count(*) as aktorSayisi from actor;

select * from film;
select max(rental_duration) from film;
select min(rental_duration) from film;
select sum(rental_duration) from film;
select avg(rental_duration) from film;













