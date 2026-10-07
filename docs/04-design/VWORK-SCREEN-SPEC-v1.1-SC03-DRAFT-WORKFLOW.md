# VWork – Screen Specification v1.1 – Batch SC-03 Draft / Workflow

**Phạm vi:** 15 Screen ID  
**Format cố định:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước
- Draft submitted/approved/finalized không sửa in-place.
- AI không auto-apply.
- Review result bị stale nếu nội dung/version thay đổi.
- Approval luôn pin submitted version.
- Bulk approval mặc định OFF.
- Workflow definition published immutable; thay đổi tạo version mới.

---

## WEB-DRF-001 – Danh sách dự thảo
**CRUD:** Create; Read; Edit eligible draft; Delete draft chưa submitted/referenced; Archive otherwise.  
**Bulk:** Select/Select All page/filtered; bulk archive/delete eligible/export metadata.  
**Permission Code:** DRF.DRAFT.READ, CREATE, UPDATE, DELETE_DRAFT, ARCHIVE, BULK.  
**Data Scope:** SELF_CREATED / ORG_UNIT / EXPLICIT / shared-by-object scope.  
**Allowed States:** DRAFT, GENERATED, EDITING, REVIEWING, READY_FOR_APPROVAL, SUBMITTED, RETURNED, REJECTED, APPROVED, FINALIZED, ARCHIVED.  
**BRULE:** 029..040,095,111..120.  
**API:** API-DRF-001..003,013..015.  
**Master Data:** DocumentType, Template, DraftMode, Status.  
**Exception:** EX-DRF-006,015,016; EX-CRUD-001..005.  
**Audit Event:** AUD-DRF-001,010,011,012.  
**Test ID:** TC-SCR-WEB-DRF-001-01..08.  
**UAT:** UAT-64,23.  
**Acceptance Criteria:** full CRUD/select-all/bulk theo state; submitted không hard delete; cross-tenant = 0.

## WEB-DRF-002 – Tạo dự thảo – Brief
**CRUD:** Create draft; Edit brief trước generate; Cancel/delete draft nếu chưa referenced.  
**Bulk:** N/A.  
**Permission Code:** DRF.DRAFT.CREATE, DRF.DRAFT.UPDATE, DRF.GENERATE.RUN.  
**Data Scope:** creator + selected source scopes.  
**Allowed States:** DRAFT → GENERATED.  
**BRULE:** 029..035,044,095,099.  
**API:** API-DRF-001,004.  
**Master Data:** DraftMode, DocumentType, Template, OrgUnit, SignatoryProfile.  
**Exception:** EX-DRF-008,009,013.  
**Audit Event:** AUD-DRF-001,002,003.  
**Test ID:** TC-SCR-WEB-DRF-002-01..06.  
**UAT:** UAT-05,06,61.  
**Acceptance Criteria:** brief/source/template explicit; missing facts visible; generation async; không overwrite draft thủ công.

## WEB-DRF-003 – Chọn nguồn & mẫu
**CRUD:** Add/remove source context; choose/change template before submit; Read pinned context.  
**Bulk:** Select All sources in current filtered search; bulk add/remove context.  
**Permission Code:** DRF.DRAFT.UPDATE, DOC.DOCUMENT.READ.  
**Data Scope:** draft scope + permission từng source.  
**Allowed States:** DRAFT/GENERATED/EDITING/RETURNED; SUBMITTED+ read-only snapshot.  
**BRULE:** 030,031,033,044,089,095.  
**API:** API-DOC-004, API-KNO-002, API-DRF-003.  
**Master Data:** Template, Taxonomy, DocumentType, SourceAuthority.  
**Exception:** EX-DRF-008,009; EX-KNO-001..004.  
**Audit Event:** AUD-DRF-002.  
**Test ID:** TC-SCR-WEB-DRF-003-01..07.  
**UAT:** UAT-61,33..35.  
**Acceptance Criteria:** source permission check before add; context snapshot pin exact versions; revoked source blocks/regrounds future AI run.

## WEB-DRF-004 – AI Draft Workspace
**CRUD:** Read/Edit current editable version; Create new version; Archive draft; Submit via workflow command.  
**Bulk:** N/A document editor; selected-text action không phải collection bulk.  
**Permission Code:** DRF.DRAFT.READ, UPDATE, CREATE_VERSION, ARCHIVE, SUBMIT, DRF.GENERATE.RUN.  
**Data Scope:** draft/object + source scope.  
**Allowed States:** GENERATED/EDITING/RETURNED editable; REVIEWING limited; READY_FOR_APPROVAL submit; SUBMITTED/APPROVED/FINALIZED read-only.  
**BRULE:** 029..040,033,035,039,040,044,095,115.  
**API:** API-DRF-003..006, API-WFL-005.  
**Master Data:** DraftMode, TemplateVersion, DocumentType, SignatoryProfile.  
**Exception:** EX-DRF-006,007,008,009,010,011,014.  
**Audit Event:** AUD-DRF-004,009, AUD-WFL-001.  
**Test ID:** TC-SCR-WEB-DRF-004-01..10.  
**UAT:** UAT-05..09,61..63,65.  
**Acceptance Criteria:** AI không auto-apply; stale version warning; blocker gate; submit pin exact version; state/action matrix enforced.

## WEB-DRF-005 – AI Review Panel
**CRUD:** Create review run; Read findings; Update finding resolution; Override blocker với quyền; history immutable.  
**Bulk:** Select findings; bulk resolve chỉ same resolution policy; blocker bulk override không mặc định.  
**Permission Code:** DRF.REVIEW.RUN, DRF.REVIEW.RESOLVE, DRF.REVIEW.OVERRIDE_BLOCKER.  
**Data Scope:** draft scope.  
**Allowed States:** REVIEWING/READY_FOR_APPROVAL; finding OPEN/RESOLVED/OVERRIDDEN/STALE.  
**BRULE:** 036..039,041,095,113,117,120.  
**API:** API-DRF-007..009.  
**Master Data:** ReviewSeverity, ReviewCategory, GroundingType.  
**Exception:** EX-DRF-010,011,007.  
**Audit Event:** AUD-DRF-005,006,007.  
**Test ID:** TC-SCR-WEB-DRF-005-01..08.  
**UAT:** UAT-07,62,63.  
**Acceptance Criteria:** BLOCKER visible/chặn submit; content đổi làm findings stale; override reason bắt buộc.

## WEB-DRF-006 – Rewrite
**CRUD:** Create rewrite candidate; Read/compare; Apply = update draft selection sau explicit user action; reject candidate.  
**Bulk:** N/A.  
**Permission Code:** DRF.REWRITE.RUN, DRF.DRAFT.UPDATE.  
**Data Scope:** current draft/version/selection.  
**Allowed States:** EDITING/RETURNED; không rewrite submitted/finalized in-place.  
**BRULE:** 039,040,044,095.  
**API:** API-DRF-010.  
**Master Data:** RewriteMode/Tone policy optional.  
**Exception:** EX-DRF-006,007,012,013.  
**Audit Event:** AUD-DRF-008; apply change captured in version/edit audit.  
**Test ID:** TC-SCR-WEB-DRF-006-01..06.  
**UAT:** UAT-05,62.  
**Acceptance Criteria:** chỉ rewrite selection hiện tại; không auto-apply; stale selection rejected.

## WEB-DRF-007 – Document Package
**CRUD:** Create package; Read result; regenerate = new run/version; Archive theo retention; không mutate completed artifact.  
**Bulk:** N/A detail.  
**Permission Code:** DRF.PACKAGE.CREATE, DRF.DRAFT.READ, DOC.DOCUMENT.EXPORT.  
**Data Scope:** all package source objects must be readable.  
**Allowed States:** QUEUED/RUNNING/SUCCEEDED/FAILED; package historical immutable.  
**BRULE:** 034,040,044,095,101,102.  
**API:** API-DRF-011,012, API-GOV-014.  
**Master Data:** PackageType, TemplateVersion, OutputFormat.  
**Exception:** EX-DRF-008,009,013.  
**Audit Event:** AUD-DRF-013.  
**Test ID:** TC-SCR-WEB-DRF-007-01..06.  
**UAT:** UAT-60,61.  
**Acceptance Criteria:** pin source/template versions; async progress; failed run không mất prior package.

## WEB-DRF-008 – Lịch sử phiên bản
**CRUD:** Read versions; Create version từ editor; không sửa/xóa committed history.  
**Bulk:** Select/Select All versions; bulk export/compare selection only.  
**Permission Code:** DRF.DRAFT.READ, DRF.DRAFT.CREATE_VERSION.  
**Data Scope:** draft scope.  
**Allowed States:** all historical/current versions.  
**BRULE:** 035,060,095,115,119.  
**API:** API-DRF-006,005.  
**Master Data:** VersionReason optional.  
**Exception:** EX-DRF-007.  
**Audit Event:** AUD-DRF-004.  
**Test ID:** TC-SCR-WEB-DRF-008-01..06.  
**UAT:** UAT-61,62.  
**Acceptance Criteria:** committed versions immutable; current version explicit; compare/export không đổi lịch sử.

---

## WEB-APR-001 – Hàng đợi cần duyệt
**CRUD:** Read approval projection; action approve/return/reject/clarify/delegate theo policy; không Create/Delete approval item thủ công.  
**Bulk:** Select/Select All; bulk action chỉ qua API-WFL-014 và policy; bulk approve mặc định OFF.  
**Permission Code:** WFL.APPROVAL.READ, APPROVE, RETURN, REJECT, CLARIFY, DELEGATE, BULK.  
**Data Scope:** ASSIGNED + valid delegation.  
**Allowed States:** PENDING, CLARIFICATION_REQUIRED, DELEGATED; terminal items read-only nếu history view.  
**BRULE:** 064..072,095,112..120.  
**API:** API-WFL-007,009..014.  
**Master Data:** ApprovalStatus, WorkflowActionType, Priority.  
**Exception:** EX-WFL-006..014.  
**Audit Event:** AUD-WFL-002..008.  
**Test ID:** TC-SCR-WEB-APR-001-01..10.  
**UAT:** UAT-08..10,65..69.  
**Acceptance Criteria:** queue chỉ active assignments; select-all không mặc định bulk approve; stale/terminal item disabled.

## WEB-APR-002 – Chi tiết hồ sơ trình
**CRUD:** Read exact submitted subject/version; approval action commands only; không sửa subject tại màn.  
**Bulk:** N/A detail.  
**Permission Code:** WFL.APPROVAL.READ, APPROVE, RETURN, REJECT, CLARIFY, DELEGATE.  
**Data Scope:** assigned/delegated + subject scope.  
**Allowed States:** PENDING active step; terminal read-only. Approve disabled nếu stale submitted version.  
**BRULE:** 064..072,065,069,095.  
**API:** API-WFL-008..013 + subject/document read APIs.  
**Master Data:** ApprovalStatus, WorkflowActionType, Delegation policy.  
**Exception:** EX-WFL-006..013.  
**Audit Event:** AUD-WFL-002..007.  
**Test ID:** TC-SCR-WEB-APR-002-01..10.  
**UAT:** UAT-08..10,65..68.  
**Acceptance Criteria:** exact version compare; return/reject reason; concurrent action conflict; server authorization.

## WEB-APR-003 – Lịch sử workflow
**CRUD:** Read-only history.  
**Bulk:** Select/Select All events; bulk export only.  
**Permission Code:** WFL.HISTORY.READ.  
**Data Scope:** workflow subject scope.  
**Allowed States:** all instance/step terminal and active states.  
**BRULE:** 061..072,095,115,119.  
**API:** API-WFL-006.  
**Master Data:** WorkflowStatus, ApprovalStatus, ActionType.  
**Exception:** EX-WFL-012; subject permission revoke.  
**Audit Event:** history itself append-only; export audit theo policy.  
**Test ID:** TC-SCR-WEB-APR-003-01..05.  
**UAT:** UAT-66,68,70.  
**Acceptance Criteria:** no mutate/delete history; chronological/correlation trace; subject version visible.

## WEB-APR-004 – Cấu hình workflow
**CRUD:** Create definition; Read; Edit draft definition; Create version; Publish; Archive; hard delete only unreferenced draft if future API/policy.  
**Bulk:** Select/Select All; bulk archive/publish eligible; partial result.  
**Permission Code:** WFL.DEFINITION.READ, CREATE, UPDATE, CREATE_VERSION, PUBLISH, ARCHIVE, BULK.  
**Data Scope:** TENANT/administrative config scope.  
**Allowed States:** DRAFT, PUBLISHED, ARCHIVED; published version immutable.  
**BRULE:** 061..063,069..072,095,111..120.  
**API:** API-WFL-001..004,015..017.  
**Master Data:** WorkflowSubjectType, WorkflowActionType, Role, Position, OrgUnit, SLAUnit, DelegationType.  
**Exception:** EX-WFL-015..018,017.  
**Audit Event:** AUD-WFL-009..014.  
**Test ID:** TC-SCR-WEB-APR-004-01..10.  
**UAT:** UAT-68,70,71.  
**Acceptance Criteria:** publish validation; published immutable; active-instance archive guard; bulk partial result; approver resolution rule valid.

---

## MOB-APR-001 – Danh sách cần duyệt
**CRUD:** Read queue; action commands theo policy; không create/delete approval item.  
**Bulk:** Mobile selection mode; Select All; bulk action policy same Web, bulk approve default OFF.  
**Permission Code:** WFL.APPROVAL.READ, WFL.APPROVAL.BULK + action permissions.  
**Data Scope:** ASSIGNED + valid delegation.  
**Allowed States:** PENDING/CLARIFICATION_REQUIRED/DELEGATED; terminal read-only.  
**BRULE:** 064..072,095,112..120.  
**API:** API-WFL-007,014.  
**Master Data:** ApprovalStatus, Priority, ActionType.  
**Exception:** EX-WFL-006..014.  
**Audit Event:** AUD-WFL-002,008.  
**Test ID:** TC-SCR-MOB-APR-001-01..07.  
**UAT:** UAT-65,67,69,72.  
**Acceptance Criteria:** queue fresh; selection mode; no bulk approve unless policy; stale/offline items disabled.

## MOB-APR-002 – Chi tiết hồ sơ trình
**CRUD:** Read exact submitted version; no edit subject.  
**Bulk:** N/A.  
**Permission Code:** WFL.APPROVAL.READ.  
**Data Scope:** assigned/delegated + subject scope.  
**Allowed States:** active PENDING; terminal read-only.  
**BRULE:** 064..072,095.  
**API:** API-WFL-008 + subject read APIs.  
**Master Data:** ApprovalStatus, WorkflowStep type.  
**Exception:** EX-WFL-006,007,008,012.  
**Audit Event:** AUD-WFL-002.  
**Test ID:** TC-SCR-MOB-APR-002-01..06.  
**UAT:** UAT-65,72.  
**Acceptance Criteria:** always refresh authoritative approval/version; cached preview cannot authorize action; compare/source available.

## MOB-APR-003 – Cho ý kiến/Phê duyệt
**CRUD:** Approve/Return/Reject/Clarify/Delegate commands; no subject edit/delete.  
**Bulk:** N/A detail; batch action done from MOB-APR-001 selection mode.  
**Permission Code:** WFL.APPROVAL.APPROVE, RETURN, REJECT, CLARIFY, DELEGATE.  
**Data Scope:** active assigned/delegated approval only.  
**Allowed States:** PENDING active step only; terminal/STALE disabled.  
**BRULE:** 065..072,095.  
**API:** API-WFL-009..013.  
**Master Data:** WorkflowActionType, Delegation policy, reason codes optional.  
**Exception:** EX-WFL-006..013.  
**Audit Event:** AUD-WFL-003..007.  
**Test ID:** TC-SCR-MOB-APR-003-01..09.  
**UAT:** UAT-65..67,72.  
**Acceptance Criteria:** refresh before submit; stale action returns conflict; Return reason required; delegation scope/window checked; double-submit idempotent/blocked.

---

# Batch Exit Criteria
SC-03 ENGINEERING READY khi:
- 15/15 màn đủ 13 trường.
- Review freshness + blocker + submitted-version rules explicit.
- Approval stale/delegation/parallel/bulk policy explicit.
- Workflow definition versioning/archive explicit.
- Permission/Audit/Exception/Test IDs tồn tại.
- OpenAPI lint PASS.
