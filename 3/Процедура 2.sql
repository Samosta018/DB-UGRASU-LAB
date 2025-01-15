CREATE OR REPLACE PROCEDURE apply_discount()
LANGUAGE plpgsql
AS

$$
DECLARE
    product_row RECORD;
BEGIN
    FOR product_row IN
        SELECT * FROM "Product"
    LOOP
        IF product_row.price > 550 THEN
            RAISE NOTICE 'Применяем скидку 5%% на товар % с ценой %.2f', product_row.name, product_row.price;
            UPDATE "Product"
            SET price = product_row.price * 0.95
            WHERE id = product_row.id;
        ELSE
            RAISE NOTICE 'Цена товара % ниже 550, скидка не применяется.', product_row.name;
        END IF;
    END LOOP;
END;

$$;

CALL apply_discount();