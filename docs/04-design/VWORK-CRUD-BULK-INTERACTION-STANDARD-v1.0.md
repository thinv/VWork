# VWork – CRUD & Bulk Interaction Standard v1.0

**Trạng thái:** Bắt buộc áp dụng cho toàn bộ màn hình quản lý dữ liệu VWork.

# 1. Nguyên tắc bắt buộc

Mọi màn hình có dữ liệu quản lý phải hỗ trợ đầy đủ các thao tác tương ứng:

- **Thêm**
- **Sửa**
- **Xóa / Lưu trữ / Vô hiệu hóa / Thu hồi**
- **Chọn từng dòng**
- **Chọn tất cả**
- **Bỏ chọn tất cả**
- **Thao tác hàng loạt**

Không được thiết kế màn danh sách chỉ để xem nếu actor có quyền quản trị đối tượng đó.

# 2. Áp dụng theo loại màn hình

## 2.1 Màn hình danh sách
Bắt buộc có:
- nút **Thêm mới**;
- checkbox từng dòng;
- checkbox **Chọn tất cả** ở header;
- thao tác **Sửa** trên từng dòng;
- thao tác **Xóa/Lưu trữ/Vô hiệu hóa** trên từng dòng;
- bulk action bar khi có ít nhất 1 dòng được chọn.

Bulk actions tối thiểu:
- Xóa/Lưu trữ/Vô hiệu hóa;
- đổi trạng thái nếu nghiệp vụ cho phép;
- gán người/đơn vị nếu đối tượng hỗ trợ;
- xuất dữ liệu;
- thao tác nghiệp vụ đặc thù.

## 2.2 Màn hình chi tiết
Bắt buộc có action:
- Sửa;
- Xóa/Lưu trữ/Vô hiệu hóa/Thu hồi;
- Tạo mới đối tượng cùng loại hoặc quay về danh sách để thêm;
- thao tác nghiệp vụ chính theo quyền.

## 2.3 Màn hình cấu hình/danh mục
Bắt buộc full CRUD:
- Thêm;
- Sửa;
- Xóa hoặc vô hiệu hóa;
- chọn tất cả;
- bulk activate/deactivate/delete khi hợp lệ;
- import/export nếu danh mục có quy mô lớn.

## 2.4 Màn hình lịch sử/audit/phiên bản
Không sửa/xóa dữ liệu lịch sử đã khóa.
Tuy nhiên vẫn phải có:
- chọn nhiều/chọn tất cả;
- xuất;
- so sánh;
- lọc;
- bulk export nếu phù hợp.

## 2.5 Màn hình AI/Inbox/Dashboard
Không áp CRUD trực tiếp lên dữ liệu tổng hợp nếu không phải source of truth.
Nhưng mỗi item phải có đường dẫn tới đối tượng gốc, nơi người dùng có thể Thêm/Sửa/Xóa theo quyền.

# 3. Quy tắc Select All

## UX-BR-001
Header checkbox chọn tất cả các dòng **trên trang hiện tại** theo mặc định.

## UX-BR-002
Nếu danh sách phân trang và người dùng muốn chọn toàn bộ tập kết quả, UI phải có bước thứ hai:
“Đã chọn 50 mục trên trang này. Chọn toàn bộ 1.245 mục?”

## UX-BR-003
Bulk operation trên “toàn bộ kết quả” phải gửi filter/query snapshot tới backend, không gửi hàng nghìn ID từ client nếu không cần thiết.

## UX-BR-004
Khi filter/sort/search thay đổi, selection phải được reset hoặc hiển thị cảnh báo rõ.

## UX-BR-005
Các item người dùng không có quyền thao tác không được đưa vào bulk action silently; hệ thống phải báo số item được phép/không được phép.

# 4. Quy tắc Xóa

## UX-BR-006
Dữ liệu chưa được tham chiếu và policy cho phép có thể hard delete.

## UX-BR-007
Dữ liệu đã được tham chiếu phải dùng soft delete/archive/inactive/revoke.

## UX-BR-008
Các dữ liệu sau không được hard delete:
- văn bản đã phát hành/final;
- phiên bản đã khóa;
- audit;
- workflow history;
- approval action;
- báo cáo đã chốt;
- master data đã được tham chiếu.

## UX-BR-009
Mọi thao tác xóa/hủy/lưu trữ hàng loạt phải có confirm dialog và hiển thị số lượng bản ghi bị ảnh hưởng.

# 5. Quy tắc Sửa

## UX-BR-010
Sửa phải tuân optimistic locking/versioning.

## UX-BR-011
Đối tượng đã khóa không sửa trực tiếp; phải tạo version mới.

## UX-BR-012
Bulk edit chỉ mở cho các field có semantic an toàn:
- trạng thái;
- priority;
- owner/unit;
- category;
- effective status;
không bulk edit nội dung văn bản chính thức.

# 6. Permission

Mọi action:
- UI ẩn/disable theo permission;
- backend vẫn phải re-authorize;
- không tin selection/action từ client.

# 7. Component chuẩn

- VwSelectAllCheckbox
- VwRowSelectionCheckbox
- VwBulkActionBar
- VwCreateButton
- VwEditAction
- VwDeleteArchiveAction
- VwConfirmBulkDialog
- VwSelectionSummary

# 8. Acceptance Criteria chung

Mọi màn dữ liệu được coi là hoàn thành khi:
1. Có Add/Create nếu actor có quyền tạo.
2. Có Edit nếu actor có quyền sửa.
3. Có Delete/Archive/Deactivate nếu actor có quyền.
4. Có row selection nếu là list/table.
5. Có Select All.
6. Có bulk action bar.
7. Có confirm cho destructive action.
8. Có permission state.
9. Có audit cho thao tác thay đổi.
10. Có test cho bulk selection và bulk destructive action.
