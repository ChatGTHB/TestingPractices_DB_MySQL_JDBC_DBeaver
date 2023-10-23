-- Java : String, int --   Sql de: smallint,varchar,..

-- Column Adı    Tip Adı         Extra Özellikleri
-- city_id       smallint        UN AI PK
-- city          varchar(50)
-- country_id    smallint        UN
-- last_update   timestamp       (LocalDateTime)         

-- UN :  UNsigned : byte : -127  +128  negatif olmayacak 0-255
-- AI :  Auto Increment : Otomatik Artan
-- PK :  Primary Key : Birincil Anahtar --> TCNO gibi; başkasında olamaz

--            DB SQL Komutları
-- DML (Data Manipulation Language - Verileri işler) Komutları
-- select : veriyi görüntüleme
-- insert : veri ekleme
-- update : veriyi güncelleme
-- delete : veriyi silme

-- DDL (Data Definition Language-DB tasarımı yapar) Komutları
-- create : oluşturma
-- drop   : yok etme
-- alter  : düzeltiyor, ekliyor

create database z_garip; -- z_garip db si oluşturuldu
use z_garip;
create table rehber1(
id int, 
isim varchar(50)
);

-- Veri Ekleme
insert into rehber1 (id, isim) values (1,'Hakan');
insert into rehber1 (id, isim) values (2,'Harun');
insert into rehber1 (id, isim) values (3,'Nesrin');
insert into rehber1 (id, isim) values (3,'Ebru');
select * from rehber1;

create table rehber2(
id int primary key, -- Aynı değerden sadece 1 tane olabilir.
isim varchar(50)
);

insert into rehber2 (id, isim) values (1,'Hakan');
insert into rehber2 (id, isim) values (2,'Harun');
insert into rehber2 (id, isim) values (3,'Nesrin');
select * from rehber2;
insert into rehber2 (id, isim) values (3,'Ebru'); -- id int primary key nedeniyle eklenemedi

create table rehber3(
id int auto_increment primary key, 
isim varchar(50)
);

insert into rehber3 (isim) values ('Hakan');
insert into rehber3 (isim) values ('Harun');
insert into rehber3 (isim) values ('Nesrin');
select * from rehber3;

create table rehber4(
id int auto_increment primary key, 
ad varchar(50),
soyad varchar(50)
);
select * from rehber4;
insert into rehber4 (ad,soyad) values ('Hakan','Yiğitalp');
insert into rehber4 (ad,soyad) values ('Harun','Mert');
insert into rehber4 (ad) values ('Nesrin');
select * from rehber4;

create table rehber5(
id int auto_increment primary key, 
ad varchar(50)     not null, -- Buraya bir değer gelmesi zorunlu
soyad varchar(50)  not null  -- Buraya bir değer gelmesi zorunlu
);
set sql_mode=STRICT_TRANS_TABLES; -- not null'un etkin olması için DB programı set edildi

select * from rehber5;
insert into rehber5 (ad,soyad) values ('Hakan','Yiğitalp');
insert into rehber5 (ad) values ('Harun'); -- Soyad olmadığı için tabloya eklenmedi
select * from rehber5;

create table rehber6(
id int auto_increment primary key, 
ad varchar(50)     not null,        -- Buraya bir değer gelmesi zorunlu
soyad varchar(50)  not null,        -- Buraya bir değer gelmesi zorunlu
tel varchar(10)    default '',      -- Buraya değer gelmesi zorunlu değil; verilmezse default değer '' olacak.
email varchar(100) default ''       -- Buraya değer gelmesi zorunlu değil; verilmezse default değer '' olacak.
);

select * from rehber6;
insert into rehber6 (ad,soyad) values ('Hakan','Yiğitalp');
insert into rehber6 (ad,soyad,tel) values ('Harun','Mertoğlu','0155896325');
insert into rehber6 (ad,soyad,tel,email) values ('Harun','Mertoğlu','0155896325','mertoglu0155@mail.com');
select * from rehber6;

-- Veri Ekleme Yöntemleri
-- 1. Yol
insert into rehber6 (ad,soyad,tel,email) values 
('Harun','Yiğitoğlu','0155896325','mertoglu0155@mail.com');

-- 2.Yol
insert into rehber6 (ad,soyad,tel,email) values 
('Harun1','Yiğitoğlu','0155896325','mertoglu0155@mail.com'),
('Harun2','Yiğitoğlu','0155896325','mertoglu0155@mail.com'),
('Harun3','Yiğitoğlu','0155896325','mertoglu0155@mail.com'),
('Harun4','Yiğitoğlu','0155896325','mertoglu0155@mail.com');

select * from rehber6;