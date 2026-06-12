CREATE TABLE DecodeSales (
    OrderID SERIAL PRIMARY KEY,
	OrderDate DATE,
    CustomerID VARCHAR(150) NOT NULL,
	Product VARCHAR(20) NOT NULL,
	Quantity NUMERIC(3),
    UnitPrice NUMERIC(10,2),
	ShippingAddress VARCHAR(105),
	PaymentMethod VARCHAR(25),
	OrderStatus VARCHAR(25),
	TrackingNumber VARCHAR(15),
	ItemsInCart NUMERIC(4),
	CouponCode VARCHAR(15),
	ReferralSource VARCHAR(15),
	TotalPrice NUMERIC(10,2)
);



SELECT * FROM decodesales;

ALTER TABLE decodesales
ALTER COLUMN orderid TYPE Varchar
USING orderid::varchar;


SELECT * FROM decodesales
ORDER BY Product ASC;


SELECT * FROM decodesales
ORDER BY orderstatus ASC;

SELECT Product, COUNT(*) AS total_orders
FROM decodesales
GROUP BY Product
ORDER BY total_orders DESC;

"COUNTING ALL COUPONCODE USED"

SELECT COUNT(CouponCode) AS total_coupons_used 
FROM decodesales;

"COUNTING ALL ITEM SHIPPED"

SELECT COUNT(*) AS shipped_orders_count 
FROM decodesales
WHERE OrderStatus = 'Shipped';

"GRANDTOTAL PRICE"
SELECT SUM (TotalPrice) AS grand_total_revenue 
FROM decodesales;


SELECT Product, SUM(Quantity) AS total_quantity_sold
FROM decodesales
GROUP BY Product
ORDER BY total_quantity_sold DESC;


"finding average unit price while i group it by product and order by avg unit price"

SELECT Product, AVG(UnitPrice) AS average_unit_price
FROM decodesales
GROUP BY Product
ORDER BY average_unit_price DESC;