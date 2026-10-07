# VWork – Product Requirement Refactor – Wave R1 + R2 Closure v1.0

## 1. Scope Completed
Wave R1 + R2 đã hoàn thành:
1. Product Positioning v2.0
2. Product Boundary v2.0
3. Native / Integrated / Optional Matrix v1.0
4. Core Tools & Skill Catalog v1.0
5. BRD v2.0

## 2. Strategic Decisions Locked

### D-01
VWork được định vị là **Trợ lý AI cho công việc hằng ngày của cán bộ, công chức**.

### D-02
VWork không mặc định thay eOffice, TTHC, provincial reporting, calendar, official task system hoặc specialist System of Record.

### D-03
User-facing product là **task/tool-centric**, không phải module/domain-centric.

### D-04
151 screens hiện tại được giữ như **Platform Capability Model**, không phải menu mặc định.

### D-05
Capability bắt buộc phân loại NATIVE / INTEGRATED / OPTIONAL.

### D-06
User không bị khóa theo một gói chuyên ngành.
Model chuẩn:
User → Role → Permission → Skill → Tool → Data Scope.

### D-07
Một user được gán nhiều Skill; Skill không tự cấp permission/data scope.

### D-08
Core Tools là đơn vị trải nghiệm chính.

### D-09
Unified Work Inbox là lớp hợp nhất công việc từ nhiều nguồn, không nhất thiết là official Task System.

### D-10
External authoritative objects phải có System-of-Record metadata, connector/deep-link và conflict/stale semantics.

## 3. Technical Baseline Preserved

Wave R1/R2 không tự động thay:
- 151 Screen IDs;
- 372 API IDs/OpenAPI operations;
- existing state machines;
- permission/audit semantics;
- data model;
- 176 UAT scenarios.

Mọi thay đổi technical phải được xác định ở Wave R3/R4 Delta Audit.

## 4. Engineering Restriction

Cho tới khi R3/R4 hoàn tất:
- không xây ordinary-user navigation theo 12 domain kỹ thuật;
- không expose tất cả management screens;
- không mặc định VWork owns official document/task/reporting records;
- backend foundation có thể tiếp tục nếu không phụ thuộc product exposure/SoR ownership đang refactor;
- UI/UX mới phải dựa Product v2 hoặc có approval riêng.

## 5. Next Wave R3

Bắt buộc tạo:
- Functional Requirements v2 / Delta;
- SRS v2 / Delta;
- System-of-Record Registry;
- Integration Profile Specification;
- Tool/Skill/Entitlement Model;
- Unified Work Inbox Business & System Spec;
- External Action / Deep-Link Contract;
- Product v2 Business Rule additions;
- v2 Traceability Delta Matrix.

## 6. Next Wave R4

Bắt buộc tạo:
- 151-Screen Exposure Matrix;
- User-facing IA v2;
- Service Launcher/Home spec;
- Golden Screen Catalog;
- Web/Mobile navigation v2;
- visual design reference pack;
- Claude/Codex UI handoff delta.

## 7. Exit Status

R1 – Product Strategy: PASS  
R2 – Business Requirements v2: PASS  
Technical Delta: NOT STARTED  
UX Reclassification: NOT STARTED  
Golden Screens: NOT STARTED
