-- BookByte E-commerce Database Sample Data
-- Created: May 20, 2025
-- This file contains initial data for the BookByte e-commerce platform

-- Start with a clean slate for sample data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE categories;
TRUNCATE TABLE products;
TRUNCATE TABLE product_images;
TRUNCATE TABLE tags;
TRUNCATE TABLE product_tags;
TRUNCATE TABLE reviews;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- Categories
INSERT INTO categories (id, name, description, image_url) VALUES
(5, 'Fiction', 'Dive into worlds of imagination with our carefully curated fiction collection', 'https://images.unsplash.com/photo-1544947950-fa07a98d237f'),
(6, 'Non-Fiction', 'Expand your knowledge with our expertly selected non-fiction titles', 'https://images.unsplash.com/photo-1461360370896-922624d12aa1'),
(7, 'Children''s Books', 'Inspire young minds with our engaging children''s literature', 'https://images.unsplash.com/photo-1633477189729-9290b3261d0a'),
(8, 'Book Accessories', 'Enhance your reading experience with premium accessories', 'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38');

-- Fiction Books
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(1001, 'The Midnight Library', 'Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived.', 24.99, 19.99, 100, false, 5, NOW(), NOW(), true),
(1002, 'Eternal Gardens', 'An epic fantasy tale of magic, betrayal, and ancient powers awakening in a world on the brink of war.', 22.99, 18.50, 75, false, 5, NOW(), NOW(), true),
(1003, 'Whispers of the Ocean', 'A beautifully written story about family secrets, forgiveness, and finding oneself on a remote island.', 19.99, 15.99, 85, false, 5, NOW(), NOW(), true),
(1004, 'Monthly Fiction Box', 'Curated selection of bestselling fiction books delivered monthly', 39.99, NULL, NULL, true, 5, NOW(), NOW(), true);

-- Non-Fiction Books
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(2001, 'Atomic Habits', 'Transform your life with tiny changes in behavior. The breakthrough guide to building good habits and breaking bad ones.', 29.99, 24.99, 150, false, 6, NOW(), NOW(), true),
(2002, 'Think Like a Monk', 'Train your mind for peace and purpose every day with ancient wisdom for modern life.', 27.99, 22.99, 80, false, 6, NOW(), NOW(), true),
(2003, 'The Hidden History of Humanity', 'A groundbreaking exploration of forgotten civilizations and their lasting impact on our world today.', 32.50, 27.99, 45, false, 6, NOW(), NOW(), true),
(2004, 'Monthly Non-Fiction Box', 'Curated selection of thought-provoking non-fiction books delivered monthly', 44.99, NULL, NULL, true, 6, NOW(), NOW(), true);

-- Children's Books
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(3001, 'Where the Wild Things Are', 'The beloved tale of Max''s wild adventure, a timeless classic that has enchanted generations.', 18.99, 15.99, 200, false, 7, NOW(), NOW(), true),
(3002, 'The Little Adventurer', 'Join Sam on an exciting journey through magical lands filled with friendly creatures and valuable lessons.', 16.99, 14.50, 175, false, 7, NOW(), NOW(), true),
(3003, 'Space Explorers', 'An interactive adventure through our solar system, perfect for young space enthusiasts.', 19.99, 16.99, 140, false, 7, NOW(), NOW(), true),
(3004, 'Kids'' Book Club Box', 'Monthly subscription box with age-appropriate books and activities', 34.99, NULL, NULL, true, 7, NOW(), NOW(), true);

-- Book Accessories
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(4001, 'Premium Leather Bookmark Set', 'Set of 3 handcrafted genuine leather bookmarks with classic designs', 24.99, 19.99, 250, false, 8, NOW(), NOW(), true),
(4002, 'Adjustable Bamboo Book Stand', 'Ergonomic book stand with adjustable angles and page holders, crafted from sustainable bamboo', 32.50, 27.99, 80, false, 8, NOW(), NOW(), true),
(4003, 'Literary Candle Collection', 'Set of 4 scented candles inspired by classic literature', 28.99, 24.99, 120, false, 8, NOW(), NOW(), true),
(4004, 'Reader''s Essential Box', 'Monthly subscription box of premium reading accessories', 29.99, NULL, NULL, true, 8, NOW(), NOW(), true);

-- Product Images
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
-- Fiction Books
(1001, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(1001, 'https://images.unsplash.com/photo-1629992101753-56d196c8aabb', false, 1),
(1002, 'https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf', true, 0),
(1003, 'https://images.unsplash.com/photo-1531072901881-d644216d4bf9', true, 0),
(1004, 'https://images.unsplash.com/photo-1474366521946-c3d4b507abf2', true, 0),

-- Non-Fiction Books
(2001, 'https://images.unsplash.com/photo-1589998059171-988d887df646', true, 0),
(2001, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', false, 1),
(2002, 'https://images.unsplash.com/photo-1461360370896-922624d12aa1', true, 0),
(2003, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(2004, 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8', true, 0),

-- Children's Books
(3001, 'https://images.unsplash.com/photo-1512820790803-83ca734da794', true, 0),
(3002, 'https://images.unsplash.com/photo-1629992101753-56d196c8aabb', true, 0),
(3003, 'https://images.unsplash.com/photo-1633477189729-9290b3261d0a', true, 0),
(3004, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f', true, 0),

-- Accessories
(4001, 'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38', true, 0),
(4002, 'https://images.unsplash.com/photo-1598901865264-4f18cac7e204', true, 0),
(4003, 'https://images.unsplash.com/photo-1589998059171-988d887df646', true, 0),
(4004, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0);

-- Users (Add these before reviews since they're referenced by foreign key)
INSERT INTO users (id, email, password, first_name, last_name, created_at, updated_at, active) VALUES
(1, 'john.doe@example.com', '$2a$10$xJwn4TkO/IgdP2JheXBHjO6bIEl6oAGRZCPx8TeQlC5fHp4pL.t3i', 'John', 'Doe', NOW(), NOW(), true),
(2, 'jane.smith@example.com', '$2a$10$xJwn4TkO/IgdP2JheXBHjO6bIEl6oAGRZCPx8TeQlC5fHp4pL.t3i', 'Jane', 'Smith', NOW(), NOW(), true),
(3, 'alice.reader@example.com', '$2a$10$xJwn4TkO/IgdP2JheXBHjO6bIEl6oAGRZCPx8TeQlC5fHp4pL.t3i', 'Alice', 'Reader', NOW(), NOW(), true);

-- Tags
INSERT INTO tags (id, name) VALUES
(1, 'Bestseller'),
(2, 'New Release'),
(3, 'Award Winner'),
(4, 'Staff Pick'),
(5, 'Limited Edition'),
(6, 'Educational'),
(7, 'Classic'),
(8, 'Monthly Subscription');

-- Product Tags
INSERT INTO product_tags (product_id, tag_id) VALUES
-- Fiction Books
(1001, 1), (1001, 2),  -- Midnight Library: Bestseller, New Release
(1002, 2), (1002, 5),  -- Eternal Gardens: New Release, Limited Edition
(1003, 4),             -- Whispers of the Ocean: Staff Pick
(1004, 8),             -- Monthly Fiction Box: Monthly Subscription

-- Non-Fiction Books
(2001, 1), (2001, 6),  -- Atomic Habits: Bestseller, Educational
(2002, 1), (2002, 4),  -- Think Like a Monk: Bestseller, Staff Pick
(2003, 2), (2003, 6),  -- Hidden History: New Release, Educational
(2004, 8),             -- Monthly Non-Fiction Box: Monthly Subscription

-- Children's Books
(3001, 3), (3001, 7),  -- Where the Wild Things Are: Award Winner, Classic
(3002, 2), (3002, 6),  -- Little Adventurer: New Release, Educational
(3003, 4), (3003, 6),  -- Space Explorers: Staff Pick, Educational
(3004, 8),             -- Kids' Book Club Box: Monthly Subscription

-- Accessories
(4001, 5),             -- Premium Leather Bookmark Set: Limited Edition
(4002, 4),             -- Adjustable Book Stand: Staff Pick
(4003, 2),             -- Literary Candle Collection: New Release
(4004, 8);             -- Reader's Essential Box: Monthly Subscription

-- Reviews
INSERT INTO reviews (product_id, user_id, rating, comment, created_at) VALUES
-- Fiction Books
(1001, 1, 5, 'A masterpiece that makes you question every choice you''ve ever made. Couldn''t put it down!', NOW()),
(1001, 2, 4, 'Beautifully written with an intriguing concept. A must-read for fiction lovers.', NOW()),
(1002, 3, 5, 'One of the best fantasy novels I''ve read this year. The world-building is incredible.', NOW()),

-- Non-Fiction Books
(2001, 1, 5, 'Life-changing book about habit formation. Already seeing positive changes.', NOW()),
(2002, 2, 4, 'Practical wisdom that actually works in today''s world. Highly recommended.', NOW()),
(2003, 3, 5, 'Fascinating insights into human history. Well-researched and engaging.', NOW()),

-- Children's Books
(3001, 1, 5, 'A timeless classic that still captivates children today. The illustrations are magical.', NOW()),
(3002, 2, 4, 'My kids absolutely love this book. Great messages and beautiful artwork.', NOW()),
(3003, 3, 5, 'Perfect blend of education and entertainment. Gets kids excited about science!', NOW()),

-- Accessories
(4001, 1, 5, 'Exceptional quality leather bookmarks. They make reading even more special.', NOW()),
(4002, 2, 4, 'Sturdy construction and beautiful design. Perfect for heavy textbooks.', NOW()),
(4003, 3, 5, 'These candles create the perfect reading atmosphere. Love all the scents!', NOW());

-- End of BookByte sample data
