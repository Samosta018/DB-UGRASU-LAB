CREATE OR REPLACE FUNCTION get_product_info()
RETURNS TABLE(
    product_name text,
    price numeric,
    quantity integer
) AS

$$
BEGIN
    RETURN QUERY
    SELECT p.name::text, p.price, i.quantity
    FROM "Product" p
    JOIN "Inventory" i ON p.id = i.product_id;
END;

$$ LANGUAGE plpgsql;

SELECT * FROM get_product_info();