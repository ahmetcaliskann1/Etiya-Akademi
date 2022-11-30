SELECT * from products
order by stock desc;

select * from products
order by unit_price desc;

select * from products
order by categoryid asc;

select * from products
where stock >=35;

select id,name,stock from products
where stock >1 and stock <=20;

select id,name,stock,categoryid from products
where categoryid =4 or categoryid=5 
order by id desc;

select * from products
where unit_price between '25' and '75' ;

select * from products
where name like '%şo%';
--çalışmayacak, datada büyük olanı küçükle sorguladık.

select * from products
where lower(name) like '%şo%';

select * from products
where lower(name) like 'm%';

select * from products
where lower(name) like '%o%';

select * from categories
where lower(name) like '_y%';

select * from categories
where lower(name) like '%d__';

select * from products
where unit_price > '25' and lower(name) like '%mo%';

select * from categories
where special_categoryid between 1 and 3 and lower(name) like '%a%';




