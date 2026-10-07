# VWork – Product Boundary v1.0

## 1. Mục đích

Khóa phạm vi sản phẩm VWork để:
- tránh scope creep;
- không biến VWork thành ERP;
- phân biệt Core với Extension;
- có baseline rõ cho BRD/SRS/Architecture;
- giữ một core codebase có thể bán hoặc cho thuê cho nhiều xã/phường.

## 2. Product Statement

**VWork là nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh cho chính quyền cơ sở, lấy Document → Work → Knowledge làm chuỗi giá trị lõi và AI làm lớp hỗ trợ xuyên suốt.**

VWork không nhằm thay thế mọi hệ thống nghiệp vụ chuyên ngành.

## 3. Core Boundary v1

### PB-C01 Identity & Organization
- Tenant.
- Cơ cấu đơn vị.
- User.
- Role.
- Data scope.
- Delegation.
- Signatory/document profile.

### PB-C02 Document
- Upload/import.
- Repository.
- Version.
- Viewer.
- Metadata.
- Attachment.
- Export package.

### PB-C03 Document Intelligence
- Parsing.
- OCR.
- Classification.
- Extraction.
- Provenance.

### PB-C04 AI Draft & Review
- Soạn dự thảo.
- Template-aware generation.
- Editor.
- Review.
- Rewrite.
- Quality/compliance checks cơ bản.

### PB-C05 Incoming Document
- Đọc văn bản đến.
- Bóc yêu cầu/nhiệm vụ.
- Đề xuất xử lý.
- Tạo bộ hồ sơ.
- Chuyển thành Work Case.

### PB-C06 Work Case & Task
- Hồ sơ công việc.
- Task.
- Owner.
- Deadline.
- Status.
- Evidence.
- Collaboration.

### PB-C07 Workflow & Approval
- Workflow cơ bản.
- Trình/duyệt/trả lại.
- SLA.
- Notification.
- Escalation.

### PB-C08 Meeting
- Meeting setup.
- Audio/STT.
- Transcript.
- Decision/task extraction.
- Minutes.
- Follow-up.

### PB-C09 Reporting
- Report collection.
- Metric schema.
- Human approval gate.
- Data extraction.
- Data quality.
- Consolidation.
- Draft report.

### PB-C10 Templates & Knowledge
- Template library.
- Metadata.
- Structured template.
- Knowledge base.
- RAG.
- Citation.

### PB-C11 Executive
- Inbox.
- Brief.
- Ask VWork theo context.
- Warning/signal cơ bản.

### PB-C12 Governance
- Audit.
- AI governance.
- API.
- Integration framework.
- Monitoring.
- Backup/DR hooks.
- Traceability evidence.

## 4. Core v1 – bắt buộc trên Web

- Dashboard.
- Inbox.
- Document list/detail.
- Incoming document processing.
- AI Draft Workspace.
- AI Review Workspace.
- Work Case list/detail.
- Task list/detail.
- Approval queue/detail.
- Meeting list/detail/transcript.
- Reporting workspace.
- Template library.
- Knowledge library/search.
- Notifications.
- User/org admin.
- Role/data scope admin.
- AI/provider/config admin phù hợp quyền.
- Audit viewer phù hợp quyền.

## 5. Core v1 – bắt buộc trên Mobile

- Login/session.
- Home.
- Executive Inbox.
- Notifications.
- Document viewer + AI summary.
- Work Case summary.
- Task list/detail/update.
- Approval/return/comment.
- Meeting view/record-upload extension.
- Ask VWork theo context.
- Profile/delegation cơ bản.

Mobile không có nghĩa phải có toàn bộ màn quản trị Web.

## 6. Extension Packs – không thuộc Core v1

### EXT-01 VWork Legal
- Hồ sơ dân sự.
- Hợp đồng.
- Chứng thực.
- Rule pack pháp lý.

### EXT-02 VWork Justice
- Tố tụng.
- Person-role model chuyên ngành.
- Procedural workflow.
- Batch form.

### EXT-03 VWork Inspection
- Thanh tra/kiểm tra.
- Kế hoạch.
- Biên bản.
- Kết luận.
- Theo dõi thực hiện.

### EXT-04 VWork Sector Packs
- Đất đai.
- PCCC.
- Giáo dục.
- Y tế.
- Văn hóa.
- An sinh.
- Các domain pack khác.

Extension dùng lại Core capability; không fork core codebase.

## 7. Future – có thể nghiên cứu sau

- Ký số tích hợp sâu theo nhà cung cấp cụ thể.
- Đồng bộ văn bản liên thông theo hệ thống được khách hàng chỉ định.
- Voice assistant thời gian thực.
- Offline-first mobile.
- Advanced graph reasoning.
- Automated policy monitoring.
- Robotic process automation đa hệ thống.
- BI/analytics chuyên sâu.
- Digital archive certification.

## 8. Out of Scope

VWork Core không xây lại:
- Kế toán.
- Quản lý ngân sách.
- HRM/payroll.
- CRM.
- ERP.
- Quản lý tài sản đầy đủ.
- Một cửa điện tử hoàn chỉnh.
- GIS nền tảng.
- Quản lý hộ tịch chuyên ngành.
- Quản lý đất đai chuyên ngành.
- Hệ thống ký số/CA riêng.
- Email server.
- Chat enterprise hoàn chỉnh.
- DMS cấp quốc gia.

Khi cần, VWork tích hợp qua API/adapter.

## 9. Commercial Boundary

### SaaS
- Multi-tenant.
- Annual subscription.
- User/storage/AI allowance.
- Central update.
- Tenant isolation.

### Private
- Instance riêng.
- Cấu hình riêng.
- Có thể database/storage riêng.

### On-Premise
- Triển khai hạ tầng khách hàng.
- License + maintenance/support.
- AI provider tùy mô hình kết nối và yêu cầu dữ liệu.

Một core codebase, khác deployment profile và entitlement.

## 10. Data Boundary

### VWork owns
- Metadata tài liệu trong VWork.
- Work Case.
- Task.
- Workflow runtime.
- Meeting transcript/decision.
- Report schema/result.
- Template.
- Knowledge index.
- AI run metadata.
- Audit log.

### External systems may own
- Hồ sơ chuyên ngành nguồn.
- Dữ liệu một cửa.
- Dữ liệu đất đai.
- Dữ liệu dân cư.
- Chữ ký số.
- Hồ sơ lưu trữ chính thức ở hệ thống khác.

VWork phải có integration contract thay vì sao chép không kiểm soát.

## 11. AI Boundary

AI được phép:
- tóm tắt;
- trích xuất;
- phân loại;
- đề xuất;
- dự thảo;
- rà soát;
- gom nhóm;
- phát hiện bất thường;
- truy vấn tri thức.

AI không tự:
- ban hành văn bản;
- ký;
- thay người có thẩm quyền phê duyệt;
- bịa dữ kiện;
- tự xác lập sự thật khi không có nguồn;
- vượt data scope/tenant scope;
- thực hiện thay đổi irreversible nếu chưa có quyền/approval.

## 12. Product Guardrails

### G-01 Human-in-the-loop
Mọi đầu ra hành chính quan trọng phải có bước người dùng kiểm tra trước khi sử dụng chính thức.

### G-02 Source-grounded
Claim quan trọng phải ưu tiên có nguồn/citation.

### G-03 Tenant isolation
Mọi dữ liệu và AI retrieval bị giới hạn theo tenant/data scope.

### G-04 Configurable, not hard-coded
Workflow, taxonomy, template và rule cần cấu hình được trong phạm vi hợp lý.

### G-05 API-first
Tích hợp không được làm phụ thuộc cứng vào một hệ thống bên ngoài.

### G-06 One Core
Không tạo codebase riêng cho từng xã/phường.

### G-07 Evidence-driven development
Mọi feature phải trace Requirement → Design → Code → Test → UAT → Release.

## 13. Decision Rules khi có yêu cầu mới

### Đưa vào Core khi:
- dùng chung cho phần lớn xã/phường;
- nằm trong Document/Work/Knowledge;
- có tính nền tảng dùng lại;
- không phụ thuộc sâu một ngành.

### Đưa vào Extension khi:
- nghiệp vụ đặc thù ngành;
- biểu mẫu/quy tắc chuyên biệt;
- chỉ một nhóm khách hàng cần.

### Tích hợp thay vì xây khi:
- thị trường đã có hệ thống authoritative;
- dữ liệu gốc nằm ở hệ thống khác;
- yêu cầu thuộc chữ ký số, một cửa, ERP hoặc hệ thống chuyên ngành.

### Reject khi:
- làm VWork lệch khỏi định vị;
- không có business case;
- tạo fork tùy biến khó bảo trì;
- rủi ro pháp lý/kỹ thuật vượt giá trị.

## 14. Baseline để bước sang BRD

BRD chỉ được mô tả các capability nằm trong **Core Boundary v1** trừ khi Change Request được phê duyệt.

Các module Legal/Tố tụng quan sát từ benchmark chỉ được dùng để học pattern:
- case data;
- dynamic form;
- rule engine;
- party/role;
- package generation.

Không đưa domain chuyên ngành đó vào VWork Core v1.

## 15. Product Boundary Summary

**VWork Core:** Document → Work → Workflow → Report → Knowledge → Executive Intelligence.

Các lớp Identity/Organization, Security, Audit, AI Governance và Integration phủ ngang toàn hệ thống.

Các extension như Legal, Justice, Inspection hoặc Sector Pack phải dùng lại Core capability và không tạo fork riêng.

**Kết luận:** VWork Core phải mạnh ở hạ tầng làm việc và AI dùng chung. Nghiệp vụ chuyên ngành nằm ngoài Core và kết nối qua extension/integration.
