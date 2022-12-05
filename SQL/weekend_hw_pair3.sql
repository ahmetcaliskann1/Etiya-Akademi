
--Kargo şirketlerine toplam kaç para ödendiğini hesaplayınız.
select sh.company_name as "Kargo Firmaları",
SUM(od.total_price) as "Ödenen Miktar" from order_details od 
inner join shippers sh
on od.shipperid = sh.id
group by sh.company_name

--Halihazırda indirimli ve isminde 'b' geçen tüm ürünleri listeleyiniz.

select p.name as "Ürün Adı", d.discount_price as "İndirim Miktarı(TL)"from products p
inner join discount d
on p.discount_id = d.id
where p.name like '%b%'

--3. harfi c olan tüm ürünleri listeleyiniz.
select * from products 
where name like '__c%'

--Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız (alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)

INSERT INTO public.orders(
	paymentid, order_date, customerid, adressesid)
	VALUES 
	(1,'2022-12-03',1,2),
	(2,'2022-12-03',2,3),
	(3,'2022-12-04',2,2)
	
	select * from orders
	
--Sipariş oluşturduktan sonra sepeti boşaltacak update komutlarını oluşturunuz.
Update baskets 
set aktif = False where customerid = 1 and productid = 1


--İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
select d.id "İNDİRİM KODU", p.name "ÜRÜN ADI", p.unit_prices "ÜRÜN FİYATI", d.discount_price "İNDİRİM TUTARI", 
p.unit_prices-d.discount_price "İNDİRİM UYGULANMIŞ FİYAT" from discount d
inner join products p
on p.discount_id = d.id

--Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert komutunu geliştiriniz.
INSERT INTO public.customer_reviews(
	customers_id, products_id, review_point)
	VALUES (1, 1, 6);

select Sum((cr.review_point))/(count(cr.id)) as "müşteri değerlendirmesi" from customer_reviews cr
where cr.products_id = 1


--Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.(?)

insert into public.return_details(
	returnid, order_detailsid, quantity, total_price) 
    values
	(1,3,1,2),
	(2,3,2,3),
	(3,4,2,2)

--İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.
select * from return_details

update return_details
set quantity = 4, total_price = 750
where id = 1


--Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.
select * from products

update products
set unit_prices = (unit_prices*2)
where id = 5


--Sipariş durumu(kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak update komutunu geliştiriniz.
select * from order_details

update order_details
set shipping_status = 1
where id = 3

--Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.
select * from baskets

insert into baskets (total_price, quantity, productid, customerid)
values ('70', '1', '4', '2' )

-- Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz.

Update baskets set quantity = quantity+1
WHERE ID = 1

-- En az bir sipariş vermiş ancak hiç "MNG Kargo" kullanmamış müşterileri listeleyiniz

select c.name, sh.company_name from orders o 
inner join customers c
on o.customerid = c.id
inner join order_details od
on od.orderid = o.id
inner join shippers sh
on od.shipperid = sh.id
where sh.company_name <> 'MNG' and od.quantity >= 1


-- En az bir adet aynı üründen 10+ sipariş vermiş kullanıcıları ve ürünü listeleyiniz.

select c.name as "Müşteri Adı", od.quantity as "Sipariş Adeti" from order_details od
inner join products p
on od.productid = p.id
inner join orders o
on od.orderid = o.id
inner join customers c
on o.customerid = c.id
where od.quantity > 10

-- Onaylanmamış ödemeleri listeleyiniz.

select py.payment_status,o.id,p.name from sellers s
inner join products_sellers ps
on s.id=ps.sellersid
inner join products p
on ps.productsid=p.id
inner join order_details od
on p.id= od.productid
inner join orders o
on od.orderid=o.id
inner join payments py
on o.paymentid=p.id
where py.payment_status=false

--En az 2 farklı ülkede adresi olan kullanıcıları listeleyiniz.

select cu.name,cu.surname, count(distinct(c.id)) as Ülke_sayısı,count(c.id) as adres_sayısı from countries c
inner join cities ct
on c.id = ct.countryid
inner join districts d
on ct.id = d.citiesid
inner join streets s
on d.id = s.distcritid
inner join adresses a
on s.id = a.streetid
inner join customers cu
on a.customerid = cu.id
group by cu.name,cu.surname
HAVING COUNT(distinct(c.id)) >= 2

--EN az 2 farklı şehirde adresi olan ve bu adreslere en az 1 adet sipariş vermiş 
--kullanıcıları listeleyiniz.

select  c.name,count(distinct(ct.name)) as şehir_sayısı,count(o.id) as sipariş_sayısı  from customers c
inner join orders o
on c.id = o.customerid
inner join adresses a
on o.adressesid = a.id
inner join streets s
on a.streetid = s.id
inner join districts d
on s.distcritid = d.id
inner join cities ct
on d.citiesid = ct.id
group by c.name
having count(distinct(ct.name)) >= 2

--Eklenmiş ancak hiç bir siparişte kullanılmamış adresleri listeleyiniz.

select a.id,c.name, count (o.id) from orders o 
right join adresses a
on o.adressesid = a.id
inner join customers c
on a.customerid = c.id
group by a.id,c.name
having count (o.id) = 0











