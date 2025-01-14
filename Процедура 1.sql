CREATE OR REPLACE PROCEDURE update_order_payment_status(
    order_id INTEGER,
    new_status_id INTEGER
)
LANGUAGE plpgsql
AS

$$
BEGIN
    UPDATE "Order"
    SET status_id = new_status_id
    WHERE id = order_id;
    
    COMMIT;
END;

$$;

CALL update_order_payment_status(1, 3);