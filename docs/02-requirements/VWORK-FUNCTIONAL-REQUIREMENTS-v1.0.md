# VWork – Functional Requirements v1.0

**Phạm vi:** VWork Core v1  
**Nguồn:** BRD, Business Process, Actor Catalog, Use Case Catalog, Business Rule Catalog  
**Mục tiêu:** Chuyển yêu cầu nghiệp vụ thành yêu cầu chức năng có thể thiết kế, lập trình và kiểm thử.

---

## 1. Quy ước

Mỗi yêu cầu chức năng có:
- ID: FR-xxx.
- Domain.
- Priority: P0/P1/P2.
- Requirement statement.
- Input/Output chính.
- Trace: BR / UC / BRULE.
- Acceptance summary.

---

# 2. Identity & Organization

## FR-001 – Đăng nhập theo tenant
**P0.** Hệ thống phải cho phép người dùng đăng nhập và xác lập tenant context hợp lệ.  
Trace: BR-001, BR-057; UC-001; BRULE-001..002.  
Acceptance: user không có membership hợp lệ không được vào tenant.

## FR-002 – Quản lý session
**P0.** Hệ thống phải tạo, gia hạn, thu hồi và hết hạn session theo policy.  
Trace: UC-002, BRULE-009.

## FR-003 – Tạo và cấu hình tenant
**P0.** Platform Admin phải tạo/cấu hình tenant, entitlement, quota và deployment profile.  
Trace: BR-001; UC-003.

## FR-004 – Quản lý cơ cấu tổ chức
**P0.** Tenant Admin phải tạo/sửa/ngưng sử dụng cơ quan, đơn vị, chức danh và quan hệ cây.  
Trace: BR-002; UC-004.

## FR-005 – Quản lý người dùng
**P0.** Tenant Admin phải tạo/mời/cập nhật/vô hiệu hóa người dùng.  
Trace: BR-002; UC-005.

## FR-006 – Gán role
**P0.** Hệ thống phải hỗ trợ gán một hoặc nhiều role cho user.  
Trace: BR-057; UC-006; BRULE-003.

## FR-007 – Gán data scope
**P0.** Role assignment phải gắn được data scope theo đơn vị/nhóm/object.  
Trace: BR-057..058; UC-006.

## FR-008 – Thiết lập ủy quyền
**P1.** Người dùng có quyền phải thiết lập delegation có phạm vi và thời hạn.  
Trace: BR-059; UC-007; BRULE-006..007.

## FR-009 – Hồ sơ cấu hình văn bản
**P0.** Tenant Admin phải cấu hình cơ quan chủ quản, cơ quan ban hành, ký hiệu, địa danh, người ký và nơi nhận mặc định.  
Trace: BR-003; UC-008.

---

# 3. Document Management

## FR-010 – Upload tài liệu đơn
**P0.** Người dùng phải upload được file hợp lệ và nhận Document ID.  
Trace: BR-004..005; UC-009.

## FR-011 – Upload batch
**P0.** Người dùng phải upload nhiều file và theo dõi trạng thái từng file.  
Trace: BR-004; UC-010.

## FR-012 – Multi-image document
**P1.** Người dùng phải sắp xếp nhiều ảnh thành một nguồn nhiều trang.  
Trace: UC-011.

## FR-013 – Validate file
**P0.** Hệ thống phải kiểm MIME, extension, size và malware trước processing.  
Trace: BRULE-013..014.

## FR-014 – Detect duplicate
**P1.** Hệ thống phải cảnh báo file có checksum/fingerprint trùng.  
Trace: BRULE-015.

## FR-015 – Document viewer
**P0.** Người dùng có quyền phải xem được PDF/image và preview tài liệu hỗ trợ.  
Trace: UC-012.

## FR-016 – Metadata editor
**P0.** Người dùng có quyền phải xem/sửa metadata chưa khóa.  
Trace: UC-013.

## FR-017 – Versioning
**P0.** Hệ thống phải tạo version mới thay vì overwrite version final/trình duyệt.  
Trace: BR-005; UC-014; BRULE-011..012.

## FR-018 – Compare versions
**P1.** Người dùng phải so sánh hai version hỗ trợ.  
Trace: UC-015.

## FR-019 – Export
**P0.** Người dùng có quyền phải xuất/tải tài liệu hoặc package.  
Trace: BR-044; UC-016.

## FR-020 – Source preservation
**P0.** Hệ thống phải giữ file nguồn độc lập với derivative artifact.  
Trace: BRULE-020.

---

# 4. Document Intelligence

## FR-021 – OCR job
**P0.** Scan/ảnh phải được đưa vào OCR job async.  
Trace: BR-006, BR-064; UC-017.

## FR-022 – OCR confidence review
**P1.** Hệ thống phải hiển thị vùng/trường OCR confidence thấp để rà.  
Trace: UC-018; BRULE-021..022.

## FR-023 – Document classification
**P0.** Hệ thống phải đề xuất loại văn bản, lĩnh vực, priority.  
Trace: BR-007; UC-019.

## FR-024 – Metadata extraction
**P0.** Hệ thống phải trích cơ quan, số/ký hiệu, ngày, người ký và field cấu hình.  
Trace: BR-008; UC-020.

## FR-025 – Requirement extraction
**P0.** Hệ thống phải trích yêu cầu, nhiệm vụ, deadline, required output.  
Trace: BR-009; UC-021.

## FR-026 – Table/value extraction
**P0.** Hệ thống phải trích bảng/số liệu từ nguồn hỗ trợ.  
Trace: UC-022.

## FR-027 – Provenance viewer
**P0.** Người dùng phải click từ extracted field/claim về vị trí nguồn.  
Trace: BR-010; UC-023.

## FR-028 – Grounding classification
**P0.** Hệ thống phải lưu/hiển thị FACT, INFERENCE, MISSING cho content áp dụng.  
Trace: BR-011..012; UC-024.

---

# 5. AI Draft & Review

## FR-029 – Draft from instruction
**P0.** Người dùng phải tạo draft từ ý chỉ đạo/yêu cầu.  
Trace: BR-013; UC-025.

## FR-030 – Document type selection
**P0.** Người dùng phải chọn hoặc nhận gợi ý loại văn bản.  
Trace: UC-026.

## FR-031 – Draft mode
**P0.** Hệ thống phải hỗ trợ sign-ready, working, package.  
Trace: BR-014; UC-026.

## FR-032 – Draft from Work Case
**P0.** Hệ thống phải dùng context Work Case và nguồn được chọn để sinh draft.  
Trace: UC-027.

## FR-033 – Template-aware generation
**P0.** Người dùng phải chọn template/version và cách áp dụng structure/style.  
Trace: BR-015; UC-028.

## FR-034 – Document package generation
**P1.** Hệ thống phải sinh nhiều draft từ cùng context.  
Trace: BR-016; UC-029.

## FR-035 – Context snapshot
**P0.** Mỗi AI generation phải lưu references/context snapshot.  
Trace: BRULE-032.

## FR-036 – AI Review
**P0.** Hệ thống phải tạo findings theo nhóm nội dung, cấu trúc, logic, số liệu, căn cứ, thể thức.  
Trace: BR-017; UC-030.

## FR-037 – Review severity
**P0.** Finding phải có severity, explanation và source khi có.  
Trace: BRULE-036.

## FR-038 – Quality score
**P1.** Hệ thống phải tính score theo policy cấu hình.  
Trace: UC-030.

## FR-039 – Accept/Reject finding
**P0.** Người dùng phải xử lý từng đề xuất mà không bị sửa âm thầm.  
Trace: BR-018; UC-031.

## FR-040 – Context rewrite
**P0.** Hệ thống phải rewrite selection/section theo action hoặc custom instruction.  
Trace: UC-032.

## FR-041 – Blocking review gate
**P1.** BLOCKER phải ngăn submit trừ override có quyền.  
Trace: BRULE-037..038.

---

# 6. Incoming Document Processing

## FR-042 – Register incoming document
**P0.** Văn thư phải đăng ký văn bản đến và metadata liên quan.  
Trace: BR-020; UC-033.

## FR-043 – Incoming summary
**P0.** AI phải tạo tóm tắt có grounding.  
Trace: UC-034.

## FR-044 – Extract required actions
**P0.** AI phải tạo danh sách yêu cầu thực hiện có source/confidence.  
Trace: UC-035.

## FR-045 – Assignment suggestion
**P1.** AI có thể đề xuất unit/user phù hợp dựa trên organization/context.  
Trace: UC-036.

## FR-046 – Handling advice
**P0.** AI phải đề xuất phương án xử lý và thông tin còn thiếu.  
Trace: UC-037.

## FR-047 – Convert incoming to Work Case
**P0.** Người dùng phải tạo Work Case từ văn bản đến.  
Trace: UC-038.

## FR-048 – Convert requirement to Task
**P0.** Candidate requirement phải chuyển thành Task sau human confirmation.  
Trace: UC-039.

## FR-049 – Generate response package
**P1.** Hệ thống phải tạo package draft phản hồi từ context đã xác nhận.  
Trace: UC-040.

---

# 7. Work Case & Task

## FR-050 – Create Work Case
**P0.** Người dùng có quyền phải tạo Work Case thủ công.  
Trace: BR-021; UC-041.

## FR-051 – Work Case timeline
**P0.** Hệ thống phải hiển thị timeline tài liệu, task, meeting, workflow, comment và output.  
Trace: UC-042.

## FR-052 – Create Task
**P0.** Người dùng phải tạo Task với owner/unit/deadline/priority/required output.  
Trace: BR-022; UC-043.

## FR-053 – Assign Task
**P0.** Người có quyền phải giao Task cho user/unit.  
Trace: UC-044.

## FR-054 – Accept Task
**P0.** Người nhận phải tiếp nhận/xác nhận Task khi policy yêu cầu.  
Trace: UC-045.

## FR-055 – Update progress
**P0.** Người xử lý phải cập nhật status, progress, blocker.  
Trace: BR-024; UC-046.

## FR-056 – Submit result
**P0.** Người xử lý phải nộp output/evidence.  
Trace: UC-047.

## FR-057 – Complete Task
**P0.** Người có quyền phải review/complete Task.  
Trace: UC-048.

## FR-058 – Reminder
**P1.** Hệ thống phải tạo reminder dựa deadline/SLA.  
Trace: BR-025.

## FR-059 – Escalation
**P1.** Hệ thống phải escalation theo policy cấu hình.  
Trace: BR-025.

## FR-060 – Collaboration
**P1.** Work Case/Task phải hỗ trợ comment, mention, attachment và handover.  
Trace: BR-026.

---

# 8. Workflow & Approval

## FR-061 – Workflow definition
**P0.** Admin phải cấu hình step, role, condition, action và SLA.  
Trace: BR-027.

## FR-062 – Start workflow
**P0.** Người dùng có quyền phải start workflow trên object/version hợp lệ.  
Trace: UC-049.

## FR-063 – Approval queue
**P0.** Người duyệt phải xem danh sách item đang chờ mình.  
Trace: UC-050.

## FR-064 – Approval detail
**P0.** Màn duyệt phải hiển thị version, source, summary, finding và history.  
Trace: UC-051.

## FR-065 – Approve
**P0.** Người có thẩm quyền phải approve version đã trình.  
Trace: UC-052.

## FR-066 – Return
**P0.** Người duyệt phải trả lại và ghi lý do.  
Trace: UC-053.

## FR-067 – Reject
**P1.** Người duyệt phải từ chối theo policy.  
Trace: UC-054.

## FR-068 – Request clarification
**P1.** Người duyệt phải yêu cầu bổ sung/giải trình.  
Trace: UC-055.

## FR-069 – Delegate approval
**P1.** Người duyệt phải ủy quyền bước xử lý nếu delegation hợp lệ.  
Trace: UC-056.

## FR-070 – Workflow SLA
**P1.** Engine phải đo SLA và trigger reminder/escalation.  
Trace: BR-025, BR-027.

---

# 9. Meeting Intelligence

## FR-071 – Create Meeting
**P1.** Thư ký phải tạo meeting và gắn context.  
Trace: BR-030; UC-057.

## FR-072 – Parse invitation
**P1.** AI phải đọc giấy mời/agenda và đề xuất metadata.  
Trace: UC-058.

## FR-073 – Upload/record audio
**P1.** Người dùng phải upload hoặc ghi âm theo capability client.  
Trace: UC-059.

## FR-074 – STT
**P1.** Audio phải chuyển thành transcript async có timestamp.  
Trace: BR-031; UC-060.

## FR-075 – Transcript editor
**P1.** Người dùng phải sửa speaker/text/timestamp annotation trong phạm vi hỗ trợ.  
Trace: UC-061.

## FR-076 – Extract decisions/tasks
**P1.** AI phải đề xuất decision/task candidates.  
Trace: BR-032; UC-062.

## FR-077 – Confirm decisions
**P1.** Người chủ trì/thư ký có quyền phải xác nhận candidate.  
Trace: UC-063.

## FR-078 – Generate minutes
**P1.** Hệ thống phải sinh minutes draft và citation tới transcript.  
Trace: BR-034; UC-064.

## FR-079 – Convert meeting decisions to tasks
**P1.** Decision xác nhận phải chuyển thành Task.  
Trace: BR-033.

---

# 10. Reporting & Data Consolidation

## FR-080 – Create Reporting Cycle
**P0.** Cán bộ tổng hợp phải tạo kỳ báo cáo.  
Trace: BR-035; UC-065.

## FR-081 – Obligation list
**P0.** Phải quản lý danh sách đơn vị phải nộp và deadline.  
Trace: UC-066.

## FR-082 – Submission intake
**P0.** Hệ thống phải nhận report source và version.  
Trace: UC-067.

## FR-083 – Schema suggestion
**P0.** AI phải đề xuất Metric Schema từ nguồn.  
Trace: BR-036; UC-068.

## FR-084 – Schema editor/approval
**P0.** Người dùng phải sửa/duyệt schema và tạo version locked.  
Trace: BR-037..038; UC-069.

## FR-085 – Extract by schema
**P0.** Hệ thống phải trích dữ liệu theo approved schema.  
Trace: BR-039; UC-070.

## FR-086 – Data quality
**P0.** Hệ thống phải phát hiện missing, duplicate, type error, outlier, conflict.  
Trace: BR-040; UC-071.

## FR-087 – Reconciliation
**P0.** Hệ thống phải chạy rule reconciliation và lưu finding.  
Trace: BR-041; UC-071.

## FR-088 – Aggregation
**P0.** Hệ thống phải tính aggregation deterministic theo metric rule.  
Trace: BRULE-082.

## FR-089 – Report provenance
**P0.** Người dùng phải drill-down số liệu về nguồn.  
Trace: BR-042.

## FR-090 – Generate report draft
**P0.** AI phải sinh narrative từ approved dataset.  
Trace: BR-043; UC-072.

## FR-091 – Export report
**P0.** Hệ thống phải xuất Word/XLSX/CSV theo quyền.  
Trace: BR-044.

---

# 11. Templates & Knowledge

## FR-092 – Create template from file
**P0.** Người dùng có quyền phải tạo template từ file.  
Trace: BR-045; UC-073.

## FR-093 – Save draft as template
**P1.** Người dùng phải lưu draft được phép thành template.  
Trace: UC-074.

## FR-094 – Template metadata
**P0.** Template phải có taxonomy/metadata.  
Trace: BR-046; UC-075.

## FR-095 – Template lifecycle
**P1.** Admin phải publish/version/archive template.  
Trace: BR-047; UC-076.

## FR-096 – Ingest knowledge
**P0.** Knowledge Admin phải ingest nguồn tri thức.  
Trace: BR-048; UC-077.

## FR-097 – Publish knowledge
**P0.** Nguồn tri thức phải có lifecycle draft/published/archived.  
Trace: UC-078.

## FR-098 – Knowledge search
**P0.** Người dùng có quyền phải tìm kiếm keyword/semantic trong scope.  
Trace: UC-079.

## FR-099 – RAG Q&A
**P0.** Người dùng phải hỏi đáp có citation trong scope.  
Trace: BR-049..050; UC-080.

## FR-100 – Re-index
**P1.** Hệ thống phải re-index khi source/version thay đổi.  
Trace: BRULE-092.

---

# 12. Executive Intelligence

## FR-101 – Executive Inbox
**P0.** Lãnh đạo phải xem unified inbox theo quyền.  
Trace: BR-051; UC-081.

## FR-102 – Risk filters
**P0.** Inbox phải lọc urgent, overdue, due soon, approval, new incoming.  
Trace: UC-082.

## FR-103 – Daily Brief
**P1.** Hệ thống phải tạo Daily Brief có nguồn.  
Trace: BR-052; UC-083.

## FR-104 – Weekly Brief
**P1.** Hệ thống phải tạo Weekly Brief có nguồn.  
Trace: UC-084.

## FR-105 – Contextual Ask VWork
**P0.** Người dùng phải hỏi trong context document/case/task/meeting/report.  
Trace: BR-053; UC-085.

## FR-106 – Organization status Q&A
**P1.** Lãnh đạo phải hỏi trạng thái công việc theo đơn vị/lĩnh vực trong data scope.  
Trace: UC-086.

## FR-107 – Proactive signals
**P1.** Hệ thống phải tạo signal cho overdue, missing report, conflict, unresolved decision.  
Trace: BR-054; UC-087.

## FR-108 – Action from Inbox/Brief
**P0.** Người dùng phải approve/assign/comment từ context, backend re-authorize.  
Trace: UC-088.

---

# 13. Governance, AI & Integration

## FR-109 – Audit query
**P0.** Actor có quyền phải tìm/xem audit log.  
Trace: BR-060; UC-089.

## FR-110 – AI provider registry
**P0.** AI Admin phải cấu hình provider/model/routing.  
Trace: BR-061; UC-090.

## FR-111 – Prompt registry
**P1.** Hệ thống phải version prompt/policy.  
Trace: UC-091.

## FR-112 – AI evaluation
**P1.** Admin/QA phải chạy evaluation theo dataset/use case.  
Trace: BR-062; UC-092.

## FR-113 – Usage metering
**P1.** Hệ thống phải đo AI usage/quota theo tenant/use case/provider.  
Trace: UC-093.

## FR-114 – Guardrails
**P0.** AI Orchestrator phải enforce scope, PII/injection policy và unsupported action checks.  
Trace: BR-063.

## FR-115 – Integration adapters
**P1.** Admin phải cấu hình adapter/version/credential reference.  
Trace: BR-066; UC-094.

## FR-116 – Async job dashboard
**P0.** Ops phải xem progress, retries, failure của long-running jobs.  
Trace: BR-064; UC-095.

## FR-117 – Retry/recovery
**P0.** Job system phải retry transient error, hỗ trợ recovery/dead-letter.  
Trace: BR-064; BRULE-101..103.

## FR-118 – Notification
**P0.** Hệ thống phải phát in-app và push event cho tình huống cấu hình.  
Trace: BR-067.

## FR-119 – Retention configuration
**P1.** Admin phải cấu hình retention theo deployment/policy.  
Trace: BR-068.

## FR-120 – Backup/Restore
**P0.** Ops phải chạy backup, restore test và lưu evidence.  
Trace: BR-069; UC-096.

## FR-121 – Monitoring
**P0.** Ops phải theo dõi health, log, metric, trace và alert.  
Trace: BR-070.

## FR-122 – API contracts
**P0.** Core capability phải expose API contract versioned cho Web/Mobile/service integration.  
Trace: BR-065.

## FR-123 – Traceability registry
**P0.** Dự án phải quản lý mapping Requirement → UC → FR/NFR → Design → Test → Release.  
Trace: BR-071.

## FR-124 – Tenant configuration over fork
**P0.** Khác biệt giữa xã/phường phải được giải quyết bằng configuration/extension trong phạm vi đã định.  
Trace: BR-072.

---

# 14. Functional Acceptance Principles

1. Mọi FR P0 phải có test case trước release Core v1.
2. Mọi FR liên quan authorization phải test positive + negative + cross-tenant.
3. Mọi FR AI phải có happy path + insufficient evidence + provider failure.
4. Mọi FR async phải test retry/idempotency/recovery.
5. Mọi FR approval phải test stale-version condition.
6. Mọi FR report phải test schema version và provenance.
7. Mọi FR mobile dùng cùng backend authorization, không có bypass riêng.

---

# 15. Coverage Summary

- FR-001..009: Identity/Organization
- FR-010..020: Document
- FR-021..028: Document Intelligence
- FR-029..041: AI Draft/Review
- FR-042..049: Incoming
- FR-050..060: Work/Task
- FR-061..070: Workflow
- FR-071..079: Meeting
- FR-080..091: Reporting
- FR-092..100: Template/Knowledge
- FR-101..108: Executive
- FR-109..124: Governance/AI/Integration

**Tổng số: 124 Functional Requirements.**
