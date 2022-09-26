# Product and Location Stock
Select CONCAT(products.name,'QTY : ',products.qty_onhand,' Hitung :') as full_name,
(SELECT COALESCE(SUM(product_locations.qty_onhand),0) 
		FROM product_locations 
		JOIN wh_locations on wh_locations.id = product_locations.wh_location_id
		WHERE product_locations.product_id = products.id and wh_locations.wh_location_name = 'WH/Stock') as internal_stock,
(SELECT COALESCE(SUM(product_locations.qty_onhand),0) 
		FROM product_locations 
		JOIN wh_locations on wh_locations.id = product_locations.wh_location_id
		WHERE product_locations.product_id = products.id and wh_locations.wh_location_name = 'Partner Location/Vendor') as vendor_stock
FROM products 


Select CONCAT(products.name,'QTY : ',products.qty_onhand,' Hitung :') as full_name
FROM products

# VIEWS
DROP VIEW IF EXISTS view_product
CREATE VIEW view_product as 
SELECT id, CONCAT(products.name,' Qty : ', products.qty_onhand, ' Harga :',' Rp.', format(products.product_price,0)) as product_name
FROM products

DROP VIEW IF EXISTS view_product_location
CREATE VIEW view_product_location as 
SELECT product_locations.id, products.name, product_locations.product_id, CONCAT('Supplier : ',vendors.name, ' Lokasi : ', wh_locations.wh_location_name,' Jumlah : ', product_locations.qty_onhand,' Harga : ', format(product_locations.product_price,0)) as product_location from product_locations 
JOIN products on products.id = product_locations.product_id
JOIN wh_locations on wh_locations.id = product_locations.wh_location_id
JOIN goods_receipt on goods_receipt.id = product_locations.good_receipt_id
JOIN vendors on goods_receipt.vendor_id = vendors.id
