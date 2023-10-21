 -- Tabloları Birleştirme
 -- 2 Türlü --> 1)- Üst üste   2)- Yan yana
 select * from sakila.city; -- 601
 select * from world.city;  -- 4079
 
 -- 1)- Üst üste
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
 
 
