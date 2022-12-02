-- group by
-- distinct
-- having
-- count
-- average
-- sum
-- min
-- max

--1 
-- Birim fiyatı 600'den eşit ve fazla olan ve stok miktarı 13'den eşit ve fazla olan kaç tane ürün vardır?
select p.unit_prices  as "Birim Fiyatı" , p.stock as "Stok Miktarı", COUNT(*) from products p 
GROUP BY p.stock,p.unit_prices
HAVING stock >=13 and unit_prices >= 600

--2
-- Adres tablosunda yer alan door_no ve customer tablosunda yer alan surname gruplandırması yapıp adet sayısını gösteriniz.
select c.surname,a.door_no, count(*) from adresses a
inner join customers c
on a.customerid = c.id
group by c.surname,a.door_no

--3
-- Products tablosunda yer alan unit_priceların 150 ile 900 arasında olan ürün fiyatlarının toplamı nedir?
select SUM(unit_prices) as Toplam from products
where unit_prices between 150 and 900

--4 
-- Products tablosunda yer alan unit_priceların ve stokları 10 ve 30 olan ürünlerin ortalama fiyatı nedir?
 select AVG(unit_prices) as ortalama from products
 where stock in (10,30) 
 
 --5
 -- Elektronik kategorisinde yer alan en ucuz ürün fiyatı nedir?
 select MIN(p.unit_prices) as "En ucuz ürün fiyati" from products p
 inner join categories c
 on p.categoryid = c.id
 where c.name = 'elektronik'
 
 --6 
 -- Aynı ürün ve aynı sipariş içerisinde yer alan en pahalı ürün fiyatı nedir?
 select MAX(unit_price) as "En pahalı ürün fiyati" from order_details od
 where od.productid = 1  and od.orderid = 1 
 
 
 --7
 -- Products tablosunda bulunan kategoriler ve isimleri nedir ?
 select DISTINCT(categoryid),c.name from products p
 inner join categories c
 on p.categoryid = c.id

 
 --8
 -- Verilen siparişlerde yer alan kargo firmalarının alınan sipariş sayısını gösteriniz.
 select sh.company_name, count(*) from order_details od
 full outer join shippers sh
 on od.shipperid = sh.id
 group by sh.company_name
 
 --9
 -- Satıcılara ait ürünlerin stok miktarı 15 ile 100 arasında yer alan satıcıları gruplayınız.
 
 select s.name,count(*) as "Stok Miktarları" from sellers s
 inner join products_sellers ps
 on  s.id = ps.sellersid
 inner join products p
 on ps.productsid = p.id
 where stock between 15 and 100
 group by s.name

 
 --10
 -- Her kategoride yer alan ürün miktarları 2 ve 2'den büyük olanlarını gösteriniz.
 select c.name, count(*) as "Ürün sayısı" from categories c
 full outer join products p
 on p.categoryid = c.id
 group by c.name
 HAVING Count(*) >= 2
 
 --11
 -- Renklerin ortalama stok miktarlarınız hesaplayınız.
 select AVG(p.stock) as "OrtalamaStok" ,c.name, count(*) as "Renklere_göre_ürün_sayisi" from products p
 inner join colour c
 on p.colour_id = c.id
 where c.id in(1,2,3,4)
 group by c.name
 
 --12
 -- Alınan siparişlerdeki ödeme tiplerinin sayısını gösteriniz.
 
 select p.payment_type, count (*) as "odeme_sayisi" from payments p
 inner join orders o
 on p.id = o.paymentid
 group by p.payment_type
 
 --13
 -- Tarihe göre 1'den büyük olan ödeme sayısı nedir?
 
 select o.order_date , count(*) as "Tarihe göre işlem sayısı" from payments p 
 inner join orders o
 on p.id = o.paymentid
 group by order_date 
 HAVING Count(*) >= 1

--14
-- Adreslerde yer alan ev olarak belirtilmiş şehirlere göre kaç tane ev vardır?
select c.name, count(*) as "müşterilerin ev adres sayısı" from adresses a
inner join cities c
on a.citiesid = c.id
where a.title = 'home'
group by c.name

--15
-- Sepette yer alan ürünlerin maksimum fiyatı ve ürünlerin adet sayıları nelerdir?
select MAX(b.total_price),p.name, count(*) as "Ürün Adeti" from baskets b
inner join products p
on b.productid = p.id
group by p.name

