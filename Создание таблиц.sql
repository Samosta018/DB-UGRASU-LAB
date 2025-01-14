CREATE TABLE "User" (
  "id" SERIAL PRIMARY KEY,
  "login" VARCHAR(15) NOT NULL,
  "password" VARCHAR(255) NOT NULL,
  "name" VARCHAR(50),
  "midname" VARCHAR(50),
  "lastname" VARCHAR(50) NOT NULL,
  "phone" VARCHAR(20),
  "email" VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE "Order" (
  "id" SERIAL PRIMARY KEY,
  "created" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "total_cost" DECIMAL(10, 2) NOT NULL,
  "review_text" VARCHAR(300),
  "status_id" INT NOT NULL,
  "payment_id" INT NOT NULL,
  "user_id" INT NOT NULL,
  "country" VARCHAR(50) NOT NULL,
  "city" VARCHAR(50) NOT NULL,
  "street" VARCHAR(50) NOT NULL,
  "number_house" VARCHAR(20)
);

CREATE TABLE "Order_Detail" (
  "id" SERIAL PRIMARY KEY,
  "order_id" INT NOT NULL,
  "product_id" INT NOT NULL,
  "quantity" INT NOT NULL CHECK("quantity" > 0)
);

CREATE TABLE "Payment" (
  "id" SERIAL PRIMARY KEY,
  "date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "amount" DECIMAL(10, 2) NOT NULL,
  "status_id" INT NOT NULL
);

CREATE TABLE "Status" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(25) NOT NULL,
  "description" VARCHAR(200)
);

CREATE TABLE "Product" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" TEXT,
  "price" DECIMAL(10, 2) NOT NULL,
  "brand_id" INT NOT NULL,
  "subcategory_id" INT NOT NULL
);

CREATE TABLE "Brand" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" TEXT
);

CREATE TABLE "Category" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" TEXT
);

CREATE TABLE "Subcategory" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" TEXT,
  "category_id" INT NOT NULL
);

CREATE TABLE "Storage" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "capacity" INT NOT NULL,
  "country" VARCHAR(50) NOT NULL,
  "city" VARCHAR(50) NOT NULL,
  "street" VARCHAR(50) NOT NULL,
  "number_house" VARCHAR(20)
);

CREATE TABLE "Inventory" (
  "id" SERIAL PRIMARY KEY,
  "product_id" INT NOT NULL,
  "storage_id" INT NOT NULL,
  "quantity" INT NOT NULL CHECK("quantity" >= 0)
);

ALTER TABLE "Order"
ADD CONSTRAINT fk_order_user FOREIGN KEY ("user_id") REFERENCES "User"("id"),
ADD CONSTRAINT fk_order_payment FOREIGN KEY ("payment_id") REFERENCES "Payment"("id"),
ADD CONSTRAINT fk_order_status FOREIGN KEY ("status_id") REFERENCES "Status"("id");

ALTER TABLE "Payment"
ADD CONSTRAINT fk_payment_status FOREIGN KEY ("status_id") REFERENCES "Status"("id");

ALTER TABLE "Product"
ADD CONSTRAINT fk_product_brand FOREIGN KEY ("brand_id") REFERENCES "Brand"("id"),
ADD CONSTRAINT fk_product_subcategory FOREIGN KEY ("subcategory_id") REFERENCES "Subcategory"("id");

ALTER TABLE "Subcategory"
ADD CONSTRAINT fk_subcategory_category FOREIGN KEY ("category_id") REFERENCES "Category"("id");

ALTER TABLE "Order_Detail"
ADD CONSTRAINT fk_order_detail_order FOREIGN KEY ("order_id") REFERENCES "Order"("id"),
ADD CONSTRAINT fk_order_detail_product FOREIGN KEY ("product_id") REFERENCES "Product"("id");

ALTER TABLE "Inventory"
ADD CONSTRAINT fk_inventory_storage FOREIGN KEY ("storage_id") REFERENCES "Storage"("id"),
ADD CONSTRAINT fk_inventory_product FOREIGN KEY ("product_id") REFERENCES "Product"("id");