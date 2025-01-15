CREATE OR REPLACE PROCEDURE check_and_order_product(
    product_id INT,
    quantity INT,
    storage_id INT
)
LANGUAGE plpgsql
AS

$$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM "Inventory" 
        WHERE "Inventory".product_id = check_and_order_product.product_id 
          AND "Inventory".storage_id = check_and_order_product.storage_id
    ) THEN
        IF EXISTS (
            SELECT 1 
            FROM "Inventory" 
            WHERE "Inventory".product_id = check_and_order_product.product_id 
              AND "Inventory".storage_id = check_and_order_product.storage_id 
              AND "Inventory".quantity >= check_and_order_product.quantity
        ) THEN
            UPDATE "Inventory"
            SET "quantity" = "Inventory".quantity - check_and_order_product.quantity
            WHERE "Inventory".product_id = check_and_order_product.product_id 
              AND "Inventory".storage_id = check_and_order_product.storage_id;
            
            RAISE NOTICE 'Товар успешно зарезервирован';
        ELSE
            RAISE NOTICE 'На складе недостаточно товара';
        END IF;
    ELSE
        RAISE NOTICE 'Данный склад не содержит указанный продукт';
    END IF;
END;

$$;

CALL check_and_order_product(1, 20, 1);
CALL check_and_order_product(1, 31, 1);
CALL check_and_order_product(1, 10, 2);