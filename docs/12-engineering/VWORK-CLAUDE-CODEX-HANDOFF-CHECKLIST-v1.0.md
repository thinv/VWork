# VWork – Claude/Codex Engineering Handoff Checklist v1.0

**Mục tiêu:** Chuẩn hóa đầu vào trước khi giao Claude/Codex code. Không cho phép AI coder tự suy diễn nghiệp vụ.

# 1. Tài liệu bắt buộc phải đọc trước khi code

Theo phạm vi feature, tối thiểu:
1. Product Boundary.
2. Business Process tương ứng.
3. Actor Catalog.
4. Authority & Responsibility Matrix.
5. Use Case Catalog.
6. Business Rule Catalog.
7. State Machine Catalog.
8. Exception & Edge Case Catalog.
9. Functional Requirements.
10. NFR/SRS liên quan.
11. Domain Model/Data Dictionary.
12. Shared/Master Data spec nếu dùng danh mục.
13. API Catalog/OpenAPI.
14. Screen Catalog + CRUD/Bulk Standard.
15. Test Case/UAT liên quan.

# 2. Handoff Package cho mỗi feature

Feature ID:
- Scope:
- Out of scope:
- Actors:
- Preconditions:
- Main flow:
- Alternate flow:
- Exceptions:
- Business Rules:
- State transitions:
- Permissions:
- Data entities:
- Master data:
- APIs:
- Events:
- Screens:
- CRUD/Bulk behavior:
- Audit requirements:
- Security constraints:
- Acceptance criteria:
- Test cases:
- UAT:
- Traceability IDs:

# 3. Những việc Claude/Codex không được tự quyết

Không được tự:
- thêm trạng thái mới;
- đổi semantic trạng thái;
- suy quyền từ chức danh;
- hard-delete dữ liệu đã tham chiếu;
- tự tạo deadline/owner khi nguồn không có;
- biến AI candidate thành official data;
- bỏ qua Select All/Bulk;
- bỏ qua audit;
- bỏ qua tenant scope;
- đổi API contract mà không cập nhật OpenAPI;
- tạo enum trùng Shared Data;
- bỏ versioning với đối tượng immutable.

# 4. Trước khi mở PR

AI coder phải tự kiểm:
- đúng branch/scope;
- không sửa ngoài phạm vi;
- migration có nếu data change;
- OpenAPI cập nhật nếu API change;
- event schema cập nhật nếu event change;
- screen behavior đúng CRUD Matrix;
- permission negative case;
- tenant isolation;
- state transition tests;
- exception tests;
- audit test;
- traceability mapping.

# 5. PR Description bắt buộc

## Scope
## Business references
## FR/UC/BRULE IDs
## State transitions
## API/Data changes
## UI changes
## Security/Authorization
## Tests
## Known limitations
## Migration
## Evidence

# 6. Definition of Done

Không được Done nếu:
- còn business ambiguity;
- thiếu negative/exception case;
- thiếu CRUD/Select All với màn quản lý;
- thiếu permission check;
- thiếu audit cho state-changing action;
- API khác OpenAPI;
- code tạo enum/master data riêng;
- test chỉ happy path.

# 7. Handoff Gate

BA/Product: BUSINESS READY  
Architect: TECHNICAL READY  
QA: TEST READY  
Sau đó mới chuyển ENGINEERING READY.

Nếu một trong ba chưa READY, Claude/Codex không tự lấp gap bằng giả định.
