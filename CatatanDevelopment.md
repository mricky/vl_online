# Purchase Order
- Receive Date -> No Time  Delivery Data


# Receive Barang
Penerimaan Barang di generate saat order status
1 to Process

---------------
Status
1. Process, / Ready
2. Done

Activity 
- RFQ
- Purchase Order (Confirm Order)
- Print RFQ
- Receive Product - to Process
  Demand, Done 
  Pilihan WH/Stock
  Jika Selisih
  - Buat Back Order / No Back order
  - Print Delivery Slip
  - Save Done + on Hand

- Back Order Of (No Receive)
  Source Document





good_receive_details
- add demand qty -> dari po
-
- Dampak Ke stok
- Dampak Ke Akunting


# Default Warehouse

product_locations
- product
- good_receive_id
- wh_location_id
- qty_onhand
- created_by
- created_at
- updated_by
- updated_at


#CMD
SHOW TRIGGERS
DROP TRIGGER IF EXISTS product_stock_insert;
DROP TRIGGER IF EXISTS product_stock_delete; 

#CURL API
Update Stok
http://vl_online.test/syncInternalStock
http://vl_online.test/find-product-brand?q=AMINA
http://vl_online.test/find-product-category?q=AMINA
# SALES
Product
Product Lokasi