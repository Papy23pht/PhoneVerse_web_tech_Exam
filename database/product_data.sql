-- Insert categories first
INSERT INTO categories (id, name, description, image_url) VALUES
(1, 'Fiction', 'Latest fiction books including novels, short stories, and literary works', 'https://images.unsplash.com/photo-1541963463532-d68292c34b19'),
(2, 'Non-Fiction', 'Educational and informative books across various topics', 'https://images.unsplash.com/photo-1497633762265-9d179a990aa6'),
(3, 'Children''s Books', 'Books for young readers of all ages', 'https://images.unsplash.com/photo-1512820790803-83ca734da794'),
(4, 'Book Accessories', 'Essential accessories for book lovers', 'https://images.unsplash.com/photo-1553729459-efe14ef6055d');

-- Insert products
INSERT INTO products (id, name, description, price, sale_price, stock_quantity, is_subscription, category_id, created_at, updated_at, active) VALUES
(1, 'The Midnight Library', 'A novel about infinite possibilities and second chances', 24.99, 19.99, 50, false, 1, NOW(), NOW(), true),
(2, 'Atomic Habits', 'Transform your life with tiny changes in behavior', 29.99, NULL, 75, false, 2, NOW(), NOW(), true),
(3, 'Where the Wild Things Are', 'Classic children''s picture book', 18.99, 15.99, 100, false, 3, NOW(), NOW(), true),
(4, 'Premium Leather Bookmark', 'Handcrafted genuine leather bookmark', 12.99, NULL, 200, false, 4, NOW(), NOW(), true),
(5, 'Monthly Book Subscription Box', 'Curated selection of books delivered monthly', 39.99, NULL, NULL, true, 1, NOW(), NOW(), true),
(6, 'Think Like a Monk', 'Train your mind for peace and purpose', 27.99, 22.99, 60, false, 2, NOW(), NOW(), true);

-- Insert product images
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(1, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(1, 'https://images.unsplash.com/photo-1512820790803-83ca734da794', false, 1),
(2, 'https://images.unsplash.com/photo-1553729459-efe14ef6055d', true, 0),
(3, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f', true, 0),
(4, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f', true, 0),
(5, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f', true, 0),
(6, 'https://images.unsplash.com/photo-1553729459-efe14ef6055d', true, 0);

-- Insert tags
INSERT INTO tags (id, name) VALUES
(1, 'Bestseller'),
(2, 'New Release'),
(3, 'Award Winner'),
(4, 'Classic'),
(5, 'Educational'),
(6, 'Self Help');

-- Link products with tags
INSERT INTO product_tags (product_id, tag_id) VALUES
(1, 1), (1, 2),  -- Midnight Library: Bestseller, New Release
(2, 1), (2, 6),  -- Atomic Habits: Bestseller, Self Help
(3, 3), (3, 4),  -- Where the Wild Things Are: Award Winner, Classic
(4, 2),          -- Premium Leather Bookmark: New Release
(5, 1),          -- Monthly Subscription: Bestseller
(6, 5), (6, 6);  -- Think Like a Monk: Educational, Self Help

-- Insert some sample reviews
INSERT INTO reviews (product_id, user_id, rating, comment, created_at) VALUES
(1, 1, 5, 'Absolutely loved this book! Couldn''t put it down.', NOW()),
(1, 2, 4, 'Great concept and well executed.', NOW()),
(2, 1, 5, 'Life-changing book about habit formation.', NOW()),
(3, 3, 5, 'A timeless children''s classic that still captivates.', NOW()),
(4, 2, 4, 'Beautiful craftsmanship, makes reading even more enjoyable.', NOW()),
(5, 1, 5, 'Love getting surprised with new books each month!', NOW()),
(6, 3, 4, 'Insightful and practical wisdom for modern life.', NOW());
