# VWork – Screen Gap Closure Plan v1.0

**Nguồn:** VWORK-SCREEN-COMPLETENESS-AUDIT-v1.0.md  
**Phạm vi:** 117 Web + 34 Mobile = 151 Screen ID.

# 1. Mục tiêu
Đưa từng Screen ID từ PARTIAL/GAP về ENGINEERING READY bằng cách đóng đủ 10 chiều:
CRUD → Select All → Permission → State → Business Rule → API → Master Data → Exception → Audit → Test/UAT.

# 2. Kết quả audit đầu vào
- 151 Screen ID.
- 0 màn full PASS.
- 118 PARTIAL.
- 33 GAP.
- 125 màn có API mapping cụ thể.
- 26 màn API mapping thiếu/generic.
- 151 màn chưa có permission code screen-specific.
- 151 màn chưa có BRULE mapping screen-specific.
- 151 màn chưa có audit-event mapping screen-specific.
- 151 màn chưa có test ID screen-specific.

# 3. Thứ tự đóng gap

## P0-01 – Chuẩn hóa Screen Definition v1.1
Mỗi màn phải bổ sung:
- Screen ID
- Actor
- Permission codes
- Data scope
- CRUD actions
- Bulk actions
- Select All semantics
- State visibility/action matrix
- BRULE IDs
- API IDs
- Master Data dependencies
- Exception IDs
- Audit Event IDs
- Test Case IDs
- UAT IDs
- Acceptance Criteria

## P0-02 – Đóng 26 API mapping gaps
Nhóm ưu tiên:
- WEB-WC-008 Kết quả/đầu ra
- MOB-AUTH-003 Reauth
- MOB-INB-002 Inbox item
- MOB-DOC-003 AI summary
- MOB-AI-003 Citation
- MOB-PRO-004 Settings
- WEB-MD-001..020

Với Master Data, map API-MD-001..030 vào từng màn.

## P0-03 – Permission Matrix
Tạo permission code canonical:
- *.READ
- *.CREATE
- *.UPDATE
- *.ARCHIVE
- *.DELETE_DRAFT
- *.BULK
- *.APPROVE
- *.OVERRIDE
- *.EXPORT
- *.ADMIN

Không dùng Actor như permission.

## P0-04 – Screen State/Action Matrix
Ví dụ:
Document FINAL:
- Edit = false
- Delete = false
- Create New Version = true
- Archive = permission-dependent

Task COMPLETED:
- Edit = false/limited
- Reopen = permission REOPEN
- Delete = false
- View history = true

## P0-05 – CRUD/Select All explicit
Mỗi collection screen phải chỉ rõ:
- Add
- Edit
- Delete/Archive semantics
- row select
- Select All page
- Select All filtered result
- allowed bulk actions
- partial result behavior

# 4. P1

## P1-01 – BRULE mapping
Mỗi action trên màn phải có BRULE IDs tương ứng.

## P1-02 – Master Data dependencies
Ví dụ:
- Document screens → DocumentType, Field, Urgency, Confidentiality, Agency
- Task screens → Priority, OrgUnit, EvidenceType
- Reporting → PeriodType, UnitOfMeasure, MetricType
- Meeting → MeetingType, ParticipantRole

## P1-03 – Exception UX
Mỗi exception:
- Error code
- Message tiếng Việt
- Recoverable action
- Retryability
- Required audit

## P1-04 – Audit Events
Mỗi write/action:
- event code
- actor
- object
- before/after or delta
- correlation id
- result

## P1-05 – Screen-specific tests
Quy ước:
TC-SCR-<SCREEN-ID>-NNN

Tối thiểu:
- happy path
- permission deny
- state deny
- validation
- stale version nếu có
- CRUD/Bulk nếu list
- audit assertion
- tenant isolation

# 5. Batches đóng gap

## Batch SC-01 – Identity/Shell/Executive
WEB-AUTH, WEB-SHELL, WEB-EXE, MOB-AUTH, MOB-HOME, MOB-INB.
Mục tiêu: auth/session/permission/notification/inbox contract.

## Batch SC-02 – Document/Incoming
WEB-DOC, WEB-INC, MOB-DOC.
Mục tiêu: document lifecycle, metadata, OCR, incoming routing.

## Batch SC-03 – Draft/Workflow
WEB-DRF, WEB-APR, MOB-APR.
Mục tiêu: versioning, blocker, submitted version, approval.

## Batch SC-04 – Work
WEB-WC, WEB-TSK, MOB-WRK.
Mục tiêu: owner, state, deadline, evidence, handover.

## Batch SC-05 – Meeting
WEB-MTG, MOB-MTG.
Mục tiêu: participant, transcript, decision, task, minutes.

## Batch SC-06 – Reporting
WEB-RPT.
Mục tiêu: obligations, submissions, schema, quality, reconciliation, aggregation.

## Batch SC-07 – Knowledge/AI
WEB-KNO, MOB-AI.
Mục tiêu: source authority, RAG scope, citation, evidence sufficiency.

## Batch SC-08 – Governance
WEB-ADM, MOB-PRO, MOB-NOT.
Mục tiêu: admin CRUD, immutable audit, provider/config governance.

## Batch SC-09 – Master Data
WEB-MD-001..020.
Mục tiêu: full CRUD, version/effective date, import diff, taxonomy.

# 6. Definition of ENGINEERING READY
Một Screen chỉ được gắn ENGINEERING READY khi:
- 10 chiều audit đều PASS hoặc N/A có lý do;
- API-ID không generic;
- permission code explicit;
- action/state matrix explicit;
- CRUD/Bulk AC explicit nếu applicable;
- exception mapping đầy đủ;
- audit event explicit;
- test ID có;
- traceability không orphan.

# 7. Gate cho Claude/Codex
Claude/Codex không được:
- tự thêm action để bù Screen Spec thiếu;
- tự suy permission từ Actor;
- tự chọn delete semantics;
- tự invent state;
- tự invent master data enum;
- tự map generic API;
- bỏ Select All/Bulk vì UI chưa mô tả chi tiết.

Nếu Screen chưa ENGINEERING READY, trả lại BA/Product để đóng gap.
