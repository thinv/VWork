# VWork – Business Rule Catalog v1.0

**Phạm vi:** VWork Core v1  
**Nguồn:** BRD v1.0, Actor Catalog v1.0, Use Case Catalog v1.0, Business Process Specification v1.0  
**Mục tiêu:** Chuẩn hóa các quy tắc nghiệp vụ có thể kiểm thử và tái sử dụng trong SRS, API, Data Model, Workflow, UI Validation và Test Case.

---

## 1. Quy ước

Mỗi Business Rule có:
- ID ổn định BRULE-xxx.
- Domain.
- Statement.
- Mức độ: MUST / SHOULD / MAY.
- Nguồn liên quan.
- Enforcement layer.
- Testability.

Mức độ:
- **MUST**: bắt buộc, vi phạm thì không cho phép hoặc phải cảnh báo blocking.
- **SHOULD**: mặc định phải tuân theo nhưng có thể override bởi người có quyền.
- **MAY**: hành vi tùy chọn/cấu hình.

---

# 2. Identity, Tenant & Organization

## BRULE-001 – Tenant Isolation
**MUST.** Mọi dữ liệu nghiệp vụ phải gắn tenant_id hoặc cơ chế tương đương để ngăn truy cập cross-tenant trái phép.  
Nguồn: BR-001, BR-057.  
Enforcement: DB, service, query filter, RAG scope, object storage.

## BRULE-002 – User Belongs to Tenant
Một user session chỉ được thao tác trong tenant context hợp lệ trừ platform-level role được cấp rõ ràng.

## BRULE-003 – Multi-role
Một người có thể mang nhiều role nhưng quyền hiệu lực bằng hợp của role sau khi áp dụng data scope và object permission.

## BRULE-004 – Deny Overrides Allow
Khi có xung đột giữa allow và explicit deny ở cùng object/scope, deny ưu tiên.

## BRULE-005 – Data Scope Required
Role nghiệp vụ không được mặc định toàn tenant nếu chưa có data scope.

## BRULE-006 – Delegation Time Bound
Ủy quyền phải có ngày bắt đầu, ngày kết thúc và phạm vi.

## BRULE-007 – Delegation Cannot Escalate Privilege
Người ủy quyền không thể trao quyền lớn hơn quyền mình đang có.

## BRULE-008 – Signatory Profile Versioning
Thay đổi người ký/cấu hình văn bản phải có version/effective date nếu có thể ảnh hưởng tài liệu sau thời điểm thay đổi.

## BRULE-009 – Disabled User Access
User bị vô hiệu hóa không được khởi tạo session mới và session hiện tại phải bị thu hồi theo policy.

## BRULE-010 – Platform Admin Minimal Access
Platform Admin không mặc định đọc nội dung tenant; mọi hỗ trợ có quyền dữ liệu nâng cao phải được audit.

---

# 3. Document Management

## BRULE-011 – Immutable Document ID
Document ID không thay đổi qua các version.

## BRULE-012 – Version Immutable
Một version đã được trình duyệt hoặc đánh dấu final không được sửa nội dung tại chỗ; phải tạo version mới.

## BRULE-013 – File Validation
Chỉ định dạng, kích thước và MIME được cấu hình mới được chấp nhận.

## BRULE-014 – Malware Blocking
File bị phát hiện malware phải bị quarantine và không được đưa vào parser/RAG.

## BRULE-015 – Duplicate Warning
Nếu checksum hoặc fingerprint trùng, hệ thống phải cảnh báo duplicate trước khi người dùng tạo bản ghi mới.

## BRULE-016 – Metadata Ownership
Mọi document phải có tenant, owner/creator, created_at, source và access scope.

## BRULE-017 – Retention by Policy
Document không được xóa vật lý nếu retention policy chưa cho phép.

## BRULE-018 – Export Permission
Người dùng chỉ được export nội dung mà họ có quyền đọc.

## BRULE-019 – Package Consistency
Package export phải ghi rõ version của từng tài liệu được đóng gói.

## BRULE-020 – Source Preservation
Bản gốc upload phải được bảo toàn; kết quả OCR/convert là derivative artifact.

---

# 4. OCR & Document Intelligence

## BRULE-021 – Confidence Required
Mọi field do AI/OCR extraction sinh phải có confidence hoặc trạng thái verified.

## BRULE-022 – Low Confidence Review
Field quan trọng dưới threshold cấu hình phải yêu cầu human review trước khi dùng cho workflow/aggregation chính thức.

## BRULE-023 – Provenance Required
Các field quan trọng như số/ký hiệu, deadline, nhiệm vụ, số liệu phải lưu nguồn trang/đoạn/bảng/ô nếu khả thi.

## BRULE-024 – Extraction Is Suggestion Until Verified
Extraction chưa được người dùng hoặc rule xác nhận không được xem là dữ liệu authoritative.

## BRULE-025 – FACT/INFERENCE/MISSING
Nội dung AI quan trọng phải phân loại FACT, INFERENCE hoặc MISSING.

## BRULE-026 – Missing Cannot Become Fact
MISSING không được tự động điền bằng dữ liệu suy đoán rồi chuyển thành FACT.

## BRULE-027 – Inference Must Be Marked
INFERENCE phải hiển thị rõ là suy luận và không được trình bày như dữ kiện nguồn.

## BRULE-028 – Original Source Priority
Khi nhiều nguồn mâu thuẫn, hệ thống không tự quyết nguồn đúng nếu không có rule; phải cảnh báo conflict.

---

# 5. AI Draft & Review

## BRULE-029 – Human Approval for Official Output
Mọi draft AI phải được người dùng xác nhận trước khi trở thành version trình duyệt/final.

## BRULE-030 – Template Data Isolation
Dữ kiện lịch sử trong template không được tự động tái sử dụng làm dữ kiện mới.

## BRULE-031 – Draft Mode Required
Mỗi lần sinh draft phải biết Draft Mode: sign-ready, working hoặc package.

## BRULE-032 – Context Snapshot
AI Draft phải lưu context snapshot hoặc reference tới nguồn/version đã dùng.

## BRULE-033 – Prompt/Model Trace
Mỗi AI run phải lưu prompt version, model/provider, thời điểm và policy version.

## BRULE-034 – Unsupported Claim Warning
Nếu AI không có đủ evidence cho claim quan trọng, hệ thống phải cảnh báo hoặc đánh dấu thiếu cơ sở.

## BRULE-035 – AI Review No Silent Mutation
AI Review không được sửa bản chính mà không có user action.

## BRULE-036 – Review Severity
Review finding phải có severity tối thiểu: INFO, WARNING, ERROR, BLOCKER.

## BRULE-037 – Blocking Review
Finding BLOCKER phải ngăn chuyển sang trạng thái ready-for-approval trừ khi có override bởi role được cấp.

## BRULE-038 – Override Audit
Mọi override review rule phải lưu actor, lý do, thời gian.

## BRULE-039 – Rewrite Scope
Rewrite chỉ được áp dụng lên selection/section/document scope người dùng chọn.

## BRULE-040 – Package Shared Context
Các tài liệu trong một generated package phải dùng cùng context snapshot hoặc ghi rõ khác biệt.

---

# 6. Incoming Document Processing

## BRULE-041 – Incoming Unique Registration
Mỗi văn bản đến phải có registration record duy nhất trong tenant theo chính sách định danh.

## BRULE-042 – Requirement Candidate Verification
Task candidate từ văn bản đến phải được người có quyền xác nhận trước khi giao chính thức.

## BRULE-043 – Deadline Provenance
Deadline trích từ nguồn phải giữ provenance; deadline do người dùng đặt phải ghi source=user.

## BRULE-044 – No Fabricated Result
Hệ thống không được tạo kết quả thực hiện như đã xảy ra nếu chưa có evidence.

## BRULE-045 – Work Case Link
Khi văn bản đến phát sinh xử lý nhiều bước, nên tạo Work Case thay vì chỉ sinh draft rời rạc.

## BRULE-046 – Urgent Priority
Văn bản được đánh dấu khẩn phải được ưu tiên trong inbox và notification theo policy.

## BRULE-047 – Required Output
Mỗi task tạo từ văn bản đến phải có expected output nếu nguồn xác định được hoặc người dùng bổ sung.

---

# 7. Work Case & Task

## BRULE-048 – Work Case Identity
Mỗi Work Case có ID duy nhất và timeline bất biến theo audit.

## BRULE-049 – Task Ownership
Task chính thức phải có owner cá nhân hoặc đơn vị chịu trách nhiệm.

## BRULE-050 – Task Deadline
Task có deadline nếu nguồn hoặc người giao yêu cầu; nếu không có phải cho phép trạng thái chưa xác định.

## BRULE-051 – Task Status Transition
Task chỉ chuyển trạng thái theo state machine đã định nghĩa.

## BRULE-052 – Completion Requires Evidence
Task có required output thì không được complete nếu chưa có output/evidence trừ khi được override có lý do.

## BRULE-053 – Parent Case Closure
Work Case không được complete nếu còn task blocking chưa hoàn thành.

## BRULE-054 – Handover Audit
Bàn giao owner phải lưu từ ai → cho ai → lý do → thời điểm.

## BRULE-055 – Overdue Calculation
Task overdue khi current time vượt deadline và status chưa completed/cancelled.

## BRULE-056 – Escalation Policy
Escalation phải dựa vào SLA/policy cấu hình, không hard-code theo từng tenant.

## BRULE-057 – Comment Visibility
Comment tuân theo visibility của Work Case/Task, không mặc định public toàn tenant.

---

# 8. Workflow & Approval

## BRULE-058 – Workflow Version Pinning
Workflow instance phải pin version definition tại thời điểm start.

## BRULE-059 – Approval Uses Submitted Version
Approval chỉ áp dụng cho đúng object version đã trình.

## BRULE-060 – Version Change Invalidates Pending Approval
Nếu version nội dung thay đổi sau khi trình, approval pending phải được refresh/restart theo policy.

## BRULE-061 – Authorized Approver Only
Chỉ actor thỏa role + data scope + workflow assignment mới được approve.

## BRULE-062 – Approval Action Audit
Approve/return/reject/delegate/clarification đều phải audit.

## BRULE-063 – Return Requires Comment
Return/reject phải yêu cầu ý kiến tối thiểu theo cấu hình.

## BRULE-064 – SLA Timer
Workflow step có SLA thì timer bắt đầu khi step activated.

## BRULE-065 – Delegation Validation
Delegate chỉ hợp lệ trong thời gian và scope của delegation.

## BRULE-066 – Workflow Completion
Workflow complete khi đạt terminal state hợp lệ, không chỉ do người dùng đổi status thủ công.

---

# 9. Meeting Intelligence

## BRULE-067 – Transcript Is Derivative
Transcript không thay thế audio nguồn; phải giữ liên kết audio.

## BRULE-068 – Decision Verification
Decision candidate từ AI chỉ trở thành official decision sau human confirmation.

## BRULE-069 – Timestamp Citation
Decision/task trích từ meeting phải lưu timestamp khi có transcript timecode.

## BRULE-070 – Speaker Confidence
Speaker identification dưới threshold phải hiển thị chưa xác nhận.

## BRULE-071 – Task Creation from Meeting
Task chỉ được tạo chính thức từ decision/task candidate sau bước xác nhận.

## BRULE-072 – Minutes Version
Biên bản trình duyệt phải có version và context transcript tương ứng.

---

# 10. Reporting & Data Consolidation

## BRULE-073 – Reporting Cycle Required
Mọi submission phải thuộc một Reporting Cycle hoặc được đánh dấu ad-hoc.

## BRULE-074 – Obligation List Version
Danh sách đơn vị phải nộp cần version/effective snapshot theo kỳ.

## BRULE-075 – Schema Approval Gate
Không chạy aggregation chính thức trước khi Metric Schema được approved.

## BRULE-076 – Metric Definition Required
Metric phải có code/name, datatype, unit, aggregation rule và version.

## BRULE-077 – Schema Immutable After Extraction
Schema approved đã dùng extraction không được sửa tại chỗ; phải tạo version mới.

## BRULE-078 – Source Lineage
Value trích xuất phải lưu nguồn file/sheet/cell hoặc đoạn nguồn khi khả thi.

## BRULE-079 – Data Quality Findings
Missing, duplicate, type error, outlier và conflict phải lưu thành finding.

## BRULE-080 – Blocking Data Quality
Finding severity BLOCKER phải được xử lý/override trước final report.

## BRULE-081 – Reconciliation Rule
Mỗi reconciliation phải ghi rule/method và result.

## BRULE-082 – Aggregation Deterministic
Kết quả aggregation số học phải do rule/engine xác định, không giao cho LLM tính tự do khi có thể tính deterministically.

## BRULE-083 – Narrative Uses Confirmed Data
AI narrative chỉ được dùng dataset đã xác nhận/approved hoặc phải đánh dấu draft.

## BRULE-084 – Submission Replacement
Báo cáo thay thế phải giữ lịch sử version và không xóa version cũ.

---

# 11. Templates & Knowledge

## BRULE-085 – Template Scope
Template phải thuộc scope personal, tenant hoặc system.

## BRULE-086 – Publish Permission
Chỉ actor được cấp quyền mới được publish template/knowledge source.

## BRULE-087 – Template Version Pinning
Draft sinh từ template phải lưu template version đã dùng.

## BRULE-088 – Knowledge Access Before Index
Nguồn tri thức chỉ được index/publish trong scope được phép.

## BRULE-089 – RAG Scope
Retrieval phải áp tenant + data scope trước khi ranking.

## BRULE-090 – Citation Required for Grounded Answer
Câu trả lời grounded phải trả citation khi engine có nguồn.

## BRULE-091 – Insufficient Evidence
Khi evidence không đủ, AI phải nói không đủ cơ sở thay vì bịa.

## BRULE-092 – Re-index on Source Change
Nguồn tri thức thay version phải trigger re-index hoặc mark stale.

---

# 12. Executive Intelligence

## BRULE-093 – Inbox by Authority
Executive Inbox chỉ tổng hợp item mà actor có quyền xem/xử lý.

## BRULE-094 – Brief Source Bound
Daily/Weekly Brief chỉ dùng dữ liệu trong data scope và time window tương ứng.

## BRULE-095 – Action Requires Re-authorization
Dù hành động bắt đầu từ Brief/AI answer, backend vẫn phải kiểm tra authorization như thao tác trực tiếp.

## BRULE-096 – Proactive Signal Explainability
Signal quan trọng phải có lý do/nguồn hoặc rule tạo signal.

---

# 13. Governance, Audit & Integration

## BRULE-097 – Audit Append-only
Audit log nghiệp vụ quan trọng phải append-only ở tầng ứng dụng.

## BRULE-098 – Audit Minimum Fields
Audit event tối thiểu: actor, tenant, action, object, timestamp, correlation id, result.

## BRULE-099 – AI Run Audit
AI run phải ghi model/provider, prompt version, token/usage tương ứng khi có, latency, result status.

## BRULE-100 – Provider Abstraction
Nghiệp vụ core không được phụ thuộc trực tiếp provider-specific contract.

## BRULE-101 – Long-running Idempotency
Job async phải có idempotency/correlation key để tránh xử lý trùng ngoài ý muốn.

## BRULE-102 – Retry Policy
Retry chỉ áp lỗi transient; lỗi validation/security không retry tự động.

## BRULE-103 – Dead-letter
Job vượt retry threshold phải vào failure/dead-letter state để can thiệp.

## BRULE-104 – Notification Non-authoritative
Notification không phải nguồn trạng thái nghiệp vụ; trạng thái phải lấy từ core data.

## BRULE-105 – Integration Contract Version
Mỗi integration adapter phải có contract/version.

## BRULE-106 – Secrets Never in Source
Secret/token không được commit vào source hoặc tài liệu public.

## BRULE-107 – Backup Encryption
Backup chứa dữ liệu nhạy cảm phải được bảo vệ theo policy triển khai.

## BRULE-108 – Restore Test Evidence
Backup chỉ được coi là hợp lệ khi có restore test định kỳ và evidence.

## BRULE-109 – Traceability Mandatory
Requirement P0/P1 phải truy được tới Use Case, FR/NFR, design và test.

## BRULE-110 – One Core Codebase
Tùy biến tenant phải ưu tiên config/extension; không fork source theo từng xã/phường.

---

# 14. CRUD & Bulk Interaction


## BRULE-111 – CRUD Availability
Mọi đối tượng nghiệp vụ có thể quản lý phải expose Create/Read/Update/Delete-or-Archive theo quyền và trạng thái nghiệp vụ.

## BRULE-112 – List Select All
Mọi màn danh sách quản lý phải hỗ trợ chọn từng bản ghi và Chọn tất cả.

## BRULE-113 – Bulk Action Authorization
Bulk action phải kiểm tra authorization ở backend; UI selection không tạo quyền.

## BRULE-114 – Destructive Bulk Confirmation
Xóa/Lưu trữ/Vô hiệu hóa hàng loạt phải xác nhận và hiển thị số bản ghi ảnh hưởng.

## BRULE-115 – Immutable Object Protection
Đối tượng đã khóa/final/audit/history không được sửa hoặc hard-delete; phải dùng version mới/archive/revoke theo policy.

## BRULE-116 – Selection Scope
Select All mặc định chọn trang hiện tại; chọn toàn bộ tập kết quả phải lưu snapshot filter/query tại thời điểm thao tác.

## BRULE-117 – Partial Bulk Result
Bulk action phải trả được số thành công/thất bại và lý do từng nhóm khi không thể thực hiện toàn bộ.

## BRULE-118 – Bulk Edit Safety
Bulk edit chỉ cho phép trên field có semantic an toàn; không bulk edit nội dung văn bản chính thức.

## BRULE-119 – Referential Delete Protection
Bản ghi đã được tham chiếu không được hard delete nếu làm mất toàn vẹn lịch sử.

## BRULE-120 – CRUD Audit
Create/Update/Delete/Archive/Bulk action đối với dữ liệu nghiệp vụ phải tạo audit event khi thuộc phạm vi audit.

---


# 15. Cross-Domain Orchestration

## BRULE-121 – Source Link Required
Mọi Work Case/Task/Draft được tạo từ Incoming/Document/Meeting/Report phải lưu source object + source version/provenance khi khả thi.

## BRULE-122 – Cross-Domain Idempotency
Command tạo đối tượng mới từ nguồn khác domain phải có idempotency key hoặc duplicate guard để tránh tạo trùng ngoài ý muốn.

## BRULE-123 – Routing Confirmation Gate
AI routing/suggested owner không được trở thành Task owner chính thức trước human confirmation.

## BRULE-124 – Deadline Provenance Propagation
Deadline được chuyển từ Incoming requirement sang Work Case/Task phải giữ source/provenance và distinction giữa candidate/official.

## BRULE-125 – Approval Return Synchronization
approval.returned phải đưa đúng submitted Draft version/subject về state RETURNED hoặc state được workflow định nghĩa; không tác động version khác.

## BRULE-126 – Approval Approval Synchronization
approval.approved phải áp lên đúng pinned subject version; subject state được cập nhật theo workflow contract và audit correlation.

## BRULE-127 – Rejected Subject Preservation
approval.rejected không xóa Draft/Document/Work Case; subject history và submitted version phải được giữ.

## BRULE-128 – Cross-Domain Correlation
Các object/event sinh ra trong cùng một business chain phải giữ correlationId/causationId để truy vết end-to-end.

## BRULE-129 – Related Object Authorization
Liên kết Work Case ↔ Document/Meeting/Task không tự cấp quyền đọc related object; mỗi lần mở phải re-authorize domain gốc.

## BRULE-130 – Task Completion Non-Transitive
Task COMPLETED không tự động làm Work Case COMPLETED; Work Case closure phải chạy closure gate riêng.

## BRULE-131 – Source Mutation Does Not Rewrite History
Nguồn thay version/metadata sau khi tạo Draft/Approval/Task không được rewrite snapshot/provenance lịch sử; hệ thống tạo stale/reconciliation signal khi cần.

## BRULE-132 – Cross-Domain Event Delivery
State synchronization liên-domain phải dùng transactional/outbox event hoặc command orchestration có idempotency; consumer phải deduplicate.

---

# 16. Knowledge / RAG Governance

## BRULE-133 – Retrieval Authorization Before Ranking
Mọi truy vấn RAG phải áp tenant/data-scope/source-state filter trước semantic ranking/reranking. Không xếp hạng trước rồi mới lọc quyền.

## BRULE-134 – Knowledge Source Authority
Mỗi Knowledge Source phải có authorityLevel/sourceType/owner/effective period. Khi nguồn xung đột, hệ thống phải nêu conflict hoặc áp authority policy có giải thích.

## BRULE-135 – Knowledge Version Pinning
Citation/answer phải pin exact KnowledgeVersion/DocumentVersion đã dùng. Citation lịch sử luôn mở đúng version đó nếu actor còn quyền.

## BRULE-136 – Knowledge Revoke Invalidation
Knowledge Source/Version bị revoke/archive/permission-reduced phải bị loại khỏi retrieval cache/index trong SLA invalidation; không chỉ ẩn ở UI.

## BRULE-137 – Evidence Sufficiency Gate
Nếu evidence không đủ, assistant phải trả insufficient-evidence state thay vì suy diễn thành FACT.

## BRULE-138 – Conflicting Evidence Handling
Nếu các nguồn authoritative mâu thuẫn mà không có deterministic precedence đủ mạnh, answer phải nêu conflict và citation từng phía.

## BRULE-139 – Prompt Injection Isolation
Nội dung nguồn được coi là untrusted data. Instruction bên trong source không được override system/developer/tenant policy hoặc tool permission.

## BRULE-140 – Citation Completeness
Claim được đánh dấu grounded phải có tối thiểu một citation phù hợp; claim tổng hợp nhiều nguồn phải có citation đủ support.

## BRULE-141 – RAG Context Snapshot
Mỗi AI answer lưu retrieval query/context snapshot tối thiểu: source/version refs, policy/filter version, model/prompt version, timestamp và correlationId.

## BRULE-142 – Taxonomy Integrity
Taxonomy assignment phải dùng canonical node/version; không cho circular hierarchy hoặc assignment tới retired node ngoài historical read.

## BRULE-143 – Template Version Immutability
TemplateVersion đã published/used không sửa in-place. Thay đổi tạo version mới; draft/approval pin exact template version.

## BRULE-144 – Assistant Conversation Scope Re-evaluation
Mỗi assistant message phải re-evaluate current permissions và source state; conversation history không cấp quyền truy cập nguồn đã bị revoke.


# 17. Governance / IAM / Platform Administration

## BRULE-145 – Title Does Not Grant Permission
Chức danh/chức vụ không tự cấp quyền hệ thống. Effective authorization = membership + role + permission + data scope + delegation + object state.

## BRULE-146 – Role Assignment Requires Scope
Mọi role assignment phải có tenant/membership và data scope rõ; role không scope không được suy diễn thành toàn tenant trừ system-defined role explicit.

## BRULE-147 – Privilege Escalation Prevention
Actor không được cấp role/permission/data scope vượt quá quyền quản trị mà chính actor được phép quản lý.

## BRULE-148 – User Deactivation Revokes Effective Access
User/membership bị deactivate phải mất session/effective access theo SLA; historical audit/ownership không bị xóa.

## BRULE-149 – Organization Retirement Preserves History
Organization Unit đã được tham chiếu không hard delete; retire/inactive và giữ successor/predecessor/effective dates khi áp dụng.

## BRULE-150 – Delegation Is Bounded
Delegation bắt buộc có effective window, scope, allowed actions và delegator/delegatee; mặc định không cho chain delegation.

## BRULE-151 – Delegation Revocation Immediate
Delegation revoke/expire phải vô hiệu authorization mới ngay; active approval/action phải re-authorize trước submit.

## BRULE-152 – Governance Config Versioning
Document Profile, Prompt, Retention Policy, Integration Config và AI Model/Provider config đã active/published phải version hoặc audit before/after; không silent overwrite.

## BRULE-153 – Secret Separation
API key/token/client secret không trả lại raw sau khi lưu; UI chỉ hiển thị masked metadata. Secret không xuất hiện trong log/audit/export.

## BRULE-154 – AI Provider Fail-Safe
Provider/model disabled/unhealthy không được dùng cho run mới; fallback chỉ theo explicit policy, không tự đổi sang model khác ngoài allowlist.

## BRULE-155 – Prompt Publishing Gate
Prompt version draft không dùng cho production use case nếu policy yêu cầu published/approved; run phải pin promptVersionId.

## BRULE-156 – Evaluation Reproducibility
Evaluation run phải pin dataset/version, model/provider, prompt version, configuration và metric definitions để tái lập kết quả.

## BRULE-157 – Audit Append-Only and Export Controlled
Audit event không sửa/xóa từ UI; export audit cần permission, scope, filter snapshot và export audit event.

## BRULE-158 – Retention Cannot Bypass Legal Hold
Retention/archival/deletion job không được xóa object dưới legal hold hoặc record-retention blocker.

## BRULE-159 – Job Operations Are State-Aware
Retry/cancel/bulk job operations chỉ hợp lệ theo job state và phải idempotent; không retry job đã succeeded trừ explicit rerun contract.

## BRULE-160 – Session and Preference Scope
Session revocation áp đúng user/session; app preference chỉ thay đổi presentation/user preference, không được dùng để thay đổi authorization/security policy.

# 18. Business Rule → Requirement Mapping

| Nhóm rule | BRD chính |
|---|---|
| 001–010 | BR-001..003, 057..059 |
| 011–020 | BR-004..005, 044, 068 |
| 021–028 | BR-006..012 |
| 029–040 | BR-013..019, 061..063 |
| 041–047 | BR-020..023 |
| 048–057 | BR-021..026 |
| 058–066 | BR-027..029, 059 |
| 067–072 | BR-030..034 |
| 073–084 | BR-035..044 |
| 085–092 | BR-045..050 |
| 093–096 | BR-051..054 |
| 097–110 | BR-060..072 |
| 111–120 | Cross-cutting CRUD/UI/Data Governance |
| 121–132 | Cross-Domain Orchestration |
| 133–144 | Knowledge / RAG Governance |
| 145–160 | Governance / IAM / Platform Administration |

---

# 19. Rule Enforcement Layers

| Layer | Ví dụ |
|---|---|
| UI | required field, warning, affordance |
| API | authz, validation, state transition |
| Domain Service | workflow, task, report rules |
| Database | tenant constraint, uniqueness |
| AI Orchestrator | grounding, prompt/model trace |
| Search/RAG | tenant/data scope filtering |
| Job System | idempotency/retry |
| Audit | append-only event |
| CI/CD | secret scan, traceability check |

---

# 20. Exit Criteria

Business Rule Catalog được coi là baseline khi:
- các rule trọng yếu của 12 domain đều được định danh;
- rule có thể kiểm thử;
- không mâu thuẫn Product Boundary;
- rule P0/P1 được phản ánh trong FR/NFR/SRS;
- thay đổi rule phải qua change control.
