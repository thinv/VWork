# VWork – Actor Catalog v1.0

## 1. Mục đích
Xác định đầy đủ các vai trò tham gia VWork Core v1, phạm vi trách nhiệm, quyền điển hình và quan hệ với các quy trình nghiệp vụ.

## 2. Quy ước
- Actor là vai trò nghiệp vụ, không nhất thiết trùng tài khoản cá nhân.
- Một người có thể mang nhiều actor tùy tenant và data scope.
- Quyền thực tế do RBAC + data scope + object permission quyết định.
- Actor không mặc định có quyền trên toàn tenant nếu không được cấu hình.

---

## ACT-01 – Lãnh đạo UBND

### Mô tả
Chủ tịch, Phó Chủ tịch hoặc lãnh đạo được phân quyền xử lý/trình duyệt.

### Mục tiêu
- nắm việc quan trọng;
- cho ý kiến;
- giao việc;
- duyệt/trả lại;
- theo dõi tiến độ;
- nhận AI Brief.

### Hành động điển hình
- xem Executive Inbox;
- xem văn bản/hồ sơ;
- yêu cầu AI tóm tắt;
- giao Task;
- approve/return/reject;
- theo dõi overdue;
- Ask VWork;
- xem báo cáo tổng hợp.

### Process liên quan
BP-03, BP-06, BP-07, BP-08, BP-09, BP-11.

---

## ACT-02 – Văn thư

### Mô tả
Người tiếp nhận, đăng ký, phân loại và quản lý tài liệu đầu vào/đầu ra trong phạm vi được giao.

### Hành động
- upload/import;
- kiểm tra metadata;
- xác nhận OCR;
- đăng ký văn bản đến;
- chuyển xử lý;
- tìm kiếm document;
- quản lý trạng thái tài liệu;
- xuất/phát hành theo quy trình được giao.

### Process
BP-01, BP-02, BP-03, BP-07.

---

## ACT-03 – Cán bộ Văn phòng/Tham mưu

### Mô tả
Vai trò chính trong xử lý văn bản, tham mưu, tổng hợp, soạn thảo và kiểm tra hồ sơ.

### Hành động
- đọc hiểu văn bản;
- tạo Work Case;
- đề xuất Task;
- tạo draft;
- review;
- chuẩn bị hồ sơ trình;
- tổng hợp báo cáo;
- quản lý meeting minutes;
- cập nhật knowledge/template.

### Process
BP-02 đến BP-10.

---

## ACT-04 – Công chức chuyên môn

### Mô tả
Người xử lý nhiệm vụ theo lĩnh vực chuyên môn.

### Hành động
- nhận Task;
- xem nguồn;
- cập nhật tiến độ;
- bổ sung evidence;
- tạo nội dung chuyên môn;
- soạn dự thảo;
- gửi kết quả;
- tham gia báo cáo.

### Process
BP-03, BP-04, BP-05, BP-06, BP-09, BP-10.

---

## ACT-05 – Người duyệt/Người ký

### Mô tả
Vai trò có thẩm quyền phê duyệt một loại hồ sơ/văn bản cụ thể.

### Hành động
- xem phiên bản trình;
- kiểm tra AI brief và evidence;
- approve;
- return;
- reject;
- request clarification;
- ghi ý kiến;
- delegate nếu có quyền.

### Process
BP-07.

> ACT-05 có thể trùng ACT-01 nhưng được tách để mô hình hóa thẩm quyền theo workflow.

---

## ACT-06 – Thư ký cuộc họp

### Mô tả
Người chuẩn bị, rà transcript, biên bản và kết luận cuộc họp.

### Hành động
- tạo meeting;
- nhập giấy mời/agenda;
- upload audio;
- rà transcript;
- xác nhận speaker;
- rà decision/task;
- tạo biên bản;
- gửi duyệt.

### Process
BP-08.

---

## ACT-07 – Người chủ trì cuộc họp

### Mô tả
Người xác nhận kết luận, quyết định và nhiệm vụ sau cuộc họp.

### Hành động
- xem transcript/summary;
- xác nhận hoặc sửa decision;
- xác nhận Task/owner/deadline;
- duyệt biên bản.

### Process
BP-08, BP-07.

---

## ACT-08 – Cán bộ tổng hợp báo cáo

### Mô tả
Người quản lý kỳ báo cáo và chịu trách nhiệm tổng hợp.

### Hành động
- tạo Reporting Cycle;
- thiết lập đơn vị phải nộp;
- tải báo cáo nguồn;
- duyệt metric schema;
- rà Data Quality;
- reconcile;
- tạo draft report;
- xuất Word/XLSX.

### Process
BP-09.

---

## ACT-09 – Đơn vị/người gửi báo cáo

### Mô tả
Actor nghiệp vụ cung cấp báo cáo nguồn vào một Reporting Cycle.

### Hành động
- nộp báo cáo;
- thay thế version;
- phản hồi yêu cầu bổ sung;
- xem trạng thái nộp trong phạm vi được cấp.

### Process
BP-09.

---

## ACT-10 – Quản trị đơn vị (Tenant Admin)

### Mô tả
Quản trị VWork của một xã/phường hoặc đơn vị khách hàng.

### Hành động
- quản lý user;
- cơ cấu tổ chức;
- role/data scope;
- document profile;
- signatory;
- workflow config trong phạm vi;
- taxonomy;
- template/knowledge scope;
- retention/config;
- xem audit theo quyền.

### Process
BP-12.

### Giới hạn
Không được truy cập tenant khác.

---

## ACT-11 – Quản trị nền tảng (Platform Admin)

### Mô tả
Vai trò vận hành nền tảng SaaS/Private.

### Hành động
- provisioning tenant;
- entitlement/quota;
- provider/config hạ tầng;
- monitoring;
- incident handling;
- backup/restore;
- platform audit.

### Giới hạn
Quyền truy cập dữ liệu tenant phải tối thiểu, kiểm soát và audit.

### Process
BP-12.

---

## ACT-12 – Quản trị AI

### Mô tả
Vai trò quản lý AI Gateway, provider, model, prompt và evaluation.

### Hành động
- cấu hình provider;
- model routing;
- prompt version;
- guardrails;
- evaluation;
- usage monitoring;
- failover policy.

### Process
BP-12.

---

## ACT-13 – Quản trị kho tri thức

### Mô tả
Người chịu trách nhiệm publish/unpublish nguồn tri thức, template và taxonomy.

### Hành động
- ingest;
- phân loại;
- kiểm tra quyền;
- publish;
- version;
- archive;
- re-index.

### Process
BP-10.

---

## ACT-14 – Kiểm soát/QA/Audit

### Mô tả
Vai trò kiểm tra bằng chứng, traceability, audit và chất lượng quy trình.

### Hành động
- xem audit;
- kiểm tra requirement evidence;
- xem release/test evidence;
- kiểm tra AI run theo quyền;
- lập finding.

### Process
BP-05, BP-12.

---

# 3. System Actors

## SYS-01 – VWork Core
Điều phối nghiệp vụ, dữ liệu, workflow, notification và audit.

## SYS-02 – AI Orchestrator
Điều phối LLM/OCR/STT/RAG/evaluation/guardrails.

## SYS-03 – OCR Engine
Nhận dạng scan/ảnh.

## SYS-04 – STT Engine
Nhận dạng tiếng nói.

## SYS-05 – Notification Service
Gửi in-app/push và adapter thông báo khác.

## SYS-06 – Search/RAG Engine
Index, search, vector retrieval, rerank.

## SYS-07 – Workflow Engine
Quản lý state transition, SLA, escalation.

## SYS-08 – Object Storage
Lưu file nguồn và output.

## SYS-09 – Audit Service
Ghi nhật ký hành động và sự kiện.

---

# 4. External Actors

## EXT-ACT-01 – Hệ thống SSO/Identity bên ngoài
Xác thực nếu khách hàng tích hợp.

## EXT-ACT-02 – Hệ thống ký số
Nhận tài liệu cần ký/trả trạng thái ký khi được tích hợp.

## EXT-ACT-03 – Hệ thống quản lý văn bản bên ngoài
Trao đổi metadata/tài liệu khi có integration contract.

## EXT-ACT-04 – Hệ thống chuyên ngành
Một cửa, đất đai, hộ tịch, GIS hoặc hệ thống authoritative khác.

## EXT-ACT-05 – AI Provider
Nhà cung cấp model/API bên ngoài thông qua AI Gateway.

---

# 5. Actor Hierarchy

Người dùng nội bộ:
- ACT-01 Lãnh đạo
- ACT-02 Văn thư
- ACT-03 Văn phòng/Tham mưu
- ACT-04 Chuyên môn
- ACT-05 Người duyệt/ký
- ACT-06 Thư ký họp
- ACT-07 Chủ trì
- ACT-08 Tổng hợp báo cáo
- ACT-09 Người gửi báo cáo

Quản trị:
- ACT-10 Tenant Admin
- ACT-11 Platform Admin
- ACT-12 AI Admin
- ACT-13 Knowledge Admin
- ACT-14 QA/Audit

Hệ thống:
- SYS-01..09

Bên ngoài:
- EXT-ACT-01..05

---

# 6. Actor – Capability Matrix

| Actor | Doc | AI Draft/Review | Work | Workflow | Meeting | Report | Knowledge | Admin |
|---|---|---|---|---|---|---|---|---|
| ACT-01 | R | R | A/R | A | R | R | R | - |
| ACT-02 | C/R | - | C | C | - | - | R | - |
| ACT-03 | C/R | C/R | C/R | C | C/R | C/R | C/R | - |
| ACT-04 | R | C/R | C/R | C | C | C | R | - |
| ACT-05 | R | R | R | A | R | R | R | - |
| ACT-06 | R | C | C | C | C/R | - | R | - |
| ACT-07 | R | R | A | A | A | R | R | - |
| ACT-08 | R | C/R | C | C | - | C/R | R | - |
| ACT-09 | C | - | - | - | - | C | - | - |
| ACT-10 | scoped | - | - | config | - | config | config | C/R |
| ACT-11 | minimal | - | - | platform | - | - | - | C/R |
| ACT-12 | - | config | - | - | - | - | config | C/R |
| ACT-13 | R | - | - | - | - | - | C/R | C |
| ACT-14 | R | R | R | R | R | R | R | audit |

Ký hiệu: C=create/change, R=read, A=approve/authorize. Quyền thực tế do RBAC/data scope quyết định.

---

# 7. Quy tắc actor

1. Một người có thể có nhiều actor.
2. ACT-05 là thẩm quyền workflow, không tự suy ra từ chức danh nếu chưa cấu hình.
3. ACT-11 không mặc định có quyền đọc nội dung tenant.
4. ACT-12 không được vượt data scope chỉ vì quản trị AI.
5. ACT-14 ưu tiên read-only.
6. Delegation phải có phạm vi và thời hạn.
7. Mọi actor action quan trọng phải audit.
