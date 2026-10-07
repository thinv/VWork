# VWork – Screen Completeness Audit v1.0

**Ngày audit:** 07/10/2026  
**Phạm vi thực tế theo Screen ID:** 117 Web (97 Core + 20 Shared/Master Data) + 34 Mobile = **151 màn**.

> Lưu ý: baseline trước ghi 109 Web + 32 Mobile. Đếm trực tiếp Screen ID cho thấy 117 Web + 34 Mobile. Đây là GAP-AUD-001 và phải sửa baseline count; audit này dùng Screen ID thực tế để không bỏ sót.

## 1. Tiêu chí
PASS = đã có mapping cụ thể ở cấp màn.  
PARTIAL = có quy tắc/domain baseline nhưng chưa map cụ thể vào Screen ID.  
GAP = thiếu hoặc mapping generic/không xác định.  
N/A = không áp dụng hợp lý với loại màn.

10 chiều audit:
CRUD → Select All → Permission → State → Business Rule → API → Master Data → Exception → Audit → Test/UAT.

## 2. Kết quả tổng
- PASS đầy đủ: **0**
- PARTIAL: **118**
- GAP: **33**

Không có màn nào đạt full PASS 10 chiều ở cấp tài liệu screen-specific. Nghiệp vụ nền đã tồn tại, nhưng traceability chưa được đóng ngược vào từng màn.

## 3. Kết quả theo chiều
| Chiều | PASS | PARTIAL | GAP | N/A |
|---|---:|---:|---:|---:|
| CRUD | 0 | 129 | 0 | 22 |
| Select All | 0 | 45 | 0 | 106 |
| Permission | 0 | 151 | 0 | 0 |
| State | 0 | 114 | 0 | 37 |
| Business Rule | 0 | 151 | 0 | 0 |
| API | 125 | 0 | 26 | 0 |
| Master Data | 0 | 146 | 0 | 5 |
| Exception | 0 | 143 | 8 | 0 |
| Audit | 0 | 151 | 0 | 0 |
| Test/UAT | 0 | 151 | 0 | 0 |

## 4. Gap hệ thống

### GAP-AUD-001 – Sai số lượng màn baseline – P0
Tài liệu ghi 109 Web + 32 Mobile, nhưng Screen ID thực tế là 117 Web + 34 Mobile = 151.

### GAP-AUD-002 – Không có Screen Definition đầy đủ 10 chiều – P0
Screen Catalog hiện chủ yếu có ID/route/actor/API; các chiều Authority/State/BRULE/Master Data/Exception/Audit/Test chưa map theo màn.

### GAP-AUD-003 – API mapping generic/thiếu – P0
Một số màn dùng `resource API`, `DOC/WRK`, `AST/INC`, `auth/session`, `local/server prefs` hoặc Master Data screen chưa gắn API-ID dù API-MD-001..030 đã có.

### GAP-AUD-004 – Permission mới ở Actor level – P0
Actor không phải permission. Cần permission code + data scope + object/action policy cho từng màn/action.

### GAP-AUD-005 – State action chưa khóa ở cấp màn – P0
Có State Machine theo domain nhưng chưa xác định ở mỗi màn: state nào hiển thị, action nào enabled/disabled, transition nào được phép.

### GAP-AUD-006 – CRUD/Select All phụ thuộc global rule – P0
Global standard đã có nhưng từng list/detail chưa có Acceptance Criteria riêng và bulk-action whitelist.

### GAP-AUD-007 – Master Data dependency chưa explicit – P1
Mỗi màn cần chỉ ra code list/master data nào dùng cho filter/form/validation.

### GAP-AUD-008 – Exception chưa trace đến Screen ID – P1
Exception Catalog theo domain đã có nhưng chưa map lỗi → message → recoverable action tại từng màn.

### GAP-AUD-009 – Audit event IDs chưa map màn/action – P1
Cần screen/action → audit event → payload tối thiểu.

### GAP-AUD-010 – Test/UAT chưa screen-specific – P1
UAT domain đã có nhưng thiếu TC-SCR-* cho từng screen/critical action.

## 5. Ma trận toàn bộ màn hình

| Screen | Tên | Domain | CRUD | Select All | Permission | State | BRULE | API | Master Data | Exception | Audit | Test/UAT | Overall |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| WEB-AUTH-001 | Đăng nhập | Identity/Shell | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | N/A | GAP | PARTIAL | PARTIAL | **GAP** |
| WEB-AUTH-002 | Chọn tenant/ngữ cảnh | Identity/Shell | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | N/A | GAP | PARTIAL | PARTIAL | **GAP** |
| WEB-SHELL-001 | App Shell | Identity/Shell | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | GAP | PARTIAL | PARTIAL | **GAP** |
| WEB-SHELL-002 | Thông báo | Identity/Shell | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | GAP | PARTIAL | PARTIAL | **GAP** |
| WEB-SHELL-003 | Tác vụ nền | Identity/Shell | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | GAP | PARTIAL | PARTIAL | **GAP** |
| WEB-EXE-001 | Tổng quan cá nhân | Executive | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-EXE-002 | Executive Inbox | Executive | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-EXE-003 | Việc khẩn/quá hạn | Executive | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-EXE-004 | Daily Brief | Executive | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-EXE-005 | Weekly Brief | Executive | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-EXE-006 | Ask VWork | Executive | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-001 | Danh sách văn bản | Document | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-002 | Tải tài liệu | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-003 | Chi tiết văn bản | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-004 | Trình xem tài liệu | Document | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-005 | Metadata | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-006 | Phiên bản | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-007 | So sánh phiên bản | Document | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-008 | OCR & rà soát | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-009 | Dữ liệu trích xuất | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DOC-010 | Quan hệ văn bản | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-001 | Danh sách văn bản đến | Incoming | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-002 | Đăng ký văn bản đến | Incoming | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-003 | Chi tiết xử lý | Incoming | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-004 | Yêu cầu AI bóc tách | Incoming | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-005 | Phương án xử lý | Incoming | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-006 | Tạo hồ sơ công việc | Incoming | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-INC-007 | Tạo bộ hồ sơ phản hồi | Incoming | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-001 | Danh sách dự thảo | Draft | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-002 | Tạo dự thảo – Brief | Draft | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-003 | Chọn nguồn & mẫu | Draft | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-004 | AI Draft Workspace | Draft | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-005 | AI Review Panel | Draft | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-006 | Rewrite | Draft | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-007 | Document Package | Draft | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-DRF-008 | Lịch sử phiên bản | Draft | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-001 | Danh sách hồ sơ | Work | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-002 | Tạo hồ sơ | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-003 | Tổng quan hồ sơ | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-004 | Timeline | Work | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-005 | Tài liệu liên quan | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-006 | Nhiệm vụ trong hồ sơ | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-007 | Cuộc họp liên quan | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-WC-008 | Kết quả/đầu ra | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-TSK-001 | Việc của tôi | Work | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-002 | Toàn bộ công việc | Work | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-003 | Chi tiết Task | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-004 | Tạo/Giao Task | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-005 | Cập nhật tiến độ | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-006 | Nộp kết quả | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-007 | Lịch sử & bàn giao | Work | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-TSK-008 | Quá hạn/Blocked | Work | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-APR-001 | Hàng đợi cần duyệt | Workflow | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-APR-002 | Chi tiết hồ sơ trình | Workflow | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-APR-003 | Lịch sử workflow | Workflow | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-APR-004 | Cấu hình workflow | Workflow | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-001 | Danh sách cuộc họp | Meeting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-002 | Tạo cuộc họp | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-003 | Tổng quan cuộc họp | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-004 | Giấy mời/Agenda | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-005 | Audio & Transcript | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-006 | Quyết định/Nhiệm vụ | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-MTG-007 | Biên bản | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-001 | Danh sách kỳ báo cáo | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-002 | Tạo kỳ báo cáo | Reporting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-003 | Dashboard kỳ báo cáo | Reporting | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-004 | Đơn vị phải nộp | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-005 | Nguồn báo cáo | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-006 | AI đề xuất chỉ tiêu | Reporting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-007 | Metric Schema Editor | Reporting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-008 | Kết quả trích xuất | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-009 | Data Quality | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-010 | Đối soát | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-011 | Tổng hợp số liệu | Reporting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-012 | Soạn báo cáo tổng | Reporting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-RPT-013 | Xuất báo cáo | Reporting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-001 | Kho mẫu | Knowledge/AI | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-002 | Chi tiết mẫu | Knowledge/AI | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-003 | Tạo/phiên bản mẫu | Knowledge/AI | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-004 | Kho tri thức | Knowledge/AI | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-005 | Thêm nguồn tri thức | Knowledge/AI | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-006 | Chi tiết nguồn | Knowledge/AI | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-007 | Tìm kiếm tri thức | Knowledge/AI | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-KNO-008 | Hỏi đáp có nguồn | Knowledge/AI | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-001 | Cơ cấu tổ chức | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-002 | Người dùng | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-003 | Vai trò & phạm vi | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-004 | Ủy quyền | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-005 | Hồ sơ văn bản | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-006 | AI Providers/Models | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-007 | Prompt Registry | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-008 | Evaluation | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-009 | AI Usage | Governance | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-010 | Integrations | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-011 | Audit | Governance | N/A | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-012 | Retention | Governance | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| WEB-ADM-013 | Job Operations | Governance | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-AUTH-001 | Đăng nhập | Identity/Shell | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | N/A | GAP | PARTIAL | PARTIAL | **GAP** |
| MOB-AUTH-002 | Chọn ngữ cảnh | Identity/Shell | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | N/A | GAP | PARTIAL | PARTIAL | **GAP** |
| MOB-AUTH-003 | Khóa/đăng nhập lại | Identity/Shell | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | GAP | N/A | GAP | PARTIAL | PARTIAL | **GAP** |
| MOB-HOME-001 | Home lãnh đạo | Executive | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-HOME-002 | Daily Brief card view | Executive | N/A | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-HOME-003 | Cảnh báo | Executive | N/A | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-INB-001 | Executive Inbox | Executive | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-INB-002 | Chi tiết Inbox item | Executive | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| MOB-APR-001 | Danh sách cần duyệt | Workflow | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-APR-002 | Chi tiết hồ sơ trình | Workflow | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-APR-003 | Cho ý kiến/Phê duyệt | Workflow | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-DOC-001 | Danh sách văn bản | Document | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-DOC-002 | Xem văn bản | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-DOC-003 | AI tóm tắt văn bản | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| MOB-DOC-004 | Dữ liệu chính & deadline | Document | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-WRK-001 | Việc của tôi | Work | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-WRK-002 | Chi tiết Task | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-WRK-003 | Cập nhật tiến độ | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-WRK-004 | Nộp kết quả nhanh | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-WRK-005 | Hồ sơ công việc | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-WRK-006 | Giao việc nhanh | Work | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-AI-001 | Ask VWork | Knowledge/AI | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-AI-002 | Chat theo hồ sơ | Knowledge/AI | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-AI-003 | Nguồn trích dẫn | Knowledge/AI | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| MOB-MTG-001 | Lịch họp | Meeting | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-MTG-002 | Chi tiết cuộc họp | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-MTG-003 | Transcript | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-MTG-004 | Kết luận & nhiệm vụ | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-MTG-005 | Upload/ghi âm | Meeting | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-NOT-001 | Thông báo | Notification | PARTIAL | PARTIAL | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-PRO-001 | Hồ sơ cá nhân | Profile | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-PRO-002 | Ủy quyền của tôi | Profile | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-PRO-003 | Phiên đăng nhập | Profile | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | PASS | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **PARTIAL** |
| MOB-PRO-004 | Thiết lập ứng dụng | Profile | PARTIAL | N/A | PARTIAL | N/A | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-001 | Tổng quan Master Data | Master Data | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-002 | Danh sách Code List | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-003 | Chi tiết Code List | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-004 | Tạo/Sửa Code List | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-005 | Danh sách item | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-006 | Tạo/Sửa item | Master Data | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-007 | Đơn vị hành chính | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-008 | Chi tiết đơn vị hành chính | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-009 | Cơ quan bên ngoài | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-010 | Đơn vị đo | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-011 | Loại văn bản | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-012 | Lĩnh vực | Master Data | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-013 | Nhóm nơi nhận | Master Data | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-014 | Loại hồ sơ công việc | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-015 | Loại cuộc họp | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-016 | Loại báo cáo | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-017 | Taxonomy | Master Data | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-018 | Import Master Data | Master Data | PARTIAL | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-019 | Preview/Diff Import | Master Data | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |
| WEB-MD-020 | Lịch sử Master Data | Master Data | N/A | N/A | PARTIAL | PARTIAL | PARTIAL | GAP | PARTIAL | PARTIAL | PARTIAL | PARTIAL | **GAP** |

## 6. API mapping GAP cụ thể
- **WEB-WC-008 – Kết quả/đầu ra:** catalog hiện ghi `GAP`; source API mapping = `GAP`. Cần gắn API-ID cụ thể từ API Catalog.
- **MOB-AUTH-003 – Khóa/đăng nhập lại:** catalog hiện ghi `GAP`; source API mapping = `GAP`. Cần gắn API-ID cụ thể từ API Catalog.
- **MOB-INB-002 – Chi tiết Inbox item:** catalog hiện ghi `GAP`; source API mapping = `GAP`. Cần gắn API-ID cụ thể từ API Catalog.
- **MOB-DOC-003 – AI tóm tắt văn bản:** catalog hiện ghi `GAP`; source API mapping = `GAP`. Cần gắn API-ID cụ thể từ API Catalog.
- **MOB-AI-003 – Nguồn trích dẫn:** catalog hiện ghi `GAP`; source API mapping = `GAP`. Cần gắn API-ID cụ thể từ API Catalog.
- **MOB-PRO-004 – Thiết lập ứng dụng:** catalog hiện ghi `GAP`; source API mapping = `GAP`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-001 – Tổng quan Master Data:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-002 – Danh sách Code List:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-003 – Chi tiết Code List:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-004 – Tạo/Sửa Code List:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-005 – Danh sách item:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-006 – Tạo/Sửa item:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-007 – Đơn vị hành chính:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-008 – Chi tiết đơn vị hành chính:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-009 – Cơ quan bên ngoài:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-010 – Đơn vị đo:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-011 – Loại văn bản:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-012 – Lĩnh vực:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-013 – Nhóm nơi nhận:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-014 – Loại hồ sơ công việc:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-015 – Loại cuộc họp:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-016 – Loại báo cáo:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-017 – Taxonomy:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-018 – Import Master Data:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-019 – Preview/Diff Import:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.
- **WEB-MD-020 – Lịch sử Master Data:** catalog hiện ghi `GAP`; source API mapping = `(trống)`. Cần gắn API-ID cụ thể từ API Catalog.

> Danh sách trên đánh dấu theo tình trạng mapping trong Screen Catalog. Với WEB-MD-001..020, API-MD-001..030 đã tồn tại ở API Catalog nhưng chưa được gắn ngược vào từng màn.

## 7. Master Data reference theo domain
- **Document:** DocumentType/Field/Urgency/Agency
- **Incoming:** DocumentType/Agency/Org/Priority
- **Draft:** Template/DocumentType/Signatory
- **Work:** Priority/WorkCaseType/Org/Evidence
- **Workflow:** WorkflowAction/Role/Org
- **Meeting:** MeetingType/ParticipantRole/Org
- **Reporting:** ReportType/Period/UoM/Metric
- **Knowledge/AI:** Taxonomy/SourceType/Authority
- **Master Data:** Canonical Master Data
- **Governance:** Role/Org/Provider/Policy
- **Executive:** Priority/Status
- **Notification:** NotificationType
- **Profile:** Org/Position/Role
- **Identity/Shell:** Tenant/Org/Role

## 8. Exception/UAT reference theo domain
- **Document:** Document rules + EX-CRUD-* | UAT-01..09,20..23
- **Incoming:** EX-INC-001..008 | UAT-01..04
- **Draft:** EX-DRF-001..005 | UAT-05..09
- **Work:** EX-WRK-001..006 | UAT-11..13,20..23
- **Workflow:** EX-WFL-001..005 | UAT-07..10
- **Meeting:** EX-MTG-001..005 | UAT-14,30..32
- **Reporting:** EX-RPT-001..007 | UAT-15..17,26..29
- **Knowledge/AI:** EX-KNO-001..004 | UAT-18..19,33..35
- **Master Data:** EX-MD-001..004 + EX-CRUD-* | UAT-24..25,36..40
- **Governance:** EX-CRUD-* | UAT-20..23
- **Executive:** EX-CRUD-* | UAT-20,23
- **Notification:** EX-CRUD-* | UAT-20,23
- **Profile:** EX-CRUD-* | UAT-10,20,23
- **Identity/Shell:** GAP: auth/session exception catalog | UAT-23

## 9. Exit Criteria để Screen đạt PASS
Một Screen chỉ PASS khi:
1. CRUD/action semantics explicit.
2. Select All/Bulk explicit nếu là list/collection.
3. Permission code + data scope/action policy.
4. Allowed states + disabled/hidden actions.
5. BRULE IDs.
6. API-ID cụ thể.
7. Master Data dependencies.
8. Exception IDs + UX recovery.
9. Audit event IDs.
10. TC/UAT IDs.
