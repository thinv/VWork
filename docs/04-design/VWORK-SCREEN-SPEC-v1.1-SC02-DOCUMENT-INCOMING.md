# VWork – Screen Specification v1.1 – Batch SC-02 Document / Incoming

**Phạm vi:** 21 Screen ID  
**Mục tiêu:** Đóng đủ gap theo format cố định: Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước
- Final/verified/history object không hard delete.
- Document/Incoming actions luôn re-authorize theo tenant + data scope + object state.
- AI/OCR/extraction là candidate/derivative cho tới khi được xác nhận.
- Select All mặc định page hiện tại; toàn bộ filtered result cần confirm/filter snapshot.
- Mobile dùng selection mode thay checkbox nhưng semantics tương đương Web.

---

## WEB-DOC-001 – Danh sách văn bản
**CRUD:** Create qua upload; Read list/detail; Edit metadata theo quyền; Delete chỉ draft/unreferenced; Archive otherwise.  
**Bulk:** Select row; Select All page/filtered; Bulk archive/export/classify nếu policy.  
**Permission Code:** DOC.DOCUMENT.READ, CREATE, UPDATE_METADATA, ARCHIVE, DELETE_DRAFT, EXPORT, BULK.  
**Data Scope:** SELF_CREATED / ASSIGNED / ORG_UNIT / ORG_TREE / TENANT / EXPLICIT + classification restriction.  
**Allowed States:** DRAFT, PROCESSING, READY, REVIEW_REQUIRED, APPROVAL, FINAL, ARCHIVED, FAILED, QUARANTINED.  
**BRULE:** 001,005,011..020,095,111..120.  
**API:** API-DOC-001..005, 011, 012, 017.  
**Master Data:** DOCUMENT_STATUS, DocumentType, DocumentField, Urgency, Confidentiality, Agency.  
**Exception:** EX-DOC-003,004,008,011,012; EX-CRUD-001..005.  
**Audit Event:** AUD-DOC-001,002,005,006,007,008.  
**Test ID:** TC-SCR-WEB-DOC-001-01..09.  
**UAT:** UAT-49,50,54,23.  
**Acceptance Criteria:**
1. Có Add/Edit/Delete-or-Archive/Select/Select All/Bulk theo quyền.
2. QUARANTINED không preview/process.
3. Final không hard delete.
4. Bulk trả partial result.
5. Filter không leak object ngoài scope.

## WEB-DOC-002 – Tải tài liệu
**CRUD:** Create Document/Version; Edit upload metadata trước complete; Cancel upload; Delete incomplete upload session.  
**Bulk:** Multi-file upload; Select All pending files; bulk remove/retry before complete.  
**Permission Code:** DOC.DOCUMENT.CREATE.  
**Data Scope:** effective tenant + upload destination scope.  
**Allowed States:** INITIATED, UPLOADING, VALIDATING, QUARANTINED, COMPLETED, FAILED, CANCELLED.  
**BRULE:** 013,014,015,020,101,102,109.  
**API:** API-DOC-001..003.  
**Master Data:** DocumentType, SourceType, Classification policy, allowed MIME/size policy.  
**Exception:** EX-DOC-001..004.  
**Audit Event:** AUD-DOC-001,002.  
**Test ID:** TC-SCR-WEB-DOC-002-01..08.  
**UAT:** UAT-49,50.  
**Acceptance Criteria:** file validation trước process; checksum lưu; malware quarantine; multi-file partial error không mất file hợp lệ.

## WEB-DOC-003 – Chi tiết văn bản
**CRUD:** Read; Edit metadata khi state/permission cho; Archive; Delete draft eligible; Create new version/relation/export.  
**Bulk:** N/A detail.  
**Permission Code:** DOC.DOCUMENT.READ, UPDATE_METADATA, ARCHIVE, DELETE_DRAFT, CREATE_VERSION, EXPORT, DOC.RELATION.CREATE.  
**Data Scope:** object scope + classification.  
**Allowed States:** toàn Document State; action matrix theo state. FINAL chỉ read/create-version/archive/export.  
**BRULE:** 011..020,023,095,115,119.  
**API:** API-DOC-005,007,011,012,015,016.  
**Master Data:** DocumentType, Field, Urgency, Confidentiality, Agency.  
**Exception:** EX-DOC-003,005,006,008,011.  
**Audit Event:** AUD-DOC-003..005,008,009.  
**Test ID:** TC-SCR-WEB-DOC-003-01..08.  
**UAT:** UAT-51,53,23.  
**Acceptance Criteria:** state/action đúng; final immutable; provenance/deep links đúng; archived history còn đọc theo quyền.

## WEB-DOC-004 – Trình xem tài liệu
**CRUD:** Read-only content viewer; annotation/correction không thuộc màn này.  
**Bulk:** N/A.  
**Permission Code:** DOC.DOCUMENT.READ, DOC.DOCUMENT.EXPORT nếu download.  
**Data Scope:** object scope + classification.  
**Allowed States:** READY/REVIEW_REQUIRED/APPROVAL/FINAL/ARCHIVED; QUARANTINED không render.  
**BRULE:** 014,018,020,023,095.  
**API:** API-DOC-009, API-DOC-014.  
**Master Data:** Classification/Confidentiality.  
**Exception:** EX-DOC-003,011.  
**Audit Event:** AUD-DOC-008 khi export/download sensitive theo policy.  
**Test ID:** TC-SCR-WEB-DOC-004-01..05.  
**UAT:** UAT-49,23.  
**Acceptance Criteria:** đúng version; quarantine blocked; download re-authorize; source page anchors ổn định.

## WEB-DOC-005 – Metadata
**CRUD:** Read/Edit; create missing optional metadata; delete/clear field nếu policy; document delete không tại màn này.  
**Bulk:** N/A detail.  
**Permission Code:** DOC.DOCUMENT.READ, DOC.DOCUMENT.UPDATE_METADATA.  
**Data Scope:** object scope.  
**Allowed States:** DRAFT/READY/REVIEW_REQUIRED editable; APPROVAL/FINAL limited or read-only; ARCHIVED read-only.  
**BRULE:** 016,012,023,095,115.  
**API:** API-DOC-005,006.  
**Master Data:** DocumentType, Field, Urgency, Confidentiality, Agency, SignatoryProfile.  
**Exception:** EX-DOC-005,006.  
**Audit Event:** AUD-DOC-003.  
**Test ID:** TC-SCR-WEB-DOC-005-01..06.  
**UAT:** UAT-51,23.  
**Acceptance Criteria:** optimistic lock; canonical code not free text where master exists; final fields protected.

## WEB-DOC-006 – Phiên bản
**CRUD:** Read versions; Create new version; delete only uncommitted/draft version if policy; published/final version immutable.  
**Bulk:** Select versions; bulk export only; no bulk delete committed history.  
**Permission Code:** DOC.DOCUMENT.READ, DOC.DOCUMENT.CREATE_VERSION, DOC.DOCUMENT.EXPORT.  
**Data Scope:** document scope.  
**Allowed States:** version DRAFT/PROCESSING/READY/FINAL/HISTORICAL.  
**BRULE:** 011,012,018,020,060,115,119.  
**API:** API-DOC-007,008,012.  
**Master Data:** version reason/type optional.  
**Exception:** EX-DOC-005,006.  
**Audit Event:** AUD-DOC-004,008.  
**Test ID:** TC-SCR-WEB-DOC-006-01..06.  
**UAT:** UAT-51.  
**Acceptance Criteria:** version order immutable; create version không overwrite; historical download đúng hash.

## WEB-DOC-007 – So sánh phiên bản
**CRUD:** Read-only compare; no object mutation.  
**Bulk:** N/A.  
**Permission Code:** DOC.DOCUMENT.READ.  
**Data Scope:** document scope.  
**Allowed States:** any two readable versions.  
**BRULE:** 012,020,095.  
**API:** API-DOC-010.  
**Master Data:** N/A.  
**Exception:** EX-DOC-005.  
**Audit Event:** read audit only if sensitive policy.  
**Test ID:** TC-SCR-WEB-DOC-007-01..04.  
**UAT:** UAT-51.  
**Acceptance Criteria:** compare exact requested versions; permission checked both versions; no mutation.

## WEB-DOC-008 – OCR & rà soát
**CRUD:** Create OCR run; Read OCR pages; Update/correct OCR text; no hard delete verified OCR history.  
**Bulk:** Select pages/segments; bulk mark reviewed/correct where policy permits.  
**Permission Code:** INT.OCR.READ, RUN, CORRECT.  
**Data Scope:** source document scope.  
**Allowed States:** NOT_RUN, QUEUED, RUNNING, REVIEW_REQUIRED, VERIFIED, FAILED.  
**BRULE:** 021,022,023,028,101,102,120.  
**API:** API-INT-001,006,007.  
**Master Data:** confidence threshold policy, language/OCR profile.  
**Exception:** EX-DOC-003,009; EX-CRUD-004,005.  
**Audit Event:** AUD-INT-001,003.  
**Test ID:** TC-SCR-WEB-DOC-008-01..07.  
**UAT:** UAT-52,49.  
**Acceptance Criteria:** low confidence visible; correction audited; quarantine blocked; async progress visible.

## WEB-DOC-009 – Dữ liệu trích xuất
**CRUD:** Read extracted fields; Update verification/correction; create rerun extraction; delete candidate only via invalidation, not history delete.  
**Bulk:** Select fields; bulk verify/reject only same verification policy.  
**Permission Code:** INT.EXTRACTION.READ, RUN, VERIFY.  
**Data Scope:** source document scope.  
**Allowed States:** UNVERIFIED, VERIFIED, CORRECTED, REJECTED; extraction run QUEUED/RUNNING/SUCCEEDED/FAILED.  
**BRULE:** 021..028,101,102,120.  
**API:** API-INT-001..005.  
**Master Data:** GroundingType, VerificationStatus, field schema.  
**Exception:** EX-DOC-010,005; EX-CRUD-004,005.  
**Audit Event:** AUD-INT-001,002.  
**Test ID:** TC-SCR-WEB-DOC-009-01..08.  
**UAT:** UAT-53.  
**Acceptance Criteria:** FACT/INFERENCE/MISSING visible; unverified not official; provenance click works; bulk verify re-authorize.

## WEB-DOC-010 – Quan hệ văn bản
**CRUD:** Create relation; Read; delete relation if permission/policy; edit by delete+create or typed update future.  
**Bulk:** Select relations; bulk delete eligible with confirm.  
**Permission Code:** DOC.RELATION.READ, CREATE, DELETE.  
**Data Scope:** both source and target documents must be in allowed scope.  
**Allowed States:** ACTIVE/REMOVED relation; source docs may be any readable state.  
**BRULE:** 011,020,095,113,114,119,120.  
**API:** API-DOC-015,016,018.  
**Master Data:** RelationType = REPLACES/CORRECTS/REFERENCES/SUPERSEDES/REVOKES.  
**Exception:** EX-DOC-007; EX-CRUD-002..004.  
**Audit Event:** AUD-DOC-009,010.  
**Test ID:** TC-SCR-WEB-DOC-010-01..07.  
**UAT:** UAT-04,23.  
**Acceptance Criteria:** no invalid/circular relation by policy; target scope checked; removal audited; historical relation visible if required.

---

## WEB-INC-001 – Danh sách văn bản đến
**CRUD:** Create registration; Read; Edit metadata; Archive; hard delete only draft/unregistered eligible.  
**Bulk:** Select/Select All; bulk archive, priority, routing candidate, export.  
**Permission Code:** INC.RECORD.READ, CREATE, UPDATE, ARCHIVE, BULK.  
**Data Scope:** incoming scope by org/assignment/tenant policy.  
**Allowed States:** RECEIVED, REGISTERED, ANALYZED, ROUTED, IN_PROCESS, RESPONSE_DRAFTED, APPROVAL, ISSUED/COMPLETED, ARCHIVED.  
**BRULE:** 041..047,095,111..120.  
**API:** API-INC-001..003,011..013.  
**Master Data:** DocumentType, Agency, Field, Priority, Urgency, Confidentiality, OrgUnit.  
**Exception:** EX-INC-009,016,017; EX-CRUD-001..005.  
**Audit Event:** AUD-INC-001,002,009,010.  
**Test ID:** TC-SCR-WEB-INC-001-01..09.  
**UAT:** UAT-55,57,54,23.  
**Acceptance Criteria:** CRUD/select-all/bulk; archive rule; no out-of-scope; registration uniqueness visible.

## WEB-INC-002 – Đăng ký văn bản đến
**CRUD:** Create; Edit draft registration; Cancel/delete draft registration before official register.  
**Bulk:** N/A form.  
**Permission Code:** INC.RECORD.CREATE, INC.RECORD.UPDATE.  
**Data Scope:** receiving register/org scope.  
**Allowed States:** RECEIVED → REGISTERED.  
**BRULE:** 041,043,046,020,109.  
**API:** API-INC-001,013; document upload APIs if file attached.  
**Master Data:** DocumentRegister, Agency, DocumentType, Field, Urgency, Confidentiality.  
**Exception:** EX-INC-009,010, EX-DOC-004.  
**Audit Event:** AUD-INC-001,002.  
**Test ID:** TC-SCR-WEB-INC-002-01..07.  
**UAT:** UAT-55,50.  
**Acceptance Criteria:** unique number by register/period; source file preserved; required fields validated; duplicate warning.

## WEB-INC-003 – Chi tiết xử lý
**CRUD:** Read; Edit handling metadata; Archive if allowed; trigger analyze; create related work/task/package through commands.  
**Bulk:** N/A detail.  
**Permission Code:** INC.RECORD.READ, UPDATE, ARCHIVE, INC.ANALYZE.RUN, INC.WORK_CASE.CREATE, INC.TASK.CREATE, INC.RESPONSE_PACKAGE.CREATE.  
**Data Scope:** object scope + routing scope.  
**Allowed States:** REGISTERED..COMPLETED/ARCHIVED; actions constrained by state.  
**BRULE:** 041..047,095,115,120.  
**API:** API-INC-003,004,008,009,010,012,013.  
**Master Data:** Priority, OrgUnit, RequiredOutputType, DocumentField.  
**Exception:** EX-INC-011..016, EX-INC-001..008.  
**Audit Event:** AUD-INC-002,003,006,007,008,009.  
**Test ID:** TC-SCR-WEB-INC-003-01..09.  
**UAT:** UAT-56..60,23.  
**Acceptance Criteria:** AI suggestion not official; state/action matrix enforced; source preserved; archive blocked with active work where policy.

## WEB-INC-004 – Yêu cầu AI bóc tách
**CRUD:** Read requirement candidates; Update verify/correct/reject; create rerun analyze.  
**Bulk:** Select All requirements; bulk verify only if each has sufficient provenance/confidence policy.  
**Permission Code:** INC.REQUIREMENT.READ, VERIFY, INC.ANALYZE.RUN.  
**Data Scope:** incoming record scope.  
**Allowed States:** CANDIDATE, VERIFIED, CORRECTED, REJECTED; record must be ANALYZED or later.  
**BRULE:** 042,043,044,024..027,113,117,120.  
**API:** API-INC-004,005,006.  
**Master Data:** RequiredOutputType, Priority, OrgUnit, GroundingType.  
**Exception:** EX-INC-001,002,013; EX-DOC-010.  
**Audit Event:** AUD-INC-003,004.  
**Test ID:** TC-SCR-WEB-INC-004-01..08.  
**UAT:** UAT-56,58,53.  
**Acceptance Criteria:** deadline provenance required; missing stays missing; bulk verify cannot hide low-confidence exception.

## WEB-INC-005 – Phương án xử lý
**CRUD:** Read AI suggestions; edit/confirm routing decision; delete/reject candidate; create official routing decision.  
**Bulk:** Select suggested requirements/units; bulk apply only after owner rule validation.  
**Permission Code:** INC.SUGGESTION.READ, INC.RECORD.UPDATE, INC.WORK_CASE.CREATE, INC.TASK.CREATE.  
**Data Scope:** object + org authority scope.  
**Allowed States:** ANALYZED, ROUTED; candidate vs confirmed separated.  
**BRULE:** 042..047,049,095,113,117,120.  
**API:** API-INC-007,013,008,009.  
**Master Data:** OrgUnit, Position, Priority, RequiredOutputType.  
**Exception:** EX-INC-011,012,013,017.  
**Audit Event:** AUD-INC-005,002,006,007.  
**Test ID:** TC-SCR-WEB-INC-005-01..08.  
**UAT:** UAT-57,58,59.  
**Acceptance Criteria:** exactly one primary owner when required; AI candidate visibly marked; confirm audited; no silent assignment.

## WEB-INC-006 – Tạo hồ sơ công việc
**CRUD:** Create Work Case from incoming; edit pre-submit fields; cancel draft creation.  
**Bulk:** N/A detail wizard.  
**Permission Code:** INC.WORK_CASE.CREATE + downstream Work Case create permission.  
**Data Scope:** incoming scope and target org scope.  
**Allowed States:** incoming ANALYZED/ROUTED/IN_PROCESS; duplicate conversion guard.  
**BRULE:** 045,048,049,050,095,109.  
**API:** API-INC-008.  
**Master Data:** WorkCaseType, Priority, OrgUnit.  
**Exception:** EX-INC-012,014.  
**Audit Event:** AUD-INC-006.  
**Test ID:** TC-SCR-WEB-INC-006-01..06.  
**UAT:** UAT-59,23.  
**Acceptance Criteria:** source/provenance links created; duplicate main case prevented unless policy; owner validated.

## WEB-INC-007 – Tạo bộ hồ sơ phản hồi
**CRUD:** Create package request; Read job/result; regenerate as new package/version; archive package by downstream policy.  
**Bulk:** N/A.  
**Permission Code:** INC.RESPONSE_PACKAGE.CREATE, DOC.DOCUMENT.READ, DOC.DOCUMENT.EXPORT.  
**Data Scope:** incoming + related source scope.  
**Allowed States:** context READY/INCOMPLETE; job QUEUED/RUNNING/SUCCEEDED/FAILED.  
**BRULE:** 019,020,040,044,101,102,109.  
**API:** API-INC-010, API-GOV-014.  
**Master Data:** Template, DocumentType, SignatoryProfile, RecipientGroup.  
**Exception:** EX-INC-015, EX-DOC-011.  
**Audit Event:** AUD-INC-008.  
**Test ID:** TC-SCR-WEB-INC-007-01..06.  
**UAT:** UAT-60.  
**Acceptance Criteria:** context completeness gate; source/template versions pinned; async progress; export permission checked.

---

## MOB-DOC-001 – Danh sách văn bản
**CRUD:** Create/upload action; Read; edit metadata via detail; archive/delete-draft actions theo quyền.  
**Bulk:** Mobile selection mode; Select All; bulk archive/export limited by mobile policy.  
**Permission Code:** DOC.DOCUMENT.READ, CREATE, UPDATE_METADATA, ARCHIVE, DELETE_DRAFT, EXPORT, BULK.  
**Data Scope:** document scope + classification.  
**Allowed States:** toàn Document State.  
**BRULE:** 011..020,095,111..120.  
**API:** API-DOC-004,001..003,011,017.  
**Master Data:** DocumentType, Field, Urgency, Confidentiality.  
**Exception:** EX-DOC-003,004,008,012; EX-CRUD-001..005.  
**Audit Event:** AUD-DOC-001,002,005,006,007.  
**Test ID:** TC-SCR-MOB-DOC-001-01..08.  
**UAT:** UAT-49,50,54,23.  
**Acceptance Criteria:** selection mode; no sensitive preview cache beyond policy; same permission semantics as Web.

## MOB-DOC-002 – Xem văn bản
**CRUD:** Read; metadata edit/archive/create-version action sheet if permission; no edit content in viewer.  
**Bulk:** N/A detail.  
**Permission Code:** DOC.DOCUMENT.READ, UPDATE_METADATA, ARCHIVE, CREATE_VERSION, EXPORT.  
**Data Scope:** object scope + classification.  
**Allowed States:** readable states; QUARANTINED blocked.  
**BRULE:** 012,014,018,020,095,115.  
**API:** API-DOC-005,009,011,014.  
**Master Data:** Classification, DocumentType, Status.  
**Exception:** EX-DOC-003,005,006,011.  
**Audit Event:** AUD-DOC-005,008.  
**Test ID:** TC-SCR-MOB-DOC-002-01..06.  
**UAT:** UAT-51,49,23.  
**Acceptance Criteria:** viewer exact version; download/export re-auth; offline cache policy enforced.

## MOB-DOC-003 – AI tóm tắt văn bản
**CRUD:** Create summary run; Read latest/historical summary; no silent edit of AI output; regenerate creates new run.  
**Bulk:** N/A.  
**Permission Code:** INT.SUMMARY.RUN, INT.SUMMARY.READ, DOC.DOCUMENT.READ.  
**Data Scope:** source document scope at request and read time.  
**Allowed States:** NOT_GENERATED, QUEUED, RUNNING, READY, STALE, FAILED.  
**BRULE:** 023,025..028,033,044,095,099,101,102.  
**API:** API-INT-010, API-INT-011.  
**Master Data:** GroundingType, AI Use Case Code, model/prompt policy.  
**Exception:** EX-DOC-010, EX-EXE-004, EX-KNO-001..004.  
**Audit Event:** AUD-INT-004,005.  
**Test ID:** TC-SCR-MOB-DOC-003-01..07.  
**UAT:** UAT-53,18,19,23.  
**Acceptance Criteria:** summary grounded; FACT/INFERENCE/MISSING visible; stale when source version changes; no source permission bypass.

## MOB-DOC-004 – Dữ liệu chính & deadline
**CRUD:** Read extracted facts; verify/correct if mobile policy permits; create task/case action only through authorized downstream command.  
**Bulk:** Select fields optional; Select All/bulk verify only if enabled by tenant policy.  
**Permission Code:** INT.EXTRACTION.READ, INT.EXTRACTION.VERIFY, DOC.DOCUMENT.READ.  
**Data Scope:** source document scope.  
**Allowed States:** UNVERIFIED, VERIFIED, CORRECTED, REJECTED.  
**BRULE:** 021..027,043,095,113,117,120.  
**API:** API-INT-003,004,005.  
**Master Data:** GroundingType, VerificationStatus, RequiredOutputType.  
**Exception:** EX-DOC-010, EX-INC-013.  
**Audit Event:** AUD-INT-002.  
**Test ID:** TC-SCR-MOB-DOC-004-01..06.  
**UAT:** UAT-53,56,23.  
**Acceptance Criteria:** deadline provenance visible; missing deadline not fabricated; correction audited; citation opens exact source location.

---

# Batch Exit Criteria
SC-02 chỉ đạt ENGINEERING READY khi:
- 21/21 màn có đủ 13 trường cố định.
- API mobile summary/bulk/relation/archive/update không còn generic.
- Permission/Audit/Exception/Test IDs tồn tại.
- CRUD/Select All/Bulk explicit ở mọi collection screen.
- Document/Incoming state-action semantics không mâu thuẫn State Machine.
- CI OpenAPI lint PASS.
