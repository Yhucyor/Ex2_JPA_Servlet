USE jpa_crud;
GO

-- =========================================================
-- 1. TABLE: categories
-- =========================================================
IF OBJECT_ID(N'dbo.categories', N'U') IS NULL
BEGIN
CREATE TABLE dbo.categories (
                                CategoryId   INT IDENTITY(1,1) NOT NULL,
                                CategoryName NVARCHAR(50) NOT NULL,
                                Images       NVARCHAR(500) NULL,
                                status       INT NOT NULL
                                    CONSTRAINT DF_categories_status DEFAULT (1),

                                CONSTRAINT PK_categories
                                    PRIMARY KEY (CategoryId)
);

PRINT N'Đã tạo bảng categories.';
END
ELSE
BEGIN
    PRINT N'Bảng categories đã tồn tại, bỏ qua.';
END
GO


-- =========================================================
-- 2. TABLE: products
-- =========================================================
IF OBJECT_ID(N'dbo.products', N'U') IS NULL
BEGIN
CREATE TABLE dbo.products (
                              ProductId    INT IDENTITY(1,1) NOT NULL,
                              CategoryId   INT NULL,
                              ProductName  NVARCHAR(255) NOT NULL,
                              Description  NVARCHAR(1000) NULL,
                              Price        DECIMAL(18,2) NOT NULL
                                  CONSTRAINT DF_products_Price DEFAULT (0),
                              Quantity     INT NOT NULL
                                  CONSTRAINT DF_products_Quantity DEFAULT (0),
                              Image        NVARCHAR(500) NULL,
                              Status       INT NOT NULL
                                  CONSTRAINT DF_products_Status DEFAULT (1),
                              CreatedDate  DATETIME2 NOT NULL
                                  CONSTRAINT DF_products_CreatedDate DEFAULT (SYSDATETIME()),

                              CONSTRAINT PK_products
                                  PRIMARY KEY (ProductId),

                              CONSTRAINT FK_products_categories
                                  FOREIGN KEY (CategoryId)
                                      REFERENCES dbo.categories(CategoryId)
);

PRINT N'Đã tạo bảng products.';
END
ELSE
BEGIN
    PRINT N'Bảng products đã tồn tại, bỏ qua.';
END
GO


-- =========================================================
-- Kiểm tra cấu trúc 2 bảng
-- =========================================================
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (N'categories', N'products')
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO
