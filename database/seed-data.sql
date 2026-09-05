USE jpa_crud;
GO

-- =============================================
-- SEED DATA: CATEGORIES
-- Có sẵn ảnh minh họa cho từng danh mục
-- =============================================

INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Điện thoại',
    N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Điện thoại'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Laptop',
    N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Laptop'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Tai nghe',
    N'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Tai nghe'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Bàn phím',
    N'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Bàn phím'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Chuột',
    N'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Chuột'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Màn hình',
    N'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Màn hình'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Đồng hồ thông minh',
    N'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Đồng hồ thông minh'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Phụ kiện máy tính',
    N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Phụ kiện máy tính'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Loa Bluetooth',
    N'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Loa Bluetooth'
);


INSERT INTO categories (CategoryName, Images, status)
SELECT
    N'Phụ kiện điện thoại',
    N'https://images.unsplash.com/photo-1601593346740-925612772716?w=800',
    1
    WHERE NOT EXISTS (
    SELECT 1
    FROM categories
    WHERE CategoryName = N'Phụ kiện điện thoại'
);

GO


-- Kiểm tra dữ liệu sau khi insert
SELECT
    CategoryId,
    CategoryName,
    Images,
    status
FROM categories
ORDER BY CategoryId;


USE jpa_crud;
GO

-- =====================================================
-- DỮ LIỆU MẪU CHO BẢNG PRODUCTS
-- =====================================================

INSERT INTO products
    (CreatedDate, Description, Image, Price, ProductName, Status, CategoryId, Quantity)
VALUES
(
    '2026-09-01 19:38:49',
    N'Laptop học tập và làm việc.',
    N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800',
    18500000,
    N'ASUS Vivobook 15',
    1,
    6,
    12
),

(
    '2026-09-01 19:48:49',
    N'Laptop Apple mỏng nhẹ.',
    N'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800',
    24990000,
    N'MacBook Air M2',
    1,
    6,
    8
),

(
    '2026-09-01 19:58:49',
    N'Laptop Dell dành cho sinh viên.',
    N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=800',
    17990000,
    N'Dell Inspiron 15',
    1,
    8,
    10
),

(
    '2026-09-01 20:08:49',
    N'Điện thoại Apple hiệu năng cao.',
    N'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=800',
    19990000,
    N'iPhone 15',
    1,
    5,
    20
),

(
    '2026-09-01 20:18:49',
    N'Điện thoại Samsung cao cấp.',
    N'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=800',
    21990000,
    N'Samsung Galaxy S24',
    1,
    9,
    15
),

(
    '2026-09-01 20:28:49',
    N'Điện thoại Xiaomi cấu hình mạnh.',
    N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=800',
    15990000,
    N'Xiaomi 14',
    1,
    9,
    25
),

(
    '2026-09-01 20:38:49',
    N'Tai nghe chống ồn cao cấp.',
    N'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800',
    7490000,
    N'Sony WH-1000XM5',
    1,
    10,
    18
),

(
    '2026-09-01 20:48:49',
    N'Tai nghe không dây Apple.',
    N'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=800',
    5490000,
    N'AirPods Pro',
    1,
    10,
    30
),

(
    '2026-09-01 20:58:49',
    N'Bàn phím cơ Bluetooth.',
    N'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=800',
    2190000,
    N'Keychron K2',
    1,
    11,
    14
),

(
    '2026-09-01 21:38:49',
    N'Màn hình gaming 144Hz.',
    N'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=800',
    4190000,
    N'LG UltraGear 24 inch',
    1,
    13,
    9
),

(
    '2026-09-01 21:48:49',
    N'Màn hình độ phân giải cao.',
    N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=800',
    7290000,
    N'Dell UltraSharp 27 inch',
    1,
    13,
    7
),

(
    '2026-09-01 21:58:49',
    N'Đồng hồ thông minh Apple.',
    N'https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?w=800',
    8990000,
    N'Apple Watch Series 9',
    1,
    14,
    12
),

(
    '2026-09-01 22:08:49',
    N'Đồng hồ thông minh Samsung.',
    N'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800',
    6490000,
    N'Samsung Galaxy Watch 6',
    1,
    14,
    10
);

GO


-- Kiểm tra dữ liệu
SELECT
    ProductId,
    CreatedDate,
    Description,
    Image,
    Price,
    ProductName,
    Status,
    CategoryId,
    Quantity
FROM products
ORDER BY ProductId;
GO