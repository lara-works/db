SELECT
  users.id AS user_id,
  users.name AS user_name,
  orders.id AS order_id,
  order_items.id AS order_item_id,
  products.name AS order_item_name,
  orders.created_at AS order_created_at
FROM orders
JOIN users ON orders.user_id = users.id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
ORDER BY order_created_at DESC;

