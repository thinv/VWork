# 02 – Requirements

Chứa toàn bộ hồ sơ yêu cầu nghiệp vụ và phần mềm.

## Đã hoàn thành baseline
- [x] VWORK-BUSINESS-PROCESS-SPEC-v1.0.md
- [x] VWORK-BRD-v1.0.md
- [x] VWORK-ACTOR-CATALOG-v1.0.md
- [x] VWORK-USE-CASE-CATALOG-v1.0.md
- [x] VWORK-BUSINESS-RULE-CATALOG-v1.0.md
- [x] VWORK-FUNCTIONAL-REQUIREMENTS-v1.0.md
- [x] VWORK-NON-FUNCTIONAL-REQUIREMENTS-v1.0.md
- [x] VWORK-SRS-v1.0.md
- [x] VWORK-AUTHORITY-RESPONSIBILITY-MATRIX-v1.0.md
- [x] VWORK-STATE-MACHINE-CATALOG-v1.0.md
- [x] VWORK-EXCEPTION-EDGE-CASE-CATALOG-v1.0.md
- [x] VWORK-INCOMING-OUTGOING-DOCUMENT-BUSINESS-SPEC-v1.0.md
- [x] VWORK-WORK-CASE-TASK-BUSINESS-SPEC-v1.0.md
- [x] VWORK-WORKFLOW-APPROVAL-DELEGATION-BUSINESS-SPEC-v1.0.md
- [x] VWORK-REPORTING-DETAILED-BUSINESS-SPEC-v1.0.md
- [x] VWORK-MEETING-DETAILED-BUSINESS-SPEC-v1.0.md
- [x] VWORK-IDENTITY-EXECUTIVE-EXCEPTION-CATALOG-v1.0.md
- [x] VWORK-DOCUMENT-INCOMING-EXCEPTION-CATALOG-v1.0.md

## Baseline counts
- 12 Business Processes
- 72 Business Requirements
- 14 Business Actors
- 96 Use Cases
- 120 Business Rules
- 124 Functional Requirements
- 94 Non-Functional Requirements

## Business Validation Gate
Trước khi code một vertical slice, Claude/Codex phải đọc tối thiểu:
1. Business Process
2. Actor Catalog
3. Authority & Responsibility Matrix
4. Use Case Catalog
5. Business Rule Catalog
6. State Machine Catalog
7. Exception & Edge Case Catalog
8. FR/NFR/SRS
9. API/Data/Screen spec liên quan
10. Test/UAT tương ứng

Không được tự suy diễn:
- quyền từ chức danh;
- trạng thái từ UI;
- hard delete với dữ liệu đã tham chiếu;
- deadline/owner nếu nguồn không có;
- AI suggestion thành quyết định chính thức.

## Traceability
Research/Capability → Business Process → BRD → Actor → Authority → Use Case → Business Rule → State/Exception → FR/NFR → SRS → Screen/API/Data → Code → Test → UAT → Release.

ID đã cấp giữ ổn định. Requirement/rule/use case loại bỏ phải Deprecated/Removed, không tái sử dụng ID.

## Trọng tâm tiếp theo
- Đóng gap 117 Web screens theo CRUD/Authority/State/Exception
- Đóng gap 34 Mobile screens theo nghiệp vụ và quyền
- Bổ sung domain-specific UAT/Acceptance Matrix
- Khóa API/OpenAPI cho nhóm Shared/Master Data
