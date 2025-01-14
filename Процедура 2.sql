CREATE OR REPLACE PROCEDURE add_new_product(
    p_name VARCHAR,
    p_description TEXT,
    p_price DECIMAL(10, 2),
    p_brand_id INT,
    p_subcategory_id INT
)
LANGUAGE plpgsql
AS

$$
BEGIN
    INSERT INTO "Product" ("name", "description", "price", "brand_id", "subcategory_id")
    VALUES (p_name, p_description, p_price, p_brand_id, p_subcategory_id);
END;

$$;

CALL add_new_product('Новый товар', 'Описание', 900.00, 1, 1);