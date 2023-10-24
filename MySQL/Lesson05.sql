-- DML (data manipulation language - Verileri işler)
-- select : veriyi görüntüledik
-- insert : veri ekleme
-- update : veriyi güncelleme
-- delete : veriyi silme

-- DDL (data definition language-DB tasarımı yapar) komutları
-- create : oluşturma
-- drop   : yok etme
-- alter  : düzeltiyor, ekliyor

-- ismet  z_ismet22
select * from city;

-- column adı      tip adı     column ek özellikler
-- city_id       smallint      UN AI PK 
-- city          varchar(50) 
-- country_id    smallint      UN 
-- last_update   timestamp

-- UN : unsigned işaretsiz:  byte : -127 , 128  -> 255
-- AI : Auto Increment -> otomatik artan
-- PK : Primary KEY -> bu alandan bir tane daha olamaz.

-- create database z_ismet1; -- z_ismet1 db si oluşturuldu
use z_ismet1; -- z_ismet1 db sini kullan sorgular için

create table rehber1(
   id int,
   isim varchar(20)
);

select * from rehber1;

insert into rehber1 (id, isim) values (1,"ismet");
insert into rehber1 (id, isim) values (2,"Ayşe");
insert into rehber1 (id, isim) values (2,"Mehmet");

create table rehber2(
   id int primary key,
   isim varchar(20)
);

select * from rehber2;

insert into rehber2 (id, isim) values (1,"ismet");
insert into rehber2 (id, isim) values (2,"Ayşe");
insert into rehber2 (id, isim) values (3,"Mehmet");

create table rehber3(
   id int auto_increment primary key,
   isim varchar(20)
);

select * from rehber3;

insert into rehber3 (isim) values ("ismet");
insert into rehber3 (isim) values ("Ayşe");
insert into rehber3 (isim) values ("Mehmet");

-- rehber4
create table rehber4(
   id int auto_increment primary key,
   ad varchar(20),
   soyad varchar(20)
);
select * from rehber4;
insert into rehber4 (ad,soyad) values ("ismet","temur");
insert into rehber4 (ad) values ("ayşe");

-- rehber5
create table rehber5(
   id int auto_increment primary key,
   ad varchar(20) not null,
   soyad varchar(20) not null
);
select * from rehber5;
insert into rehber5 (ad,soyad) values ("ismet","temur");
insert into rehber5 (ad) values ("ayşe");

set sql_mode=STRICT_TRANS_TABLES;

insert into rehber5 (ad,soyad) values
("ismet1","temur1"),
("ismet2","temur2"),
("ismet3","temur3"),
("ismet4","temur4");

insert into rehber5 (ad,soyad) 
select first_name,last_name from sakila.customer limit 50;









