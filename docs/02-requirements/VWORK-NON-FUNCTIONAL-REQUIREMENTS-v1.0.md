# VWork – Non-Functional Requirements v1.0

**Phạm vi:** VWork Core v1  
**Mục tiêu:** Định nghĩa các yêu cầu phi chức năng có thể đo, kiểm thử và dùng làm tiêu chí thiết kế/kiến trúc/nghiệm thu.

---

## 1. Quy ước

Mỗi NFR có:
- ID: NFR-xxx.
- Nhóm chất lượng.
- Mức: P0/P1/P2.
- Yêu cầu định lượng hoặc tiêu chí kiểm thử.
- Môi trường áp dụng.
- Trace đến BR/BRULE/FR khi cần.

Các target dưới đây là baseline kỹ thuật ban đầu và phải được hiệu chỉnh qua benchmark/pilot.

---

# 2. Security & Privacy

## NFR-001 – Tenant Isolation
**P0.** Không được có cross-tenant data leakage trong API, DB query, search, RAG, object storage và async jobs.  
Acceptance: automated negative tests phải PASS 100%.

## NFR-002 – Authentication
**P0.** Toàn bộ endpoint bảo vệ phải yêu cầu session/token hợp lệ; token hết hạn/thu hồi phải bị từ chối.

## NFR-003 – Authorization
**P0.** Backend phải enforce RBAC + data scope + object permission; UI không được là lớp bảo vệ duy nhất.

## NFR-004 – Encryption in Transit
**P0.** Traffic production phải dùng TLS phù hợp với baseline hạ tầng hiện hành.

## NFR-005 – Encryption at Rest
**P0.** Dữ liệu nhạy cảm, object storage, backup và secret phải được mã hóa theo deployment profile.

## NFR-006 – Secrets Management
**P0.** Secret không được lưu plaintext trong source, log, client bundle hoặc tài liệu public.

## NFR-007 – Password/MFA Policy
**P1.** Hệ thống phải hỗ trợ password policy và MFA/SSO khi deployment yêu cầu.

## NFR-008 – Session Security
**P0.** Session phải có expiry, revocation, secure cookie/token handling và device/session visibility phù hợp.

## NFR-009 – File Security
**P0.** File upload phải qua MIME/size validation và malware scanning trước parsing.

## NFR-010 – PII Protection
**P0.** Log/telemetry phải tránh ghi PII/secret không cần thiết; masking/redaction theo policy.

## NFR-011 – Prompt Injection Defense
**P0.** RAG/AI workflows phải coi nội dung tài liệu là untrusted input và áp guardrails chống instruction injection.

## NFR-012 – AI Data Scope
**P0.** AI provider chỉ nhận dữ liệu cần thiết trong scope của request và deployment policy.

## NFR-013 – Audit Integrity
**P0.** Audit event quan trọng phải append-only ở application layer và có correlation id.

## NFR-014 – Privileged Access Audit
**P0.** Hành động admin/platform/AI admin nhạy cảm phải có audit riêng.

## NFR-015 – Security Testing
**P0.** Release production phải có SAST/dependency scan/secret scan; DAST/penetration theo release policy.

---

# 3. Performance

## NFR-016 – Standard API Latency
**P0.** Với API CRUD/read thông thường, p95 target ≤ 2 giây trong tải chuẩn, không tính upload/download lớn.

## NFR-017 – Search Latency
**P1.** Search metadata/full-text p95 target ≤ 3 giây cho tenant quy mô chuẩn.

## NFR-018 – Executive Inbox
**P0.** Inbox p95 target ≤ 3 giây với dataset pilot chuẩn.

## NFR-019 – AI First Feedback
**P0.** Long-running AI action phải trả job/progress acknowledgement ≤ 2 giây; không block request đồng bộ đến timeout.

## NFR-020 – OCR/STT Async
**P0.** OCR/STT/report generation phải async khi vượt threshold cấu hình.

## NFR-021 – Large Upload
**P1.** Upload file lớn phải hỗ trợ progress và retry/resume khi kiến trúc client/storage cho phép.

## NFR-022 – Pagination
**P0.** List API phải paginate; không tải toàn bộ dataset lớn vào client.

## NFR-023 – Aggregation Determinism
**P0.** Tính toán báo cáo số học phải có thời gian thực thi có thể benchmark và không phụ thuộc LLM khi dùng rule deterministic được.

---

# 4. Scalability & Capacity

## NFR-024 – Horizontal Scale
**P0.** API stateless và worker async phải có khả năng scale ngang trong SaaS/Private profile.

## NFR-025 – Tenant Growth
**P1.** Kiến trúc phải hỗ trợ tăng số tenant mà không tạo codebase riêng.

## NFR-026 – Storage Growth
**P1.** Object/document storage phải tách khỏi application node và có quota/monitoring.

## NFR-027 – Queue Backpressure
**P0.** Job queue phải có backpressure/concurrency control để tránh overload provider/hạ tầng.

## NFR-028 – Provider Rate Limit
**P0.** AI Gateway phải quản lý rate limit/quota theo provider/tenant/use case.

## NFR-029 – Capacity Metrics
**P1.** Hệ thống phải đo số user, document, job, storage, tokens/AI usage, queue depth và error rate.

---

# 5. Availability & Reliability

## NFR-030 – Availability Target
**P1.** SaaS production target ≥ 99.5% theo tháng, trừ maintenance được thông báo; tier cao hơn có thể cấu hình SLA riêng.

## NFR-031 – Graceful Degradation
**P0.** Khi AI provider lỗi, nghiệp vụ không phụ thuộc AI vẫn phải hoạt động; UI phải hiển thị trạng thái phù hợp.

## NFR-032 – Retry
**P0.** Lỗi transient của async job phải retry theo exponential backoff/configuration.

## NFR-033 – Idempotency
**P0.** Các command/job có rủi ro lặp phải hỗ trợ idempotency key/correlation key.

## NFR-034 – Dead-letter
**P0.** Job hết retry phải vào failure/dead-letter state có thể điều tra/retry thủ công.

## NFR-035 – Data Durability
**P0.** Không được coi job thành công nếu output metadata đã commit nhưng asset cần thiết chưa lưu bền vững, hoặc ngược lại, nếu không có cơ chế reconciliation.

## NFR-036 – Transaction Consistency
**P0.** State transition quan trọng phải có transaction/outbox hoặc pattern tương đương để tránh trạng thái nửa vời.

## NFR-037 – External Failure Isolation
**P0.** Lỗi integration/provider ngoài không được gây cascade failure toàn core.

---

# 6. Backup, Recovery & DR

## NFR-038 – Backup Policy
**P0.** Production phải có backup database và asset metadata theo chính sách deployment.

## NFR-039 – Restore Test
**P0.** Phải kiểm thử restore định kỳ và lưu evidence.

## NFR-040 – RPO Baseline
**P1.** SaaS baseline RPO mục tiêu ≤ 24 giờ; tier/khách hàng có thể yêu cầu thấp hơn.

## NFR-041 – RTO Baseline
**P1.** SaaS baseline RTO mục tiêu ≤ 8 giờ cho sự cố nghiêm trọng; profile riêng có thể cấu hình.

## NFR-042 – DR Documentation
**P0.** Phải có runbook khôi phục và dependency map.

---

# 7. Data Quality & Integrity

## NFR-043 – Referential Integrity
**P0.** Quan hệ giữa Document, Work Case, Task, Workflow, Meeting, Report phải bảo toàn integrity.

## NFR-044 – Time Consistency
**P0.** Backend lưu timestamp chuẩn hóa; client hiển thị timezone phù hợp tenant/user.

## NFR-045 – Version Integrity
**P0.** Version đã submit/approved phải bất biến nội dung.

## NFR-046 – Provenance Integrity
**P0.** Citation/provenance phải tham chiếu đúng source version.

## NFR-047 – Schema Versioning
**P0.** Metric schema/template/workflow/prompt phải version khi thay đổi có ảnh hưởng kết quả.

## NFR-048 – Soft Delete/Retention
**P1.** Xóa logic/archival phải tương thích retention policy và audit.

---

# 8. AI Quality & Governance

## NFR-049 – Groundedness
**P0.** Use case yêu cầu grounded answer phải có evaluation groundedness/citation correctness.

## NFR-050 – Hallucination Handling
**P0.** Khi evidence không đủ, hệ thống phải ưu tiên abstain/warn hơn tạo fact không có nguồn.

## NFR-051 – AI Evaluation Dataset
**P1.** Mỗi AI use case P0 phải có evaluation dataset đại diện trước production qualification.

## NFR-052 – Model Traceability
**P0.** Mỗi AI run phải truy được provider/model/prompt/policy version.

## NFR-053 – Provider Portability
**P0.** Thay model/provider không được yêu cầu viết lại business service core.

## NFR-054 – AI Cost Observability
**P1.** Phải theo dõi token/call/cost proxy theo tenant/use case/provider nếu provider cung cấp.

## NFR-055 – AI Latency Budget
**P1.** Mỗi AI use case phải có latency SLO riêng sau benchmark; UI phải hỗ trợ progress cho tác vụ dài.

## NFR-056 – Human Review
**P0.** Official administrative output từ AI phải có human review gate.

## NFR-057 – AI Safety Test
**P0.** Qualification phải test prompt injection, data exfiltration, unsupported action và cross-scope retrieval.

---

# 9. Usability & Accessibility

## NFR-058 – Responsive Web
**P0.** Web phải usable ở desktop/laptop chuẩn; tablet responsive trong phạm vi màn hình hỗ trợ.

## NFR-059 – Mobile Native/Client UX
**P0.** Mobile phải tối ưu cho lãnh đạo và xử lý nhanh, không đơn thuần render desktop UI.

## NFR-060 – Consistent Navigation
**P0.** Các workspace dùng navigation, terminology và status nhất quán.

## NFR-061 – Loading/Empty/Error State
**P0.** Mỗi màn phải có loading, empty, error và permission-denied state.

## NFR-062 – Confirmation for Destructive Actions
**P0.** Action irreversible/destructive phải confirm và audit.

## NFR-063 – AI Explainability UI
**P0.** Người dùng phải thấy source/confidence/status cho AI content quan trọng.

## NFR-064 – Vietnamese First
**P0.** Giao diện Core v1 ưu tiên tiếng Việt; architecture hỗ trợ i18n.

## NFR-065 – Accessibility Baseline
**P1.** Thành phần chính phải hỗ trợ keyboard navigation, focus state, label và contrast theo baseline accessibility của design system.

---

# 10. Compatibility

## NFR-066 – Browser Support
**P0.** Web hỗ trợ ít nhất 2 phiên bản stable gần nhất của Chrome/Edge tại thời điểm release; Safari/Firefox theo test matrix nếu khách hàng yêu cầu.

## NFR-067 – Mobile OS
**P1.** Mobile support matrix phải được freeze trước implementation; tối thiểu Android/iOS versions còn được vendor hỗ trợ phù hợp khách hàng.

## NFR-068 – File Formats
**P0.** Core intake hỗ trợ DOCX, PDF, common image, XLSX, CSV và common audio formats đã định trong API spec.

## NFR-069 – OpenAPI
**P0.** Public/internal client APIs phải có OpenAPI hoặc contract machine-readable tương đương.

---

# 11. Maintainability & Engineering Quality

## NFR-070 – Modular Architecture
**P0.** Domain boundaries phải tách rõ để giảm coupling.

## NFR-071 – Code Review
**P0.** Mọi change vào protected branch phải qua review theo policy.

## NFR-072 – Automated Tests
**P0.** Core domain P0 phải có unit/integration/contract test phù hợp.

## NFR-073 – Migration Management
**P0.** Database schema thay đổi phải dùng versioned migrations.

## NFR-074 – Backward Compatibility
**P1.** API/event contract breaking change phải có versioning/migration plan.

## NFR-075 – Configuration Management
**P0.** Environment-specific config không hard-code trong source.

## NFR-076 – Observability
**P0.** Service phải emit structured logs, metrics và correlation/trace context.

## NFR-077 – Documentation as Code
**P1.** Requirement/API/architecture docs được version cùng repo và review qua Git.

## NFR-078 – Traceability
**P0.** P0/P1 requirement phải map đến test evidence trước release.

---

# 12. Deployment & Portability

## NFR-079 – One Core
**P0.** SaaS, Private, On-Premise dùng cùng core codebase.

## NFR-080 – Environment Profiles
**P0.** Dev/Test/Staging/Production phải tách config/secret/data.

## NFR-081 – Containerization
**P1.** Service production nên đóng gói container hoặc deployment artifact reproducible tương đương.

## NFR-082 – Infrastructure as Code
**P1.** SaaS/Private cloud infrastructure nên quản lý bằng IaC khi khả thi.

## NFR-083 – On-Premise Dependency Manifest
**P0.** On-Premise phải có danh sách dependency, port, storage, network, secret và sizing.

## NFR-084 – Upgrade Strategy
**P1.** Upgrade production phải có rollback/migration strategy.

---

# 13. Mobile-specific

## NFR-085 – Secure Local Storage
**P0.** Token/secret trên mobile phải dùng secure storage của nền tảng.

## NFR-086 – Sensitive Cache
**P0.** Nội dung nhạy cảm cache local phải giới hạn, mã hóa hoặc tránh lưu tùy policy.

## NFR-087 – Push Notification Privacy
**P0.** Push payload không chứa dữ liệu nhạy cảm vượt mức cần thiết.

## NFR-088 – Network Resilience
**P1.** Mobile phải xử lý mất mạng/timeout/retry thân thiện; action write không được duplicate.

## NFR-089 – Deep Link Authorization
**P0.** Mở object từ notification/deep link vẫn phải re-check authorization.

---

# 14. Compliance & Auditability

## NFR-090 – Evidence Retention
**P0.** Hồ sơ phát triển, test, release và acceptance phải có thể lưu evidence theo quy trình dự án.

## NFR-091 – Change Control
**P0.** Requirement baseline change phải ghi lý do, impact và approval.

## NFR-092 – Configuration Baseline
**P0.** Release phải xác định version source, migration, config schema, API contract, prompt/model policy liên quan.

## NFR-093 – Release Reproducibility
**P1.** Có khả năng xác định chính xác artifact/source commit tạo ra release.

## NFR-094 – Audit Export
**P1.** Audit có thể export theo quyền để phục vụ kiểm tra/nghiệm thu.

---

# 15. NFR Qualification Gates

Một release Core v1 không được production nếu các gate P0 sau chưa PASS:
1. Cross-tenant isolation.
2. Authentication/authorization negative tests.
3. File security.
4. Audit coverage.
5. Async idempotency/recovery.
6. Backup/restore evidence.
7. AI groundedness/safety cho use case P0.
8. API contract/integration tests.
9. P0 performance benchmark.
10. Traceability completeness.
11. Migration rollback/forward validation phù hợp.
12. Mobile security nếu mobile nằm trong release.

---

# 16. NFR Summary

- NFR-001..015: Security & Privacy
- NFR-016..023: Performance
- NFR-024..029: Scalability
- NFR-030..037: Availability/Reliability
- NFR-038..042: Backup/DR
- NFR-043..048: Data Integrity
- NFR-049..057: AI Quality/Governance
- NFR-058..065: UX/Accessibility
- NFR-066..069: Compatibility
- NFR-070..078: Maintainability
- NFR-079..084: Deployment
- NFR-085..089: Mobile
- NFR-090..094: Compliance/Auditability

**Tổng số: 94 Non-Functional Requirements.**
