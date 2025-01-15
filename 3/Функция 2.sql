CREATE OR REPLACE FUNCTION get_user_orders(user_login VARCHAR)
RETURNS TABLE(order_total_cost DECIMAL, product_name VARCHAR, quantity BIGINT) AS

$$
BEGIN
    RETURN QUERY
    WITH user_orders AS (
        SELECT o.id, p.name, od.quantity, o.total_cost
        FROM "Order" o
        JOIN "Order_Detail" od ON o.id = od.order_id
        JOIN "Product" p ON od.product_id = p.id
        WHERE o.user_id IN (
            SELECT id
            FROM "User"
            WHERE "User".login = user_login
        )
    )
    SELECT SUM(uo.total_cost), uo.name, SUM(uo.quantity)
    FROM user_orders uo
    GROUP BY uo.name;
END;

$$ LANGUAGE plpgsql;

SELECT * FROM get_user_orders('admin');