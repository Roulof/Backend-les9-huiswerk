DROP TABLE IF EXISTS wall_bracket CASCADE;
DROP TABLE IF EXISTS ci_module CASCADE;
DROP TABLE IF EXISTS remote_controller CASCADE;
DROP TABLE IF EXISTS television CASCADE;
DROP TABLE IF EXISTS product CASCADE;

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    price DECIMAL(10,2),
    current_stock INTEGER,
    sold INTEGER
);

-- Maak de Television tabel
CREATE TABLE television (
    product_id INTEGER PRIMARY KEY REFERENCES product(product_id),
    type VARCHAR(255),
    available INTEGER,
    refresh_rate INTEGER,
    screen_type VARCHAR(255)
);

-- Maak de RemoteController tabel
CREATE TABLE remote_controller (
    controller_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES television(product_id),
    compatible_with VARCHAR(255),
    battery_type VARCHAR(255)
);

-- Maak de CIModule tabel
CREATE TABLE ci_module (
    module_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES television(product_id)
);

-- Maak de WallBracket tabel
CREATE TABLE wall_bracket (
    bracket_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES television(product_id),
    adjustable BOOLEAN
);

-- Voeg producten toe
INSERT INTO product (name, brand, price, current_stock, sold) VALUES
('Samsung TV', 'Samsung', 800.00, 50, 10),
('LG TV', 'LG', 750.00, 40, 8);

-- Voeg televisies toe
INSERT INTO television (product_id, type, available, refresh_rate, screen_type) VALUES
(1, 'OLED', 10, 120.0, '4K'),
(2, 'LED', 8, 60.0, '1080p');

-- Voeg remote controllers toe
INSERT INTO remote_controller (product_id, compatible_with, battery_type) VALUES
(1, 'Samsung TV', 'AA'),
(2, 'LG TV', 'AAA');

-- Voeg CI modules toe
INSERT INTO ci_module (product_id) VALUES
(1),
(2);

-- Voeg wall brackets toe
INSERT INTO wall_bracket (product_id, adjustable) VALUES
(1, TRUE),
(2, FALSE);

--Ophalen van gegevens
SELECT t.*, p.* FROM television t
JOIN product p ON t.product_id = p.product_id;