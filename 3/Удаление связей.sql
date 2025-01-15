-- Удаление внешних ключей
ALTER TABLE "Order" DROP CONSTRAINT fk_order_user;
ALTER TABLE "Order" DROP CONSTRAINT fk_order_payment;
ALTER TABLE "Order" DROP CONSTRAINT fk_order_status;
ALTER TABLE "Payment" DROP CONSTRAINT fk_payment_status;
ALTER TABLE "Product" DROP CONSTRAINT fk_product_brand;
ALTER TABLE "Product" DROP CONSTRAINT fk_product_subcategory;
ALTER TABLE "Subcategory" DROP CONSTRAINT fk_subcategory_category;
ALTER TABLE "Order_Detail" DROP CONSTRAINT fk_order_detail_order;
ALTER TABLE "Order_Detail" DROP CONSTRAINT fk_order_detail_product;
ALTER TABLE "Inventory" DROP CONSTRAINT fk_inventory_storage;
ALTER TABLE "Inventory" DROP CONSTRAINT fk_inventory_product;

-- Удаление первичных ключей
ALTER TABLE "User" DROP CONSTRAINT "User_pkey";
ALTER TABLE "Order" DROP CONSTRAINT "Order_pkey";
ALTER TABLE "Order_Detail" DROP CONSTRAINT "Order_Detail_pkey";
ALTER TABLE "Payment" DROP CONSTRAINT "Payment_pkey";
ALTER TABLE "Status" DROP CONSTRAINT "Status_pkey";
ALTER TABLE "Product" DROP CONSTRAINT "Product_pkey";
ALTER TABLE "Brand" DROP CONSTRAINT "Brand_pkey";
ALTER TABLE "Category" DROP CONSTRAINT "Category_pkey";
ALTER TABLE "Subcategory" DROP CONSTRAINT "Subcategory_pkey";
ALTER TABLE "Storage" DROP CONSTRAINT "Storage_pkey";
ALTER TABLE "Inventory" DROP CONSTRAINT "Inventory_pkey";