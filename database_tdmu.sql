-- ============================================================================
-- CƠ SỞ DỮ LIỆU: HỆ THỐNG QUẢN LÝ ĐẶT VÉ XEM PHIM TẠI RẠP TDMU
-- Đồ án môn học: Phân tích và Thiết kế Hệ thống Thông tin
-- ============================================================================

CREATE DATABASE QuanLyDatVeTDMU;
GO
USE QuanLyDatVeTDMU;
GO

-- 1. Bảng PHIM
CREATE TABLE PHIM (
    MaPhim VARCHAR(10) PRIMARY KEY,
    TenPhim NVARCHAR(150) NOT NULL,
    TheLoai NVARCHAR(50) NOT NULL,
    ThoiLuong INT NOT NULL,
    TrangThai NVARCHAR(30) NOT NULL
);

-- 2. Bảng PHONGCHIEU
CREATE TABLE PHONGCHIEU (
    MaPhong VARCHAR(10) PRIMARY KEY,
    TenPhong NVARCHAR(50) NOT NULL,
    SucChua INT NOT NULL
);

-- 3. Bảng GHE
CREATE TABLE GHE (
    MaGhe VARCHAR(10) PRIMARY KEY,
    MaPhong VARCHAR(10) NOT NULL,
    SoGhe VARCHAR(10) NOT NULL,
    HangGhe CHAR(2) NOT NULL,
    LoaiGhe NVARCHAR(20) NOT NULL,
    PhuThu DECIMAL(10,0) DEFAULT 0,
    FOREIGN KEY (MaPhong) REFERENCES PHONGCHIEU(MaPhong)
);

-- 4. Bảng SUATCHIEU
CREATE TABLE SUATCHIEU (
    MaSuatChieu VARCHAR(15) PRIMARY KEY,
    MaPhim VARCHAR(10) NOT NULL,
    MaPhong VARCHAR(10) NOT NULL,
    NgayChieu DATE NOT NULL,
    GioBatDau TIME NOT NULL,
    GiaVeCoBan DECIMAL(10,0) NOT NULL,
    FOREIGN KEY (MaPhim) REFERENCES PHIM(MaPhim),
    FOREIGN KEY (MaPhong) REFERENCES PHONGCHIEU(MaPhong)
);

-- 5. Bảng KHACHHANG
CREATE TABLE KHACHHANG (
    MaKH VARCHAR(15) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    MssvTDMU VARCHAR(15)
);

-- 6. Bảng NHANVIEN
CREATE TABLE NHANVIEN (
    MaNV VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    TenDangNhap VARCHAR(50) UNIQUE NOT NULL,
    MatKhau VARCHAR(255) NOT NULL,
    VaiTro NVARCHAR(30) NOT NULL
);

-- 7. Bảng HOADON
CREATE TABLE HOADON (
    MaHD VARCHAR(15) PRIMARY KEY,
    MaKH VARCHAR(15) NOT NULL,
    MaNV VARCHAR(10),
    NgayLap DATETIME NOT NULL,
    TongTien DECIMAL(12,0) NOT NULL,
    TrangThaiTT NVARCHAR(30) NOT NULL,
    FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
);

-- 8. Bảng VE
CREATE TABLE VE (
    MaVe VARCHAR(15) PRIMARY KEY,
    MaHD VARCHAR(15) NOT NULL,
    MaSuatChieu VARCHAR(15) NOT NULL,
    MaGhe VARCHAR(10) NOT NULL,
    GiaVeThucTe DECIMAL(10,0) NOT NULL,
    MaQR VARCHAR(100) UNIQUE NOT NULL,
    TrangThaiVe NVARCHAR(30) NOT NULL,
    CONSTRAINT UQ_SuatChieu_Ghe UNIQUE (MaSuatChieu, MaGhe),
    FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD),
    FOREIGN KEY (MaSuatChieu) REFERENCES SUATCHIEU(MaSuatChieu),
    FOREIGN KEY (MaGhe) REFERENCES GHE(MaGhe)
);

-- ============================================================================
-- DỮ LIỆU MẪU KHỞI TẠO
-- ============================================================================
INSERT INTO PHIM VALUES
('PH001', N'Lật Mặt 8: Vòng Tay Nắng', N'Tâm lý, Gia đình', 120, N'Đang chiếu'),
('PH002', N'Doraemon: Bản Giao Hưởng Địa Cầu', N'Hoạt hình, Phiêu lưu', 115, N'Đang chiếu'),
('PH003', N'Conan: Ngôi Sao 5 Cánh 1 Triệu Đô', N'Trinh thám, Hoạt hình', 110, N'Đang chiếu');

INSERT INTO PHONGCHIEU VALUES
('P01', N'Phòng chiếu 01', 24),
('P02', N'Phòng chiếu 02', 24);

INSERT INTO GHE VALUES
('P01-A1', 'P01', 'A1', 'A', N'Thường', 0),
('P01-A2', 'P01', 'A2', 'A', N'Thường', 0),
('P01-A3', 'P01', 'A3', 'A', N'Thường', 0),
('P01-C3', 'P01', 'C3', 'C', N'VIP', 15000);

INSERT INTO SUATCHIEU VALUES
('SC01', 'PH001', 'P01', '2026-11-19', '14:00:00', 60000),
('SC02', 'PH001', 'P01', '2026-11-19', '19:15:00', 60000),
('SC03', 'PH002', 'P02', '2026-11-19', '15:30:00', 60000);

INSERT INTO KHACHHANG VALUES
('KH001', N'Trần Minh Khoa', '0909111222', 'khoa.tm@student.tdmu.edu.vn', '2324802010001'),
('KH002', N'Lê Thị Thu Hà', '0909333444', 'ha.le@gmail.com', NULL);

INSERT INTO NHANVIEN VALUES
('NV01', N'Nguyễn Hoàng Nam', 'namnh', 'hashed_password_123', N'NhanVienBanVe'),
('NV02', N'Phạm Thị Lan Anh', 'anhptl', 'hashed_password_456', N'QuanLyRap');

INSERT INTO HOADON VALUES
('HD-0001', 'KH001', NULL, '2026-11-19 08:30:00', 51000, N'Đã thanh toán'),
('HD-0002', 'KH002', 'NV01', '2026-11-19 09:15:00', 75000, N'Đã thanh toán');

INSERT INTO VE VALUES
('VE-0001', 'HD-0001', 'SC02', 'P01-A3', 51000, 'QR-TDMU-VE-0001', N'Chưa sử dụng'),
('VE-0002', 'HD-0002', 'SC02', 'P01-C3', 75000, 'QR-TDMU-VE-0002', N'Đã soát vé');
