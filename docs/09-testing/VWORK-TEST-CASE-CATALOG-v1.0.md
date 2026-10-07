# VWork – Test Case Catalog v1.0

## Foundation
TC-FND-001 Monorepo clean install.
TC-FND-002 Build Web/Mobile/Core/AI skeleton.
TC-FND-003 OpenAPI lint.
TC-FND-004 Migration 0001 clean DB.
TC-FND-005 Health live/ready.

## Tenant/Auth
TC-IAM-001 Login tenant hợp lệ.
TC-IAM-002 User không membership bị chặn.
TC-IAM-003 Disabled user session revoked.
TC-IAM-004 Role + scope allow đúng.
TC-IAM-005 Explicit deny ưu tiên.
TC-IAM-006 Delegation hợp lệ.
TC-IAM-007 Delegation hết hạn denied.
TC-IAM-008 Không delegate vượt quyền.
TC-IAM-009 Tenant A đoán UUID Tenant B → denied.
TC-IAM-010 Search/RAG cross-tenant → zero leakage.

## Document
TC-DOC-001 Upload hợp lệ.
TC-DOC-002 MIME invalid reject.
TC-DOC-003 Malware quarantine.
TC-DOC-004 Duplicate warning.
TC-DOC-005 Final version immutable.
TC-DOC-006 New version không overwrite.
TC-DOC-007 Export re-check permission.
TC-DOC-008 Provenance mở đúng source version.
TC-DOC-009 Cross-tenant download denied.
TC-DOC-010 Storage failure không false-success.

## Intelligence
TC-INT-001 OCR tiếng Việt.
TC-INT-002 Low confidence review.
TC-INT-003 Extract metadata.
TC-INT-004 Deadline + provenance.
TC-INT-005 MISSING không thành FACT.
TC-INT-006 INFERENCE được đánh dấu.
TC-INT-007 Source conflict warning.
TC-INT-008 Retry transient.

## Draft/Review
TC-DRF-001 Grounded draft.
TC-DRF-002 Insufficient evidence warning/abstain.
TC-DRF-003 Template dữ kiện cũ không thành fact mới.
TC-DRF-004 Context snapshot pin source version.
TC-DRF-005 Review không silent mutation.
TC-DRF-006 BLOCKER chặn submit.
TC-DRF-007 Override cần quyền+lý do.
TC-DRF-008 Rewrite không vượt selection.
TC-DRF-009 Provider timeout retry.
TC-DRF-010 Cross-tenant source không vào prompt.

## Work/Workflow
TC-WRK-001 Create Work Case.
TC-WRK-002 Assign Task.
TC-WRK-003 Invalid transition denied.
TC-WRK-004 Completion cần evidence.
TC-WRK-005 Case không đóng khi blocking task.
TC-WRK-006 Handover audit.
TC-WRK-007 Overdue đúng timezone.
TC-WFL-001 Workflow pin version.
TC-WFL-002 Authorized approve.
TC-WFL-003 Unauthorized denied.
TC-WFL-004 Stale approval → 409.
TC-WFL-005 Return cần comment.
TC-WFL-006 Delegation expiry.
TC-WFL-007 SLA breach event.
TC-WFL-008 Approval audit.

## Meeting/Reporting
TC-MTG-001 Transcript timestamp.
TC-MTG-002 Decision provenance.
TC-MTG-003 Confirm trước tạo Task.
TC-RPT-001 Schema approval gate.
TC-RPT-002 Approved schema immutable.
TC-RPT-003 Missing/duplicate/type/outlier findings.
TC-RPT-004 Deterministic aggregation.
TC-RPT-005 Provenance drilldown.
TC-RPT-006 BLOCKER chặn final.

## RAG/Mobile/Security
TC-RAG-001 Correct citation.
TC-RAG-002 Insufficient evidence abstain.
TC-RAG-003 Scope revoke removes retrieval.
TC-RAG-004 Prompt injection ignored.
TC-MOB-001 Secure token storage.
TC-MOB-002 Push minimal payload.
TC-MOB-003 Deep-link re-authorize.
TC-MOB-004 Stale approval blocked.
TC-SEC-001 Secret scan.
TC-SEC-002 XSS rich text.
TC-SEC-003 SSRF adapter URL.
TC-SEC-004 Webhook replay.
TC-SEC-005 AI exfiltration attempt.
TC-OPS-001 Worker crash recovery.
TC-OPS-002 Duplicate event idempotent.
TC-OPS-003 Backup restore.
TC-OPS-004 Provider outage degrade.

## Release Gate
Mọi TC P0 trong scope release phải PASS; không release khi còn S0/S1.
