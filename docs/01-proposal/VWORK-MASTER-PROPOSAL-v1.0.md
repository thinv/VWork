# VWork – Master Proposal v1.0

## 1. Tên đề án
**VWork – Nền tảng Văn phòng và Tham mưu thông minh cho UBND xã/phường.**

## 2. Sự cần thiết
Cán bộ cấp xã/phường xử lý khối lượng lớn công văn, báo cáo, chỉ đạo, hồ sơ, cuộc họp và nhiệm vụ theo dõi; dữ liệu phân tán ở Word, PDF, scan, Excel và trao đổi thủ công. VWork hình thành một lớp làm việc số có AI, hỗ trợ nhưng không thay thế thẩm quyền của cán bộ.

## 3. Mục tiêu
- Rút ngắn thời gian đọc, tổng hợp và soạn thảo.
- Tăng tính đầy đủ, nhất quán và truy vết của văn bản.
- Chuyển yêu cầu trong văn bản thành nhiệm vụ có người phụ trách và thời hạn.
- Tạo kho tri thức theo từng đơn vị.
- Hỗ trợ lãnh đạo theo dõi việc cần xử lý trên Web/Mobile.
- Đủ khả năng triển khai nhiều đơn vị từ một core product.

## 4. Đối tượng sử dụng
Lãnh đạo UBND; Văn phòng; Văn thư; công chức chuyên môn; quản trị đơn vị; quản trị nền tảng.

## 5. Phạm vi Core
### VWC-01 Tiếp nhận tài liệu
Word, PDF, scan, ảnh, Excel, audio; metadata; phân loại; virus/malware scan; versioning.

### VWC-02 AI đọc hiểu
OCR, phân đoạn, nhận diện loại văn bản, trích xuất cơ quan, số ký hiệu, ngày, căn cứ, nhiệm vụ, thời hạn, số liệu và thực thể.

### VWC-03 AI tham mưu
Tóm tắt; xác định yêu cầu; đề xuất hướng xử lý; phát hiện thông tin thiếu; tạo checklist công việc.

### VWC-04 AI soạn thảo
Sinh dự thảo theo loại văn bản, dữ liệu thực tế, mẫu và kho tri thức; không tự bịa dữ liệu nghiệp vụ.

### VWC-05 AI kiểm tra
Rà nội dung, logic, thể thức, số liệu, căn cứ, tính đầy đủ; trả về đề xuất có giải thích và nguồn.

### VWC-06 Kho mẫu & tri thức
Mẫu cơ quan, tài liệu tham chiếu, quy định, hồ sơ đã phê duyệt; phân quyền và scope theo tenant.

### VWC-07 Công việc
Tạo/giao việc từ văn bản; deadline; trạng thái; nhắc việc; kết quả; dashboard.

### VWC-08 Họp
Tiếp nhận audio; transcript; người nói; kết luận; nhiệm vụ; biên bản.

### VWC-09 Tổng hợp báo cáo
Nhận nhiều Word/Excel; xác định schema/chỉ tiêu; người dùng duyệt; trích xuất; đối soát; tổng hợp; xuất Word/Excel.

### VWC-10 Quản trị
Tenant, cơ cấu tổ chức, người dùng, RBAC/data scope, cấu hình AI, nhật ký, hạn mức.

## 6. Ngoài phạm vi Core
Kế toán, HRM, CRM, quản lý tài sản, một cửa điện tử, GIS, ERP. Các hệ thống này tích hợp qua API nếu cần.

## 7. Mô hình triển khai
- **VWork SaaS:** nhiều xã/phường dùng chung nền tảng, cách ly tenant.
- **VWork Private:** instance riêng cho một khách hàng/cụm khách hàng.
- **VWork On-Premise:** cài trong hạ tầng khách hàng.

## 8. Nguyên tắc AI
AI là Copilot; người dùng chịu trách nhiệm phê duyệt. Dữ liệu được phân loại thành FACT, INFERENCE, MISSING. Nội dung quan trọng phải có provenance/citation khi nguồn cho phép.

## 9. Kết quả bàn giao sản phẩm
Web App, Mobile App, API, AI services, database, tài liệu quản trị/vận hành, tài liệu người dùng, bộ test/UAT, hồ sơ cài đặt, SLA và baseline kỹ thuật.

## 10. Lộ trình tài liệu
Proposal → BRD → Business Process → Actor/Use Case → Business Rules → SRS → Architecture → Data/API → Web/Mobile Screen Catalog → AI/Security → Test/UAT → Deployment/Acceptance.
