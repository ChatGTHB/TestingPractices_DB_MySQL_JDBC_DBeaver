create table rehber(
   id int auto_increment primary key,
   ad varchar(50) not null,  -- ad alanına mutlaka veri gelmeli
   soyad varchar(50) not null, -- soyad alanına mutlaka veri gelmeli
   tel varchar(10) default '', -- bu alana bilgi eksik gelebilir.(eksik gelirse bosluk olabilir)
   email varchar(100) default '*' -- email gelmeyebilir, gelmezse * atanacak
);

select * from rehber;
insert into rehber (ad, soyad) values ("ismet","temur");

insert into rehber (ad,soyad, tel, email) values 
('ismet','temur','555','bir@hotmail.com'),
('ahmet','kaya','666','dort@hotmail.com'),
('ayşe','demir','777','uc@hotmail.com'),
('kaya','altın','888','bes@hotmail.com'),
('ali','deniz','999','alti@hotmail.com'),
('fatma','yıldız','000','yedi@hotmail.com'),
('zeynep','kaya','111','iki@hotmail.com');

-- veri silme işlemi
select * from rehber;
-- delete from rehber; BUNU SAKIN YAPMA !
-- delete from rehber where soyad="kaya"; BUNU SAKIN YAPMA !
select * from rehber where id=16; -- önce mutlaka select ile kontrol et
delete from rehber where id=16;

truncate table rehber; -- tabloyu ilk oluşturulduğu ana döndürüyor.
drop table rehber; -- remove table

-- update
-- sakın WHERE olmadan kullanma
update rehber set ad='Ali',soyad='yılmaz' where id=34;

-- Özet
-- DML, select,insert, update,delete(bilgi siliyor)
-- önce select ile kesin olarak bul , sonra update delete 

-- DDL,  create,drop (remove gibi),  alter

-- alter var olan tabloda tasarım değişikliği yapar
alter table rehber ADD soyad2 varchar(50) not null; -- yeni alan ekler
alter table rehber CHANGE email email varchar(200); -- özellik değiştirme
alter table rehber DROP soyad2; -- column siler

-- primary key birden fazla olursa aşağıdaki gibi verilir
create table aktor_film(
  aktor_id int,
  film_id int,

  primary key(aktor_id,film_id)
);


-- TODO: 
-- Bir üniversite ders kayıt db si tasarlanmak isteniyor(JAVA sorusunun DB sini)
-- öğrencilerin adı, soyadı, email, telefon, bolum  bilgisi vardır
-- bu öğrencilere ders saati belli olan dersler keydedilecektir(stored)
-- bu bilgilerin kaydedilmesini sağlayacak veritabanını tasarlayınız
-- Tabloların uyugn olanlarını diğer tablolardan bilgileri alarak dodurunuz.

-- daha sonra aşağıdaki bilgilerin sorgularını yazınız
-- Soru 0 : Öğrencilerin bölümlerini listeletiniz.
-- Soru 1 : Öğrencleri aldığı dersleri listeletiniz.
-- Soru 2 : hangi bölümden, kaç ders kaydı olduğunu bulunuz
-- Soru 3 : hangi dersten kaç ogrenci kaydı olduğunu bulunuz
-- Soru 4 : derse kayıtlı olmayan öğrencilerin listesini yazdırınız
-- Soru 5 : hangi öğrenci kaç derse kayıtlı olduğunu bulunuz
-- Soru 6 : Her bölümüm kayıtlı olan toplam ders saatini bulunuz
-- Soru 7 : En yüksek ders saatine sahip bolumu bulunuz. 
-- Soru 8 : Hangi bölümden kaç öğrenci olduğunuz bulunuz.

