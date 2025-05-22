-- New Product Data SQL
-- This file maintains proper sequencing with existing data

-- Start with a clean slate while preserving foreign key relationships
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product_images;
TRUNCATE TABLE product_tags;
TRUNCATE TABLE reviews;
TRUNCATE TABLE products;
TRUNCATE TABLE tags;
SET FOREIGN_KEY_CHECKS = 1;

-- Insert new products (maintaining category IDs 5-8 from existing data)
-- Fiction Books (category_id = 5)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(1001, 'The Midnight Library', 'Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived.', 18.99, 24.99, 100, false, 5, NOW(), NOW(), true),
(1002, 'Eternal Gardens', 'An epic fantasy tale of magic, betrayal, and ancient powers awakening in a world on the brink of war.', 18.50, 22.00, 75, false, 5, NOW(), NOW(), true),
(1003, 'Whispers of the Ocean', 'A beautifully written story about family secrets, forgiveness, and finding oneself on a remote island.', 15.99, 19.99, 85, false, 5, NOW(), NOW(), true),
(1004, 'The Last Stargazer', 'Set in a distant future where humanity seeks new homes among the stars while facing extinction.', 17.99, 21.99, 60, false, 5, NOW(), NOW(), true),
(1005, 'The Midnight Chronicles', 'A detective races against time to solve a series of ritualistic murders before the killer strikes again.', 18.99, 22.00, 90, false, 5, NOW(), NOW(), true),
(1006, 'Love in Paris', 'A heartwarming romance set in the city of lights, where two strangers find an unexpected connection.', 14.99, 18.99, 120, false, 5, NOW(), NOW(), true);

-- Non-Fiction Books (category_id = 6)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(2001, 'The Power of Habits', 'Discover how to build positive habits and break negative ones to transform your life and achieve success.', 24.99, 29.99, 150, false, 6, NOW(), NOW(), true),
(2002, 'Creative Innovation', 'A comprehensive handbook for business leaders looking to foster innovation and creative thinking.', 21.99, 26.99, 100, false, 6, NOW(), NOW(), true),
(2003, 'Leadership Presence', 'Learn how to lead with compassion, presence, and purpose in today''s fast-paced business environment.', 22.99, 27.99, 80, false, 6, NOW(), NOW(), true),
(2004, 'Cosmic Wonders', 'A fascinating exploration of the universe''s mysteries, from quantum mechanics to distant galaxies.', 29.95, 36.50, 70, false, 6, NOW(), NOW(), true);

-- Children's Books (category_id = 7)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(3001, 'The Little Adventurer', 'Join Sam on an exciting journey through magical lands filled with friendly creatures and valuable lessons.', 16.99, 19.50, 200, false, 7, NOW(), NOW(), true),
(3002, 'The Curious Caterpillar', 'A beautifully illustrated story about transformation, patience, and the wonders of nature.', 14.50, 17.99, 175, false, 7, NOW(), NOW(), true),
(3003, 'Dinosaur Detective', 'Tim and his dinosaur friend solve mysteries in this exciting adventure series that combines fun and learning.', 15.99, 19.99, 150, false, 7, NOW(), NOW(), true),
(3004, 'The Magic Paintbrush', 'A magical tale about a young artist who discovers that her paintings come to life at night.', 13.95, 16.50, 160, false, 7, NOW(), NOW(), true),
(3005, 'Space Explorers', 'An interactive adventure through our solar system, perfect for young space enthusiasts.', 18.99, 22.50, 140, false, 7, NOW(), NOW(), true);

-- Book Accessories (category_id = 8)
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(4001, 'Modern Bookends Set', 'Elegant metal bookends with a minimalist design, perfect for any bookshelf or desk.', 24.99, 32.00, 100, false, 8, NOW(), NOW(), true),
(4002, 'Oxford Premium Leather Bookmark Set', 'Set of 3 handcrafted leather bookmarks with classic designs and durable construction.', 18.99, 24.50, 250, false, 8, NOW(), NOW(), true),
(4003, 'Adjustable Book Stand', 'Ergonomic book stand with adjustable angles and page holders, perfect for hands-free reading.', 32.50, 39.99, 80, false, 8, NOW(), NOW(), true),
(4004, 'Literary Candle Collection', 'Set of scented candles inspired by classic literature, perfect for creating a cozy reading atmosphere.', 28.99, 35.00, 120, false, 8, NOW(), NOW(), true),
(4005, 'Vintage Book Cover Tote Bag', 'Canvas tote bag featuring classic book cover designs, perfect for carrying your reading materials.', 19.99, 24.99, 200, false, 8, NOW(), NOW(), true);

-- Insert product images
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
-- Fiction Books
(1001, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(1001, 'https://images.unsplash.com/photo-1629992101753-56d196c8aabb', false, 1),
(1002, 'https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf', true, 0),
(1003, 'https://images.unsplash.com/photo-1531072901881-d644216d4bf9', true, 0),
(1004, 'https://images.unsplash.com/photo-1629992101753-56d196c8aabb', true, 0),
(1005, 'https://images.unsplash.com/photo-1512820790803-83ca734da794', true, 0),
(1006, 'https://images.unsplash.com/photo-1600189261867-30e5ffe7b8da', true, 0),

-- Non-Fiction Books
(2001, 'https://images.unsplash.com/photo-1589998059171-988d887df646', true, 0),
(2002, 'https://images.unsplash.com/photo-1461360370896-922624d12aa1', true, 0),
(2003, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(2004, 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564', true, 0),

-- Children's Books
(3001, 'https://images.unsplash.com/photo-1633477189729-9290b3261d0a', true, 0),
(3002, 'https://images.unsplash.com/photo-1629992101753-56d196c8aabb', true, 0),
(3003, 'https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf', true, 0),
(3004, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f', true, 0),
(3005, 'https://images.unsplash.com/photo-1614332287897-cdc485fa562d', true, 0),

-- Book Accessories
(4001, 'https://images.unsplash.com/photo-1610116306796-6fea9f4fae38', true, 0),
(4002, 'https://images.unsplash.com/photo-1589998059171-988d887df646', true, 0),
(4003, 'https://images.unsplash.com/photo-1598901865264-4f18cac7e204', true, 0),
(4004, 'https://images.unsplash.com/photo-1603006905003-be475563bc59', true, 0),
(4005, 'https://images.unsplash.com/photo-1544816155-12df9643f363', true, 0);

-- Insert tags
INSERT INTO tags (id, name) VALUES
(1, 'Bestseller'),
(2, 'New Release'),
(3, 'Award Winner'),
(4, 'Staff Pick'),
(5, 'Limited Edition'),
(6, 'Educational'),
(7, 'Classic'),
(8, 'Monthly Subscription');

-- Link products with tags
INSERT INTO product_tags (product_id, tag_id) VALUES
-- Fiction Books
(1001, 1), (1001, 2),  -- Midnight Library: Bestseller, New Release
(1002, 2), (1002, 5),  -- Eternal Gardens: New Release, Limited Edition
(1003, 4),             -- Whispers of the Ocean: Staff Pick
(1004, 1),             -- The Last Stargazer: Bestseller
(1005, 2),             -- The Midnight Chronicles: New Release

-- Non-Fiction Books
(2001, 1), (2001, 6),  -- Power of Habits: Bestseller, Educational
(2002, 4),             -- Creative Innovation: Staff Pick
(2003, 2),             -- Leadership Presence: New Release
(2004, 2), (2004, 6),  -- Cosmic Wonders: New Release, Educational

-- Children's Books
(3001, 2),             -- Little Adventurer: New Release
(3002, 1),             -- Curious Caterpillar: Bestseller
(3003, 6),             -- Dinosaur Detective: Educational
(3004, 4),             -- Magic Paintbrush: Staff Pick
(3005, 1), (3005, 6),  -- Space Explorers: Bestseller, Educational

-- Book Accessories
(4001, 5),             -- Modern Bookends Set: Limited Edition
(4002, 1),             -- Oxford Premium Leather Bookmark Set: Bestseller
(4003, 2),             -- Adjustable Book Stand: New Release
(4004, 1),             -- Literary Candle Collection: Bestseller
(4005, 5);             -- Vintage Book Cover Tote Bag: Limited Edition

-- Insert sample reviews
INSERT INTO reviews (product_id, user_id, rating, comment, created_at) VALUES
-- Fiction Books
(1001, 1, 5, 'A life-changing book that makes you think about all the possibilities in life.', NOW()),
(1001, 2, 4, 'Beautifully written with an interesting concept.', NOW()),
(1002, 3, 5, 'An epic fantasy that kept me engaged until the last page.', NOW()),
(1003, 1, 4, 'Beautiful and moving story about family bonds.', NOW()),

-- Non-Fiction Books
(2001, 2, 5, 'Practical advice that actually works. Highly recommended!', NOW()),
(2002, 3, 4, 'Great insights for business innovation.', NOW()),
(2003, 1, 5, 'Changed my approach to leadership completely.', NOW()),

-- Children's Books
(3001, 2, 5, 'My kids absolutely love this book. The illustrations are beautiful.', NOW()),
(3002, 3, 4, 'A wonderful story about growth and change.', NOW()),
(3003, 1, 5, 'Makes learning fun for children!', NOW()),

-- Book Accessories
(4001, 3, 4, 'Elegant design and good quality materials.', NOW()),
(4002, 1, 5, 'Beautiful craftsmanship, these bookmarks are perfect!', NOW()),
(4003, 2, 4, 'Very functional and well-made book stand.', NOW());
