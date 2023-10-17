-- Sıralama / Order By
select * from customer;
select * from customer order by last_name;      -- default olarak asc (artan)
select * from customer order by last_name asc;  -- artan yönde sıralama
select * from customer order by last_name desc; -- azalan yönde sıralama

select * from customer order by store_id; -- store_id artan yönde sıralı
select * from customer order by store_id asc, last_name asc; -- store_id artan sıralı olsun; her store_id de kendi içinde artan yönde soyad sıralı olsun

-- Soru : Müşteri tablosundaki id'ye göre son 10 ismi bulunuz
select * from customer order by customer_id desc limit 10;

-- Soru : Müşteri tablosundaki 500 ila 600 id'ler arasındaki müşterileri mağaza bazlı, soyisim sıralı listeleyiniz.
 select * from customer where customer_id between 500 and 600 order by store_id, last_name;
 
-- Soru : 2005-12-01 tarihinden önceki ödemelerin listesini müşteri sıralı veriniz.
 select * from payment where payment_date < '2005-12-01' order by payment_date, customer_id;
-- Order by'dan 2 alan gelirse önce 1. alan göre sıralar eğer aynı bilgiler gelirse onları da kendi içinde 2. alana göre sıralar
 
-- Soru : 2006 yılına ait toplam ödemeyi (amount) bulunuz.
 select sum(amount) from payment where payment_date between '2006-01-01' and '2006-12-31 23:59:59';
 select sum(amount) from payment where payment_date like'2006%';
 
-- Soru : 2005-2006 yılları toplam ödeme farkını bulunuz.
 select 
 (select sum(amount) from payment where payment_date like'2005%') 
 - 
 (select sum(amount) from payment where payment_date like'2006%')
 as _2005_2006_TahsilatFarki;
  
select * from address;
  -- district (ilçe-semt)  distinct (tekrarsız kayıtlar) 
select distinct(district) from address; -- Hangi bölgelerden müşteri geliyor
select * from address order by district; 
  
-- Gruplama
select district,count(*) as MusteriSayisi from address group by district;
select district,count(*) as MusteriSayisi from address group by district order by MusteriSayisi desc;

-- Soru :  Her ülkenin kaç şehri olduğunu bulunuz ve il sayısı yüksek olan az olana göre sıralayınız.
select country_id as UlkeId, count(*) as SehirSayisi from city group by country_id order by SehirSayisi desc;

-- Soru : City tablosundan her ülkenin 'A' harfi ile başlayan kaç şehri olduğunuz bulunuz.
select country_id as UlkeId, count(*) as SehirSayisi from city where city like 'A%' group by country_id order by SehirSayisi desc;

-- Having
-- City tablosundan her ülkenin 'A' harfi ile başlayan kaç şehri olduğunuz bulunuz ve sorgu sonucundaki listeden sadece 3'den fazla şehri olan ülkeleri yazdırınız.
select country_id as UlkeId, count(*) as SehirSayisi from city where city like 'A%' group by country_id having SehirSayisi >=3 order by SehirSayisi desc;

-- String Fonksiyonları
select * from  customer;

select first_name, last_name, email from customer;
select concat(first_name, ' ',last_name) as AdSoyad from customer;
select concat('Ad Soyad = ',first_name, ' ',last_name) as Ad_Soyad from customer;

select first_name as Ad, last_name as Soyad, length(first_name) as Ad_Uzunluk, length(last_name) as Soyad_Uzunluk from customer;

select first_name as Ad, last_name as Soyad, left(first_name,3) as Soldan_Uc_Karakter, right(last_name,3) as Sagdan_Uc_Karakter from customer;

-- Soru : Ad ve Soyadları --A. Soyad-- şeklinde kısaltarak yazdırınız.
select first_name as Ad, last_name as Soyad, concat(left(first_name,1),'. ',last_name) as KısaAd from customer;

-- Soru : Ad ve Soyadları --A. S.-- şeklinde kısaltarak yazdırınız.
select first_name as Ad, last_name as Soyad, concat(left(first_name,1),'. ',left(last_name,1),'.') as KısaAd from customer;

-- Soru : Customer tablosunda first_name'in uzunluğuna göre kaçar kişi olduğunu bulunuz.
-- Örneğin : 
-- 5 karakterli isme sahip 7 müşteri var...
select length(first_name) as Ad_Uzunlugu, count(*) as Musteri_Sayisi from customer group by Ad_Uzunlugu order by Ad_Uzunlugu;
select concat(length(first_name), ' karakterli isme sahip ', count(*), ' müşteri var.') as Rapor from customer group by length(first_name) order by length(first_name);
 
