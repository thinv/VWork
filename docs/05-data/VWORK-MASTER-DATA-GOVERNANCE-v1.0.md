# VWork – Master Data Governance v1.0

# 1. Mục tiêu
Quản trị dữ liệu dùng chung theo ownership, version, effective date, approval và audit; tránh mỗi module tự tạo danh mục riêng.

# 2. Phân loại

SYSTEM:
VWork sở hữu semantic.

TENANT:
Đơn vị khách hàng sở hữu.

HYBRID:
Core cung cấp baseline, tenant mở rộng có kiểm soát.

EXTERNAL:
Nguồn authoritative bên ngoài.

# 3. Lifecycle

DRAFT → REVIEW → ACTIVE → INACTIVE → RETIRED.

Với administrative data:
DRAFT → APPROVED → EFFECTIVE → EXPIRED.

# 4. Ownership

Mỗi master dataset phải có:
- business owner;
- technical owner;
- steward;
- update authority;
- approval authority.

# 5. Versioning

Version bắt buộc nếu thay đổi ảnh hưởng:
- meaning;
- hierarchy;
- mapping;
- valid period;
- report interpretation.

Label typo có thể update non-breaking nếu policy.

# 6. Effective Date

Field:
- valid_from;
- valid_to;
- status.

Query phải hỗ trợ “as of date” với dữ liệu lịch sử quan trọng.

# 7. Snapshot

Record giao dịch cần snapshot khi tên/chức danh/đơn vị tại thời điểm phát sinh là bằng chứng.

Snapshot không thay source master.

# 8. CRUD

Thêm:
- validate code;
- validate ownership;
- duplicate check.

Sửa:
- optimistic lock;
- semantic change có version.

Xóa:
- chỉ hard delete draft chưa referenced;
- referenced → inactive/retired.

Select All/Bulk:
- activate/deactivate;
- classify;
- export;
- import validation;
- retire eligible.

# 9. Import

Flow:
Upload → Parse → Validate → Diff Preview → User Confirm → Apply Batch → Audit → Publish/Activate.

Validation:
- duplicate;
- parent missing;
- code invalid;
- circular hierarchy;
- effective overlap;
- referenced delete.

# 10. Administrative Data

Không hard-code số lượng đơn vị hành chính.

Mỗi record:
- official code;
- name;
- level;
- parent;
- valid period;
- status;
- predecessor/successor mapping nếu thay đổi.

# 11. Organization Changes

Đổi tên:
- update current master;
- historical snapshots giữ nguyên.

Sáp nhập:
- old units RETIRED;
- successor mapping;
- active membership/task migration policy riêng.

Giải thể:
- không xóa lịch sử.

# 12. Data Quality

Rule:
- completeness;
- uniqueness;
- referential;
- hierarchy;
- effective-date overlap;
- code format.

# 13. Publish

Một dataset có thể cần staging version.
Chỉ ACTIVE/PUBLISHED version được client/business logic dùng.

# 14. Cache

Publish/retire phải emit cache invalidation event.

Client không cache vô thời hạn.

# 15. Audit

Audit:
- create;
- update;
- publish;
- activate;
- deactivate;
- retire;
- import;
- bulk action.

# 16. Acceptance

- owner rõ.
- version/effective date.
- referenced delete protection.
- import diff preview.
- audit.
- historical snapshot không bị rewrite.
