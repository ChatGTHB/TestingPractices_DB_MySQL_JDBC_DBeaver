-- TODO

-- Soru :  isim ve soyisimlerin ilk karakterden sonraki kısımlarına * atarak listeletiniz.
-- İsmet Temur  ->  İ****  T****

select
first_name,last_name,
concat( 
left(first_name,1),   repeat('*', length(first_name)-1), ' ',   
left(last_name,1),   repeat('*', length(last_name)-1)
) as gizliAdSoyad
from customer;


-- Soru : isim ve soyisimi örneğin Ismet Temur -> IT TR şeklinde bitişik yazdırınız.

select
first_name,last_name,
concat( 
left(first_name,1), right(first_name,1)," ",left(last_name,1), right(last_name,1)) as KısaAdSoyad
from customer;


-- Soru : isim ve soyisimi örneğin Ismet Temur -> I***T T***R şeklinde bitişik yazdırınız

select
first_name,last_name,
concat( 
left(first_name,1),repeat('*', length(first_name)-2),right(first_name,1)," ",left(last_name,1), repeat('*', length(first_name)-2),right(last_name,1)) as KısaAdSoyad
from customer;





