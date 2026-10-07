# VWork – Shared & Master Data Screen Catalog v1.0

**Mục tiêu:** Bổ sung nhóm màn hình chuyên biệt cho Dữ liệu dùng chung/Master Data, với CRUD + Select All + Bulk đầy đủ.

# 1. Navigation
Quản trị → Dữ liệu dùng chung

Nhóm:
1. Danh mục hệ thống
2. Danh mục đơn vị
3. Đơn vị hành chính
4. Cơ quan bên ngoài
5. Đơn vị đo
6. Loại văn bản
7. Lĩnh vực
8. Nơi nhận
9. Danh mục công việc
10. Danh mục báo cáo
11. Taxonomy
12. Import/Export
13. Lịch sử thay đổi

# 2. Screen Catalog

| ID | Màn hình | Route | Actor |
|---|---|---|---|
| WEB-MD-001 | Tổng quan Master Data | /admin/master-data | ACT-10 |
| WEB-MD-002 | Danh sách Code List | /admin/master-data/code-lists | ACT-10 |
| WEB-MD-003 | Chi tiết Code List | /admin/master-data/code-lists/:code | ACT-10 |
| WEB-MD-004 | Tạo/Sửa Code List | /admin/master-data/code-lists/:code/edit | ACT-10 |
| WEB-MD-005 | Danh sách item | /admin/master-data/code-lists/:code/items | ACT-10 |
| WEB-MD-006 | Tạo/Sửa item | /admin/master-data/code-lists/:code/items/:id | ACT-10 |
| WEB-MD-007 | Đơn vị hành chính | /admin/master-data/administrative-units | ACT-10/11 |
| WEB-MD-008 | Chi tiết đơn vị hành chính | /admin/master-data/administrative-units/:code | ACT-10/11 |
| WEB-MD-009 | Cơ quan bên ngoài | /admin/master-data/agencies | ACT-10 |
| WEB-MD-010 | Đơn vị đo | /admin/master-data/uom | ACT-10/08 |
| WEB-MD-011 | Loại văn bản | /admin/master-data/document-types | ACT-10/02 |
| WEB-MD-012 | Lĩnh vực | /admin/master-data/domains | ACT-10/03 |
| WEB-MD-013 | Nhóm nơi nhận | /admin/master-data/recipient-groups | ACT-10/02 |
| WEB-MD-014 | Loại hồ sơ công việc | /admin/master-data/work-case-types | ACT-10/03 |
| WEB-MD-015 | Loại cuộc họp | /admin/master-data/meeting-types | ACT-10/06 |
| WEB-MD-016 | Loại báo cáo | /admin/master-data/report-types | ACT-10/08 |
| WEB-MD-017 | Taxonomy | /admin/master-data/taxonomy | ACT-10/13 |
| WEB-MD-018 | Import Master Data | /admin/master-data/import | ACT-10 |
| WEB-MD-019 | Preview/Diff Import | /admin/master-data/import/:batch | ACT-10 |
| WEB-MD-020 | Lịch sử Master Data | /admin/master-data/history | ACT-10/14 |

# 3. CRUD Matrix

Mọi màn list:
- Thêm
- Sửa
- Xóa/Deactivate/Retire
- checkbox từng dòng
- Chọn tất cả
- Bulk Action Bar

System-owned code:
- tenant không sửa code/semantic.
- chỉ xem hoặc override label nếu policy.

Tenant-owned:
- full CRUD.

Hybrid:
- system baseline + tenant extension.

# 4. WEB-MD-005 Code List Items

Columns:
- checkbox
- code
- label
- description
- sort order
- status
- effective from/to
- source/owner
- actions

Actions:
- Add
- Edit
- Activate
- Deactivate
- Retire
- Duplicate as new version if semantic change

Bulk:
- Activate
- Deactivate
- Retire eligible
- Change category
- Export

Rules:
- referenced item không hard delete.
- code immutable sau publish nếu referenced.

# 5. WEB-MD-007 Administrative Units

Views:
- tree
- table
- effective-date view

Columns:
- code
- name
- level
- parent
- valid_from/to
- status
- predecessor/successor

Actions:
- import official dataset
- create staging version
- edit staging
- validate
- publish
- retire
- map successor

Không cho tenant tùy ý sửa official code nếu source platform-owned.

# 6. WEB-MD-010 Unit of Measure

Fields:
- code
- name
- symbol
- data type compatibility
- conversion group
- status

CRUD/Bulk:
- Add/Edit/Retire
- Select All
- Bulk activate/deactivate
- Import/export

Conversion rule thay đổi phải version nếu ảnh hưởng report.

# 7. WEB-MD-017 Taxonomy

Tree CRUD:
- add root/child
- edit
- move
- retire
- select all branch
- bulk move
- bulk retire

Validation:
- no cycle
- no duplicate sibling code
- referenced retired node remains resolvable historically

# 8. Import Wizard

Step 1 Upload  
Step 2 Map columns  
Step 3 Validate  
Step 4 Diff  
Step 5 Confirm  
Step 6 Apply  
Step 7 Result

Diff statuses:
NEW
CHANGED
UNCHANGED
INVALID
CONFLICT
RETIRE_CANDIDATE

Bulk apply chỉ sau confirm.

# 9. Delete Semantics
Draft, unreferenced:
- hard delete có thể cho phép.

Published/referenced:
- deactivate/retire.

Administrative/history:
- never hard delete.

# 10. Select All
- page current mặc định.
- option toàn bộ filtered results.
- filter snapshot.
- partial authorization result.

# 11. Mobile
Master Data admin là Web-first.
Mobile Core v1 chỉ read/select lookup; không bắt buộc full admin CRUD.

# 12. Acceptance
- Không hard-code danh mục ở UI.
- Full CRUD/Select All/Bulk cho tenant-owned list.
- Version/effective-date cho dữ liệu cần lịch sử.
- Import có preview diff.
- Audit mọi change.
