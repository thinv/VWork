# VWork – Audit Event Catalog v1.0

**Phạm vi khởi tạo:** SC-01 Identity / Shell / Executive.

## 1. Quy ước
Audit ID: `AUD-<DOMAIN>-NNN`.

Minimum payload:
auditEventId, tenantId, actorId, membershipId, action, objectType, objectId, result, correlationId, occurredAt; before/after hoặc metadata khi cần.

## 2. Identity / Session
- AUD-IAM-001 LOGIN_SUCCEEDED
- AUD-IAM-002 LOGIN_FAILED
- AUD-IAM-003 LOGOUT
- AUD-IAM-004 CONTEXT_SELECTED
- AUD-IAM-005 CONTEXT_SWITCH_DENIED
- AUD-IAM-006 REAUTH_SUCCEEDED
- AUD-IAM-007 REAUTH_FAILED
- AUD-IAM-008 SESSION_REVOKED

## 3. Notification / Job
- AUD-GOV-001 NOTIFICATION_MARK_READ
- AUD-GOV-002 NOTIFICATION_MARK_ALL_READ
- AUD-GOV-003 NOTIFICATION_CLEARED
- AUD-GOV-004 JOB_VIEW_SENSITIVE
- AUD-GOV-005 JOB_RETRY_REQUESTED
- AUD-GOV-006 JOB_CANCEL_REQUESTED

## 4. Executive
- AUD-EXE-001 INBOX_OPENED
- AUD-EXE-002 INBOX_ITEM_OPENED
- AUD-EXE-003 BULK_SELECTION_ACTION
- AUD-EXE-004 BRIEF_GENERATION_REQUESTED
- AUD-EXE-005 BRIEF_OPENED
- AUD-EXE-006 ASSISTANT_CONVERSATION_CREATED
- AUD-EXE-007 ASSISTANT_MESSAGE_SUBMITTED
- AUD-EXE-008 SIGNAL_OPENED

## 5. Audit Policy
- Login failures phải log nhưng không chứa password/secret.
- Read audit chỉ bắt buộc với sensitive resource/use case; các ID trên là baseline.
- Không log raw prompt/source content nếu không cần; lưu hashes/references.
- Audit append-only.
