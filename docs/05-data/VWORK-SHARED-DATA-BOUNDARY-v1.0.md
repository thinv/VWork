# VWork – Shared Data Boundary Matrix v1.0

## 1. Mục tiêu
Xác định dữ liệu nào là System, Tenant, Domain-owned hoặc External-authoritative.

| Dữ liệu | Owner | Scope | Source of Truth |
|---|---|---|---|
| Tenant | Platform | Platform | VWork |
| Organization Unit | Tenant | Tenant | VWork/Integration |
| Position | Tenant | Tenant | VWork |
| Membership | Tenant | Tenant | VWork/SSO mapping |
| Administrative Unit | Platform | Global/versioned | Master dataset |
| External Agency | Platform/Tenant | Hybrid | Shared Data |
| Document Type | Platform+Tenant | Hybrid | Shared Data |
| Document Status | Platform | Global | System code list |
| Task Status | Platform | Global | System code list |
| Priority | Platform | Global | System code list |
| Unit of Measure | Platform | Global | Shared Data |
| Metric Definition | Reporting | Tenant/report | Reporting domain |
| Workflow Action | Platform | Global | System code list |
| Workflow Definition | Tenant | Tenant | Workflow domain |
| Knowledge Taxonomy | Tenant | Tenant | Knowledge domain |
| AI Provider/Model | Platform/Tenant | Deployment | AI Governance |
| Permission Code | Platform | Global | IAM |
| Role | Tenant | Tenant | IAM |

## 2. Boundary Rules

1. Domain entity không tự sao chép Organization name làm source of truth.
2. Business record có thể lưu snapshot label nếu cần chứng cứ lịch sử.
3. Khi master data đổi tên, record lịch sử vẫn giữ reference và snapshot phù hợp.
4. External authoritative data phải có source_system + external_id.
5. Shared data không chứa transaction state nghiệp vụ.

## 3. Snapshot Rule

Các hồ sơ cần giữ snapshot tại thời điểm phát sinh:
- người ký/chức danh trên văn bản;
- tên đơn vị phát hành;
- tên đơn vị báo cáo;
- administrative label;
- metric unit/name khi report final.

Reference dùng cho liên kết; snapshot dùng cho lịch sử/chứng cứ.

## 4. Cache Rule

Cache allowed:
- code list;
- administrative unit;
- organization tree.

Cache invalidation bắt buộc khi publish master version mới.

## 5. Anti-pattern

Không:
- copy toàn bảng master vào từng module;
- hard-code 34 tỉnh/thành trong source;
- dùng tên địa phương làm khóa join;
- dùng label “Hoàn thành” thay code COMPLETED;
- để mobile giữ danh mục cũ vô hạn.
