-- Active: 1714660276272@@127.0.0.1@3306@testingexam_db

-- Question 1. Tạo bảng với ràng buộc và kiểu dữ liệu. Sau đó, thêm ít nhất 5 bản ghi vào bảng
-- Create Database
DROP DATABASE IF EXISTS TestingExam_Db;
CREATE DATABASE TestingExam_Db;

USE TestingExam_Db;

-- Create Table
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
    CustomerID  INT AUTO_INCREMENT PRIMARY KEY,
    Name        NVARCHAR(255),
    Phone       VARCHAR(20),
    Email       VARCHAR(255),
    Address     NVARCHAR(255),
    Note        NVARCHAR(255)
);

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars(
    CarID   INT AUTO_INCREMENT PRIMARY KEY,
    Maker   ENUM('HONDA', 'TOYOTA', 'NISSAN'),
    Model   VARCHAR(255),
    Year    INT,
    Color   VARCHAR(50),
    Note    NVARCHAR(255)
);

DROP TABLE IF EXISTS Car_Order;
CREATE TABLE CAR_ORDER (
    OrderID         INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID      INT,
    CarID           INT,
    Amount          INT DEFAULT 1,
    SalePrice       DECIMAL(10, 2),
    OrderDate       DATE,
    DeliveryDate    DATE,
    DeliveryAddress NVARCHAR(255),
    Status          INT DEFAULT 0,
    Note            NVARCHAR(255),
    FOREIGN KEY     (CustomerID)    REFERENCES Customers(CustomerID)    ON DELETE CASCADE,
    FOREIGN KEY     (CarID)         REFERENCES Cars(CarID)              ON DELETE CASCADE
);

-- Insert Data
INSERT INTO Customers   (Name               , Phone         , Email                         , Address                                                               , Note                      )
VALUES                  ('Trần Văn Bình'    , '0909123456'  , 'tranvanbinh@example.com'     , '321 Lê Lợi, Phường Hưng Phú, Tp. Cần Thơ'                            , 'Khách hàng mới'          ),
                        ('Nguyễn Thị Hương' , '0987654321'  , 'nguyenthihuong@example.com'  , '456 Lê Lợi, Phường Hưng Phú, Tp. Cần Thơ'                            , 'Khách hàng VIP'          ),
                        ('Lê Văn Hùng'      , '0918234567'  , 'levanhung@example.com'       , '789 Đường 30/4, Phường Ninh Kiều, Tp. Cần Thơ'                       , 'Khách hàng thân thiết'   ),
                        ('Trần Thị Mai'     , '0987654321'  , 'tranthimai@example.com'      , '123 Phạm Ngũ Lão, Phường 1, Quận 1, Tp. Hồ Chí Minh'                 , 'Khách hàng mới'          ),
                        ('Nguyễn Văn Nam'   , '0365987412'  , 'nguyenvannam@example.com'    , '456 Trần Hưng Đạo, Phường 2, Quận 5, Tp. Hồ Chí Minh'                , 'Khách hàng VIP'          ),
                        ('Lê Thị Lan'       , '0765432109'  , 'lethilan@example.com'        , '789 Lê Lai, Phường 3, Quận 10, Tp. Hồ Chí Minh'                      , 'Khách hàng thân thiết'   ),
                        ('Phạm Văn Lâm'     , '0321876543'  , 'phamvanlam@example.com'      , '101 Trần Phú, Phường 1, Tp. Đà Nẵng'                                 , 'Khách hàng đang quan tâm'),
                        ('Hoàng Thị Thủy'   , '0909123456'  , 'hoangthithuy@example.com'    , '202 Trần Hưng Đạo, Phường An Hải Đông, Quận Sơn Trà, Tp. Đà Nẵng'    , 'Khách hàng mới'          ),
                        ('Trần Văn Dương'   , '0987654321'  , 'tranvanduong@example.com'    , '321 Lê Hồng Phong, Phường 6, Quận 10, Tp. Hồ Chí Minh'               , 'Khách hàng VIP'          ),
                        ('Nguyễn Thị Thanh' , '0918234567'  , 'nguyenthithanh@example.com'  , '456 Hai Bà Trưng, Phường Bến Nghé, Quận 1, Tp. Hồ Chí Minh'          , 'Khách hàng thân thiết'   ),
                        ('Nguyễn Văn Anh'   , '0123456789'  , 'nguyenvana@example.com'      , '123 Nguyễn Văn Cừ, Phường 1, Quận Bình Thạnh, Tp. Hồ Chí Minh'       , 'Khách hàng thân thiết'   ),
                        ('Trần Thị Bích'    , '0987654321'  , 'tranthib@example.com'        , '456 Lê Lợi, Phường Hưng Phú, Tp. Cần Thơ'                            , 'Khách hàng mới'          ),
                        ('Lê Thị Cẩm Hà'    , '0365987412'  , 'lethicamha@example.com'      , '789 Đường 30/4, Phường Ninh Kiều, Tp. Cần Thơ'                       , 'Khách hàng VIP'          ),
                        ('Phạm Thị Duyên'   , '0765432109'  , 'phamthiduyen@example.com'    , '101 Lê Duẩn, Phường Trần Phú, Tp. Hà Tĩnh'                           , 'Khách hàng quen'         ),
                        ('Hoàng Văn Em'     , '0321876543'  , 'hoangvane@example.com'       , '202 Hai Bà Trưng, Phường Hải Châu, Quận Hải Châu, Tp. Đà Nẵng'       , 'Khách hàng đang quan tâm');

INSERT INTO Cars        (Maker      , Model     , Year, Color       , Note                  )
VALUES                  ('HONDA'    , 'Civic'   , 2022, 'Màu đen'   , 'Xe thể thao'         ),
                        ('TOYOTA'   , 'Rav4'    , 2022, 'Màu xám'   , 'Xe đa dụng'          ),
                        ('NISSAN'   , 'Sunny'   , 2022, 'Màu trắng' , 'Xe công nghệ mới'    ),
                        ('HONDA'    , 'City'    , 2022, 'Màu bạc'   , 'Xe phổ thông'        ),
                        ('TOYOTA'   , 'Yaris'   , 2022, 'Màu vàng'  , 'Xe nhỏ gọn'          ),
                        ('HONDA'    , 'Civic'   , 2023, 'Màu đen'   , 'Xe thể thao'         ),
                        ('TOYOTA'   , 'Rav4'    , 2023, 'Màu xám'   , 'Xe đa dụng'          ),
                        ('NISSAN'   , 'Sunny'   , 2023, 'Màu trắng' , 'Xe công nghệ mới'    ),
                        ('HONDA'    , 'City'    , 2023, 'Màu bạc'   , 'Xe phổ thông'        ),
                        ('TOYOTA'   , 'Yaris'   , 2023, 'Màu vàng'  , 'Xe nhỏ gọn'          ),
                        ('HONDA'    , 'Civic'   , 2024, 'Màu đen'   , 'Xe thể thao'         ),
                        ('TOYOTA'   , 'Rav4'    , 2024, 'Màu xám'   , 'Xe đa dụng'          ),
                        ('NISSAN'   , 'Sunny'   , 2024, 'Màu trắng' , 'Xe công nghệ mới'    ),
                        ('HONDA'    , 'City'    , 2024, 'Màu bạc'   , 'Xe phổ thông'        ),
                        ('TOYOTA'   , 'Yaris'   , 2024, 'Màu vàng'  , 'Xe nhỏ gọn'          );

INSERT INTO Car_Order   (CustomerID , CarID , Amount, SalePrice , OrderDate     , DeliveryDate  , DeliveryAddress                                       , Status)
VALUES                  (2          , 1     , 4     , 25000.00  , '2022-01-01'  , '2022-01-17'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (5          , 5     , 4     , 30000.00  , '2022-02-10'  , '2022-02-26'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (9          , 2     , 2     , 29000.00  , '2022-03-15'  , '2022-03-31'  , '789 Lê Lai, Quận 10, Tp. Hồ Chí Minh'                , 1     ),
                        (13         , 1     , 2     , 26000.00  , '2022-03-16'  , '2022-04-05'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (6          , 3     , 1     , 19000.00  , '2022-04-10'  , NULL          , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 2     ),
                        (14         , 2     , 2     , 28000.00  , '2022-05-02'  , '2022-05-27'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (3          , 4     , 1     , 21000.00  , '2022-06-05'  , '2022-07-02'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (10         , 1     , 1     , 27000.00  , '2022-07-25'  , NULL          , '456 Hai Bà Trưng, Quận 1, Tp. Hồ Chí Minh'           , 2     ),
                        (14         , 6     , 1     , 28000.00  , '2023-01-03'  , '2023-01-20'  , '101 Lê Duẩn, Quận Trần Phú, Tp. Hà Tĩnh'             , 1     ),
                        (9          , 7     , 4     , 25000.00  , '2023-03-10'  , '2023-03-30'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (5          , 6     , 3     , 22000.00  , '2023-04-05'  , NULL          , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 2     ),
                        (10         , 8     , 1     , 31000.00  , '2023-05-04'  , '2023-05-21'  , '789 Lê Lai, Quận 10, Tp. Hồ Chí Minh'                , 1     ),
                        (6          , 6     , 2     , 26000.00  , '2023-05-11'  , NULL          , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 2     ),
                        (11         , 9     , 1     , 26000.00  , '2023-05-12'  , '2023-06-01'  , '101 Trần Phú, Quận Hải Châu, Tp. Đà Nẵng'            , 1     ),
                        (12         , 8     , 1     , 19000.00  , '2023-06-15'  , '2023-06-10'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (6          , 10    , 2     , 31000.00  , '2023-08-06'  , '2023-08-29'  , '789 Lê Lai, Quận 10, Tp. Hồ Chí Minh'                , 1     ),
                        (2          , 10    , 2     , 31000.00  , '2023-08-13'  , '2023-09-03'  , '789 Đường 30/4, Quận Ninh Kiều, Tp. Cần Thơ'         , 1     ),
                        (4          , 6     , 1     , 27000.00  , '2023-09-05'  , '2023-09-28'  , '789 Lê Lai, Quận 10, Tp. Hồ Chí Minh'                , 1     ),
                        (13         , 7     , 5     , 29000.00  , '2023-10-14'  , '2023-10-30'  , '321 Lê Hồng Phong, Quận 10, Tp. Hồ Chí Minh'         , 1     ),
                        (8          , 7     , 1     , 29000.00  , '2023-10-22'  , '2023-11-10'  , '101 Lê Duẩn, Quận Trần Phú, Tp. Hà Tĩnh'             , 1     ),
                        (5          , 7     , 3     , 30000.00  , '2023-11-10'  , '2023-11-26'  , '456 Hai Bà Trưng, Quận 1, Tp. Hồ Chí Minh'           , 1     ),
                        (7          , 9     , 3     , 22000.00  , '2023-12-10'  , NULL          , '456 Hai Bà Trưng, Quận 1, Tp. Hồ Chí Minh'           , 2     ),
                        (1          , 15    , 1     , 32000.00  , '2024-01-05'  , '2024-01-31'  , '202 Hai Bà Trưng, Quận Hải Châu, Tp. Đà Nẵng'        , 1     ),
                        (4          , 15    , 1     , 32000.00  , '2024-01-19'  , '2024-02-07'  , '456 Hai Bà Trưng, Quận 1, Tp. Hồ Chí Minh'           , 1     ),
                        (12         , 15    , 1     , 24000.00  , '2024-01-22'  , NULL          , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 2     ),
                        (13         , 12    , 3     , 28000.00  , '2024-01-25'  , '2024-02-15'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (3          , 12    , 3     , 28000.00  , '2024-01-26'  , '2024-02-15'  , '101 Trần Phú, Quận Hải Châu, Tp. Đà Nẵng'            , 1     ),
                        (8          , 14    , 1     , 28000.00  , '2024-02-05'  , NULL          , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 2     ),
                        (6          , 13    , 2     , 18000.00  , '2024-02-05'  , '2024-02-24'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (11         , 12    , 1     , 25000.00  , '2024-02-10'  , '2024-03-03'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (10         , 13    , 3     , 18000.00  , '2024-02-11'  , NULL          , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 2     ),
                        (14         , 13    , 1     , 19000.00  , '2023-03-15'  , '2023-04-01'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (5          , 14    , 3     , 21000.00  , '2024-03-15'  , '2024-04-04'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (2          , 14    , 3     , 21000.00  , '2024-03-30'  , '2024-04-15'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (9          , 14    , 2     , 20000.00  , '2024-03-31'  , '2024-05-17'  , '123 Nguyễn Văn Cừ, Quận Bình Thạnh, Tp. Hồ Chí Minh' , 1     ),
                        (14         , 13    , 3     , 18000.00  , '2024-04-01'  , '2024-04-26'  , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 1     ),
                        (9          , 12    , 3     , 25000.00  , '2024-04-09'  , NULL          , '456 Lê Lợi, Quận Ninh Kiều, Tp. Cần Thơ'             , 2     ),
                        (2          , 13    , 5     , 30000.00  , '2024-04-10'  , '2024-05-02'  , '202 Hai Bà Trưng, Quận Hải Châu, Tp. Đà Nẵng'        , 1     ),
                        (1          , 11    , 1     , 27000.00  , '2024-04-25'  , '2024-05-02'  , '789 Đường 30/4, Quận Ninh Kiều, Tp. Cần Thơ'         , 1     ),
                        (4          , 13    , 2     , 20000.00  , '2024-05-01'  , '2024-05-29'  , '321 Lê Hồng Phong, Quận 10, Tp. Hồ Chí Minh'         , 1     ),
                        (8          , 13    , 2     , 20000.00  , '2024-05-05'  , NULL          , '101 Lê Duẩn, Quận Trần Phú, Tp. Hà Tĩnh'             , 0     ),
                        (7          , 12    , 5     , 30000.00  , '2024-05-10'  , NULL          , '202 Hai Bà Trưng, Quận Hải Châu, Tp. Đà Nẵng'        , 0     ),
                        (15         , 14    , 4     , 22000.00  , '2024-05-20'  , NULL          , '202 Hai Bà Trưng, Quận Hải Châu, Tp. Đà Nẵng'        , 0     );

-- Question 2. Truy vấn thông tin Khách hàng (tên, số lượng oto khách hàng đã mua) và sắp sếp tăng dần theo số lượng Ô-tô đã mua
SELECT      cu.Name, SUM(co.Amount) AS NUM_CARS
FROM        Customers   AS cu
LEFT JOIN   Car_Order   AS co   ON  co.CustomerID = cu.CustomerID
GROUP BY    cu.Name
ORDER BY    NUM_CARS;

-- Question 3. Viết hàm (không có Parameter) trả về Tên hãng sản xuất đã bán được nhiều Ô-tô nhất trong năm nay
DELIMITER //
CREATE FUNCTION GetBestSellingCarMaker()
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE BestMaker VARCHAR(50);

    SELECT      ca.Maker    INTO    BestMaker
    FROM        Cars        AS ca 
    LEFT JOIN   Car_Order   AS co   ON co.CarID = ca.CarID
    WHERE       YEAR(co.DeliveryDate) = YEAR(CURRENT_DATE())
    GROUP BY    ca.Maker
    HAVING      SUM(co.Amount) =    (SELECT  MAX(NUM_CARS)
                                    FROM    (SELECT      SUM(co.Amount) AS NUM_CARS
                                            FROM        Cars        AS ca 
                                            LEFT JOIN   Car_Order   AS co   ON co.CarID = ca.CarID
                                            WHERE       YEAR(co.DeliveryDate) = YEAR(CURRENT_DATE())
                                            GROUP BY    ca.Maker) AS TotalCars);

    RETURN BestMaker;
END //
DELIMITER ;

-- Question 4. Viết 1 thủ tục (không có Parameter) để Xóa các Đơn hàng đã bị hủy của những năm trước. In ra số lượng bản ghi đã bị xóa
DELIMITER //
CREATE PROCEDURE DeleteCancelledOrdersFromPreviousYears()
BEGIN
    DECLARE num_deleted INT;

    CREATE TEMPORARY TABLE IF NOT EXISTS TempCancelledOrders LIKE Car_Order;

    TRUNCATE TABLE TempCancelledOrders;

    INSERT INTO TempCancelledOrders
    SELECT  *
    FROM    Car_Order
    WHERE   Status = 2
    AND     YEAR(OrderDate) < YEAR(CURRENT_DATE());

    SELECT  COUNT(*)    INTO num_deleted
    FROM    (
            SELECT  *
            FROM    Car_Order
            WHERE   Status = 2
            AND     YEAR(OrderDate) < YEAR(CURRENT_DATE())
            ) AS deleted_row;

    DELETE  
    FROM    Car_Order
    WHERE   Status = 2 
    AND     YEAR(OrderDate) < YEAR(CURRENT_DATE());

    SELECT CONCAT('Số lượng bản ghi đã bị xóa: ', num_deleted) AS Message;

    SELECT * FROM TempCancelledOrders;

    TRUNCATE TABLE TempCancelledOrders;
END //
DELIMITER ;

-- Question 5. Viết 1 thủ tục (có CustomerID Parameter) để in ra thông tin của các Đơn hàng đã đặt hàng (Tên của khách hàng, Mã đơn hàng, Số lượng Ô-tô và Tên hãng sản xuất)
DROP    PROCEDURE IF EXISTS GetCustomerOrders;
DELIMITER //
CREATE  PROCEDURE           GetCustomerOrders(IN CustomerID INT)
BEGIN
    SELECT      cu.Name, co.OrderID, co.Amount, ca.Maker
    FROM        Car_Order   AS co
    LEFT JOIN   Customers   AS cu   ON cu.CustomerID    =   co.CustomerID
    LEFT JOIN   Cars        AS ca   ON ca.CarID         =   co.CarID
    WHERE       co.CustomerID = CustomerID;
END //
DELIMITER ;

-- Question 6. Viết Trigger để tránh trường hợp User nhập thông tin không hợp lệ vào Database (DeliveryDate < OrderDate + 15)
DELIMITER //
CREATE TRIGGER BeforeInsertOrUpdateCarOrder
BEFORE INSERT ON Car_Order
FOR EACH ROW
BEGIN
    IF NEW.DeliveryDate < DATE_ADD(NEW.OrderDate, INTERVAL 15 DAY) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'DeliveryDate must be at least 15 days after OrderDate';
    END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeUpdateCarOrder
BEFORE UPDATE ON Car_Order
FOR EACH ROW
BEGIN
    IF NEW.DeliveryDate < DATE_ADD(NEW.OrderDate, INTERVAL 15 DAY) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'DeliveryDate must be at least 15 days after OrderDate';
    END IF;
END //

DELIMITER ;