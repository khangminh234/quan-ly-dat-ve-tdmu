# Hệ thống Quản lý Đặt vé Xem phim tại Rạp TDMU

Đồ án môn học **Phân tích và Thiết kế Hệ thống Thông tin** — Viện Công nghệ số, Trường Đại học Thủ Dầu Một (TDMU).

## Cấu trúc thư mục
- `index.html`: Giao diện ứng dụng Web hoàn chỉnh (tích hợp lưu trữ trạng thái dữ liệu trên trình duyệt).
- `database_tdmu.sql`: Script khởi tạo 8 bảng Cơ sở dữ liệu quan hệ chuẩn 3NF và dữ liệu mẫu.
- `README.md`: Tài liệu hướng dẫn cài đặt và thông tin dự án.

## Các phân hệ chức năng đã triển khai
1. **Tra cứu phim & Đặt vé chọn ghế (`MH01` - `MH02`):** Lọc lịch chiếu, chọn sơ đồ ghế Thường/VIP trực quan, tự động sinh mã vé `VE-0000`, tính ưu đãi 15% cho sinh viên TDMU.
2. **Thanh toán & Vé điện tử (`MH03`):** Quản lý hóa đơn chờ thanh toán, xuất mã QR vé điện tử và hỗ trợ in/lưu thẻ vé.
3. **Soát vé vào rạp (`MH04`):** Kiểm tra tính hợp lệ của mã vé, cập nhật trạng thái đã sử dụng và cảnh báo vé dùng lại.
4. **Quản lý & Thống kê doanh thu (`MH05`):** Thống kê KPI doanh thu, tỷ lệ lấp đầy ghế, xuất file báo cáo Excel (`.CSV`) và thêm suất chiếu mới.
