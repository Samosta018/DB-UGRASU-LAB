CREATE OR REPLACE FUNCTION calculate_discount(product_id INT, quantity INT)
RETURNS NUMERIC(10, 2) AS

$$
DECLARE
    base_price NUMERIC(10, 2);
    discount_percentage NUMERIC(10, 2);
    final_price NUMERIC(10, 2);
BEGIN
    SELECT price INTO base_price
    FROM "Product"
    WHERE id = calculate_discount.product_id;

    IF quantity >= 10 THEN
        discount_percentage := 0.03; -- Скидка 3% при покупке от 10 штук
    ELSEIF quantity >= 5 THEN
        discount_percentage := 0.02; -- Скидка 2% при покупке от 5 до 9 штук
    ELSE
        discount_percentage := 0;
    END IF;

    final_price := base_price * (1 - discount_percentage) * quantity;

    RETURN final_price;
END;

$$ LANGUAGE plpgsql;

SELECT calculate_discount(1, 5);