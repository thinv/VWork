# VWork – Software Requirements Specification (SRS) v1.0

**Sản phẩm:** VWork – Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh cho chính quyền cơ sở  
**Phạm vi:** Core v1  
**Trạng thái:** Baseline đặc tả phần mềm  
**Nguồn:** Research, Product Boundary, Business Process, BRD, Actor Catalog, Use Case Catalog, Business Rule Catalog, Functional Requirements, Non-Functional Requirements.

---

# 1. Mục đích

Tài liệu này là baseline yêu cầu phần mềm chính thức của VWork Core v1, dùng để:
- thiết kế kiến trúc;
- thiết kế dữ liệu;
- thiết kế API;
- thiết kế Web/Mobile;
- lập kế hoạch kiểm thử;
- triển khai source code;
- quản lý traceability;
- phục vụ nghiệm thu và quản lý thay đổi.

SRS không thay thế BRD hoặc Business Rule Catalog mà hợp nhất các yêu cầu cần thiết ở mức có thể triển khai kỹ thuật.

---

# 2. Phạm vi sản phẩm

VWork Core v1 bao gồm 12 domain:

1. Identity & Organization
2. Document Management
3. Document Intelligence
4. AI Draft & Review
5. Incoming Document Processing
6. Work Case & Task
7. Workflow & Approval
8. Meeting Intelligence
9. Reporting & Data Consolidation
10. Templates & Knowledge
11. AI Assistant & Executive Intelligence
12. Governance, Audit & Integration

Các nghiệp vụ Legal, tố tụng, đất đai, hộ tịch, một cửa, kế toán, ERP và hệ thống chuyên ngành không thuộc Core v1; tích hợp/extension nếu cần.

---

# 3. Kiến trúc chức năng mục tiêu

VWork phải tuân theo chuỗi nghiệp vụ:

Document → Understand → Advise → Draft/Review → Work Case → Task/Workflow → Approval → Track → Report → Knowledge → Executive Intelligence.

Các lớp ngang:
- Identity & Organization
- Security & Authorization
- Audit
- AI Governance
- Integration
- Observability

---

# 4. Nhóm người dùng

## 4.1 Business actors
- ACT-01 Lãnh đạo UBND
- ACT-02 Văn thư
- ACT-03 Cán bộ Văn phòng/Tham mưu
- ACT-04 Công chức chuyên môn
- ACT-05 Người duyệt/Người ký
- ACT-06 Thư ký cuộc họp
- ACT-07 Người chủ trì cuộc họp
- ACT-08 Cán bộ tổng hợp báo cáo
- ACT-09 Đơn vị/người gửi báo cáo
- ACT-10 Tenant Admin
- ACT-11 Platform Admin
- ACT-12 AI Admin
- ACT-13 Knowledge Admin
- ACT-14 QA/Audit

## 4.2 External/system actors
SSO, hệ thống ký số, hệ thống quản lý văn bản, hệ thống chuyên ngành, AI provider và các service nội bộ VWork.

---

# 5. Yêu cầu chức năng hệ thống

## 5.1 Identity & Organization

Hệ thống phải:
- hỗ trợ multi-tenant;
- tạo tenant và entitlement;
- quản lý cây tổ chức;
- quản lý user lifecycle;
- hỗ trợ multi-role;
- áp RBAC + data scope + object permission;
- hỗ trợ delegation có thời hạn;
- quản lý document/signatory profile;
- thu hồi session khi user bị disable;
- bảo đảm platform admin không mặc định đọc dữ liệu tenant.

Yêu cầu liên quan: FR-001..009, BRULE-001..010.

### Entity dự kiến
Tenant, OrganizationUnit, Position, User, Membership, Role, Permission, RoleAssignment, DataScope, Delegation, DocumentProfile, SignatoryProfile.

---

## 5.2 Document Management

Hệ thống phải:
- upload đơn/batch;
- hỗ trợ Word, PDF, image, XLSX, CSV, audio;
- validate file/malware;
- phát hiện duplicate;
- lưu source artifact;
- tạo Document ID bất biến;
- quản lý version;
- xem/preview;
- sửa metadata trong phạm vi được phép;
- compare version;
- export đơn/package;
- áp retention.

Yêu cầu: FR-010..020.

### State dự kiến
UPLOADING → PROCESSING → READY → REVIEW_REQUIRED → ARCHIVED/QUARANTINED/FAILED.

### Entity
Document, DocumentVersion, FileAsset, DocumentMetadata, DocumentRelation, ExportPackage.

---

## 5.3 Document Intelligence

Hệ thống phải:
- OCR scan/ảnh;
- parse text/layout/table;
- phân loại tài liệu;
- trích metadata;
- trích task/deadline/required output;
- trích số liệu;
- gắn confidence;
- gắn provenance;
- hỗ trợ human verification;
- phân biệt FACT / INFERENCE / MISSING.

Yêu cầu: FR-021..028.

### Entity
ExtractionRun, ExtractedField, Provenance, Classification, OCRPage, VerificationRecord.

---

## 5.4 AI Draft & Review

Hệ thống phải:
- sinh draft từ chỉ đạo/yêu cầu;
- chọn loại văn bản;
- hỗ trợ 3 Draft Mode;
- sinh từ Work Case;
- dùng template;
- tạo package;
- lưu context snapshot;
- chạy review;
- tạo finding severity;
- quality score;
- accept/reject suggestion;
- rewrite selection/section;
- blocking gate;
- lưu AI run metadata.

Yêu cầu: FR-029..041.

### AI policy
- không tự biến MISSING thành FACT;
- không dùng dữ kiện cũ trong template như dữ liệu hiện tại;
- phải lưu model/provider/prompt version;
- official output phải qua human review.

### Entity
Draft, DraftVersion, DraftContext, AIJob, AIOutput, ReviewRun, ReviewFinding, RewriteOperation, DocumentPackage.

---

## 5.5 Incoming Document Processing

Hệ thống phải:
- đăng ký văn bản đến;
- tóm tắt;
- bóc yêu cầu;
- đề xuất xử lý;
- đề xuất người/đơn vị;
- tạo Work Case;
- tạo Task;
- tạo bộ hồ sơ phản hồi.

Yêu cầu: FR-042..049.

### Entity
IncomingRecord, IncomingRequirement, HandlingSuggestion, AssignmentSuggestion.

---

## 5.6 Work Case & Task

Hệ thống phải:
- tạo Work Case;
- quản lý timeline;
- tạo/giao/nhận Task;
- theo dõi progress;
- quản lý blocker;
- nộp output/evidence;
- complete Task;
- reminder/escalation;
- comment/mention/attachment;
- handover;
- ngăn đóng case nếu còn blocking task.

Yêu cầu: FR-050..060.

### Task state
DRAFT → ASSIGNED → ACCEPTED → IN_PROGRESS → WAITING → REVIEW → COMPLETED / CANCELLED.

### Entity
WorkCase, WorkCaseRelation, Task, TaskAssignment, TaskEvidence, TaskComment, TaskStatusHistory, Reminder, Escalation.

---

## 5.7 Workflow & Approval

Hệ thống phải:
- định nghĩa workflow versioned;
- cấu hình step, role, condition, SLA, action;
- start workflow;
- quản lý approval queue;
- hiển thị submitted version;
- approve/return/reject/request clarification/delegate;
- audit toàn bộ action;
- xử lý stale version;
- trigger reminder/escalation.

Yêu cầu: FR-061..070.

### Entity
WorkflowDefinition, WorkflowVersion, WorkflowStep, WorkflowInstance, WorkflowTransition, ApprovalItem, ApprovalAction, SLAClock.

---

## 5.8 Meeting Intelligence

Hệ thống phải:
- tạo meeting;
- đọc invitation/agenda;
- upload/record audio;
- STT async;
- transcript có timestamp/speaker;
- chỉnh transcript;
- trích decision/task;
- human confirm;
- sinh minutes;
- convert decision thành Task.

Yêu cầu: FR-071..079.

### Entity
Meeting, Participant, AgendaItem, AudioAsset, Transcript, TranscriptSegment, MeetingDecision, MeetingTaskCandidate, Minutes.

---

## 5.9 Reporting & Data Consolidation

Hệ thống phải:
- tạo Reporting Cycle;
- danh sách đơn vị phải nộp;
- nhận submission nhiều format;
- AI đề xuất Metric Schema;
- human approve schema;
- version schema;
- extract data;
- data quality;
- reconciliation;
- deterministic aggregation;
- provenance;
- sinh narrative;
- export.

Yêu cầu: FR-080..091.

### State
DRAFT → COLLECTING → SCHEMA_REVIEW → EXTRACTION → QUALITY_REVIEW → AGGREGATED → DRAFT_REPORT → APPROVED → CLOSED.

### Entity
ReportingCycle, ReportingObligation, ReportSubmission, MetricSchema, MetricDefinition, ExtractedMetricValue, DataQualityFinding, ReconciliationRun, AggregationResult, ReportDraft.

---

## 5.10 Templates & Knowledge

Hệ thống phải:
- tạo template từ file/draft;
- metadata/taxonomy;
- publish/version/archive;
- ingest knowledge;
- publish/unpublish;
- full-text/semantic search;
- RAG;
- citation;
- re-index khi source đổi;
- enforce scope trước retrieval.

Yêu cầu: FR-092..100.

### Entity
Template, TemplateVersion, TemplateField, Taxonomy, KnowledgeSource, KnowledgeVersion, Chunk, IndexRecord, Citation.

---

## 5.11 Executive Intelligence

Hệ thống phải:
- unified Executive Inbox;
- filter urgent/overdue/due soon/approval/new incoming;
- daily/weekly brief;
- Ask VWork theo context;
- organization status Q&A;
- proactive signal;
- action từ Brief/Inbox sau backend authorization.

Yêu cầu: FR-101..108.

### Entity
InboxItem/View, ExecutiveBrief, BriefItem, Signal, AssistantConversation, AssistantMessage.

---

## 5.12 Governance, AI & Integration

Hệ thống phải:
- audit query;
- provider/model registry;
- prompt registry;
- evaluation;
- usage metering;
- guardrails;
- integration adapter;
- async job dashboard;
- retry/recovery;
- notification;
- retention config;
- backup/restore;
- monitoring;
- API contracts;
- traceability registry.

Yêu cầu: FR-109..124.

### Entity
AuditEvent, AIProvider, AIModel, PromptTemplate, PromptVersion, EvaluationDataset, EvaluationRun, UsageRecord, IntegrationAdapter, IntegrationCredentialRef, Job, JobAttempt, Notification, RetentionPolicy, TraceabilityLink.

---

# 6. Yêu cầu phi chức năng

SRS áp toàn bộ NFR-001..094.

## 6.1 Security
Bắt buộc:
- tenant isolation;
- backend authz;
- encryption;
- secrets management;
- malware scan;
- PII protection;
- prompt injection defense;
- privileged audit;
- security test.

## 6.2 Performance
Baseline:
- standard API p95 ≤ 2s;
- search/inbox p95 ≤ 3s;
- async acknowledgement ≤ 2s;
- pagination bắt buộc;
- long-running processing không block request.

## 6.3 Reliability
- idempotency;
- retry transient;
- dead-letter;
- external failure isolation;
- transaction/outbox pattern khi cần;
- graceful AI degradation.

## 6.4 Backup/DR
Baseline SaaS:
- RPO mục tiêu ≤24h;
- RTO mục tiêu ≤8h;
- restore test có evidence.

## 6.5 AI Quality
- groundedness evaluation;
- citation correctness;
- abstain khi thiếu evidence;
- trace provider/model/prompt;
- evaluation dataset;
- safety test;
- human approval.

## 6.6 Usability
- Web desktop-first;
- Mobile leadership-first;
- loading/empty/error/permission state;
- Vietnamese-first;
- accessibility baseline;
- explainability cho AI.

## 6.7 Engineering
- modular architecture;
- protected branch/code review;
- automated tests;
- migration versioning;
- OpenAPI;
- observability;
- documentation as code;
- release traceability.

---

# 7. Interface Requirements

## 7.1 Web
Web phải có tối thiểu các workspace:
1. Tổng quan
2. Văn bản
3. Hồ sơ công việc
4. Công việc
5. Soạn thảo AI
6. Họp
7. Báo cáo
8. Kho tri thức
9. Quản trị

Mỗi màn hình sau này phải có:
- Screen ID
- Actor
- Route
- Component
- Field
- Validation
- Permission
- API
- Loading/Empty/Error
- Audit
- Acceptance Criteria

## 7.2 Mobile
Navigation mục tiêu:
- Home
- Inbox
- Work
- AI
- Meeting
- Profile

Mobile phải dùng cùng backend authz và object permission như Web.

## 7.3 API
API phải:
- versioned;
- machine-readable contract;
- authentication/authorization;
- tenant context;
- validation;
- standardized error;
- correlation id;
- pagination;
- idempotency ở write cần thiết;
- audit;
- rate limit khi phù hợp.

## 7.4 Integration
Tích hợp bên ngoài qua adapter:
- SSO;
- ký số;
- quản lý văn bản;
- hệ thống chuyên ngành;
- AI provider;
- notification provider.

Không hard-code provider contract vào domain service.

---

# 8. Data Requirements

## 8.1 Tenant-bound data
Hầu hết entity nghiệp vụ phải mang tenant context.

## 8.2 Versioned entities
Tối thiểu phải version:
- Document
- Draft
- Template
- Workflow
- Metric Schema
- Prompt/Policy
- Knowledge Source khi nội dung thay đổi có ảnh hưởng.

## 8.3 Audit
Mọi state-changing action P0/P1 phải emit audit event.

## 8.4 Provenance
Provenance phải hỗ trợ:
- document/version;
- page/paragraph;
- table/cell;
- audio/timestamp;
- extraction run;
- confidence.

## 8.5 Retention
Retention phải tách khỏi business status; archive không đồng nghĩa physical delete.

---

# 9. AI Architecture Requirements

AI Orchestrator phải tách khỏi Core Business Services.

Tối thiểu gồm:
- AI Gateway;
- Provider/Model Registry;
- Prompt Registry;
- RAG Pipeline;
- OCR/STT adapters;
- Evaluation;
- Guardrails;
- Usage Metering;
- Retry/Failover;
- AI Audit.

AI request context phải chứa:
- tenant;
- user;
- data scope;
- use case;
- source refs;
- prompt version;
- policy;
- correlation id.

---

# 10. Security Requirements chi tiết

1. Query/service phải enforce tenant.
2. RAG filter trước ranking.
3. Object storage path/presigned access phải scope đúng.
4. Async worker phải nhận tenant context.
5. Log không chứa raw secret.
6. Export phải re-check permission.
7. Deep link/mobile notification phải re-authorize.
8. Platform admin support access phải audit.
9. AI provider outbound policy phải cấu hình theo deployment.
10. Backup/restore phải bảo vệ dữ liệu.

---

# 11. State Machine Requirements

## Document
DRAFT/UPLOADING → PROCESSING → READY → REVIEW_REQUIRED → APPROVAL → FINAL/ARCHIVED/FAILED.

## Task
DRAFT → ASSIGNED → ACCEPTED → IN_PROGRESS → WAITING → REVIEW → COMPLETED/CANCELLED.

## Workflow
CREATED → RUNNING → WAITING → COMPLETED/REJECTED/CANCELLED/FAILED.

## Reporting Cycle
DRAFT → COLLECTING → SCHEMA_REVIEW → EXTRACTION → QUALITY_REVIEW → AGGREGATED → DRAFT_REPORT → APPROVED → CLOSED.

## AI/Async Job
QUEUED → RUNNING → SUCCEEDED / RETRYING / FAILED / CANCELLED / DEAD_LETTER.

Chi tiết transition sẽ được freeze trong Domain Model/Business Rule implementation.

---

# 12. Error Handling

API/Service phải phân loại tối thiểu:
- VALIDATION_ERROR
- AUTHENTICATION_REQUIRED
- PERMISSION_DENIED
- TENANT_SCOPE_VIOLATION
- NOT_FOUND
- CONFLICT
- STALE_VERSION
- RATE_LIMITED
- PROVIDER_UNAVAILABLE
- PROCESSING_FAILED
- UNSUPPORTED_FILE
- MALWARE_DETECTED
- INSUFFICIENT_EVIDENCE
- INTERNAL_ERROR

Client phải hiển thị lỗi có thể hành động; không lộ stack trace/secret.

---

# 13. Audit Events tối thiểu

- login/logout/session revoke;
- user/role/scope change;
- upload/delete/archive/export;
- metadata/version change;
- AI generation/review;
- task assign/status/complete;
- workflow submit/approve/return/reject/delegate;
- meeting decision confirm;
- report schema approve;
- report aggregate/export;
- template/knowledge publish;
- AI provider/prompt config;
- integration config;
- backup/restore;
- privileged access.

---

# 14. Acceptance Criteria cấp hệ thống

Core v1 chỉ đủ điều kiện qualification khi:

1. 124 FR được phân loại release và P0 hoàn tất.
2. 94 NFR có test/evidence phù hợp.
3. 110 Business Rules trọng yếu được enforce hoặc documented exception.
4. 96 Use Cases có coverage.
5. Không có P0 traceability gap.
6. Cross-tenant/security gate PASS.
7. API contract tests PASS.
8. Migration tests PASS.
9. AI evaluation P0 PASS theo threshold đã freeze.
10. Performance baseline PASS.
11. Backup/restore evidence PASS.
12. Web P0 workflows PASS.
13. Mobile P0 workflows PASS nếu mobile nằm trong release.
14. UAT được APPROVED.
15. Release/Configuration Baseline được ghi nhận.

---

# 15. Traceability Model

Chuỗi bắt buộc:

Research → Capability → BP → BR → Actor → UC → BRULE → FR/NFR → SRS Section → Screen/API/Data → Code → Test → UAT → Release.

Ví dụ:

BR-013  
→ UC-025  
→ BRULE-029/031/032/033  
→ FR-029/031/035  
→ SRS 5.4  
→ WEB-DRAFT-* / API-DRAFT-* / Draft entities  
→ TC-*  
→ UAT-*  
→ Release.

---

# 16. Configuration Baseline

Mỗi release cần xác định:
- Git commit/tag;
- database migration version;
- OpenAPI version;
- Web build;
- Mobile build;
- AI prompt/policy version;
- provider/model routing baseline;
- workflow definitions;
- template/system taxonomy versions;
- infrastructure/deployment manifest;
- test report;
- known issues.

---

# 17. Change Management

Thay đổi sau khi SRS baseline phải:
1. Tạo Change Request.
2. Nêu lý do.
3. Impact tới BR/UC/BRULE/FR/NFR.
4. Impact Screen/API/Data/Test.
5. Đánh giá backward compatibility.
6. Phê duyệt.
7. Cập nhật version và traceability.

Không thay ID cũ chỉ vì đổi tên wording. Requirement bị loại phải giữ trạng thái Deprecated/Removed thay vì tái sử dụng ID.

---

# 18. Deliverables phát sinh trực tiếp từ SRS

Sau SRS v1.0, thứ tự thiết kế tiếp theo:

1. Domain Model
2. Data Dictionary
3. ERD
4. API Catalog
5. OpenAPI
6. System/Application Architecture chi tiết
7. Web Screen Catalog
8. Mobile Screen Catalog
9. AI Detailed Specification
10. Security Detailed Specification
11. Test Strategy/Test Case Catalog
12. Traceability Matrix

---

# 19. SRS Exit Criteria

SRS v1.0 được coi là đủ baseline khi:
- khớp Product Boundary;
- không bỏ sót Core Domain;
- FR/NFR có ID ổn định;
- Business Rules liên quan được phản ánh;
- các state machine chính được xác định;
- interface/data/security/AI requirements đủ để thiết kế;
- traceability model rõ;
- stakeholder phê duyệt.

---

# 20. Baseline Summary

- 12 Core Domains
- 12 Business Processes
- 72 Business Requirements
- 14 Business Actors
- 96 Use Cases
- 110 Business Rules
- 124 Functional Requirements
- 94 Non-Functional Requirements

Tài liệu này là **baseline yêu cầu phần mềm chính thức** để VWork bước sang Architecture, Data, API và Screen Design.
