select * from address;
-- District(ilçe-semt) ,  distinct(benzersizleri ver)

select * from address order by district; -- bölge - bolge müşteri listesi
select distinct(district) from address; -- bana müşteriler hangi bölgelerden gelmiş

-- Group by
-- Hangi bölgeden kaç müşteri var
select district, count(*) as MüşteriSayısı from address group by district;

-- Hangi bölgeden kaç müşteri var : 1) bolge sıralı 2) miktar sıralı veriniz
select district, count(*) as MüşteriSayısı 
from address 
group by district
order by district;

select district, count(*) as MüşteriSayısı 
from address 
group by district
order by MüşteriSayısı desc;

-- Soru : district e göre kaç adres olduğunu bulunuz, miktarlara göre,
--        disctrictleri kendi içinde sıralayınız.
select district, count(*) as MüşteriSayısı 
from address 
group by district
order by MüşteriSayısı desc, district;

-- Soru : City tablosunda her ülke ID sinine göre kaç şehri olduğunu bulunuz
select * from city;
select country_id, count(*) as SehirSayisi 
from city 
group by country_id
order by SehirSayisi desc;
select * from country where country_id=44;

-- Soru : City tablosundan her ülkenin A ile başlayan kaç şehri 
--        olduğunu bulunuz

select country_id as UlkeId, count(*) as SehirSayisi 
from city
Where city like 'a%'
group by country_id  -- sonuc listesi bu noktada 
order by SehirSayisi desc;

-- yukarıdaki sorgunun sonucundaki listeden sadece 3 den büyük şehirlerini alınız

select country_id as UlkeId, count(*) as SehirSayisi 
from city
Where city like 'a%'  -- süzme : gruplamadan önce
group by country_id   
having SehirSayisi>3  -- süzme : gruplamadan sonra -> yani gruplama sonrası veri süzüldüandü
order by SehirSayisi desc;

-- String functions  
select * from customer;
select first_name, last_name, email from customer;
select concat(first_name,' ', last_name) as fullname  from customer;
select concat('fullname=',first_name,' ', last_name) from customer;
select first_name, length(first_name) as fu,  
       last_name,  length(last_name) as lu
from customer;
select first_name, left(first_name,3) as soldanUcTaneKarakter,
       last_name, right(last_name,3) as sagdanUcTaneKarakter
       from customer;

-- soru : isimleri İ.Temur  şeklinde yazdırınız.
select concat(left(first_name,1),'.',last_name) as nickName from customer;

-- soru : isimleri İ.T.  şeklinde yazdırınız.
select concat(left(first_name,1),'.',left(last_name,1),'.') as nickName from customer;


-- Soru : Customer tablosunda first_name in uzunluğuna göre kaçar kişi olduğunu bulunuz
--        örneğin 5 karakterli isimlerde 7 kişi var gibi...
--        4 karakterli isimden 5 tane var
--        6 karakterli isimden 7 tane var

select length(first_name) as harfSayisi, count(*) as isimSayisi  
from customer
group by harfSayisi
order by harfSayisi;

select concat(length(first_name),' karakterli isimden ',count(*), ' tane var') as rapor
from customer
group by length(first_name)
order by length(first_name);

-- String le ilgili diğer fonksiyonlar
select first_name,
substr(first_name,3),               -- sira 1 den başlar ve 3 dahil sonrsını parça olarak alır
substr(first_name,3,2),             -- 3 (dahil) den itibaren 2 tane al
replace(first_name,'A','*'),        -- A ların hepsini * la değiştirir.
replace(first_name,'FE','******'),  -- aranılan karakterleri bul , ve verilen ile değiştir.
repeat('*',5),                      -- verilen karakter(leri) , verilen sayı kadar tekrar eder
locate('a', first_name),            -- aranılan karakter(ler) in sira sini verir
lower(first_name),                  -- küçük harfe çevirir
upper(first_name)                   -- büyük harfe çevirir 
from customer;

-- Soru : 5 karakterden büyük isimlerin ilk 3 harfini alıp, gerisine * ekleyiniz
--        soyisimlerin ise, ilk bölümüne * ekleyip sondan 3 karakterini alarak aynı işlemi yapınız.
-- İsmet Temur  ->  İsm**  **mur

select
first_name,last_name,

concat( 
left(first_name,3),   repeat('*', length(first_name)-3), ' ',   
repeat('*', length(last_name)-3), right(last_name,3)
) as gizliAdSoyad

from customer
Where length(first_name)>5;

-- TODO
-- Soru :  isim ve soyisimlerin ilk karakterden sonraki kısımlarına * atarak listeletiniz.
-- İsmet Temur  ->  İ****  T****
-- Soru : isim ve soyisimi örneğin Ismet Temur -> IT TR şeklinde bitişik yazdırınız.
-- Soru : isim ve soyisimi örneğin Ismet Temur -> I***T T***R şeklinde bitişik yazdırınız




































