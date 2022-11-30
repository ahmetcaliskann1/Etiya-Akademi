--1
select name from country 
where lower(name) like 'a%'
--2
select c.name,c.surname,c.email from customer c 
--3
select * from products
where lower(name) like '%şo%'
--4
select p.name,p.unit_price,p.stock from products p
where unit_price between '10' and '25'
--5
select * from adress
order by title desc
--6
select * from adress
where street_id = 2 or door_number = 19
--7
select * from categories
where lower(name) like '_a%' and subcategoryid in (1,2,4)
--8
select name,surname,email from customer
order by name asc
--9
select * from products
where stock >23 and unit_price < '120'
--10
select * from products
where stock >=50 or unit_price >='30' and lower(name) like '%şo%'
--11
select sh.name,c.price from cargo c
full outer join shippers sh
on c.shippers_id = sh.id order by c.price
--12
select cu.name,cu.surname,a.title,co.name as country,c.name as city,
s.name as street,a.door_number from customer cu
right join adress a
on cu.shipping_adressid = a.id
right join street s
on a.street_id = s.id
right join city c
on s.cityid= c.id
right join country co
on c.countryid= co.id
--13
select * from categories c
inner join special_category sc
on c.special_categoryid = sc.id
inner join subcategory sb
on c.subcategoryid = sb.id
order by c.name asc
--14
select p.name,p.unit_price,p.stock,co.name as colour,br.name as brand from products p
full outer join products_colour pc
on p.id = pc.productsid
right join colour co
on pc.colourid = co.id
full outer join products_brand pb
on p.id = pb.productsid
full outer join brand br
on pb.brandid = br.id
--15
select p.id,p.name,p.unit_price,dc.name,dc.ratio from products p
full outer join discount_coupon dc
on p.discount_couponid = dc.id
order by p.name
--16
select pr.id,pr.name,pr.unit_price,pr.stock from products pr
full outer join categories ca
on pr.categoryid = ca.id
where pr.unit_price is not null
--17
select * from products p
inner join products_order po
on p.id = po.productsid
inner join orders o
on po.orderid = o.id
inner join customer c
on o.customerid = c.id
full outer join adress a
on c.shipping_adressid = a.id
--18
select * from return_products rp
inner join refund re
on rp.refundid = re.id
--19
select * from products p
right join products_basket pb 
on p.id = pb.productsid
right join basket b 
on pb.basketid = b.id
--20
select * from basket b
full outer join orders o
on b.orderid = o.id
full outer join cargo c
on o.cargoid = c.id








