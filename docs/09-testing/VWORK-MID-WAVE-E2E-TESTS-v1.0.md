# VWork – Mid-Wave Cross-Domain E2E Test Specification v1.0

**Chain:** Incoming → Draft → Approval → Work Case → Task.

## E2E-MW-001 – Incoming to Work, retry-safe
Given Incoming requirement VERIFIED và routing human-confirmed.
When gọi create Work Case/Task hai lần với cùng idempotency key.
Then chỉ một canonical Case/Task được tạo; source/provenance/correlation giữ nguyên.

## E2E-MW-002 – Incoming to Draft to Approve exact version
Create Draft từ Incoming source version → AI Review → Submit version N → Approve.
Assert approval subjectVersion=N; Draft N → APPROVED; version khác không đổi.

## E2E-MW-003 – Return, edit, resubmit
Submit Draft v1 → Return → edit/create v2 → resubmit → approve v2.
Assert approval v1 terminal history retained; approval mới pin v2; không chuyển approval cũ sang v2.

## E2E-MW-004 – Deadline source correction
Task được tạo với deadline human-confirmed từ Incoming.
Sau đó nguồn Incoming được đính chính deadline.
Assert Task deadline không silent rewrite; stale/reconciliation signal tạo; người có quyền quyết định update.

## E2E-MW-005 – Case closure with blocking task
Case có Task A completed, Task B blocking active.
Call complete Case.
Expect conflict STATE_HAS_BLOCKING_TASK; Case không đổi state.

## E2E-MW-006 – Related-object permission revoked
User từng có quyền Document liên quan Case, sau đó quyền Document bị revoke.
Open Case remains allowed; drilldown Document denied/not-found theo policy; timeline không leak title/content restricted.

## E2E-MW-007 – Approval event replay
Replay approval.approved.v1 cùng eventId.
Consumer deduplicate; Draft state transition/audit side effect xảy ra một lần.

## E2E-MW-008 – Cross-tenant chain isolation
Tenant A đoán Incoming/Draft/Approval/Case/Task identifiers Tenant B.
Không read/update/action/search/export được; không leak existence qua related-object projection.

## E2E-MW-009 – Owner candidate vs official owner
AI suggests Unit X; human confirms Unit Y.
Created Task primary owner phải là Y; AI candidate X chỉ giữ provenance/history nếu policy.

## E2E-MW-010 – Correlation trace
Start từ Incoming action với correlationId C.
Assert downstream Draft/Workflow/Case/Task events đều giữ C hoặc causation chain hợp lệ.

# Exit
- E2E-MW-001..010 là P0 trước release core pilot.
- Mỗi test lưu evidence build SHA, environment, dataset, result.
