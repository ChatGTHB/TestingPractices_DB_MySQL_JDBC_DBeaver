use sakila; -- Film kiralama programı database
select * from actor; -- Aktör tablosu
select count(*) as AktorSayisi from actor;
select * from film;
select * from payment;

select max(amount) as EnPahaliKiralama from payment;       -- En pahalı kiralama ücreti
select min(amount) as EnUcuzKiralama from payment;         -- En ucuz kiralama ücreti
select sum(amount) as ToplamGelir from payment;            -- Toplam gelir
select avg(amount) as OrtalamaKiralamaUcreti from payment; -- Ortalama kiralama ücreti

-- Where kelimesi ile kriter veriyoruz
select * from payment where customer_id=3; -- Payment tablosundan customer_id'si 3 olan müşterinin bilgileri

-- Soru :  3 nolu müşterinin yaptığı toplam ödemeyi bulunuz.
select sum(amount) as ToplamOdeme from payment where customer_id=3;

-- Soru :  3 nolu müşterinin yapmış olduğu minimum ve maksimum ödemeleri bulunuz.
select min(amount) as EnDusukOdeme, max(amount) as EnYuksekOdeme from payment where customer_id=3;

-- Soru :  3 nolu müşterinin kaç kiralama yaptığını bulunuz.
select count(*) as KiralamaSayisi from payment where customer_id=3;

-- Birden fazla where kriteri
select * from payment where customer_id=3 or customer_id=6; -- 3 ve 6 customer_id'li müşteriler

select * from payment where customer_id=3 and staff_id=2;   -- 3 customer_id'li müşterinin 2 staff_id'li çalışandan yaptığı kiralamalar

-- Soru 3 ve 2 nolu müşterilerin yaptığı kiralamaları listesini alınız
select * from payment where customer_id=3 or customer_id=2;
select count(*) from payment where customer_id=3 or customer_id=2;

select * from payment where customer_id in (2,3,4,5,6);          -- Çok kriter vermenin diğer bir yolu. Or gibi çalışır.
select * from payment where customer_id between 2 and 6;         -- Çok kriter vermenin diğer bir yolu. 2 ila 6 arası
select * from payment where customer_id >=2 and customer_id <=6; -- 2 ila 6 arası müşteriler

select * from customer;
select * from customer where last_name='SCOTT';
select * from customer where last_name='SCOTT' or last_name='DAVIS'	or last_name='MILLER';
select * from customer where last_name in ('SCOTT','DAVIS','MILLER');

-- Soru: Payment tablosundan 5 ve 7 dolar arası ödeme yapan müşteri numaralarını bulunuz.
select customer_id from payment where amount between 5 and 7;
select customer_id from payment where amount<=7 and amount>=5;

-- Soru: 5 nolu müşteri haricindeki müşterileri customer tablosundan sıralatınız.
select * from customer where customer_id <> 5;

-- Soru: 2005-07-08 tarihinde 5 ila 7 dolar arası ödeyen müşteri bilgilerini yazdırınız.
select * from payment where (amount between 5 and 7) and (payment_date between '2005-07-08 00:00:00' and '2005-07-08 23:59:59');

-- String arama işlemleri :
select * from customer where last_name='SCOTT'; 
select * from customer where last_name like 'S%';      -- S... startWiths(S) 'S' ile başlayanlar
select * from customer where last_name like '%S';      -- ...S endWiths(S) 'S' ile bitenler
select * from customer where last_name like '%S%';     -- ...S... contains(S) 'S' içerenler
select * from customer where last_name like '%S%C';    -- ...S...C... içinde önce 'S' geçip sonra 'C' geçenler
select * from customer where last_name like '%SC%';    -- ...SC... contains(SC) 'SC' içerenler
select * from customer where last_name like '%SC%IN%'; -- ...SC...IN... içinde önce 'SC' geçip sonra 'IN' geçenler

select first_name , last_name from customer;
select first_name , length(first_name) as fu, last_name, length(last_name) as lu from customer;

select first_name , left(first_name,3) as SoldanUcKarakter, last_name, right(last_name,3) as SagdanUcKarakter from customer;

select concat(first_name,' ',last_name) as fullName from customer;
select concat('FullName=',first_name,' ',last_name) as fullName from customer;

-- Limit
select * from customer limit 10;    -- İlk 10 kaydı gösterir
select * from customer limit 10,10; -- 10. kayıttan sonraki 10 kayıt --> 1.si kaçıncıdan sonra başlayacak (10), 2.si kaç kayıt getirecek
select * from customer limit 20,10; -- 21. kayıttan itibaren 10 kayıt
select * from customer limit 30,10; -- 31. kayıt dahil sonraki 10 kayıt

-- Sıralama
select * from customer;
select * from customer order by last_name; -- last_name ile sırala --> default asc
-- asc : küçükten büyüğe, desc : büyükten küçüğe 
