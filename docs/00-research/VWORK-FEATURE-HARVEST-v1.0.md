# VWork – Feature Harvest v1.0

**Mục đích:** Chuyển các ý tưởng quan sát được từ benchmark thành quyết định sản phẩm có kiểm soát: Adopt / Improve / Defer / Reject.

## 1. Quy ước quyết định
- **ADOPT:** đưa vào VWork Core, có thể thay đổi thiết kế.
- **IMPROVE:** đưa vào Core nhưng nâng cấp đáng kể.
- **DEFER:** không vào Core v1, giữ cho extension/future.
- **REJECT:** không phù hợp định vị.

## 2. Harvest Matrix

| ID | Feature tham chiếu | Giá trị | Quyết định | VWork implementation |
|---|---|---|---|---|
| FH-001 | Tạo dự thảo từ ý chỉ đạo | Rất cao | IMPROVE | AI Draft Workspace, gắn Work Case và nguồn |
| FH-002 | Chọn loại văn bản | Cao | ADOPT | Document Type Catalog |
| FH-003 | Loại chi tiết/prompt phù hợp | Cao | IMPROVE | Document Type + Draft Policy + Prompt Registry |
| FH-004 | Tải nhiều file đầu vào | Rất cao | ADOPT | Unified Document Intake |
| FH-005 | Cấu hình cơ quan/người ký | Cao | IMPROVE | Organization Profile + Signatory Profile |
| FH-006 | Dự thảo trình ký | Cao | ADOPT | Draft Mode: Sign-ready |
| FH-007 | Dự thảo chi tiết | Cao | ADOPT | Draft Mode: Working |
| FH-008 | Dự thảo nâng cao | Cao | IMPROVE | Document Package Generator |
| FH-009 | Chọn template có chủ đích | Cao | ADOPT | Template Selection |
| FH-010 | Giữ văn phong/logic mẫu | Cao | IMPROVE | Style/Structure Extraction |
| FH-011 | Tạo mới dựa trên mẫu | Cao | IMPROVE | Structured Template Renderer |
| FH-012 | Editor + AI panel | Rất cao | IMPROVE | Document Workspace 60/40 configurable |
| FH-013 | AI rewrite nhanh | Cao | ADOPT | Context Actions |
| FH-014 | Undo/redo/search/compare | Cao | ADOPT | Editor foundation |
| FH-015 | Chấm chất lượng văn bản | Cao | IMPROVE | Rule + AI Quality Score |
| FH-016 | Đối chiếu tài liệu nguồn | Rất cao | IMPROVE | Evidence-linked Review |
| FH-017 | AI tra quy định | Cao | IMPROVE | Policy/Legal Knowledge Connector + citation |
| FH-018 | Văn bản đến → bóc yêu cầu | Rất cao | IMPROVE | Incoming Intelligence Pipeline |
| FH-019 | Không bịa số liệu | Rất cao | IMPROVE | FACT/INFERENCE/MISSING policy |
| FH-020 | Sinh bộ hồ sơ phản hồi | Rất cao | IMPROVE | Work Case + Output Package |
| FH-021 | Transcript có timestamp | Cao | ADOPT | Meeting Transcript |
| FH-022 | Xác định quyết định/nhiệm vụ | Rất cao | IMPROVE | Meeting Decision/Task Extraction |
| FH-023 | Biên bản có nguồn | Rất cao | IMPROVE | Citation to timestamp |
| FH-024 | AI tạo bộ chỉ tiêu báo cáo | Rất cao | ADOPT | Report Schema Suggestion |
| FH-025 | Người dùng duyệt chỉ tiêu | Rất cao | ADOPT | Schema Approval Gate |
| FH-026 | Sửa đơn vị/cách tổng hợp | Cao | ADOPT | Metric Definition Editor |
| FH-027 | Gom khó khăn/kiến nghị | Cao | IMPROVE | Thematic Clustering + source |
| FH-028 | Danh sách đơn vị phải báo cáo | Cao | IMPROVE | Reporting Obligation Matrix |
| FH-029 | Gộp XLSX/CSV/DOCX | Cao | ADOPT | Data Consolidation |
| FH-030 | Phát hiện thiếu/trùng/sai | Rất cao | IMPROVE | Data Quality Engine |
| FH-031 | PDF/scan → DOCX | Cao | ADOPT | OCR Reconstruction |
| FH-032 | Kéo thả sắp trang ảnh | Trung bình | ADOPT | Intake UX |
| FH-033 | OCR warning | Cao | IMPROVE | Confidence + review queue |
| FH-034 | Chuyển kết quả sang Review | Cao | ADOPT | Cross-module continuation |
| FH-035 | Lưu kết quả vào Kho mẫu | Cao | ADOPT | Save as Template |
| FH-036 | Mẫu tài khoản | Trung bình | IMPROVE | Personal Workspace |
| FH-037 | Mẫu hệ thống | Cao | IMPROVE | Tenant/Global Template Library |
| FH-038 | Metadata mẫu sâu | Rất cao | ADOPT | Template Metadata Schema |
| FH-039 | Hệ văn bản/loại/ngành/lĩnh vực/năm | Cao | ADOPT | Taxonomy Service |
| FH-040 | Vai trò tệp trong hồ sơ | Rất cao | IMPROVE | Document Role Model |
| FH-041 | Hồ sơ pháp lý dynamic form | Cao | DEFER | VWork Legal extension |
| FH-042 | Đỏ/vàng/xanh | Cao | DEFER | Generic Case Rule Engine, future |
| FH-043 | Person-role trong tố tụng | Cao về kiến trúc | DEFER | Generic Party/Role model |
| FH-044 | Batch Word generation | Cao | IMPROVE | Package Generator core |
| FH-045 | Quét CCCD | Trung bình | DEFER | Identity capture extension |
| FH-046 | Lịch sử xử lý | Cao | IMPROVE | Immutable audit + activity |
| FH-047 | Lịch sử 10 ngày/file 5 ngày | Thấp cho gov | REJECT | Retention policy configurable |
| FH-048 | Tính điểm theo tác vụ | Trung bình | DEFER | AI usage metering nội bộ |
| FH-049 | Gói điểm cá nhân | Thấp | REJECT | VWork B2G/B2B subscription |
| FH-050 | Gói đơn vị | Cao | IMPROVE | SaaS tenant annual plan |
| FH-051 | CTV/hoa hồng | Không core | DEFER | Commercial CRM ngoài Core |
| FH-052 | Ví dụ hướng dẫn theo tình huống | Cao | ADOPT | Guided onboarding |
| FH-053 | Empty state hướng dẫn | Cao | ADOPT | UX standard |
| FH-054 | Người dùng chịu trách nhiệm phê duyệt | Rất cao | ADOPT | Human Approval Policy |
| FH-055 | Tải cả bộ Word | Cao | ADOPT | Package Export |
| FH-056 | Tải CSV/Excel | Cao | ADOPT | Structured Export |

## 3. Ý tưởng VWork bổ sung – không lấy từ benchmark

### FH-VW-001 Work Case
Mỗi yêu cầu/văn bản/họp/báo cáo có thể nằm trong một **Hồ sơ công việc** thống nhất.

### FH-VW-002 Task Intelligence
AI chuyển văn bản, cuộc họp hoặc chỉ đạo thành Task có owner, deadline, required output, priority, source và evidence.

### FH-VW-003 Workflow Engine
Luồng xử lý cấu hình được theo step, actor/role, condition, SLA, escalation, notification và approval action.

### FH-VW-004 Executive Inbox
Một hàng đợi duy nhất cho lãnh đạo:
- cần duyệt,
- cần cho ý kiến,
- văn bản khẩn,
- nhiệm vụ quá hạn,
- cuộc họp sắp tới.

### FH-VW-005 Executive Brief
AI brief theo ngày/tuần dựa trên dữ liệu có cấu trúc và nguồn.

### FH-VW-006 Provenance
Mọi claim quan trọng liên kết về Document → page/section/table/cell hoặc Meeting → timestamp.

### FH-VW-007 Knowledge Graph
Quan hệ Document ↔ Work Case ↔ Task ↔ Organization ↔ Person ↔ Meeting ↔ Report ↔ Decision.

### FH-VW-008 Compliance Engine
Rule engine cho thể thức, trường bắt buộc, thẩm quyền, phần bắt buộc, nơi nhận, ký.

### FH-VW-009 Multi-tenant Organization
Tenant → Organization → Unit → Position → User → Role → Data Scope.

### FH-VW-010 Mobile Leadership App
Mobile là client chính thức, không phải responsive clone.

### FH-VW-011 API-first Integration
REST/OpenAPI + event/webhook + adapter cho ký số, SSO, DMS và hệ thống bên ngoài.

### FH-VW-012 Long-running Job Platform
OCR/STT/LLM/report jobs có queue, checkpoint, retry, idempotency, progress và recovery.

### FH-VW-013 AI Governance
Prompt registry, model/provider registry, evaluation, guardrails, usage metering, audit.

### FH-VW-014 Report Obligation Management
Ai phải báo cáo gì, kỳ nào, deadline nào, đã nộp/chưa nộp, phiên bản nào.

### FH-VW-015 Data Reconciliation
Không chỉ gộp bảng; phải reconcile giữa tổng–chi tiết, kỳ trước–kỳ này và nguồn–đầu ra.

## 4. Feature Priority cho Core v1

### P0 – Bắt buộc
- Unified Document Intake.
- Document Repository.
- AI Draft.
- AI Review.
- Incoming Document Intelligence.
- Work Case.
- Task Intelligence.
- Workflow/Approval cơ bản.
- Templates.
- Knowledge/RAG cơ bản.
- Report Consolidation.
- OCR.
- Web.
- Mobile leadership.
- Organization/RBAC/Data Scope.
- Audit.
- AI Gateway.

### P1 – Trong v1 sau P0
- Meeting Intelligence.
- Structured Report Schema Approval.
- Data Quality/Reconciliation.
- Executive Brief.
- Advanced provenance.
- Compliance rules.
- Package generation.
- Notification/escalation.

### P2 – Extension
- Legal case.
- Criminal procedure.
- CCCD scanning.
- Commercial referral.
- Specialized vertical packs.

## 5. Quy tắc chống scope creep

Một feature chỉ được vào VWork Core nếu đạt ít nhất 2/3 điều kiện:
1. Phục vụ phần lớn xã/phường.
2. Tham gia trực tiếp chuỗi Document → Work → Report → Knowledge.
3. Là nền tảng dùng chung cho nhiều module khác.

Nếu chỉ phục vụ một ngành/nghiệp vụ đặc thù, đưa vào Extension Pack.

## 6. Feature Harvest Outcome
VWork sẽ **thu hết ý tưởng tốt ở cấp pattern**, nhưng không xây thành bộ công cụ rời rạc. Mọi feature được hợp nhất vào 3 trục:
- **Document**
- **Work**
- **Knowledge**

AI là lớp xuyên suốt, Workflow là xương sống, Organization/Data Scope là nền kiểm soát.
