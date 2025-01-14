SELECT ord.*, us.login, us.name, us.lastname
FROM "Order" ord
INNER JOIN "User" us ON ord.user_id = us.id;