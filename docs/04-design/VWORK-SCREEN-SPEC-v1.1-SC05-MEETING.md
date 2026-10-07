# VWork – Screen Specification v1.1 – Batch SC-05 Meeting

**Phạm vi:** 12 Screen ID  
**Format:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước
- Transcript là derivative, audio là source.
- Low-confidence speaker phải hiển thị chưa xác nhận.
- Decision Candidate ≠ MeetingDecision.
- Human confirmation bắt buộc trước khi tạo Task.
- Decision sửa sau khi đã tạo Task → reconciliation, không silent update.
- Minutes submitted/approved/final immutable.
- Related Task/Document/Work Case luôn re-authorize domain gốc.

## WEB-MTG-001 – Danh sách cuộc họp
**CRUD:** Create; Read; Edit eligible meeting; Archive; hard delete chỉ draft chưa referenced nếu policy.  
**Bulk:** Select/Select All page/filtered; bulk archive, notify, export.  
**Permission Code:** MTG.MEETING.READ, CREATE, UPDATE, ARCHIVE, BULK.  
**Data Scope:** INVITED / PARTICIPANT / CHAIR / SECRETARY / ORG_UNIT / ORG_TREE / TENANT / EXPLICIT.  
**Allowed States:** DRAFT, SCHEDULED, IN_PROGRESS, COMPLETED, CANCELLED, ARCHIVED.  
**BRULE:** 067..072,095,111..120,121,128,129,131,132.  
**API:** API-MTG-001..004,014,015.  
**Master Data:** MeetingType, MeetingStatus, OrgUnit, LocationType.  
**Exception:** EX-MTG-006,007,024,025; EX-CRUD-001..005.  
**Audit Event:** AUD-MTG-001..004.  
**Test ID:** TC-SCR-WEB-MTG-001-01..08.  
**UAT:** UAT-89,23.  
**Acceptance Criteria:** full CRUD/select-all/bulk; archive state-aware; cross-tenant leak=0; cancelled/archived not editable.

## WEB-MTG-002 – Tạo cuộc họp
**CRUD:** Create/Edit draft; cancel draft.  
**Bulk:** N/A.  
**Permission Code:** MTG.MEETING.CREATE, UPDATE, MTG.PARTICIPANT.CREATE, MTG.AGENDA.CREATE.  
**Data Scope:** creator + target participant/org scope.  
**Allowed States:** DRAFT → SCHEDULED.  
**BRULE:** 067..072,095,109,121.  
**API:** API-MTG-001,004,017,022.  
**Master Data:** MeetingType, OrgUnit, ParticipantRole, LocationType.  
**Exception:** EX-MTG-007..010.  
**Audit Event:** AUD-MTG-001,002,005,009.  
**Test ID:** TC-SCR-WEB-MTG-002-01..07.  
**UAT:** UAT-89..91.  
**Acceptance Criteria:** time range valid; chair/secretary explicit; duplicate participant prevented; agenda can be draft.

## WEB-MTG-003 – Tổng quan cuộc họp
**CRUD:** Read; Edit metadata; manage participants/attendance; Archive; no hard delete referenced meeting.  
**Bulk:** Participant/attendance bulk via subviews; meeting detail itself N/A.  
**Permission Code:** MTG.MEETING.READ, UPDATE, ARCHIVE, MTG.PARTICIPANT.*, MTG.MINUTES.READ.  
**Data Scope:** meeting scope + each related object scope.  
**Allowed States:** DRAFT/SCHEDULED/IN_PROGRESS/COMPLETED/CANCELLED/ARCHIVED.  
**BRULE:** 067..072,095,115,119,121,129,131.  
**API:** API-MTG-003,004,015..020,026,030.  
**Master Data:** MeetingType, AttendanceStatus, ParticipantRole.  
**Exception:** EX-MTG-006,008,009,024,025.  
**Audit Event:** AUD-MTG-002,003,005..008,013.  
**Test ID:** TC-SCR-WEB-MTG-003-01..09.  
**UAT:** UAT-89,90,23.  
**Acceptance Criteria:** participant CRUD; attendance bulk; related object reauth; completed meeting edits limited.

## WEB-MTG-004 – Giấy mời/Agenda
**CRUD:** Parse invitation; Read/Edit parsed candidate; Add/Edit/Delete/Reorder agenda; manage participant candidates.  
**Bulk:** Select/Select All agenda/participants; bulk remove/reorder category/notify where safe.  
**Permission Code:** MTG.MEETING.UPDATE, MTG.PARTICIPANT.*, MTG.AGENDA.*.  
**Data Scope:** meeting + participant target scope.  
**Allowed States:** DRAFT/SCHEDULED; during IN_PROGRESS limited read/edit by secretary policy; completed read-only except correction workflow.  
**BRULE:** 067,070,095,111..120.  
**API:** API-MTG-005,016..026.  
**Master Data:** ParticipantRole, AttendanceStatus, AgendaType.  
**Exception:** EX-MTG-008..010,024.  
**Audit Event:** AUD-MTG-005..013.  
**Test ID:** TC-SCR-WEB-MTG-004-01..09.  
**UAT:** UAT-90,91.  
**Acceptance Criteria:** parsed invitation remains candidate until confirm; agenda order valid; bulk actions partial-safe.

## WEB-MTG-005 – Audio & Transcript
**CRUD:** Upload audio; create transcript run; Read transcript; correct text/speaker; verify segments; source audio immutable except archive policy.  
**Bulk:** Select segments; Select All filtered; bulk verify/mark speaker only when policy permits.  
**Permission Code:** MTG.AUDIO.UPLOAD, MTG.TRANSCRIPT.READ, RUN, CORRECT, VERIFY.  
**Data Scope:** meeting scope; audio/transcript may be narrower.  
**Allowed States:** Audio UPLOADED/VALIDATING/READY/FAILED; Transcript NOT_RUN/QUEUED/RUNNING/REVIEW_REQUIRED/VERIFIED/STALE/FAILED.  
**BRULE:** 067,069,070,095,101..103,111..120,131.  
**API:** API-MTG-006..009,027.  
**Master Data:** AudioFormatPolicy, TranscriptLanguage, SpeakerConfidenceThreshold.  
**Exception:** EX-MTG-011..015,024.  
**Audit Event:** AUD-MTG-014..017.  
**Test ID:** TC-SCR-WEB-MTG-005-01..09.  
**UAT:** UAT-92..94.  
**Acceptance Criteria:** audio preserved; low confidence visible; correction audited; stale transcript if audio/source changes.

## WEB-MTG-006 – Quyết định/Nhiệm vụ
**CRUD:** Extract candidates; Read; Confirm/Edit/Reject candidates; Create Task from confirmed decision; reconcile linked Task when decision changes.  
**Bulk:** Select candidates; bulk reject; bulk confirm only if owner/deadline/evidence rules satisfied; bulk create-task default OFF.  
**Permission Code:** MTG.DECISION.READ, CONFIRM, UPDATE, REJECT, CREATE_TASK, RECONCILE_TASK.  
**Data Scope:** meeting scope + target Task owner/work scope.  
**Allowed States:** CANDIDATE, CONFIRMED, REJECTED; linked-task reconciliation NONE/REQUIRED/RESOLVED.  
**BRULE:** 068..071,095,113,117,121..124,128..132.  
**API:** API-MTG-010..012,028,029.  
**Master Data:** DecisionType, Priority, OrgUnit, RequiredOutputType.  
**Exception:** EX-MTG-016..020,024.  
**Audit Event:** AUD-MTG-018..023.  
**Test ID:** TC-SCR-WEB-MTG-006-01..10.  
**UAT:** UAT-95..97,14,77,80.  
**Acceptance Criteria:** candidate not official; create Task only confirmed; timestamp provenance retained; decision edits trigger reconciliation not silent Task update.

## WEB-MTG-007 – Biên bản
**CRUD:** Generate; Read; Edit draft; Submit; archive historical draft; version on post-submit edits.  
**Bulk:** Select historical versions; bulk export/archive eligible.  
**Permission Code:** MTG.MINUTES.READ, GENERATE, UPDATE, SUBMIT, ARCHIVE.  
**Data Scope:** meeting scope + source transcript/decision scope.  
**Allowed States:** DRAFT, GENERATED, REVIEWING, SUBMITTED, APPROVED, FINAL, ARCHIVED, STALE.  
**BRULE:** 067,068,069,072,095,115,119,121,128,131.  
**API:** API-MTG-013,030..033 + WFL APIs when approval enabled.  
**Master Data:** MinutesTemplate, DocumentType, MeetingType, WorkflowProfile.  
**Exception:** EX-MTG-021..023.  
**Audit Event:** AUD-MTG-024..027.  
**Test ID:** TC-SCR-WEB-MTG-007-01..08.  
**UAT:** UAT-98,99,65.  
**Acceptance Criteria:** source context pinned; incomplete context visible; submitted/final immutable; workflow exact version if approval enabled.

## MOB-MTG-001 – Lịch họp
**CRUD:** Read; create/edit/archive only when mobile policy permits; no hard delete.  
**Bulk:** Selection mode; Select All; bulk archive/notify if permission.  
**Permission Code:** MTG.MEETING.READ, CREATE, UPDATE, ARCHIVE, BULK.  
**Data Scope:** invited/participant/chair/secretary/authorized org scope.  
**Allowed States:** all meeting states.  
**BRULE:** 067..072,095,111..120.  
**API:** API-MTG-001..004,014,015.  
**Master Data:** MeetingType, MeetingStatus.  
**Exception:** EX-MTG-006,007,024,025.  
**Audit Event:** AUD-MTG-001..004.  
**Test ID:** TC-SCR-MOB-MTG-001-01..07.  
**UAT:** UAT-89,100,23.  
**Acceptance Criteria:** selection mode; stale refresh; archive/bulk same rules as Web.

## MOB-MTG-002 – Chi tiết cuộc họp
**CRUD:** Read; limited metadata/attendance edit by permission; related objects via subflows.  
**Bulk:** participant attendance selection supported.  
**Permission Code:** MTG.MEETING.READ, UPDATE, MTG.PARTICIPANT.READ/UPDATE/BULK.  
**Data Scope:** meeting + related object scope.  
**Allowed States:** all meeting states, state-limited actions.  
**BRULE:** 067..072,095,129,131.  
**API:** API-MTG-003,004,016,018,020,026,030.  
**Master Data:** AttendanceStatus, ParticipantRole, MeetingType.  
**Exception:** EX-MTG-006,009,024.  
**Audit Event:** AUD-MTG-002,006,008,013.  
**Test ID:** TC-SCR-MOB-MTG-002-01..07.  
**UAT:** UAT-90,100,23.  
**Acceptance Criteria:** authoritative refresh before action; participant scope safe; attendance audit.

## MOB-MTG-003 – Transcript
**CRUD:** Read transcript; correct segment/speaker when mobile policy permits; no source audio delete.  
**Bulk:** selection mode; bulk verify eligible segments.  
**Permission Code:** MTG.TRANSCRIPT.READ, CORRECT, VERIFY.  
**Data Scope:** transcript/audio scope.  
**Allowed States:** REVIEW_REQUIRED/VERIFIED/STALE; RUNNING read progress.  
**BRULE:** 067,069,070,095,131.  
**API:** API-MTG-008,009,027.  
**Master Data:** SpeakerConfidenceThreshold, TranscriptStatus.  
**Exception:** EX-MTG-013..015.  
**Audit Event:** AUD-MTG-016,017.  
**Test ID:** TC-SCR-MOB-MTG-003-01..06.  
**UAT:** UAT-92..94,100.  
**Acceptance Criteria:** low confidence visible; UNKNOWN preserved; correction audited; stale segments not used silently.

## MOB-MTG-004 – Kết luận & nhiệm vụ
**CRUD:** Read candidates/decisions; confirm/reject/edit if authorized; create Task from confirmed decision; reconcile linked Task.  
**Bulk:** selection mode; bulk reject/confirm safe candidates; bulk create Task OFF by default.  
**Permission Code:** MTG.DECISION.READ, CONFIRM, UPDATE, REJECT, CREATE_TASK, RECONCILE_TASK.  
**Data Scope:** meeting + target task scope.  
**Allowed States:** CANDIDATE/CONFIRMED/REJECTED + reconciliation state.  
**BRULE:** 068..071,095,121..124,128..132.  
**API:** API-MTG-010..012,028,029.  
**Master Data:** DecisionType, Priority, OrgUnit, RequiredOutputType.  
**Exception:** EX-MTG-016..020.  
**Audit Event:** AUD-MTG-018..023.  
**Test ID:** TC-SCR-MOB-MTG-004-01..09.  
**UAT:** UAT-95..97,100.  
**Acceptance Criteria:** refresh before confirm/create Task; exact timestamp provenance; no silent downstream update.

## MOB-MTG-005 – Upload/ghi âm
**CRUD:** Create audio upload/recording; cancel incomplete upload; read upload status.  
**Bulk:** multi-file select only if policy; no bulk transcription start unless explicit.  
**Permission Code:** MTG.AUDIO.UPLOAD, MTG.TRANSCRIPT.RUN.  
**Data Scope:** meeting secretary/chair permitted scope.  
**Allowed States:** INITIATED/UPLOADING/VALIDATING/READY/FAILED/CANCELLED.  
**BRULE:** 067,095,101..103.  
**API:** API-MTG-006,007.  
**Master Data:** AudioFormatPolicy, MaxDuration, LanguageProfile.  
**Exception:** EX-MTG-011,012.  
**Audit Event:** AUD-MTG-014,015.  
**Test ID:** TC-SCR-MOB-MTG-005-01..06.  
**UAT:** UAT-92,100.  
**Acceptance Criteria:** checksum/duration recorded; failed upload recoverable; recording/upload permission explicit; transcription only valid audio.

# Batch Exit Criteria
SC-05 ENGINEERING READY khi:
- 12/12 màn đủ 13 trường.
- Meeting CRUD/participants/agenda/attendance explicit.
- Audio/transcript source/derivative semantics explicit.
- Decision human-confirmation gate explicit.
- Meeting→Task provenance + reconciliation explicit.
- Minutes versioning/submission explicit.
- Permission/Audit/Exception/Test IDs tồn tại.
- OpenAPI lint PASS.
