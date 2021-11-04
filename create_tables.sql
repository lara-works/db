BEGIN;

CREATE TABLE IF NOT EXISTS users (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100) CHECK (name <> ''),
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  last_login TIMESTAMPTZ DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ CHECK (updated_at > created_at)
);

CREATE TABLE IF NOT EXISTS products (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(255) CHECK (name <> ''),
  description TEXT CHECK (description <> ''),
  price DECIMAL(11,2) CHECK (price >= 0.01),
  stock_count INTEGER CHECK (stock_count >= 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ CHECK (updated_at > created_at)
);

CREATE TABLE IF NOT EXISTS user_carts (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  product_id BIGINT REFERENCES products(id) ON DELETE RESTRICT,
  quantity INTEGER CHECK (quantity > 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ CHECK (updated_at > created_at)
);

CREATE TABLE IF NOT EXISTS orders ( 
  id BIGSERIAL PRIMARY KEY,
  no VARCHAR(100) NOT NULL UNIQUE,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  total_amount DECIMAL(11,2) CHECK (total_amount >= 0.01),
  notes VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ CHECK (updated_at > created_at)
);

CREATE TABLE IF NOT EXISTS order_items ( 
  id BIGSERIAL PRIMARY KEY,
  order_id BIGINT REFERENCES orders(id) ON DELETE CASCADE,
  product_id BIGINT REFERENCES products(id) ON DELETE RESTRICT,
  price DECIMAL(11,2) CHECK (price >= 0.01),
  quantity INTEGER CHECK (quantity > 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ CHECK (updated_at > created_at)
);

CREATE OR REPLACE FUNCTION set_updated_at_to_now()
RETURNS TRIGGER AS $$
BEGIN
  IF to_jsonb(NEW) ? 'updated_at' THEN
    NEW.updated_at = NOW();
  END IF;

  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER trigger_users_set_updated_at
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE PROCEDURE set_updated_at_to_now();

CREATE TRIGGER trigger_products_set_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW
  EXECUTE PROCEDURE set_updated_at_to_now();

CREATE TRIGGER trigger_user_carts_set_updated_at
  BEFORE UPDATE ON user_carts
  FOR EACH ROW
  EXECUTE PROCEDURE set_updated_at_to_now();

CREATE TRIGGER trigger_orders_set_updated_at
  BEFORE UPDATE ON orders
  FOR EACH ROW
  EXECUTE PROCEDURE set_updated_at_to_now();

CREATE TRIGGER trigger_order_items_set_updated_at
  BEFORE UPDATE ON order_items
  FOR EACH ROW
  EXECUTE PROCEDURE set_updated_at_to_now();

COMMIT;

