-- FurniFind Product Database Inserts
-- Generated based on homepage products

-- First, clear existing data from tables (in reverse order of foreign key dependencies)
-- Note: This will remove ALL existing data from these tables
DELETE FROM product_tags;
DELETE FROM product_images;
DELETE FROM products;
DELETE FROM reviews;
DELETE FROM tags;
ALTER TABLE products DISABLE TRIGGER ALL; -- Disable triggers temporarily to avoid foreign key issues
DELETE FROM products WHERE id BETWEEN 100 AND 700; -- Only delete furniture products (100-700 range)
ALTER TABLE products ENABLE TRIGGER ALL; -- Re-enable triggers

-- First, make sure we have the necessary categories
-- Check if categories exist and insert if they don't
INSERT INTO categories (name, description) 
SELECT 'Living Room', 'Furniture and accessories for your living room'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Living Room');

INSERT INTO categories (name, description) 
SELECT 'Dining Room', 'Tables, chairs and accessories for your dining area'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Dining Room');

INSERT INTO categories (name, description) 
SELECT 'Bedroom', 'Beds, nightstands, and accessories for your bedroom'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Bedroom');

INSERT INTO categories (name, description) 
SELECT 'Home Office', 'Desks, chairs, and accessories for productive work spaces'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Home Office');

INSERT INTO categories (name, description) 
SELECT 'Storage Solutions', 'Shelving, cabinets, and organization for your home'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Storage Solutions');

INSERT INTO categories (name, description) 
SELECT 'Entertainment', 'TV stands, media consoles, and entertainment centers'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Entertainment');

INSERT INTO categories (name, description) 
SELECT 'Office Furniture', 'Professional furniture for home and business offices'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Office Furniture');

-- Create tags if they don't exist
INSERT INTO tags (name) SELECT 'New' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'New');
INSERT INTO tags (name) SELECT 'Sale' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'Sale');
INSERT INTO tags (name) SELECT 'Best Seller' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'Best Seller');
INSERT INTO tags (name) SELECT 'Trending' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'Trending');
INSERT INTO tags (name) SELECT 'Hot Deal' WHERE NOT EXISTS (SELECT 1 FROM tags WHERE name = 'Hot Deal');

-- New Arrivals Products (101-104)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(101, 'Scandinavian Armchair - Gray', 'Elegant and comfortable Scandinavian-inspired armchair with high-quality upholstery and solid wood legs.', 
 299.99, 249.99, 15, false, (SELECT id FROM categories WHERE name = 'Living Room'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(102, 'Rustic Wooden Dining Table Set', 'Handcrafted rustic wooden dining table with matching benches, perfect for family gatherings and entertainment.', 
 499.99, 399.99, 8, false, (SELECT id FROM categories WHERE name = 'Dining Room'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(103, 'Wall-Mounted Floating Shelves (Set of 3)', 'Modern floating shelves with invisible mounting hardware, perfect for displaying books, plants, and decorative items.', 
 79.99, 59.99, 25, false, (SELECT id FROM categories WHERE name = 'Storage Solutions'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(104, 'Electric Height Adjustable Standing Desk', 'Electric height adjustable desk with memory settings, perfect for creating an ergonomic workspace at home.', 
 449.99, 379.99, 12, false, (SELECT id FROM categories WHERE name = 'Home Office'), NOW(), NOW(), true);

-- Featured Products (201-206)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(201, 'Modern Ergonomic Desk Chair', 'Ergonomic office chair with adjustable lumbar support, height, and armrests for maximum comfort during long working hours.', 
 249.99, 199.99, 20, false, (SELECT id FROM categories WHERE name = 'Office Furniture'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(202, 'Scandinavian Coffee Table', 'Minimalist Scandinavian coffee table with clean lines and durable construction, featuring a lower shelf for extra storage.', 
 199.99, 159.99, 15, false, (SELECT id FROM categories WHERE name = 'Living Room'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(203, 'Minimalist Floating Bookshelf', 'Sleek, space-saving floating bookshelf that creates a modern display for your favorite books and decorative items.', 
 119.99, 89.99, 30, false, (SELECT id FROM categories WHERE name = 'Storage Solutions'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(204, 'Modern Queen Platform Bed Frame', 'Low-profile queen platform bed with wooden slats that eliminates the need for a box spring, creating a clean modern aesthetic.', 
 349.99, 299.99, 10, false, (SELECT id FROM categories WHERE name = 'Bedroom'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(205, 'Compact Foldable Desk for Small Spaces', 'Space-saving foldable desk that can be easily stored when not in use, perfect for apartments and small home offices.', 
 149.99, 119.99, 25, false, (SELECT id FROM categories WHERE name = 'Home Office'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(206, 'Modern Entertainment Center & TV Stand', 'Contemporary entertainment center with cable management system, adjustable shelving, and ample storage for media devices.', 
 249.99, 199.99, 18, false, (SELECT id FROM categories WHERE name = 'Entertainment'), NOW(), NOW(), true);

-- Bedroom Furniture Products (301-302)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(301, 'King Size Upholstered Bed with Storage', 'Luxurious king size bed with padded headboard and built-in storage drawers, combining style with functionality.', 
 699.99, 599.99, 8, false, (SELECT id FROM categories WHERE name = 'Bedroom'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(302, 'Modern Bedside Table with Drawers', 'Sleek bedside table with two spacious drawers for storage, made from high-quality materials with a modern finish.', 
 159.99, 129.99, 20, false, (SELECT id FROM categories WHERE name = 'Bedroom'), NOW(), NOW(), true);

-- Home Office Furniture Products (401-402)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(401, 'L-Shaped Computer Desk with Storage', 'Spacious L-shaped desk with integrated storage solutions, perfect for multi-monitor setups and home office productivity.', 
 259.99, 199.99, 15, false, (SELECT id FROM categories WHERE name = 'Home Office'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(402, 'Premium Ergonomic Office Chair', 'Professional-grade ergonomic chair with breathable mesh back, adjustable headrest and lumbar support for all-day comfort.', 
 299.99, 249.99, 18, false, (SELECT id FROM categories WHERE name = 'Home Office'), NOW(), NOW(), true);

-- Living Room Furniture Products (501-502)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(501, 'Modern L-Shaped Sectional Sofa', 'Versatile L-shaped sectional sofa with premium upholstery, offering spacious seating and contemporary design for modern living rooms.', 
 999.99, 799.99, 5, false, (SELECT id FROM categories WHERE name = 'Living Room'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(502, 'Wall-Mounted Entertainment Center', 'Space-saving wall-mounted entertainment center with floating shelves, cable management system, and ample storage for media devices.', 
 449.99, 349.99, 12, false, (SELECT id FROM categories WHERE name = 'Living Room'), NOW(), NOW(), true);

-- Dining Room Furniture Products (601-602)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(601, 'Extendable Dining Table with Leaf', 'Versatile dining table with extendable leaf design, perfect for both everyday meals and dinner parties, comfortably seating 6 to 8 people.', 
 599.99, 449.99, 10, false, (SELECT id FROM categories WHERE name = 'Dining Room'), NOW(), NOW(), true);

INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active)
VALUES 
(602, 'Set of 4 Upholstered Dining Chairs', 'Elegant dining chairs with sturdy frames and comfortable upholstery, designed to complement a variety of dining table styles.', 
 399.99, 329.99, 15, false, (SELECT id FROM categories WHERE name = 'Dining Room'), NOW(), NOW(), true);

-- Insert product images
-- First delete existing images for these products
DELETE FROM product_images WHERE product_id IN 
(101, 102, 103, 104, 201, 202, 203, 204, 205, 206, 301, 302, 401, 402, 501, 502, 601, 602);

INSERT INTO product_images (product_id, image_url, is_primary, display_order)
VALUES 
(101, 'https://images.unsplash.com/photo-1538688423619-a81d3f23454b?q=80&w=1374&auto=format&fit=crop', true, 1),
(102, 'https://images.unsplash.com/photo-1593194062010-c8276c508435?q=80&w=1374&auto=format&fit=crop', true, 1),
(103, 'https://images.unsplash.com/photo-1567016376408-0226e4d0c1ea?q=80&w=1374&auto=format&fit=crop', true, 1),
(104, 'https://images.unsplash.com/photo-1595500381751-d837f87d3f14?q=80&w=1374&auto=format&fit=crop', true, 1),
(201, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=1470&auto=format&fit=crop', true, 1),
(201, 'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?q=80&w=1374&auto=format&fit=crop', false, 2),
(202, 'https://images.unsplash.com/photo-1540574163026-643ea20ade25?q=80&w=1470&auto=format&fit=crop', true, 1),
(202, 'https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?q=80&w=1374&auto=format&fit=crop', false, 2),
(203, 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?q=80&w=1470&auto=format&fit=crop', true, 1),
(203, 'https://images.unsplash.com/photo-1594026112284-02bb6f3352fe?q=80&w=1470&auto=format&fit=crop', false, 2),
(204, 'https://images.unsplash.com/photo-1616627561950-9f746e330187?q=80&w=1374&auto=format&fit=crop', true, 1),
(204, 'https://images.unsplash.com/photo-1617325247661-675ab4b64ae2?q=80&w=1470&auto=format&fit=crop', false, 2),
(205, 'https://images.unsplash.com/photo-1519947486511-46149fa0a254?q=80&w=1374&auto=format&fit=crop', true, 1),
(205, 'https://images.unsplash.com/photo-1587212195700-b39bac3ba9f5?q=80&w=1376&auto=format&fit=crop', false, 2),
(206, 'https://images.unsplash.com/photo-1551298370-9d3d53740c72?q=80&w=1374&auto=format&fit=crop', true, 1),
(206, 'https://images.unsplash.com/photo-1581541234264-671cc782a76e?q=80&w=1374&auto=format&fit=crop', false, 2),
(301, 'https://images.unsplash.com/photo-1505693314120-0d443867891c?q=80&w=1470&auto=format&fit=crop', true, 1),
(301, 'https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=1469&auto=format&fit=crop', false, 2),
(302, 'https://images.unsplash.com/photo-1618220179428-22790b461013?q=80&w=1527&auto=format&fit=crop', true, 1),
(302, 'https://images.unsplash.com/photo-1556228578-0d85b1a4d571?q=80&w=1470&auto=format&fit=crop', false, 2),
(401, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?q=80&w=1469&auto=format&fit=crop', true, 1),
(401, 'https://images.unsplash.com/photo-1593062096033-9a26b09da705?q=80&w=1470&auto=format&fit=crop', false, 2),
(402, 'https://images.unsplash.com/photo-1596162954151-cdcb4c0f70fb?q=80&w=1374&auto=format&fit=crop', true, 1),
(402, 'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?q=80&w=1374&auto=format&fit=crop', false, 2),
(501, 'https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?q=80&w=1469&auto=format&fit=crop', true, 1),
(501, 'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?q=80&w=1470&auto=format&fit=crop', false, 2),
(502, 'https://images.unsplash.com/photo-1585412727339-54e4bae3bbf9?q=80&w=1470&auto=format&fit=crop', true, 1),
(502, 'https://images.unsplash.com/photo-1616046386594-c152babc9e15?q=80&w=1480&auto=format&fit=crop', false, 2),
(601, 'https://images.unsplash.com/photo-1604578762246-41134e37f9cc?q=80&w=1470&auto=format&fit=crop', true, 1),
(601, 'https://images.unsplash.com/photo-1615876234886-9b2c0c2b0b1e?q=80&w=1374&auto=format&fit=crop', false, 2),
(602, 'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?q=80&w=1374&auto=format&fit=crop', true, 1),
(602, 'https://images.unsplash.com/photo-1611486212557-88be5ff6f941?q=80&w=1470&auto=format&fit=crop', false, 2);

-- Insert product-tag relationships
-- First delete existing tag relationships for these products
DELETE FROM product_tags WHERE product_id IN 
(101, 102, 103, 104, 201, 202, 203, 204, 205, 206, 301, 302, 401, 402, 501, 502, 601, 602);

INSERT INTO product_tags (product_id, tag_id)
VALUES
(101, (SELECT id FROM tags WHERE name = 'New')),
(102, (SELECT id FROM tags WHERE name = 'New')),
(103, (SELECT id FROM tags WHERE name = 'New')),
(104, (SELECT id FROM tags WHERE name = 'New')),
(201, (SELECT id FROM tags WHERE name = 'Sale')),
(202, (SELECT id FROM tags WHERE name = 'Sale')),
(203, (SELECT id FROM tags WHERE name = 'New')),
(205, (SELECT id FROM tags WHERE name = 'Sale')),
(301, (SELECT id FROM tags WHERE name = 'New')),
(302, (SELECT id FROM tags WHERE name = 'Sale')),
(401, (SELECT id FROM tags WHERE name = 'Sale')),
(402, (SELECT id FROM tags WHERE name = 'Best Seller')),
(501, (SELECT id FROM tags WHERE name = 'Trending')),
(502, (SELECT id FROM tags WHERE name = 'Hot Deal')),
(601, (SELECT id FROM tags WHERE name = 'New')),
(602, (SELECT id FROM tags WHERE name = 'Best Seller'));
