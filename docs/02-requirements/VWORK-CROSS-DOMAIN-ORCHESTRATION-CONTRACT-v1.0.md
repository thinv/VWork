# VWork – Cross-Domain Orchestration Contract v1.0

**Phạm vi:** Incoming Document → Draft → Approval → Work Case → Task.

# 1. Mục tiêu
Khóa cách các domain nối với nhau để không domain nào tự suy diễn state/owner/deadline/version của domain khác.

# 2. Canonical Chain
IncomingRecord
→ VerifiedRequirement / ConfirmedRouting
→ Draft hoặc WorkCase/Task
→ DraftVersion submitted
→ WorkflowInstance / ApprovalItem
→ approval outcome
→ WorkCase/Task execution
→ Evidence/Output
→ WorkCase closure.

# 3. Shared Cross-Domain Fields
Mọi object tạo từ nguồn khác domain phải hỗ trợ khi phù hợp:
- sourceType
- sourceId
- sourceVersionId
- sourceRef / provenance
- correlationId
- causationId
- idempotencyKey
- createdFromAction
- snapshot metadata cần cho lịch sử

# 4. Incoming → Work Case
Command: API-INC-008.

Preconditions:
- incoming record readable;
- routing đã được human-confirmed;
- primary owner/owner unit hợp lệ;
- source requirement có provenance.

Output:
- WorkCase.sourceType=INCOMING;
- sourceId=incomingRecordId;
- source requirement ids;
- owner/priority/deadline confirmed;
- correlationId giữ từ incoming flow.

Idempotency:
- cùng incoming + conversion purpose + idempotencyKey không tạo duplicate main case.

Event:
incoming.converted-to-case.v1 → work-case.created.v1.

# 5. Incoming → Task
Command: API-INC-009.

Preconditions:
- requirement VERIFIED/CORRECTED;
- routing confirmed;
- exactly one primary owner;
- deadline official hoặc null, không lấy candidate chưa xác nhận.

Output:
- Task source/provenance;
- deadlineSource;
- ownerSource;
- WorkCase link nếu có.

# 6. Incoming/Document → Draft
Command: API-DRF-001.

Draft Context phải pin:
- incomingRecordId optional;
- sourceDocumentVersionId;
- verified requirement ids;
- WorkCaseId optional;
- templateVersionId;
- contextSnapshotId.

Không dùng “latest source” sau khi draft đã tạo nếu chưa explicit refresh.

# 7. Draft → Approval
Command: API-WFL-005.

Submitted package:
- draftId;
- exact draftVersionId;
- reviewRunId/finding snapshot;
- blocker status;
- source/context references;
- workflowDefinitionVersionId.

Event:
draft.submitted.v1
→ workflow.started.v1
→ approval.requested.v1.

# 8. Approval → Draft synchronization

## APPROVED
approval.approved.v1 consumer:
- validate pinned subject=draft/version;
- Draft state SUBMITTED → APPROVED;
- workflow continues/terminates;
- never approve another version.

## RETURNED
approval.returned.v1:
- exact submitted Draft becomes RETURNED;
- user edit creates/continues new version according policy;
- old approval history immutable.

## REJECTED
approval.rejected.v1:
- Draft state REJECTED;
- no hard delete;
- resubmit only by new workflow/branch policy.

## CLARIFICATION
approval.clarification-requested.v1:
- Draft/subject remains pinned;
- workflow WAITING/clarification state;
- SLA pause policy from workflow definition.

# 9. Approval → Work Case/Task
Approval outcome không tự tạo Work Case/Task trừ khi workflow definition có explicit post-action.

Post-action contract phải khai báo:
- actionType;
- target domain;
- source version;
- owner/deadline resolution;
- idempotency key.

Không suy hành động từ text comment của approver.

# 10. Work Case → Task
API-WRK-006 creates Task:
- workCaseId required for case-scoped task;
- source chain inherited as reference, không thay source-of-truth;
- Task owner explicit;
- deadline provenance explicit.

# 11. Task → Work Case
task.completed.v1:
- cập nhật projection/progress;
- KHÔNG auto-complete Work Case.

Work Case complete:
API-WRK-017 chạy closure gate:
- blocking task;
- required output;
- critical approval;
- policy.

# 12. Deadline Propagation
Deadline có:
- value;
- sourceType;
- sourceId/sourceLocation;
- sourceKind = EXTRACTED_CANDIDATE | HUMAN_CONFIRMED | LEADER_ASSIGNMENT | SLA_DERIVED | MANUAL;
- confirmedBy;
- confirmedAt.

Candidate deadline không được biến thành official Task deadline nếu chưa confirmation rule.

# 13. Owner Propagation
Suggested owner:
AI_CANDIDATE.

Confirmed routing:
HUMAN_CONFIRMED.

Task owner chỉ lấy từ:
- confirmed routing;
- leader assignment;
- explicit manual assignment;
- deterministic configured rule đã được phê duyệt.

# 14. Authorization Boundary
Work Case link không cấp quyền Document.
Task link không cấp quyền Incoming.
Approval link không cấp quyền Draft nếu actor không còn subject scope.
Mọi drill-down re-authorize target domain.

# 15. Transaction / Event Reliability
Trong cùng domain transaction:
- write aggregate;
- write outbox event.

Consumer:
- idempotent theo eventId;
- lưu processed consumer message;
- retry transient;
- dead-letter sau threshold.

# 16. Correlation
Một chain phải truy được:
Incoming → requirement → routing decision → Draft/Case/Task → Approval → Task evidence → Case output.

CorrelationId giữ xuyên command/event nếu cùng business intent.
CausationId chỉ event/action trực tiếp trước đó.

# 17. Reconciliation / Stale Signals
Tạo stale/reconciliation signal khi:
- source document version đổi sau draft;
- routing owner đổi sau task creation;
- deadline nguồn bị đính chính;
- approval subject version mismatch;
- meeting/source decision bị sửa sau task creation.

Không silently rewrite downstream object.

# 18. Acceptance
1. Không duplicate conversion do retry.
2. Owner candidate không thành official owner tự động.
3. Deadline provenance xuyên chain.
4. Approval exact version.
5. Return/Reject state sync đúng subject.
6. Task complete không auto-close case.
7. Cross-domain drilldown không leak quyền.
8. correlationId truy được end-to-end.
9. Event consumer idempotent.
