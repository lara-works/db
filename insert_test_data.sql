BEGIN;

INSERT INTO
  users (id,name,email,password,last_login,created_at)
VALUES
  ('1','Elijah Shaw','Elijah_Shaw9172@sheye.org','c9z0A6SaIphPoQbNSZAIzQQoreXeOz','2021-04-05 10:34:14Z','2020-02-04 21:10:10Z'),
  ('2','Liv Moss','Liv_Moss2333@zorer.org','zSRgP80VwLw5LsLJfiyLT8FoZNeCHy','2021-11-02 21:35:23Z','2020-10-29 07:24:56Z'),
  ('3','Cassidy Richards','Cassidy_Richards4851@guentu.biz','QyT1N9BEbYCi0MnHBdxN7L0UwQ0tia','2020-07-18 18:48:04Z','2021-07-15 19:05:20Z'),
  ('4','Tyler Lewis','Tyler_Lewis7431@grannar.com','gi0lIwzGCjQ5E79F7JRgAGOtvWwBqN','2021-05-19 02:13:36Z','2020-08-04 17:55:39Z'),
  ('5','Davina Bailey','Davina_Bailey3273@eirey.tech','OjJu3GQT4yNhaTG0v9xZzzIrcnNJRc','2020-08-06 18:40:49Z','2020-01-03 03:36:36Z'),
  ('6','Brooklyn Hammond','Brooklyn_Hammond8967@qater.org','TAF3bzz5744aZabSP2GBceZ1kT6OJG','2021-08-12 22:55:57Z','2021-07-10 16:21:43Z'),
  ('7','Nicholas Partridge','Nicholas_Partridge5292@gmail.com','3wZltKTnCT1YykNSI2kv0C4ealt5fH','2021-06-20 12:54:07Z','2020-12-19 01:09:42Z'),
  ('8','Gina Thomson','Gina_Thomson4672@hourpy.biz','qDkAHIbna1vf015KIaXH5fScqDIIZp','2020-12-21 21:22:12Z','2020-06-08 09:49:35Z'),
  ('9','Samara Nicolas','Samara_Nicolas4782@gmail.com','rKmpNOhFncV4KvHTDASOuVzHomeVhy','2021-02-08 01:26:08Z','2021-02-15 07:04:22Z'),
  ('10','Emmanuelle Gibbons','Emmanuelle_Gibbons5921@guentu.biz','dCSEprRiwvPmVUeBltMiy0RcBJyOpF','2020-09-26 08:09:26Z','2020-08-30 01:20:32Z');

INSERT INTO
  products (id,name,description,price,stock_count,created_at)
VALUES
  ('1','Bakery products','M&M Food Market',4068.24,41,'2021-06-02 05:26:33Z'),
  ('2','Medicines','Domino',6858.17,65,'2020-11-15 09:22:03Z'),
  ('3','Sauces','Tic Tac',9986.74,24,'2020-10-28 03:19:39Z'),
  ('4','Snack foods','Subway',6260.61,74,'2021-08-13 13:57:55Z'),
  ('5','Fruits','Magnum',1816.17,72,'2020-12-30 08:47:17Z'),
  ('6','Personal Care','Nabisco',6454.68,74,'2021-11-02 01:40:44Z'),
  ('7','Seafood','Knorr',3620.96,10,'2020-03-01 02:18:10Z'),
  ('8','Snack foods','Cheetos',7181.81,56,'2021-04-01 12:05:33Z'),
  ('9','Personal Care','Subway',1281.46,37,'2020-10-26 03:14:05Z'),
  ('10','Canned Goods','Bel Group',5328.63,52,'2020-02-14 02:04:07Z');

INSERT INTO
  user_carts (id,user_id,product_id,quantity,created_at)
VALUES
  ('1',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),2,'2021-06-02 05:26:33Z'),
  ('2',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),5,'2020-11-15 09:22:03Z'),
  ('3',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),3,'2020-10-28 03:19:39Z'),
  ('4',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),7,'2021-08-13 13:57:55Z'),
  ('5',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),1,'2020-12-30 08:47:17Z'),
  ('6',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),9,'2021-11-02 01:40:44Z'),
  ('7',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),2,'2020-03-01 02:18:10Z'),
  ('8',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),6,'2021-04-01 12:05:33Z'),
  ('9',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),1,'2020-10-26 03:14:05Z'),
  ('10',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),4,'2020-02-14 02:04:07Z');

INSERT INTO
  orders (id,no,user_id,total_amount,notes,created_at)
VALUES
  ('1','2021-1',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),15000,NULL,'2021-06-02 05:26:33Z'),
  ('2','2021-2',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),6000,'harry up','2020-11-15 09:22:03Z'),
  ('3','2021-3',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),5555.60,'к обеду','2020-10-28 03:19:39Z'),
  ('4','2021-4',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),8000,'без звонков','2021-08-13 13:57:55Z'),
  ('5','2021-5',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),2000,'после 20-00','2020-12-30 08:47:17Z'),
  ('6','2021-6',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),7300,NULL,'2021-11-02 01:40:44Z'),
  ('7','2021-7',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),830,NULL,'2020-03-01 02:18:10Z'),
  ('8','2021-8',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),120,NULL,'2021-04-01 12:05:33Z'),
  ('9','2021-9',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),500,NULL,'2020-10-26 03:14:05Z'),
  ('10','2021-10',(SELECT id FROM users ORDER BY RANDOM() LIMIT 1),3000.88,NULL,'2020-02-14 02:04:07Z');

INSERT INTO
  order_items (id,order_id,product_id,price,quantity,created_at)
VALUES
  ('1',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),356.20,2,'2021-06-02 05:26:33Z'),
  ('2',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),833.05,5,'2020-11-15 09:22:03Z'),
  ('3',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),3550.5,3,'2020-10-28 03:19:39Z'),
  ('4',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),2790.85,7,'2021-08-13 13:57:55Z'),
  ('5',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),1000,1,'2020-12-30 08:47:17Z'),
  ('6',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),920,9,'2021-11-02 01:40:44Z'),
  ('7',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),250.80,2,'2020-03-01 02:18:10Z'),
  ('8',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),600,6,'2021-04-01 12:05:33Z'),
  ('9',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),12000.3,1,'2020-10-26 03:14:05Z'),
  ('10',(SELECT id FROM orders ORDER BY RANDOM() LIMIT 1),(SELECT id FROM products ORDER BY RANDOM() LIMIT 1),555.55,4,'2020-02-14 02:04:07Z');

COMMIT;

