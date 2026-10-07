# VWork – Event Catalog v1.0

**Mục tiêu:** Chuẩn hóa domain/integration events dùng cho outbox, async processing, notification, search projection và tích hợp ngoài.

---

# 1. Event Envelope

```json
{
  "eventId": "uuid",
  "eventType": "task.assigned.v1",
  "eventVersion": 1,
  "tenantId": "uuid",
  "aggregateType": "Task",
  "aggregateId": "uuid",
  "occurredAt": "2026-10-07T10:00:00+07:00",
  "correlationId": "uuid",
  "causationId": "uuid",
  "actorId": "uuid",
  "data": {}
}
```

Rules:
- immutable.
- at-least-once delivery.
- consumer idempotent.
- eventType versioned.
- payload tối thiểu, không chứa binary/raw sensitive content.

---

# 2. Identity/Organization Events

EVT-IAM-001 tenant.created.v1  
EVT-IAM-002 tenant.status-changed.v1  
EVT-IAM-003 membership.created.v1  
EVT-IAM-004 membership.disabled.v1  
EVT-IAM-005 role.assigned.v1  
EVT-IAM-006 role.revoked.v1  
EVT-IAM-007 delegation.created.v1  
EVT-IAM-008 delegation.expired.v1  
EVT-IAM-009 document-profile.changed.v1

Consumers: audit, cache invalidation, notification, permission projection.

---

# 3. Document Events

EVT-DOC-001 document.created.v1  
EVT-DOC-002 document.version-created.v1  
EVT-DOC-003 document.version-locked.v1  
EVT-DOC-004 document.finalized.v1  
EVT-DOC-005 document.archived.v1  
EVT-DOC-006 document.quarantined.v1  
EVT-DOC-007 export.completed.v1

Consumers:
- search indexer.
- intelligence pipeline.
- retention.
- notification.
- audit projection.

---

# 4. Intelligence Events

EVT-INT-001 extraction.requested.v1  
EVT-INT-002 extraction.completed.v1  
EVT-INT-003 extraction.failed.v1  
EVT-INT-004 low-confidence.detected.v1  
EVT-INT-005 extracted-field.verified.v1  
EVT-INT-006 source-conflict.detected.v1

---

# 5. Draft/Review Events

EVT-DRF-001 draft.created.v1  
EVT-DRF-002 draft.generation-requested.v1  
EVT-DRF-003 draft.generated.v1  
EVT-DRF-004 review.requested.v1  
EVT-DRF-005 review.completed.v1  
EVT-DRF-006 review.blocker-detected.v1  
EVT-DRF-007 review.finding-overridden.v1  
EVT-DRF-008 draft.submitted.v1  
EVT-DRF-009 package.generated.v1

---

# 6. Incoming Events

EVT-INC-001 incoming.registered.v1  
EVT-INC-002 incoming.analyzed.v1  
EVT-INC-003 incoming.requirement-verified.v1  
EVT-INC-004 incoming.converted-to-case.v1  
EVT-INC-005 incoming.response-package-generated.v1

---

# 7. Work Events

EVT-WRK-001 work-case.created.v1  
EVT-WRK-002 work-case.completed.v1  
EVT-WRK-003 task.created.v1  
EVT-WRK-004 task.assigned.v1  
EVT-WRK-005 task.accepted.v1  
EVT-WRK-006 task.progress-updated.v1  
EVT-WRK-007 task.blocked.v1  
EVT-WRK-008 task.due-soon.v1  
EVT-WRK-009 task.overdue.v1  
EVT-WRK-010 task.completed.v1  
EVT-WRK-011 task.handed-over.v1  
EVT-WRK-012 task.evidence-submitted.v1

Consumers:
notification, executive inbox, signal engine, analytics.

---

# 8. Workflow Events

EVT-WFL-001 workflow.started.v1  
EVT-WFL-002 approval.requested.v1  
EVT-WFL-003 approval.approved.v1  
EVT-WFL-004 approval.returned.v1  
EVT-WFL-005 approval.rejected.v1  
EVT-WFL-006 approval.clarification-requested.v1  
EVT-WFL-007 approval.delegated.v1  
EVT-WFL-008 workflow.sla-breached.v1  
EVT-WFL-009 workflow.completed.v1  
EVT-WFL-010 workflow.failed.v1

---

# 9. Meeting Events

EVT-MTG-001 meeting.created.v1  
EVT-MTG-002 transcript.requested.v1  
EVT-MTG-003 transcript.completed.v1  
EVT-MTG-004 decision.candidate-created.v1  
EVT-MTG-005 decision.confirmed.v1  
EVT-MTG-006 meeting-task.created.v1  
EVT-MTG-007 minutes.generated.v1  
EVT-MTG-008 minutes.submitted.v1  
EVT-MTG-009 participant.updated.v1  
EVT-MTG-010 attendance.updated.v1  
EVT-MTG-011 transcript.corrected.v1  
EVT-MTG-012 decision.updated.v1  
EVT-MTG-013 decision.reconciliation-required.v1  
EVT-MTG-014 decision.task-reconciled.v1  
EVT-MTG-015 minutes.updated.v1  
EVT-MTG-016 meeting.archived.v1

---

# 10. Reporting Events

EVT-RPT-001 reporting-cycle.created.v1  
EVT-RPT-002 report.submitted.v1  
EVT-RPT-003 schema.suggested.v1  
EVT-RPT-004 schema.approved.v1  
EVT-RPT-005 extraction.completed.v1  
EVT-RPT-006 data-quality.blocker-detected.v1  
EVT-RPT-007 reconciliation.completed.v1  
EVT-RPT-008 aggregation.completed.v1  
EVT-RPT-009 report-draft.generated.v1  
EVT-RPT-010 reporting-cycle.closed.v1

---

# 11. Knowledge Events

EVT-KNO-001 template.published.v1  
EVT-KNO-002 template.archived.v1  
EVT-KNO-003 knowledge.published.v1  
EVT-KNO-004 knowledge.reindex-requested.v1  
EVT-KNO-005 knowledge.indexed.v1  
EVT-KNO-006 knowledge.archived.v1

Consumers: search/vector indexer, cache invalidation, audit.

---

# 12. Executive/AI/Platform Events

EVT-EXE-001 signal.raised.v1  
EVT-EXE-002 brief.generated.v1  
EVT-AI-001 ai-job.started.v1  
EVT-AI-002 ai-job.completed.v1  
EVT-AI-003 ai-job.failed.v1  
EVT-AI-004 ai-quota.threshold.v1  
EVT-GOV-001 job.dead-lettered.v1  
EVT-GOV-002 integration.failed.v1  
EVT-GOV-003 backup.completed.v1  
EVT-GOV-004 restore-test.completed.v1

---

# 13. Event Payload Rules

Payload phải:
- có identifiers.
- có state tối thiểu cho consumer.
- không copy toàn aggregate.
- không copy raw document content.
- không copy secret.
- có source version nếu event liên quan version.

Ví dụ task.assigned.v1:
```json
{
  "taskId": "uuid",
  "workCaseId": "uuid",
  "ownerMembershipId": "uuid",
  "ownerUnitId": "uuid",
  "dueAt": "2026-10-10T17:00:00+07:00",
  "priority": "HIGH"
}
```

---

# 14. Delivery Semantics

Baseline: at-least-once.

Consumer bắt buộc:
- dedup eventId.
- transaction local.
- không giả định ordering toàn hệ thống.
- ordering theo aggregate có thể dựa sequence/version nếu cần.

---

# 15. Event Ordering

Thêm aggregateSequence cho aggregate cần ordering nghiêm:
- WorkflowInstance.
- Task.
- ReportingCycle.

Consumer phát hiện gap phải retry/resync bằng API/read model.

---

# 16. Dead-letter

Event publish/consume fail vượt threshold:
- DEAD_LETTER.
- alert.
- operator inspect.
- replay có audit.

---

# 17. External Events

Không expose toàn bộ internal events ra ngoài.

Whitelist outbound integration events:
- task.completed.v1
- document.finalized.v1
- workflow.completed.v1
- report-draft.generated.v1

External contract có schema riêng và compatibility policy.

---

# 18. Event Governance

Mỗi event cần:
- owner module.
- schema.
- version.
- producer.
- consumers.
- PII classification.
- retention.
- test fixture.

Breaking payload change → version mới.


# 16. Cross-Domain Orchestration Events

EVT-XD-001 source.stale.v1  
Khi source version/metadata ảnh hưởng downstream context sau khi object downstream đã được tạo.

EVT-XD-002 downstream.reconciliation-required.v1  
Yêu cầu người dùng xác nhận việc đồng bộ owner/deadline/content từ source thay đổi sang downstream object.

EVT-XD-003 post-approval-action.requested.v1  
Yêu cầu thực thi Post-Approval Action theo WorkflowDefinitionVersion.

EVT-XD-004 post-approval-action.completed.v1  
Post-action hoàn tất; payload chỉ chứa target refs/result metadata.

EVT-XD-005 post-approval-action.failed.v1  
Post-action thất bại; retry/dead-letter theo policy.

## 16.1 Consumer Mapping
- approval.approved.v1 → Draft state sync + optional EVT-XD-003.
- approval.returned.v1 → exact submitted Draft state RETURNED.
- approval.rejected.v1 → exact submitted Draft state REJECTED.
- task.completed.v1 → Work Case projection/progress update only.
- source.stale.v1 → tạo reconciliation signal; không silent rewrite downstream.
- incoming.converted-to-case.v1 → không tạo lại Case nếu idempotency đã xử lý.

## 16.2 Idempotency
Consumer phải deduplicate theo eventId.
Post-approval action deduplicate theo workflowInstanceId + actionId + subjectVersion.
