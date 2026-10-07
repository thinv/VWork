# VWork – Mid-Wave Consistency Audit v1.0

**Phạm vi:** Incoming Document → Draft → Approval → Work Case → Task  
**Thời điểm:** sau SC-04  
**Mục tiêu:** Rà consistency liên-domain trước SC-05 Meeting.

# 1. Executive Summary
- Domain screen closure: SC-01..SC-04 hoàn thành.
- 77/151 Screen ID ENGINEERING READY.
- Audit phát hiện **12 finding**:
  - 6 P0
  - 4 P1
  - 2 P2
- Sau remediation trong cùng wave:
  - P0 OPEN: **0**
  - P1 OPEN: **0**
  - P2 OPEN: **2**

# 2. Findings

| ID | Sev | Finding | Trước | Remediation | Sau |
|---|---|---|---|---|---|
| MW-001 | P0 | Incoming→Case/Task chưa khóa cross-domain idempotency/source link | GAP | BRULE-121/122 + Orchestration Contract §4/5 | CLOSED |
| MW-002 | P0 | AI suggested owner có nguy cơ bị hiểu như official owner | PARTIAL | BRULE-123 + owner propagation §13 | CLOSED |
| MW-003 | P0 | Deadline candidate→Task chưa có canonical provenance contract | PARTIAL | BRULE-124 + deadline contract §12 | CLOSED |
| MW-004 | P0 | approval.returned/approved chưa map explicit về đúng Draft version | GAP | BRULE-125/126/127 + §8 | CLOSED |
| MW-005 | P0 | Task completed có thể bị implement sai thành auto-close Work Case | PARTIAL | BRULE-130 + closure gate §11 | CLOSED |
| MW-006 | P0 | Related-object link có nguy cơ tạo permission inheritance | PARTIAL | BRULE-129 + §14 | CLOSED |
| MW-007 | P1 | correlationId/causationId chưa bắt buộc xuyên chain | GAP | BRULE-128 + §16 | CLOSED |
| MW-008 | P1 | Cross-domain event consumer idempotency chưa explicit | PARTIAL | BRULE-132 + §15 | CLOSED |
| MW-009 | P1 | Source mutation sau downstream creation cần reconciliation signal thống nhất | PARTIAL | BRULE-131 + EVT-XD-001/002 | CLOSED |
| MW-010 | P1 | Post-approval automated actions chưa có catalog/config schema chi tiết | GAP | VWORK-POST-APPROVAL-ACTION-CATALOG-v1.0.md + EVT-XD-003..005 | CLOSED |
| MW-011 | P2 | Snapshot field set theo từng source type chưa machine-readable | PARTIAL | Orchestration contract baseline | OPEN-P2 |
| MW-012 | P2 | Cross-domain trace query/API cho support/admin chưa đặc tả | GAP | Có correlation IDs nhưng chưa query contract | OPEN-P2 |

# 3. Trace Consistency

## 3.1 Incoming → Draft
Status: PASS baseline.
- Source document version pinned.
- Verified requirement ids allowed.
- AI candidate not official.
- Template/context version pinned.
Remaining: machine-readable ContextSnapshot schema chi tiết ở data design wave.

## 3.2 Incoming → Work Case
Status: PASS.
- Confirmed routing gate.
- Source/provenance.
- Owner.
- Duplicate/idempotency guard.
- Audit/correlation.

## 3.3 Incoming → Task
Status: PASS.
- Requirement verified.
- Exactly one owner.
- Deadline provenance.
- Case optional.
- No AI auto-assign.

## 3.4 Draft → Approval
Status: PASS.
- exact DraftVersion pinned.
- review/blocker gate.
- workflow definition version pinned.
- stale protection.

## 3.5 Approval → Draft
Status: PASS after remediation.
- approved/returned/rejected map exact subject version.
- history append-only.
- no silent approval transfer between versions.

## 3.6 Approval → Work
Status: PASS.
- No implicit work action: PASS.
- Explicit post-action requirement: PASS.
- Post-action catalog/config schema: PASS.

## 3.7 Work Case → Task
Status: PASS.
- Task source link.
- one primary owner.
- deadline provenance.
- handover.
- evidence/review.

## 3.8 Task → Work Case
Status: PASS.
- task completion updates progress only.
- closure remains explicit Work Case command.
- blockers/outputs/approval checked.

# 4. Permission Consistency
PASS:
- source links do not grant access;
- each drilldown re-authorizes;
- delegation scoped;
- manager Task scope separated from assignee scope.

Mandatory test:
Tenant A/Org A cannot infer title/metadata of inaccessible related object through Case timeline/output/task.

# 5. State Consistency
Canonical transitions aligned:
- Incoming lifecycle ≠ technical Document state, intentionally.
- Draft RETURNED from approval.returned.
- Approval terminal state immutable.
- Task REVIEW return → IN_PROGRESS.
- Case complete independent from Task completed.

No conflicting P0 state transition found after remediation.

# 6. Provenance Consistency
PASS baseline for:
- incoming requirement;
- draft context;
- submitted version;
- task source;
- deadline.
P1 follow-up:
- standardize sourceRef schema machine-readable for all domains.

# 7. Audit Consistency
Required chain:
AUD-INC-* → AUD-DRF-* → AUD-WFL-* → AUD-WRK/AUD-TSK-*.

All state-changing actions carry correlationId.
No audit event may include raw secret or excessive source content.

# 8. Test Gaps
Need cross-domain E2E additions:
- E2E-MW-001 Incoming verified requirement → Work Case + Task, retry safe.
- E2E-MW-002 Incoming → Draft → Review → Submit → Approve exact version.
- E2E-MW-003 Return Draft → edit new version → resubmit → approve.
- E2E-MW-004 Source deadline correction after Task creation → reconciliation signal, no silent rewrite.
- E2E-MW-005 Task complete with another blocking task → Case completion denied.
- E2E-MW-006 Related document permission revoked → Case/Task drilldown denied without metadata leak.
- E2E-MW-007 Approval retry/event replay → no duplicate state transition.
- E2E-MW-008 Cross-tenant chain isolation end-to-end.

# 9. Gate Result
**MID-WAVE CORE GATE: PASS WITH P1/P2 FOLLOW-UP**

Cho phép chuyển SC-05 Meeting vì:
- 6/6 P0 findings đã CLOSED.
- Không còn P0/P1 mở.
- 2 P2 còn lại đã định danh và không được Claude/Codex tự suy diễn.

# 10. Follow-up trước Final 151-Screen Audit
- MW-011 machine-readable cross-domain SourceRef/Snapshot schema.
- MW-012 trace query/admin support contract.
