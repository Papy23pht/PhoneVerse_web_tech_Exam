-- Homepage Products Data SQL
-- Generated from home.html template
-- Created: May 20, 2025

-- New Arrivals Products
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
-- The Midnight Chronicles (Mystery & Thriller)
(101, 'The Midnight Chronicles', 'A gripping mystery thriller that will keep you on the edge of your seat', 18.99, 22.00, 100, false, 5, NOW(), NOW(), true),
-- Whispers of the Ocean - Hardcover Edition (Literary Fiction)
(102, 'Whispers of the Ocean - Hardcover Edition', 'A beautifully crafted literary masterpiece about the ocean''s secrets', 32.50, 39.99, 75, false, 5, NOW(), NOW(), true),
-- The Little Adventurer - Children's Book
(103, 'The Little Adventurer - Children''s Book', 'An enchanting tale of adventure for young readers', 16.99, 19.50, 150, false, 7, NOW(), NOW(), true),
-- Creativity and Innovation - Business Handbook
(104, 'Creativity and Innovation - Business Handbook', 'A comprehensive guide to fostering innovation in business', 45.99, 59.99, 100, false, 6, NOW(), NOW(), true);

-- Featured Products
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
-- The Silent Library (Mystery & Thriller)
(201, 'The Silent Library - Bestselling Mystery Novel', 'A captivating mystery set in an ancient library', 14.99, 17.50, 120, false, 5, NOW(), NOW(), true),
-- Eternal Gardens (Fantasy & Science Fiction)
(202, 'Eternal Gardens - Fantasy Series Collection', 'An epic fantasy collection that transports readers to magical worlds', 28.99, 36.00, 90, false, 5, NOW(), NOW(), true),
-- Modern Bookends Set
(203, 'Modern Bookends Set (Set of 2)', 'Elegant and modern bookends for the contemporary bookshelf', 24.99, 32.00, 200, false, 8, NOW(), NOW(), true),
-- Monthly Book Club Subscription Box
(204, 'Monthly Book Club Subscription Box', 'A curated monthly selection of books for avid readers', 29.99, 35.00, NULL, true, 5, NOW(), NOW(), true),
-- Oxford Premium Leather Bookmark Set
(205, 'Oxford Premium Leather Bookmark Set', 'Luxurious leather bookmarks with classic designs', 31.99, 39.99, 150, false, 8, NOW(), NOW(), true),
-- Adjustable Book Reading Light
(206, 'Adjustable Book Reading Light', 'Versatile reading light for comfortable nighttime reading', 12.99, 15.00, 250, false, 8, NOW(), NOW(), true);

-- Product Images
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
-- New Arrivals
(101, 'https://images.unsplash.com/photo-1512820790803-83ca734da794', true, 0),
(102, 'https://images.unsplash.com/photo-1531072901881-d644216d4bf9', true, 0),
(103, 'https://images.unsplash.com/photo-1633477189729-9290b3261d0a', true, 0),
(104, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),

-- Featured Products
(201, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(201, 'https://images.unsplash.com/photo-1629992101753-56d196c8aabb', false, 1),
(202, 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e', true, 0),
(202, 'https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf', false, 1),
(203, 'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38', true, 0),
(203, 'https://images.unsplash.com/photo-1613685703305-dec0d139ea35', false, 1),
(204, 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8', true, 0),
(204, 'https://images.unsplash.com/photo-1474366521946-c3d4b507abf2', false, 1),
(205, 'https://images.unsplash.com/photo-1589998059171-988d887df646', true, 0),
(205, 'https://images.unsplash.com/photo-1598014082230-e8f1566be762', false, 1),
(206, 'https://images.unsplash.com/photo-1476275466078-4007374efbbe', true, 0),
(206, 'https://images.unsplash.com/photo-1491841573634-28140fc7ced7', false, 1);

-- Tags for new products
INSERT INTO product_tags (product_id, tag_id) VALUES
-- New Arrivals
(101, 2), -- New Release
(102, 5), -- Limited Edition (Hardcover)
(103, 2), -- New Release
(103, 6), -- Educational
(104, 6), -- Educational

-- Featured Products
(201, 1), -- Bestseller
(201, 2), -- New Release (15% off badge)
(202, 1), -- Bestseller
(202, 5), -- Limited Edition
(203, 2), -- New Release (NEW badge)
(204, 8), -- Monthly Subscription
(205, 5), -- Limited Edition (20% off badge)
(206, 4); -- Staff Pick

-- Sample reviews for new products
INSERT INTO reviews (product_id, user_id, rating, comment, created_at) VALUES
(201, 1, 4, 'A thrilling mystery that keeps you guessing until the end', NOW()),
(202, 2, 4, 'Beautiful collection, perfect for fantasy lovers', NOW()),
(203, 3, 5, 'High quality bookends, very sturdy and elegant', NOW()),
(204, 1, 5, 'Love the monthly selections, great value!', NOW()),
(205, 2, 4, 'Premium quality leather, beautiful craftsmanship', NOW()),
(206, 3, 4, 'Perfect for late night reading, good battery life', NOW());
