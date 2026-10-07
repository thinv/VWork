# VWork – Permission Catalog v1.0

**Phạm vi hiện tại:** SC-01 Identity / Shell / Executive + SC-02 Document / Incoming. Catalog tiếp tục mở rộng theo từng Screen Batch.

## 1. Quy ước
Permission code: `<DOMAIN>.<RESOURCE>.<ACTION>`.

Permission không đồng nghĩa Actor/Role. Backend quyết định theo:
Permission + Tenant + Data Scope + Object State + Delegation.

## 2. Identity / Session
- IAM.SESSION.LOGIN
- IAM.SESSION.LOGOUT
- IAM.SESSION.REAUTH
- IAM.SESSION.READ_OWN
- IAM.SESSION.REVOKE_OWN
- IAM.CONTEXT.READ_OWN
- IAM.CONTEXT.SWITCH_OWN

## 3. Notification / Job
- GOV.NOTIFICATION.READ_OWN
- GOV.NOTIFICATION.MARK_READ_OWN
- GOV.NOTIFICATION.MARK_ALL_READ_OWN
- GOV.NOTIFICATION.CLEAR_OWN
- GOV.JOB.READ_OWN
- GOV.JOB.READ_SCOPE
- GOV.JOB.RETRY
- GOV.JOB.CANCEL

## 4. Executive
- EXE.DASHBOARD.READ
- EXE.INBOX.READ
- EXE.INBOX.READ_ITEM
- EXE.INBOX.BULK_SELECT
- EXE.SIGNAL.READ
- EXE.BRIEF.READ
- EXE.BRIEF.GENERATE
- EXE.ASSISTANT.USE
- EXE.ASSISTANT.READ_OWN

## 5. Data Scope
- SELF: chỉ dữ liệu của membership hiện tại.
- ASSIGNED: object được giao/được duyệt.
- ORG_UNIT: đơn vị hiện tại.
- ORG_TREE: đơn vị + cây con nếu được cấp.
- TENANT: toàn tenant.
- EXPLICIT: danh sách scope được cấp.

## 6. Quy tắc
1. UI permission guard chỉ là UX; backend luôn re-authorize.
2. Deny overrides allow.
3. Context switch chỉ tới membership ACTIVE.
4. Executive Inbox không mở rộng quyền đọc object gốc.
5. Job/Notification không trở thành nguồn authoritative cho state nghiệp vụ.


## 7. Document / Intelligence
- DOC.DOCUMENT.READ
- DOC.DOCUMENT.CREATE
- DOC.DOCUMENT.UPDATE_METADATA
- DOC.DOCUMENT.CREATE_VERSION
- DOC.DOCUMENT.ARCHIVE
- DOC.DOCUMENT.DELETE_DRAFT
- DOC.DOCUMENT.EXPORT
- DOC.DOCUMENT.BULK
- DOC.RELATION.READ
- DOC.RELATION.CREATE
- DOC.RELATION.DELETE
- INT.OCR.READ
- INT.OCR.RUN
- INT.OCR.CORRECT
- INT.EXTRACTION.READ
- INT.EXTRACTION.RUN
- INT.EXTRACTION.VERIFY
- INT.SUMMARY.RUN
- INT.SUMMARY.READ

## 8. Incoming Document
- INC.RECORD.READ
- INC.RECORD.CREATE
- INC.RECORD.UPDATE
- INC.RECORD.ARCHIVE
- INC.RECORD.BULK
- INC.ANALYZE.RUN
- INC.REQUIREMENT.READ
- INC.REQUIREMENT.VERIFY
- INC.SUGGESTION.READ
- INC.WORK_CASE.CREATE
- INC.TASK.CREATE
- INC.RESPONSE_PACKAGE.CREATE

## 9. Document Data Scope
Document/Incoming permissions luôn kết hợp một trong:
- SELF_CREATED
- ASSIGNED
- ORG_UNIT
- ORG_TREE
- TENANT
- EXPLICIT

Văn bản có classification/mật/khẩn có thể thu hẹp scope thêm theo security policy.
