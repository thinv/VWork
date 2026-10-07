# VWork – Unified Work Inbox Business & System Specification v1.0

# 1. Goal
“Việc của tôi” là một hàng đợi cá nhân hợp nhất, không phải hệ thống Task chính thức thứ hai.

# 2. Sources
- VWork Task
- external Task/Directive
- Approval Item
- Incoming Requirement
- Meeting Decision/Follow-up
- Reporting Obligation
- Reminder
- Executive action item
- AI-discovered candidate sau human confirmation

# 3. UnifiedWorkItem
Fields:
workItemId, tenantId, title, sourceType, sourceSystem, sourceObjectId, sourceOfTruth, sourceVersion, assignedTo, ownerProjection, priority, dueAt, statusProjection, actionability, primaryAction, deepLink, contextRefs[], lastSyncedAt, staleState, conflictState, createdAt, updatedAt.

# 4. Projection Principle
UnifiedWorkItem là projection.
Không được:
- thay external authoritative Task state trực tiếp;
- coi projection ID là source ID;
- xoá source khi xóa projection;
- tự biến AI candidate thành official work item.

# 5. Normalized Status
OPEN / IN_PROGRESS / WAITING / REVIEW / DONE / CANCELLED / UNKNOWN.

Mỗi connector có mapping version từ source status → normalized status.
UI vẫn có thể hiển thị source status chi tiết.

# 6. Actionability
- NATIVE_ACTION
- CONNECTOR_ACTION
- DEEP_LINK
- READ_ONLY
- NEEDS_CONFIRMATION

# 7. Primary User Flows
## UWI-01 View My Work
Filter theo Today / Overdue / Upcoming / Waiting / Approvals / Meetings / Reports / Source.

## UWI-02 Open Context
Mở source/object context và re-authorize.

## UWI-03 Perform Action
Native → VWork API.
Integrated write → Connector Action.
No write connector → Deep Link.
Candidate → confirmation flow.

## UWI-04 Refresh/Reconcile
Refresh source; update projection; preserve prior snapshot/history.

## UWI-05 Personal Prioritization
User pin/snooze/tag personal view nếu policy cho; không làm đổi official priority ngoài source action.

# 8. Deduplication
Work items có thể correlate qua source refs/correlation.
Không auto-merge hai authoritative items chỉ vì title giống nhau.

# 9. Stale/Conflict
STALE nếu freshness SLA vượt ngưỡng.
CONFLICT nếu source changed while local pending action/context dựa version cũ.
Action nhạy cảm phải refresh/revalidate.

# 10. AI in Inbox
AI được:
- summarize;
- explain urgency;
- suggest next action;
- group;
- generate brief.

AI không được:
- mark official task complete;
- change official deadline;
- assign official owner;
- execute irreversible external action không confirm.

# 11. Permissions
Mỗi item re-authorize theo target object/source policy.
Inbox visibility không cấp quyền mở source.

# 12. API Delta Proposal
Future IDs to allocate after architecture review:
- GET /work-inbox
- GET /work-inbox/{id}
- POST /work-inbox/refresh
- POST /work-inbox/{id}/action
- PATCH /work-inbox/{id}/preference
- POST /work-inbox/bulk-refresh

# 13. Events
work-item.projected
work-item.refreshed
work-item.stale
work-item.conflict-detected
external-action.requested/completed/failed

# 14. Audit
Log actor, source refs, actionability, connector correlation, version used, result.

# 15. NFR
- list p95 ≤3s;
- cached projection allowed by policy;
- source refresh async;
- no cross-tenant projection;
- idempotent source refresh.

# 16. Acceptance
- một user nhìn được nhiều nguồn trong một Inbox;
- item luôn biết nguồn;
- external official state không silently mutated;
- stale/conflict rõ;
- deep-link/connector/native action phân biệt;
- source authorization enforced.