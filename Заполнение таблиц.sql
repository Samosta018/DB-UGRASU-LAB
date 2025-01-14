-- Заполнение таблицы User
INSERT INTO "User" ("login", "password", "name", "midname", "lastname", "phone", "email")
VALUES 
('admin', '12345678', 'Иван', 'Иванович', 'Иванов', '+7-999-111-22-33', 'ivanov@example.com'),
('petrov', '87654321', 'Петр', 'Петрович', 'Петров', '+7-888-222-44-55', 'petrov@example.com');

-- Заполнение таблицы Brand
INSERT INTO "Brand" ("name", "description")
VALUES 
('Rubiks', 'Производитель классических головоломок.'),
('Meffert', 'Известный производитель пирамидок.');

-- Заполнение таблицы Category
INSERT INTO "Category" ("name", "description")
VALUES 
('Головоломки', 'Различные виды механических головоломок.'),
('Игрушки', 'Детские развивающие игрушки.');

-- Заполнение таблицы Subcategory
INSERT INTO "Subcategory" ("name", "description", "category_id")
VALUES 
('Кубики', 'Механические головоломки в виде кубов.', 1),
('Пирамиды', 'Механические головоломки в виде пирамид.', 1);

-- Заполнение таблицы Product
INSERT INTO "Product" ("name", "description", "price", "brand_id", "subcategory_id")
VALUES 
('Кубик Рубика 3x3', 'Классический кубик Рубика размером 3x3.', 500.00, 1, 1),
('Мегаминкс', 'Головоломка в форме додекаэдра.', 800.00, 1, 2),
('Пирамидка Мефферта', 'Пирамида из четырех слоев.', 600.00, 2, 1);

-- Заполнение таблицы Status
INSERT INTO "Status" ("name", "description")
VALUES 
('Оплачен', 'Оплата успешно произведена.'),
('Не оплачен', 'Ожидание оплаты.'),
('В обработке', 'Оплата обрабатывается');

-- Заполнение таблицы Storage
INSERT INTO "Storage" ("name", "capacity", "country", "city", "street", "number_house")
VALUES 
('Склад Москва', 1000, 'Россия', 'Москва', 'Тверская улица', '12'),
('Склад Санкт-Петербург', 1200, 'Россия', 'Санкт-Петербург', 'Московский проспект', '23');

-- Заполнение таблицы Inventory
INSERT INTO "Inventory" ("product_id", "storage_id", "quantity")
VALUES 
(1, 1, 30), -- На складе в Москве 30 Кубиков Рубика 3x3
(2, 1, 40), -- На складе в Москве 40 Мегаминксов
(3, 2, 35); -- На складе в Санкт-Петербурге 35 Пирамидок Мефферта

-- Заполнение таблицы Payment
INSERT INTO "Payment" ("amount", "status_id")
VALUES 
(1000.00, 1),
(1500.00, 1);

-- Получаем ID и сумму платежей для использования в следующей таблице
WITH inserted_payments AS (
    SELECT id, amount FROM "Payment" WHERE amount IN (1000.00, 1500.00)
)

-- Заполнение таблицы Order
INSERT INTO "Order" ("total_cost", "review_text", "status_id", "payment_id", "user_id", "country", "city", "street", "number_house")
SELECT 
    total_cost, review_text, status_id, ip.id, user_id, country, city, street, number_house
FROM (VALUES
    (1000.00, 'Отличная покупка!', 1, 1, 'Россия', 'Москва', 'Ленинский проспект', '32'),
    (1500.00, 'Все пришло вовремя.', 1, 2, 'Россия', 'Санкт-Петербург', 'Невский проспект', '45')
) AS orders(total_cost, review_text, status_id, user_id, country, city, street, number_house)
JOIN inserted_payments ip ON orders.total_cost = ip.amount;

-- Заполнение таблицы Order_Detail
INSERT INTO "Order_Detail" ("order_id", "product_id", "quantity")
VALUES 
(1, 1, 5),
(1, 2, 3),
(2, 3, 4);
