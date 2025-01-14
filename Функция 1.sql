CREATE OR REPLACE FUNCTION get_orders_by_user(_user_id INTEGER)
RETURNS SETOF "Order" AS

$$
BEGIN
    RETURN QUERY 
        SELECT o.*
        FROM "Order" o
        WHERE o."user_id" = _user_id;
END;

$$ LANGUAGE plpgsql;

SELECT * FROM get_orders_by_user(1);