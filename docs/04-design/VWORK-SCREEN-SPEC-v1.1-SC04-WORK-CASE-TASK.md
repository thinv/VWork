# VWork – Screen Specification v1.1 – Batch SC-04 Work Case / Task

**Phạm vi:** 22 Screen ID  
**Format:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước
- Một Task có đúng một primary owner.
- Coordinator/Watcher không phải owner.
- Deadline có source/provenance; thay đổi deadline phải lưu history + reason.
- Progress percent không thay Task state.
- Blocking semantics quyết định closure.
- Evidence/output bắt buộc được kiểm trước REVIEW/COMPLETED.
- Reassign sau ACCEPTED tạo Handover.
- Bulk complete mặc định OFF.
- Related object luôn re-authorize, không inherit quyền mù quáng từ Work Case.

---

## WEB-WC-001 – Danh sách hồ sơ
**CRUD:** Create; Read; Edit eligible case; delete draft unreferenced; Archive terminal case.  
**Bulk:** Select/Select All; bulk priority/category/archive/export.  
**Permission Code:** WRK.CASE.READ, CREATE, UPDATE, DELETE_DRAFT, ARCHIVE, BULK, EXPORT.  
**Data Scope:** SELF_CREATED / ASSIGNED / ORG_UNIT / ORG_TREE / TENANT / EXPLICIT.  
**Allowed States:** DRAFT, OPEN, IN_PROGRESS, WAITING, REVIEW, COMPLETED, ARCHIVED, CANCELLED.  
**BRULE:** 048..060,095,111..120.  
**API:** API-WRK-001..004,017..020.  
**Master Data:** WorkCaseType, Priority, OrgUnit, Status.  
**Exception:** EX-WRK-007..015; EX-CRUD-001..005.  
**Audit Event:** AUD-WRK-001..007.  
**Test ID:** TC-SCR-WEB-WC-001-01..09.  
**UAT:** UAT-73..75,85,23.  
**Acceptance Criteria:** full CRUD/select-all/bulk; completed case không hard delete; partial bulk result; cross-tenant = 0.

## WEB-WC-002 – Tạo hồ sơ
**CRUD:** Create/Edit draft/Cancel draft.  
**Bulk:** N/A.  
**Permission Code:** WRK.CASE.CREATE, WRK.CASE.UPDATE.  
**Data Scope:** target org + source object scope.  
**Allowed States:** DRAFT → OPEN.  
**BRULE:** 048..051,095,109.  
**API:** API-WRK-001,004.  
**Master Data:** WorkCaseType, Priority, OrgUnit, SourceType.  
**Exception:** EX-WRK-007, EX-INC-014.  
**Audit Event:** AUD-WRK-001,002.  
**Test ID:** TC-SCR-WEB-WC-002-01..06.  
**UAT:** UAT-73,59.  
**Acceptance Criteria:** source/provenance required when created from source; owner unit/owner validation; no duplicate main case outside policy.

## WEB-WC-003 – Tổng quan hồ sơ
**CRUD:** Read; Edit allowed fields; Complete/Reopen/Archive commands; Add output/task through subflows.  
**Bulk:** N/A detail.  
**Permission Code:** WRK.CASE.READ, UPDATE, COMPLETE, REOPEN, ARCHIVE, OUTPUT_MANAGE.  
**Data Scope:** case scope + each related object re-authorization.  
**Allowed States:** DRAFT/OPEN/IN_PROGRESS/WAITING/REVIEW/COMPLETED/ARCHIVED/CANCELLED.  
**BRULE:** 048..060,095,115,120.  
**API:** API-WRK-003,004,017..019,021.  
**Master Data:** Priority, Status, WorkCaseType.  
**Exception:** EX-WRK-008..013, EX-WRK-018.  
**Audit Event:** AUD-WRK-002..005.  
**Test ID:** TC-SCR-WEB-WC-003-01..09.  
**UAT:** UAT-74,75,88.  
**Acceptance Criteria:** close gate checks blocking task/output/approval; reopen reason mandatory; related resources không leak.

## WEB-WC-004 – Timeline
**CRUD:** Read-only timeline; source event mutation N/A.  
**Bulk:** Select/Select All events; export only.  
**Permission Code:** WRK.CASE.READ.  
**Data Scope:** case scope; event detail may redact inaccessible related object.  
**Allowed States:** all case states.  
**BRULE:** 060,095,119,120.  
**API:** API-WRK-005.  
**Master Data:** event type/status labels.  
**Exception:** EX-WRK-018.  
**Audit Event:** export audit if sensitive.  
**Test ID:** TC-SCR-WEB-WC-004-01..05.  
**UAT:** UAT-75,88.  
**Acceptance Criteria:** chronological immutable timeline; inaccessible related object không lộ content.

## WEB-WC-005 – Tài liệu liên quan
**CRUD:** Add relation/link; Read; remove relation if allowed; source document not deleted.  
**Bulk:** Select/Select All; bulk link/unlink eligible.  
**Permission Code:** WRK.CASE.UPDATE, DOC.DOCUMENT.READ.  
**Data Scope:** case scope + each document scope.  
**Allowed States:** case DRAFT..COMPLETED editable by policy; ARCHIVED read-only.  
**BRULE:** 020,048,060,095,113,119.  
**API:** API-DOC-004 + relation/link command through work-case update policy.  
**Master Data:** DocumentRelationType, DocumentType.  
**Exception:** EX-WRK-018, EX-DOC-007.  
**Audit Event:** AUD-WRK-002 plus relation audit.  
**Test ID:** TC-SCR-WEB-WC-005-01..06.  
**UAT:** UAT-88,04.  
**Acceptance Criteria:** link không cấp quyền mới; unlink không xóa document; select-all respects document scope.

## WEB-WC-006 – Nhiệm vụ trong hồ sơ
**CRUD:** Create Task; Read; edit via task detail; cancel/archive action by task rules.  
**Bulk:** Select/Select All; bulk assign/priority/remind; bulk complete OFF.  
**Permission Code:** WRK.TASK.READ, CREATE, ASSIGN, BULK, REMIND.  
**Data Scope:** case + task scope.  
**Allowed States:** all Task states.  
**BRULE:** 050..060,095,112..120.  
**API:** API-WRK-006..009,028,031.  
**Master Data:** Priority, TaskStatus, OrgUnit, EvidenceType.  
**Exception:** EX-TSK-001,002,015,016.  
**Audit Event:** AUD-TSK-001,002,015,016.  
**Test ID:** TC-SCR-WEB-WC-006-01..08.  
**UAT:** UAT-77,85,86.  
**Acceptance Criteria:** one primary owner; select-all/bulk safe; bulk complete disabled.

## WEB-WC-007 – Cuộc họp liên quan
**CRUD:** Add/link meeting; Read; unlink relation; meeting source not deleted.  
**Bulk:** Select/Select All; bulk link/unlink eligible.  
**Permission Code:** WRK.CASE.UPDATE + meeting read permission when defined.  
**Data Scope:** case + each meeting scope.  
**Allowed States:** case active states; archived read-only.  
**BRULE:** 048,060,095,113,119.  
**API:** API-MTG-002 + relation handling policy.  
**Master Data:** MeetingType.  
**Exception:** EX-WRK-018.  
**Audit Event:** AUD-WRK-002.  
**Test ID:** TC-SCR-WEB-WC-007-01..05.  
**UAT:** UAT-88,14.  
**Acceptance Criteria:** meeting permission rechecked; link/unlink audited; no access inheritance leak.

## WEB-WC-008 – Kết quả/đầu ra
**CRUD:** Add output; Read; edit metadata before final; remove unreferenced output; archive/retain final output.  
**Bulk:** Select/Select All; bulk classify/export/remove eligible.  
**Permission Code:** WRK.CASE.OUTPUT_MANAGE, WRK.CASE.READ, WRK.CASE.EXPORT.  
**Data Scope:** case scope + output source scope.  
**Allowed States:** output DRAFT/FINAL/ARCHIVED; case DRAFT..COMPLETED.  
**BRULE:** 048,052,058,060,095,113,119,120.  
**API:** API-WRK-021..023.  
**Master Data:** RequiredOutputType, EvidenceType, DocumentType.  
**Exception:** EX-WRK-009,014, EX-CRUD-002..004.  
**Audit Event:** AUD-WRK-008,009.  
**Test ID:** TC-SCR-WEB-WC-008-01..07.  
**UAT:** UAT-76,74.  
**Acceptance Criteria:** final/referenced output protected; provenance retained; closure checks required outputs.

---

## WEB-TSK-001 – Việc của tôi
**CRUD:** Read own/assigned; update via task actions; Create only through allowed create action; no hard delete terminal.  
**Bulk:** Select/Select All; bulk accept/remind/tag where policy; bulk complete OFF.  
**Permission Code:** WRK.TASK.READ, ACCEPT, PROGRESS, EVIDENCE, BULK.  
**Data Scope:** ASSIGNED/WATCHING/SELF.  
**Allowed States:** DRAFT, ASSIGNED, ACCEPTED, IN_PROGRESS, WAITING, REVIEW, COMPLETED, CANCELLED.  
**BRULE:** 050..060,095,112..120.  
**API:** API-WRK-007,010,028.  
**Master Data:** TaskStatus, Priority.  
**Exception:** EX-TSK-005,015,016,017.  
**Audit Event:** AUD-TSK-003,015.  
**Test ID:** TC-SCR-WEB-TSK-001-01..08.  
**UAT:** UAT-78,85,87.  
**Acceptance Criteria:** only assigned scope; stale item action conflicts; no bulk complete.

## WEB-TSK-002 – Toàn bộ công việc
**CRUD:** Create; Read; Edit/manage; Cancel/Reassign/Reopen by permission.  
**Bulk:** Select/Select All; bulk assign/priority/remind/export; partial result.  
**Permission Code:** WRK.TASK.READ, CREATE, UPDATE, ASSIGN, REASSIGN, CANCEL, REOPEN, BULK, REMIND, EXPORT.  
**Data Scope:** ORG_UNIT/ORG_TREE/TENANT/EXPLICIT manager scope.  
**Allowed States:** all Task states.  
**BRULE:** 050..060,095,111..120.  
**API:** API-WRK-006..009,024,027..029,031.  
**Master Data:** TaskStatus, Priority, OrgUnit, RequiredOutputType.  
**Exception:** EX-TSK-001..017.  
**Audit Event:** AUD-TSK-001,002,010..016.  
**Test ID:** TC-SCR-WEB-TSK-002-01..10.  
**UAT:** UAT-77,80,83..85,23.  
**Acceptance Criteria:** manager scope enforced; one primary owner; bulk partial result; deadline/reassign history.

## WEB-TSK-003 – Chi tiết Task
**CRUD:** Read; Edit allowed metadata; assign/accept/progress/evidence/review/cancel/reopen/handover commands.  
**Bulk:** N/A detail.  
**Permission Code:** all relevant WRK.TASK.* according to action.  
**Data Scope:** task object + source scope.  
**Allowed States:** all Task states with explicit action matrix.  
**BRULE:** 050..060,095,115,120.  
**API:** API-WRK-008..016,024..030.  
**Master Data:** TaskStatus, Priority, EvidenceType, RequiredOutputType, OrgUnit.  
**Exception:** EX-TSK-001..018.  
**Audit Event:** AUD-TSK-001..014.  
**Test ID:** TC-SCR-WEB-TSK-003-01..12.  
**UAT:** UAT-77..84,88.  
**Acceptance Criteria:** action/state matrix; provenance visible; source revoke safe; optimistic lock.

## WEB-TSK-004 – Tạo/Giao Task
**CRUD:** Create; Edit draft; assign; cancel draft.  
**Bulk:** Can create multiple tasks from multiple verified requirements only via explicit batch flow; not implicit.  
**Permission Code:** WRK.TASK.CREATE, ASSIGN.  
**Data Scope:** case/source scope + target owner scope.  
**Allowed States:** DRAFT → ASSIGNED/ACCEPTED per policy.  
**BRULE:** 050..054,095,109.  
**API:** API-WRK-006,009.  
**Master Data:** Priority, OrgUnit, RequiredOutputType, EvidenceType.  
**Exception:** EX-TSK-001..004.  
**Audit Event:** AUD-TSK-001,002.  
**Test ID:** TC-SCR-WEB-TSK-004-01..07.  
**UAT:** UAT-77,80,59.  
**Acceptance Criteria:** exactly one owner; deadline source persisted; coordinator N allowed; assign audit.

## WEB-TSK-005 – Cập nhật tiến độ
**CRUD:** Add progress update; edit current draft note before submit if policy; no delete committed progress history.  
**Bulk:** N/A.  
**Permission Code:** WRK.TASK.PROGRESS.  
**Data Scope:** assignee/delegated task scope.  
**Allowed States:** ACCEPTED, IN_PROGRESS, WAITING; terminal states read-only.  
**BRULE:** 053..056,095,115,120.  
**API:** API-WRK-011.  
**Master Data:** BlockerSeverity, ProgressStatus optional.  
**Exception:** EX-TSK-006,013,017.  
**Audit Event:** AUD-TSK-004,014.  
**Test ID:** TC-SCR-WEB-TSK-005-01..06.  
**UAT:** UAT-79,87.  
**Acceptance Criteria:** % không tự đổi status; blocker fields required; committed progress immutable.

## WEB-TSK-006 – Nộp kết quả
**CRUD:** Add evidence; Read; remove unreferenced evidence; submit for review/complete.  
**Bulk:** Select evidence; bulk remove eligible before review; no bulk submit tasks here.  
**Permission Code:** WRK.TASK.EVIDENCE, COMPLETE.  
**Data Scope:** assignee/task scope.  
**Allowed States:** IN_PROGRESS/WAITING → REVIEW or COMPLETED by policy; REVIEW evidence mostly read-only.  
**BRULE:** 054,057,058,095,113,119.  
**API:** API-WRK-012,013,030.  
**Master Data:** EvidenceType, RequiredOutputType.  
**Exception:** EX-TSK-007,008,013.  
**Audit Event:** AUD-TSK-005,006,007,008.  
**Test ID:** TC-SCR-WEB-TSK-006-01..07.  
**UAT:** UAT-81,82.  
**Acceptance Criteria:** required evidence gate; referenced evidence protected; review transition correct.

## WEB-TSK-007 – Lịch sử & bàn giao
**CRUD:** Read history; Create handover/reassign command; history immutable.  
**Bulk:** Select/Select All history; export only.  
**Permission Code:** WRK.TASK.READ, REASSIGN.  
**Data Scope:** task scope.  
**Allowed States:** handover from ACCEPTED/IN_PROGRESS/WAITING/REVIEW as policy permits.  
**BRULE:** 055,060,095,115,119.  
**API:** API-WRK-014,016.  
**Master Data:** HandoverReason, OrgUnit.  
**Exception:** EX-TSK-002,010,017.  
**Audit Event:** AUD-TSK-010.  
**Test ID:** TC-SCR-WEB-TSK-007-01..06.  
**UAT:** UAT-83.  
**Acceptance Criteria:** owner old/new + reason + time preserved; no overwrite history.

## WEB-TSK-008 – Quá hạn/Blocked
**CRUD:** Read projection; update via reminder/blocker/source task command; no delete source task.  
**Bulk:** Select/Select All; bulk remind/reassign/priority per permission; partial result.  
**Permission Code:** WRK.TASK.READ, REMIND, REASSIGN, BULK.  
**Data Scope:** manager scope.  
**Allowed States:** overdue flag independent from Task state; blockers OPEN/RESOLVED.  
**BRULE:** 055,056,095,112..120.  
**API:** API-WRK-007,028,031.  
**Master Data:** Priority, BlockerSeverity, TaskStatus.  
**Exception:** EX-TSK-013,015,017.  
**Audit Event:** AUD-TSK-014..016.  
**Test ID:** TC-SCR-WEB-TSK-008-01..07.  
**UAT:** UAT-79,85.  
**Acceptance Criteria:** overdue không tự đổi status; bulk remind no duplicate spam beyond policy; blocker drilldown authoritative.

---

## MOB-WRK-001 – Việc của tôi
**CRUD:** Read/update through actions; no hard delete.  
**Bulk:** selection mode; Select All; bulk accept/remind where policy; bulk complete OFF.  
**Permission Code:** WRK.TASK.READ, ACCEPT, PROGRESS, EVIDENCE, BULK.  
**Data Scope:** ASSIGNED/WATCHING/SELF.  
**Allowed States:** all Task states.  
**BRULE:** 050..060,095,112..120.  
**API:** API-WRK-007,010,028.  
**Master Data:** TaskStatus, Priority.  
**Exception:** EX-TSK-005,015..017.  
**Audit Event:** AUD-TSK-003,015.  
**Test ID:** TC-SCR-MOB-WRK-001-01..07.  
**UAT:** UAT-78,85,87.  
**Acceptance Criteria:** selection mode; stale refresh; no offline bulk complete.

## MOB-WRK-002 – Chi tiết Task
**CRUD:** Read; action commands permitted; edit limited fields by state.  
**Bulk:** N/A.  
**Permission Code:** relevant WRK.TASK.* per action.  
**Data Scope:** task + source scope.  
**Allowed States:** all Task states.  
**BRULE:** 050..060,095.  
**API:** API-WRK-008..016,024..030.  
**Master Data:** TaskStatus, Priority, EvidenceType.  
**Exception:** EX-TSK-001..018.  
**Audit Event:** AUD-TSK-001..014.  
**Test ID:** TC-SCR-MOB-WRK-002-01..09.  
**UAT:** UAT-77..84,87,88.  
**Acceptance Criteria:** refresh before state action; source access rechecked; history visible.

## MOB-WRK-003 – Cập nhật tiến độ
**CRUD:** Add progress/blocker update; history immutable.  
**Bulk:** N/A.  
**Permission Code:** WRK.TASK.PROGRESS.  
**Data Scope:** assignee task scope.  
**Allowed States:** ACCEPTED/IN_PROGRESS/WAITING.  
**BRULE:** 053..056,095.  
**API:** API-WRK-011.  
**Master Data:** BlockerSeverity.  
**Exception:** EX-TSK-006,013,017.  
**Audit Event:** AUD-TSK-004,014.  
**Test ID:** TC-SCR-MOB-WRK-003-01..05.  
**UAT:** UAT-79,87.  
**Acceptance Criteria:** progress does not imply complete; offline conflict safe.

## MOB-WRK-004 – Nộp kết quả nhanh
**CRUD:** Add/remove eligible evidence; submit for review/complete.  
**Bulk:** multi-select evidence removal before review only.  
**Permission Code:** WRK.TASK.EVIDENCE, COMPLETE.  
**Data Scope:** assignee task.  
**Allowed States:** IN_PROGRESS/WAITING; REVIEW read-only evidence except policy.  
**BRULE:** 054,057,058,095.  
**API:** API-WRK-012,013,030.  
**Master Data:** EvidenceType, RequiredOutputType.  
**Exception:** EX-TSK-007,008,017.  
**Audit Event:** AUD-TSK-005..008.  
**Test ID:** TC-SCR-MOB-WRK-004-01..06.  
**UAT:** UAT-81,82,87.  
**Acceptance Criteria:** required evidence enforced; upload retry idempotent; review state authoritative.

## MOB-WRK-005 – Hồ sơ công việc
**CRUD:** Read; limited case actions by permission; no destructive action by default on mobile.  
**Bulk:** N/A detail.  
**Permission Code:** WRK.CASE.READ, UPDATE, COMPLETE, REOPEN where mobile policy enables.  
**Data Scope:** case + related object scopes.  
**Allowed States:** all case states.  
**BRULE:** 048..060,095.  
**API:** API-WRK-003,005,017,018,021.  
**Master Data:** WorkCaseType, Priority, Status.  
**Exception:** EX-WRK-008..014, EX-TSK-018.  
**Audit Event:** AUD-WRK-002..004.  
**Test ID:** TC-SCR-MOB-WRK-005-01..07.  
**UAT:** UAT-74..76,87,88.  
**Acceptance Criteria:** closure gate same Web; related object permission safe; stale cached case cannot complete.

## MOB-WRK-006 – Giao việc nhanh
**CRUD:** Create Task + assign; edit draft fields before submit.  
**Bulk:** optional multi-task from selected verified requirements only; not default.  
**Permission Code:** WRK.TASK.CREATE, ASSIGN.  
**Data Scope:** case/source + target owner scope.  
**Allowed States:** DRAFT → ASSIGNED/ACCEPTED.  
**BRULE:** 050..054,095,109.  
**API:** API-WRK-006,009.  
**Master Data:** Priority, OrgUnit, RequiredOutputType.  
**Exception:** EX-TSK-001..004.  
**Audit Event:** AUD-TSK-001,002.  
**Test ID:** TC-SCR-MOB-WRK-006-01..06.  
**UAT:** UAT-77,80,87.  
**Acceptance Criteria:** exactly one primary owner; deadline source visible; submit refreshes case/owner state.

# Batch Exit Criteria
SC-04 ENGINEERING READY khi:
- 22/22 màn đủ 13 trường.
- Work Case closure/reopen/output semantics explicit.
- Task owner/deadline/evidence/review/handover/bulk semantics explicit.
- Permission/Audit/Exception/Test IDs tồn tại.
- OpenAPI lint PASS.
