# 🛠️ Windows Software Installer (Script Cài Đặt Tự Động)

Đây là một đoạn mã (Batch Script) giúp tự động hóa quá trình cài đặt các phần mềm thiết yếu trên máy tính Windows. Script sử dụng trình quản lý gói **Winget** (Windows Package Manager) do chính Microsoft phát triển, đảm bảo phần mềm tải về luôn là bản gốc, sạch và an toàn nhất.

---

## ✨ Tính năng nổi bật
- **Cài đặt hoàn toàn tự động (Silent Install):** Không cần bấm "Next", "I Agree" hay chọn đường dẫn. Script sẽ tự lo mọi thứ.
- **Tự động tạo Shortcut:** Sau khi cài xong, script sẽ tìm và đưa biểu tượng (shortcut) của phần mềm ra ngoài màn hình Desktop.
- **Hỗ trợ cài nhiều phần mềm cùng lúc:** Chỉ cần nhập các số cách nhau bằng dấu phẩy (VD: `1,12,24`).
- **Phân loại khoa học:** Menu được chia thành các nhóm (Tiện ích, Trình duyệt, Lập trình, Văn phòng, Thiết kế...) giúp dễ dàng tìm kiếm.
- **An toàn & Độc lập:** Chạy trong một cửa sổ bảo vệ độc lập, tránh hiện tượng crash hoặc tự động đóng đột ngột khi bộ cài của ứng dụng khác can thiệp.

---

## 💻 Yêu cầu hệ thống
1. **Hệ điều hành:** Windows 10 (từ phiên bản 1809 trở lên) hoặc Windows 11.
2. **Winget:** Máy tính cần có sẵn `winget` (thường được cài mặc định thông qua "App Installer" trên Microsoft Store). *Lưu ý: Nếu máy tính chưa có, script sẽ tự động cảnh báo bạn.*
3. **Kết nối mạng:** Cần có Internet ổn định để script tiến hành tải phần mềm.

---

## 🚀 Hướng dẫn sử dụng chi tiết

### Bước 1: Khởi chạy Script
- Click đúp chuột vào file `.bat` (ví dụ: `Install_Software.bat`) để chạy.
- *(Khuyến nghị)*: Nhấn chuột phải vào file `.bat` và chọn **"Run as administrator"** (Chạy dưới quyền quản trị viên) để đảm bảo không bị lỗi quyền khi cài đặt một số phần mềm hệ thống.

### Bước 2: Tương tác với Menu
Khi giao diện Menu hiện lên, bạn sẽ thấy danh sách 49 phần mềm được đánh số thứ tự. Tại dòng `Nhap lua chon cua ban:`, bạn có thể thực hiện các thao tác sau:

1. **Cài đặt MỘT phần mềm:**
   - Nhập số thứ tự của phần mềm và nhấn `Enter`. 
   - *Ví dụ:* Nhập `13` để cài đặt Google Chrome.

2. **Cài đặt NHIỀU phần mềm cùng lúc (Khuyên dùng):**
   - Nhập các số thứ tự, cách nhau bởi dấu phẩy `,` rồi nhấn `Enter`.
   - *Ví dụ:* Nhập `1,7,13,24,49` để cài cùng lúc: 7-Zip, UniKey, Google Chrome, Canva và Zalo.

3. **Cài đặt TẤT CẢ phần mềm (Full):**
   - Nhập số `99` và nhấn `Enter`. Script sẽ tự động chạy từ ứng dụng số 1 đến 49. Cắm máy, pha một tách cà phê và quay lại khi hoàn thành!

4. **Thoát chương trình:**
   - Nhập số `0` hoặc nhấn dấu `X` ở góc phải cửa sổ.

---

## ⚠️ Một số lưu ý quan trọng

- **Quá trình cài đặt ngầm:** Khi script đang chạy, bạn sẽ thấy một cửa sổ đen mờ hiện lên thông báo "Cai dat...". Vui lòng **KHÔNG đóng cửa sổ này**, nó sẽ tự động tắt khi phần mềm đó cài xong.
- **Phần mềm có dấu `*` (LDPlayer, NoxPlayer):** Đây là các phần mềm hiện chưa được hỗ trợ chính thức trên hệ thống dữ liệu của Winget. Khi bạn chọn, script sẽ không tự cài mà sẽ in ra đường link gốc để bạn nhấp vào tải thủ công.
- **Lỗi không có shortcut:** Nếu script báo "Cài đặt thành công" nhưng không thể tạo shortcut ra Desktop, điều này có nghĩa là bản thân phần mềm đó được thiết kế không tạo shortcut trong Start Menu, hoặc cài ở dạng Portable. Bạn có thể tìm thấy phần mềm bằng cách gõ tên vào thanh Search của Windows.

---

## 🔧 Xử lý sự cố (Troubleshooting)

- **Lỗi: "Winget chua duoc cai dat tren may nay"**
  => *Cách sửa:* Mở Microsoft Store, tìm kiếm ứng dụng tên là **"App Installer"** (Trình cài đặt ứng dụng) của Microsoft và nhấn Cập nhật/Cài đặt.

- **Lỗi: Cài đặt bị treo (đứng im rất lâu không chuyển sang app khác)**
  => *Nguyên nhân:* Mạng chậm hoặc máy chủ của phần mềm đang bảo trì. 
  => *Cách sửa:* Nhấp vào cửa sổ đen đang báo cài đặt, bấm `Ctrl + C` để hủy cài đặt phần mềm đó, script sẽ tiếp tục nhảy sang cài phần mềm tiếp theo.

---
*Chúc bạn tiết kiệm được nhiều thời gian với bộ công cụ này!*
