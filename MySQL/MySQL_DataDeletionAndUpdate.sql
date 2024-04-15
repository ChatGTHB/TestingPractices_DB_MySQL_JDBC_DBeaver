-- Veri Ekleme Yöntemleri
-- 1. Yol
insert into rehber6 (ad,soyad,tel,email) values 
('Haluk','Yiğitoğlu','0155896325','mertoglu0155@mail.com');

-- 2.Yol
insert into rehber6 (ad,soyad,tel,email) values 
('Haluk1','Yiğitoğlu','0155896325','mertoglu0155@mail.com'),
('Haluk2','Yiğitoğlu','0155896325','mertoglu0155@mail.com'),
('Haluk3','Yiğitoğlu','0155896325','mertoglu0155@mail.com'),
('Haluk4','Yiğitoğlu','0155896325','mertoglu0155@mail.com');

-- 3.Yol --> Select-Insert Methodu
insert into rehber6 (ad,soyad,tel,email)
select first_name, last_name, substr(phone,1,10), email 
from sakila.customer
left join sakila.address ON sakila.address.address_id=sakila.customer.address_id limit 50;
select * from rehber6;

truncate table rehber6; -- Tabloyu ilk oluştuğu ana va ayarlara döndürür.

create table rehber7(
id int auto_increment primary key, 
ad varchar(50)     not null,        -- Buraya bir değer gelmesi zorunlu
soyad varchar(50)  not null,        -- Buraya bir değer gelmesi zorunlu
tel varchar(10)    default '',      -- Buraya değer gelmesi zorunlu değil; verilmezse default değer '' olacak.
email varchar(100) default ''       -- Buraya değer gelmesi zorunlu değil; verilmezse default değer '' olacak.
);

insert into rehber7 (ad,soyad,tel,email)
select first_name, last_name, substr(phone,1,10), email 
from sakila.customer
left join sakila.address ON sakila.address.address_id=sakila.customer.address_id limit 50;
select * from rehber7;

create table rehber8(
id int auto_increment primary key, 
ad varchar(50)     not null,        -- Buraya bir değer gelmesi zorunlu
soyad varchar(50)  not null,        -- Buraya bir değer gelmesi zorunlu
tel varchar(50)    default '',      -- Buraya değer gelmesi zorunlu değil; verilmezse default değer '' olacak.
email varchar(100) default ''       -- Buraya değer gelmesi zorunlu değil; verilmezse default değer '' olacak.
);

insert into rehber8 (ad,soyad,tel,email)
select first_name, last_name, substr(phone,1,10), email 
from sakila.customer
left join sakila.address ON sakila.address.address_id=sakila.customer.address_id limit 50;
select * from rehber8;

-- ATTENTION : DELETE ve UPDATE komutları WHERE olmadan kullanılmamalı!!!
-- Veri Silme İşlemleri
select * from rehber8 where id=7; -- Önce selectle aradığını bulup kontrolünü yap
delete from rehber8 where id=7;   -- Sonra sil
select * from rehber8;

-- Veri Güncelleme İşlemleri
select * from rehber8 where id=50;                            -- Önce selectle aradığını bulup kontrolünü yap
update rehber8 set ad='JACK', soyad='NICHOLSON' where id=50;  -- Sonra sil

-- Drop
drop database z_garip; -- Database siler
drop table rehber8;    -- Tablo siler

-- Alter : Yapıda değişiklik yapar
alter table rehber8 ADD yas int not null;        -- Yeni özellik ekler
alter table rehber8 CHANGE tel tel varchar(60);  -- Var olanı değiştirir
alter table rehber8 DROP yas;                    -- Var olan kolonu siler

-- 1den fazla primary keye ihtiyaç varsa tanımlama aşağıdaki şekilde yapılır : 
create table aktor_film(
aktor_id int,
film_id int,
primary key (aktor_id, film_id)
)
