CREATE DATABASE QLoto1;
GO

USE QLoto;
GO

-- Bảng Trangthai
CREATE TABLE Trangthai(
    Tinhtrang INT IDENTITY(1,1) PRIMARY KEY,
    TenTrangThai NVARCHAR(50)
);

-- Bảng PhanQuyen
CREATE TABLE PhanQuyen (
    IDQuyen INT IDENTITY(1,1) PRIMARY KEY,
    TenQuyen NVARCHAR(20)
);

-- Bảng Nguoidung
CREATE TABLE Nguoidung (
    MaNguoiDung INT IDENTITY(1,1) PRIMARY KEY,
    Hoten NVARCHAR(50),
    Email NVARCHAR(50),
    Dienthoai NCHAR(10),
    Matkhau VARCHAR(50),
    IDQuyen INT,
    Diachi NVARCHAR(100),
    FOREIGN KEY (IDQuyen) REFERENCES PhanQuyen(IDQuyen)
);

-- Bảng Hangsanxuat
CREATE TABLE Hangsanxuat (
    Mahang INT IDENTITY(1,1) PRIMARY KEY,
    Tenhang NVARCHAR(50)
);

-- Bảng Dongxe
CREATE TABLE Dongxe (
    Madongxe INT IDENTITY(1,1) PRIMARY KEY,
    Tendongxe NVARCHAR(50)
);

-- Bảng Sanpham
CREATE TABLE Sanpham (
    Masp INT IDENTITY(1,1) PRIMARY KEY,
    Tensp NVARCHAR(50),
    Giatien DECIMAL(18, 0),
    Soluong INT,
    Mota NTEXT,
    Mahang INT,
    Madongxe INT,
    Anhbia NVARCHAR(100),
    FOREIGN KEY (Mahang) REFERENCES Hangsanxuat(Mahang),
    FOREIGN KEY (Madongxe) REFERENCES Dongxe(Madongxe)
);

-- Bảng Donhang
CREATE TABLE Donhang (
    Madon INT IDENTITY(1,1) PRIMARY KEY,
    Ngaydat DATETIME,
    Tinhtrang INT,
    MaNguoidung INT,
    FOREIGN KEY (Tinhtrang) REFERENCES Trangthai(Tinhtrang),
    FOREIGN KEY (MaNguoidung) REFERENCES Nguoidung(MaNguoiDung)
);

-- Bảng Chitietdonhang
CREATE TABLE Chitietdonhang (
    Madon INT,
    Masp INT,
    Soluong INT,
    Dongia DECIMAL(18, 0),
    PRIMARY KEY (Madon, Masp),
    FOREIGN KEY (Madon) REFERENCES Donhang(Madon),
    FOREIGN KEY (Masp) REFERENCES Sanpham(Masp)
);

-- Thêm dữ liệu mẫu
INSERT INTO Trangthai (TenTrangThai) VALUES
(N'Chờ xác nhận'), 
(N'Đang xử lý'), 
(N'Hoàn thành'), 
(N'Hủy bỏ');

INSERT INTO PhanQuyen (TenQuyen) VALUES 
(N'Member'), 
(N'Admin');

INSERT INTO Hangsanxuat (Tenhang) VALUES 
(N'Vinfast');

INSERT INTO Dongxe (Tendongxe) VALUES  
(N'Hybrid'), 
(N'Electric');

INSERT INTO Sanpham (Tensp, Giatien, Soluong, Mota, Mahang, Madongxe, Anhbia) VALUES 
(N'VF3', 250000000, 10, N'New', 1, 2, N'vf31.jpg');

INSERT INTO Nguoidung (Hoten, Email, Dienthoai, Matkhau, IDQuyen, Diachi) VALUES 
(N'Nguyen Van A', N'vana@gmail.com', N'0123456789', N'password123', 1 ,N'Hanoi'),
(N'Tran Thi B', N'thib@gmail.com', N'0987654321', N'password456',2 ,N'HCM'),
(N'Le Thi C', N'lethiC@gmail.com',N'0912345678',N'password789',1 ,N'Da Nang'),
(N'Pham Van D',N'phamvand@gmail.com',N'0908765432',N'password012',2 ,N'Hue'),
(N'Hoang Thi E',N'hoangthie@gmail.com',N'0934567890',N'password345',1 ,N'Can Tho');

INSERT INTO Donhang (Ngaydat, Tinhtrang, MaNguoidung) VALUES
(GETDATE(), 1, 1),
(GETDATE(), 2, 2),
(GETDATE(), 1, 3),
(GETDATE(), 2, 4),
(GETDATE(), 1, 5);

INSERT INTO Chitietdonhang (Madon, Masp, Soluong, Dongia) VALUES
(1, 1, 1, 250000000);
SELECT d.Madon, d.Ngaydat, d.Tinhtrang, d.MaNguoidung, t.TenTrangThai, n.Hoten
FROM Donhang d
INNER JOIN Trangthai t ON d.Tinhtrang = t.Tinhtrang
INNER JOIN Nguoidung n ON d.MaNguoidung = n.MaNguoidung
SELECT 
    t.TenTrangThai, 
    COUNT(d.Madon) AS TotalOrders, 
    SUM(c.Dongia * c.Soluong) AS TotalRevenue
FROM 
    Donhang d
JOIN 
    Trangthai t ON d.Tinhtrang = t.Tinhtrang
JOIN 
    Chitietdonhang c ON d.Madon = c.Madon
GROUP BY 
    t.TenTrangThai
SELECT TOP 1 * FROM Donhang;