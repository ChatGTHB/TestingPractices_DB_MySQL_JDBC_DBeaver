-- String Fonksiyonları
select first_name
,substr(first_name,3)                -- Sıra 1'den başlıyor ve 3 dahil alıyor. (1., 2. ve 3. harfleri alır.)
,substr(first_name,3,2)              -- 3 (dahil)den itibaren 2 karakter alıyor. (3. ve 4. karakterleri alır.)
,replace(first_name,'A','*')         -- A' ların hepsini * ile değiştirir.
,replace(first_name,'AN','*****')    -- AN' ların hepsini ***** ile değiştirir.
,repeat('*','5')                     -- Verilen karakteri (*), 5 kez tekrar yazar.
,locate('A',first_name)              -- 1 den başlayarak aranılan karakter/ler (A)'in kelimede bulunduğu ilk harfin sırasını verir.
,lower(first_name)                   -- Tüm karakterleri küçültür.
,upper(first_name)					 -- Tüm karakterleri büyütür.
 from customer;

-- Soru : 5 karakterden uzun adların ilk 3 karakterini aynen alıp kalanına * ekleyiniz;
--        soyadların ise ilk bölümüne * yıldız ekleyip kalan son 3 karakteri aynen yazdırınız.
--        Örn : Kerem Paktaş  --> Ker** ***taş

 select first_name, last_name, concat(left(first_name,3),repeat('*',length(substr(first_name,4))),' ',repeat('*',length(last_name)-3),right(last_name,3)) 
 as Yildizli_Ad_Soyad 
 from customer 
 where length(first_name)>5;
 
 -- İkinci Yol
 select first_name as Ad, last_name as Soyad, concat(left(first_name,3),repeat('*',length(first_name)-3)) as Yildizli_Ad,concat(repeat('*',length(last_name)-3),right(last_name,3)) 
 as Yildizli_Soyad 
 from customer 
 where length(first_name)>5;
 
 -- Sub Select
 select * from 
 (select first_name, last_name, concat(left(first_name,3),repeat('*',length(first_name)-3)) as Yildizli_Ad,concat(repeat('*',length(last_name)-3),right(last_name,3)) 
 as Yildizli_Soyad 
 from customer 
 where length(first_name)>5) as Sonuc_Tablosu;
 
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
 
 
