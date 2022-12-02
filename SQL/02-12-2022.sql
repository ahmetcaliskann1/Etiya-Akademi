
-- Sepetinde o an en az 5 ürün olan customerları listeleyiniz.
select c.name, b.quantity from baskets b
inner join customers c
on b.customerid = c.id 
where quantity >=5

--Bugüne kadar verdiği sipariş toplamı 2000₺'yi geçen customerları listeleyiniz.
Select c.name "müşteri", od.total_price "Toplam fiyat" from order_details od
inner join orders o
on od.orderid = o.id
inner join customers c
on o.customerid = c.id
where od.total_price > 2000

-- Bugüne kadar en az 10.000₺ ürüne sahip satıcıları listeleyiniz.
select SUM(p.unit_prices) as "Fiyat Toplam", s.name as "Satıcı Adı"  from sellers s
inner join products_sellers ps
on ps.sellersid = s.id
inner join products p 
on ps.productsid = p.id
group by s.name 
Having sum(p.unit_prices) > 10000


--Her kategoride en çok kazandıran ürünü (price * quantity değeri ele alınmalıdır) listeleyiniz.
select  c.name,  MAX(p.unit_prices * p.stock) as "toplam fiyat" from products p
inner join categories c
on p.categoryid = c.id
group by c.name


-- Satıcıları sattığı ürün adedine göre büyükten küçüğe sıralayınız.
select s.name as "Satıcı Adı", count(*) as "Ürün Adedi" from sellers s
inner join products_sellers ps
on ps.sellersid = s.id
inner join products p 
on ps.productsid = p.id
group by s.name
order by count(*) desc

-- Siparişleri içerdiği ürün adedine göre listeleyiniz.
select orderid as "Sipariş Kodu", SUM(quantity) as "Ürün Adedi" from order_details
group by orderid
order by SUM(quantity) 

-- En çok kullanılan kargo şirketlerini kullanıldığı sipariş veya sipariş ürünü adedi ile birlikte listeleyiniz.
select sh.company_name "Kargo şirketi", sum(od.quantity) as "Sipariş ürün adedi" from order_details od
inner join shippers sh
on od.shipperid = sh.id
inner join orders o
on od.orderid = o.id
group by sh.company_name

-- Ürün bilgilerini içerisinde kategori,renk,beden,satıcı,kaç adet satıldı, kaç para kazandırdı bilgileri ile listeleyiniz.
select ct.name as "Kategori", c.name as "Renk", sz.name as "Beden", s.name as "Satıcı", od.quantity as "Satılan Adet",
od.total_price as "Toplan satılan ürün fiyatı" from products p
inner join products_sellers ps
on ps.productsid = p.id
inner join sellers s
on ps.sellersid = s.id
inner join colour c
on p.colour_id = c.id
inner join size sz
on p.sizeid = sz.id
inner join categories ct
on p.categoryid = ct.id
inner join order_details od 
on p.id = od.productid

-- Girilen Ülke için kaç adet şehir olduğunu,
Select cn.name, count(*) from countries cn
inner join cities c
on c.countryid = cn.id
group by cn.name

-- Girilen şehir için kaç adet ilçe olduğunu,
Select c.name, count(*) from cities c
inner join districts d
on d.citiesid = c.id
group by c.name

-- Girilen ilçe için kaç adet mahalle olduğunu listeleyiniz.
Select d.name, count(*) from districts d
inner join streets s
on s.distcritid = d.id
group by d.name
