-- where
select * from payment;
select * from payment where customer_id=3; -- 3 nolu müşterinin ödemeleri
select * from customer where customer_id=3;
-- soru:  3 nolu müşterinin toplam yaptığı ödemeyi(tutarı) bulunuz
select sum(amount) from payment where customer_id=3;
-- Soru:  3 nolu müşterinin yapmış olduğu max ve min ödemeleri bulunuz.
select min(amount) as enKucukOdeme, max(amount) as enBuyukOdeme 
from payment where customer_id=3;  
-- Soru: 3 nolu müşterinin kaç kiralama yaptığını bulunuz
select count(*) from payment where customer_id=3;

select * from customer;
select * from customer where last_name='SCOTT';
select * from customer where customer_id=2 OR customer_id=3;
select * from customer where customer_id in (24,30,2,3,5);
select * from customer where last_name in ('JONES','DAVIS','MILLER');
select * from customer where store_id=2 and active=0; -- 2 nolu mağazanın pasif müşterileri
-- Soru: 5 dahil 7 dolar arası ödeme yapan müşterileri listeleniz.
select * from payment where amount >=5 and amount<=7; 
select * from payment where amount between 5 and 7;
select * from payment where (amount between 6 and 7)
   and payment_date between '2005-07-08' and '2005-07-08 23:59:59';
   
   
select * from customer where last_name='scott'; -- equalignorecase
select * from customer where last_name like 's%'; -- % .. gibi,  startwith, s ile başlayan
select * from customer where last_name like '%s'; -- endwith, s ile bitenler
select * from customer where last_name like '%s%'; -- ..s.. , contains
select * from customer where last_name like '%s%ca%'; -- ..s..ca.. contains
select * from customer where last_name like 's%g'; -- s ile başlayan ve g ile biten
select * from customer where customer_id%2=1; -- id si tek olanlar modül

-- limit
select * from customer limit 10; -- ilk 10 kayıt
select * from customer limit 10,10; -- 10.satırdan sonraki 10
-- 1.Rakam kaçıncı satırdan sonra göstereceğini, 2.Rakam kaç tane göstereceğini
select * from customer limit 20,10; -- 3. 10luk:20.satırdan sonraki 10 satır
select * from customer limit 30,10; -- 4. 10luk:30.satırdan sonraki 10 satır

-- SIRALAMA
select * from customer;
select * from customer order by first_name;   -- default asc
-- asc : küçük ten büyüğe, desc : büyükten küçüğe 
select * from customer order by first_name asc; -- müşterileri alfabetik sıral k->b
select * from customer order by first_name desc; -- müşterileri alfabetik sıral b->k

-- müşterileri isme göre tersten sırala, aynı isimler var ise onları soyada normal sırala
select * from customer order by first_name desc, last_name asc;

select * from customer order by customer_id desc;
select * from customer order by customer_id desc limit 10;  -- sondan 10 kayıt
-- Soru : Müşteri tablosundaki 500 ile 600 id ler arası 
-- müşterileri mağazaya bazlı, soyisim sıralı listesini veriniz.
select * 
from customer 
where customer_id between 500 and 600 
order by store_id, last_name;

-- Soru : 2005-12-01 tarihten önceki ödemelerin listesini müşteri  sıralı veriniz.
select * 
from payment 
where payment_date < '2005-12-01'
order by customer_id, staff_id;

-- Soru : 2006 yılına ait toplam ödemeyi(amount) bulunuz.
select sum(amount) 
from payment 
where payment_date between '2006-01-01' and '2006-12-31 23:59:59';

select sum(amount) 
from payment 
where payment_date between '2005-01-01' and '2005-12-31 23:59:59';

select 4-2 as sonuc;


select
(select sum(amount) 
from payment 
where payment_date between '2005-01-01' and '2005-12-31 23:59:59')
-
(select sum(amount) 
from payment 
where payment_date between '2006-01-01' and '2006-12-31 23:59:59') as _2005_2006_Farkı;









































  



