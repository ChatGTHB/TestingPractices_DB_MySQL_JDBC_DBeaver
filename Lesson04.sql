-- tabloları birleştirme
-- verilerini alt alta birleştirme, yan yana birleştirme

select * from sakila.city; -- 600
select * from world.city; -- 4079

select city from sakila.city
union -- aynılarını almaz
select name from world.city
order by city;

select city from sakila.city
union all  -- aynıları da olsa alır
select name from world.city
order by city;
-- Soru : sakila.city tablosundan A ile başlayan şehirleri
--        world.city tablosundan A ile başlayan şehirleri
--        world_x.city tablosundan A ile başlayan şehirleri leri de listeye ekleyiniz.
--        a) aynı şehirleri almayınız b) aynı şehirleri alınız        


select city from sakila.city where city like 'a%'
union -- all --b
select Name from world.city where Name like 'a%'
union -- all --b
select Name from world_x.city where Name like 'a%';

select city
from
(select city from sakila.city
union -- all --b
select Name from world.city
union -- all --b
select Name from world_x.city) as sehirler
where city like 'a%';

-- Soru : Hangi dilden kaç film olduğunu bulunuz. listeni altına TOPLAM film sayısını ekleyiniz.

select language_id, count(*) from film group by language_id
union
select 'toplam', count(*) from film;

-- yan yana birleştirme
select title, language_id from film;
select * from language;

select title, film.language_id, language.language_id, language.name
from film    -- left in solundaki tablo ANA tablo
left join language ON film.language_id=language.language_id;
-- dil tablosunun kayıtlarını language_id alanı üzerinden film tablosuna birleştir.
-- referans yani birinci tablo LEFT ile sol taraf yani FİLM tablosudur.

-- Soru : bir önceki union sorusundaki dil id lerin yerine isimlerini yazdırınız.
-- (Hangi dilden kaç film olduğunu bulunuz. listeni altına TOPLAM film sayısını ekleyiniz.)

select film.*, language.*
from film
left join language ON film.language_id=language.language_id;

select language.name, count(*)
from film 
left join language ON film.language_id = language.language_id
group by film.language_id
union
select 'toplam', count(*) from film;


-- Soru: Sakila.City tablosundaki Her bir city nin yanına ülkesini yazdıralım

select * from city;
select * from country;

select city.city, country.country
from city left join country ON city.country_id=country.country_id
Where country.country like 'turke%'
order by country.country;

-- Soru: Adres tablosundaki tüm satırların city kısmının ismini yazdırınız.

select address.* , city.city
from address
left join city ON address.city_id=city.city_id;

-- yukarıdaki sonuçlara city nin ülkesini de ekleyiniz.

select address.* , city.city, country.country
from address
left join city ON address.city_id=city.city_id
left join country ON city.country_id=country.country_id;

-- TODO : -- Her filmin yanına aktorünün adını ve soyadını yazdırınız. 
-- TODO : -- Soru : Hangi aktörün(adı ve soyadı) kaç filmi olduğunu bulunuz.
-- TODO : -- Soru : Hangi kategoriden kaç film olduğunu bulunuz
-- TODO : -- Soru : Bütün filimlerin title ını ve hangi kategoride olduğunun listesini yazdırınız
-- TODO : -- Günün Sorusu : Her kategoriden kaç film olduğunu ve en son satıra toplam film sayısını ekleyiniz.
-- TODO : -- Soru : Her filmin(title) yanına aktörün adı ve soyadını yazdırınız
-- TODO : -- Soru : hangi aktör kaç filimde oynamıştır









