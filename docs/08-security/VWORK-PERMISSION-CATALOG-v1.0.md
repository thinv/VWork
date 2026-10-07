# VWork – Permission Catalog v1.0

**Phạm vi khởi tạo:** SC-01 Identity / Shell / Executive. Catalog này sẽ được mở rộng theo từng Screen Batch.

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
