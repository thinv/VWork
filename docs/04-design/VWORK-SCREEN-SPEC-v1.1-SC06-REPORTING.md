# VWork – Screen Specification v1.1 – Batch SC-06 Reporting

**Phạm vi:** 13 Screen ID  
**Format:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước
- AI chỉ đề xuất schema/narrative; không tự approve schema và không tính số official.
- Aggregation official phải deterministic.
- Mọi metric value official phải drill-down được tới submission/version/source location.
- Unit phải canonical hoặc có conversion rule approved.
- BLOCKER quality finding chặn final aggregation/report.
- Submission replace tạo version mới, không overwrite.
- Approved schema immutable; thay đổi tạo version mới.
- Export pin cycle/schema/aggregation/source snapshot.

---

## WEB-RPT-001 – Danh sách kỳ báo cáo
**CRUD:** Create; Read; Edit eligible cycle; Close/Reopen/Archive; không hard delete cycle đã phát sinh nghĩa vụ/submission.  
**Bulk:** Select/Select All page/filtered; bulk archive, owner change, export status, reminder orchestration theo policy.  
**Permission Code:** RPT.CYCLE.READ, CREATE, UPDATE, CLOSE, REOPEN, ARCHIVE, BULK.  
**Data Scope:** OWNED_CYCLE / ORG_UNIT / ORG_TREE / TENANT / EXPLICIT.  
**Allowed States:** DRAFT, OPEN, COLLECTING, SCHEMA_REVIEW, EXTRACTION, QUALITY_REVIEW, AGGREGATED, DRAFT_REPORT, APPROVED, CLOSED, ARCHIVED.  
**BRULE:** BRULE-073..087, BRULE-095, BRULE-111..120.  
**API:** API-RPT-001..003, 019..023.  
**Master Data:** ReportType, PeriodType, OrgUnit, ReportingStatus.  
**Exception:** EX-RPT-008,009,031,032; EX-CRUD-001..005.  
**Audit Event:** AUD-RPT-001..006.  
**Test ID:** TC-SCR-WEB-RPT-001-01..09.  
**UAT:** UAT-101,102,23.  
**Acceptance Criteria:** full CRUD/select-all/bulk; close/reopen state-aware; reopen reason required; cross-tenant leak=0.

## WEB-RPT-002 – Tạo kỳ báo cáo
**CRUD:** Create/Edit draft; cancel draft.  
**Bulk:** N/A.  
**Permission Code:** RPT.CYCLE.CREATE, UPDATE.  
**Data Scope:** creator/owner + target reporting scope.  
**Allowed States:** DRAFT → OPEN/COLLECTING.  
**BRULE:** BRULE-073,074,075,095,109.  
**API:** API-RPT-001,019.  
**Master Data:** ReportType, PeriodType, OrgUnit, Template, MetricSchemaPolicy.  
**Exception:** EX-RPT-009,010.  
**Audit Event:** AUD-RPT-001,002.  
**Test ID:** TC-SCR-WEB-RPT-002-01..07.  
**UAT:** UAT-101,103.  
**Acceptance Criteria:** period valid; owner set; obligation list initialized/versioned; schema policy explicit.

## WEB-RPT-003 – Dashboard kỳ báo cáo
**CRUD:** Read; limited cycle update/close/reopen actions by permission.  
**Bulk:** N/A dashboard; drill-down to collection screens.  
**Permission Code:** RPT.CYCLE.READ, UPDATE, CLOSE, REOPEN.  
**Data Scope:** cycle scope.  
**Allowed States:** all cycle states.  
**BRULE:** BRULE-073..087,095.  
**API:** API-RPT-003,005,028,013,016,042,047.  
**Master Data:** ReportingStatus, ObligationStatus, FindingSeverity.  
**Exception:** EX-RPT-008,026,027,029.  
**Audit Event:** mutation events only; read audit if sensitive policy.  
**Test ID:** TC-SCR-WEB-RPT-003-01..07.  
**UAT:** UAT-101,108,113.  
**Acceptance Criteria:** KPI authoritative; missing submissions visible; blockers visible; aggregation/report state not inferred from UI only.

## WEB-RPT-004 – Đơn vị phải nộp
**CRUD:** Add obligation; Read; Edit; Retire; không hard delete obligation đã có submission.  
**Bulk:** Select/Select All; bulk remind, deadline change, required-format change, retire eligible.  
**Permission Code:** RPT.OBLIGATION.READ, CREATE, UPDATE, RETIRE, BULK, REMIND.  
**Data Scope:** cycle owner/admin; reporting unit sees own obligation read-only unless granted.  
**Allowed States:** NOT_SUBMITTED, SUBMITTED, VALIDATING, ACCEPTED, REJECTED, REPLACED; LATE flag độc lập.  
**BRULE:** BRULE-074,079,080,084,095,111..120.  
**API:** API-RPT-004,005,024..027.  
**Master Data:** OrgUnit, RequiredFormat, SubmissionStatus, ReminderPolicy.  
**Exception:** EX-RPT-010,011,026,031.  
**Audit Event:** AUD-RPT-007..011.  
**Test ID:** TC-SCR-WEB-RPT-004-01..09.  
**UAT:** UAT-102,104,105.  
**Acceptance Criteria:** missing unit explicit; bulk remind safe; retirement preserves history; deadline changes audited.

## WEB-RPT-005 – Nguồn báo cáo
**CRUD:** Add submission; Read versions; Replace creates version; Archive non-active version; không overwrite.  
**Bulk:** Select/Select All; bulk validate/re-extract/archive eligible.  
**Permission Code:** RPT.SUBMISSION.READ, CREATE, REPLACE, ARCHIVE, BULK.  
**Data Scope:** REPORTING_UNIT for submitter; cycle owner sees authorized units.  
**Allowed States:** RECEIVED, VALIDATING, ACCEPTED, REJECTED, REPLACED, ARCHIVED; late as flag.  
**BRULE:** BRULE-074,078,079,084,095,113,119.  
**API:** API-RPT-006,028..031.  
**Master Data:** ReportType, FileFormat, OrgUnit, SubmissionStatus.  
**Exception:** EX-RPT-012..014,031.  
**Audit Event:** AUD-RPT-012..015.  
**Test ID:** TC-SCR-WEB-RPT-005-01..09.  
**UAT:** UAT-103,106,107.  
**Acceptance Criteria:** submission version immutable; reporting unit snapshot kept; checksum preserved; replace chain traceable.

## WEB-RPT-006 – AI đề xuất chỉ tiêu
**CRUD:** Create AI suggestion run; Read candidate schema; accept/reject candidate into draft schema; no direct approval.  
**Bulk:** Select candidate metrics; bulk accept/reject candidate.  
**Permission Code:** RPT.SCHEMA.READ, CREATE_VERSION, UPDATE_DRAFT.  
**Data Scope:** cycle/schema scope + source submission scope.  
**Allowed States:** cycle DRAFT/COLLECTING/SCHEMA_REVIEW; suggestion CANDIDATE/ACCEPTED/REJECTED.  
**BRULE:** BRULE-075,076,077,083,095,099.  
**API:** API-RPT-007,009,032..035.  
**Master Data:** MetricDataType, UnitOfMeasure, AggregationType, DimensionType.  
**Exception:** EX-RPT-016..019.  
**Audit Event:** AUD-RPT-016,017,018.  
**Test ID:** TC-SCR-WEB-RPT-006-01..07.  
**UAT:** UAT-109,110.  
**Acceptance Criteria:** AI candidate clearly marked; no auto-approve; duplicate/incompatible metric blocked.

## WEB-RPT-007 – Metric Schema Editor
**CRUD:** Add/Edit/Retire metric definition trong draft schema; create schema version; approve version.  
**Bulk:** Select/Select All; bulk required/optional, unit/category/retire eligible.  
**Permission Code:** RPT.SCHEMA.READ, CREATE_VERSION, UPDATE_DRAFT, APPROVE, BULK.  
**Data Scope:** cycle/schema admin scope.  
**Allowed States:** Schema DRAFT, REVIEW, APPROVED, SUPERSEDED, ARCHIVED; approved immutable.  
**BRULE:** BRULE-075..077,082,095,111..120.  
**API:** API-RPT-008..010,032..035.  
**Master Data:** MetricDataType, UnitOfMeasure, AggregationType, MetricCategory.  
**Exception:** EX-RPT-015..019,031.  
**Audit Event:** AUD-RPT-017..019.  
**Test ID:** TC-SCR-WEB-RPT-007-01..10.  
**UAT:** UAT-17,109,110.  
**Acceptance Criteria:** approved immutable; duplicate code blocked; aggregation compatible datatype/unit; cycle pins version.

## WEB-RPT-008 – Kết quả trích xuất
**CRUD:** Run extraction; Read values; Verify/correct extracted value; rerun creates new extraction run.  
**Bulk:** Select/Select All; bulk verify/reject only same verification policy; bulk rerun eligible sources.  
**Permission Code:** RPT.EXTRACTION.RUN, READ, VERIFY, BULK.  
**Data Scope:** cycle + submission/source scope.  
**Allowed States:** UNVERIFIED, VERIFIED, CORRECTED, REJECTED; run QUEUED/RUNNING/SUCCEEDED/FAILED.  
**BRULE:** BRULE-075,078,079,095,101,102,120.  
**API:** API-RPT-011,036..038.  
**Master Data:** UnitOfMeasure, VerificationStatus, GroundingType, MetricDefinition.  
**Exception:** EX-RPT-015,019..021.  
**Audit Event:** AUD-RPT-020,021.  
**Test ID:** TC-SCR-WEB-RPT-008-01..09.  
**UAT:** UAT-27,111,112.  
**Acceptance Criteria:** drill-down source location; raw/normalized/unit visible; low confidence not official; unit mismatch not silently normalized.

## WEB-RPT-009 – Data Quality
**CRUD:** Run quality check; Read finding; Resolve; Override with permission/reason; history immutable.  
**Bulk:** Select/Select All; bulk resolve same rule/reason; blocker override bulk default OFF unless policy.  
**Permission Code:** RPT.QUALITY.RUN, READ, RESOLVE, OVERRIDE, BULK.  
**Data Scope:** cycle scope.  
**Allowed States:** OPEN, RESOLVED, OVERRIDDEN, STALE; Severity INFO/WARNING/ERROR/BLOCKER.  
**BRULE:** BRULE-079,080,095,113,117,120.  
**API:** API-RPT-012,013,039..041.  
**Master Data:** FindingType, Severity, ResolutionCode.  
**Exception:** EX-RPT-022,023,031.  
**Audit Event:** AUD-RPT-022..024.  
**Test ID:** TC-SCR-WEB-RPT-009-01..09.  
**UAT:** UAT-16,113,114.  
**Acceptance Criteria:** BLOCKER blocks final aggregation/report; override reason required; source drilldown works.

## WEB-RPT-010 – Đối soát
**CRUD:** Run reconciliation; Read result; Override mismatch with reason; rerun creates new result set.  
**Bulk:** Select mismatches; bulk accept override only same rule/policy; no bulk silent match.  
**Permission Code:** RPT.RECONCILIATION.RUN, READ, OVERRIDE.  
**Data Scope:** cycle + source scope.  
**Allowed States:** MATCHED, MISMATCH, UNRESOLVED, ACCEPTED_OVERRIDE.  
**BRULE:** BRULE-078,081,095,113,117,120.  
**API:** API-RPT-014,042,043.  
**Master Data:** ReconciliationRuleType, ResolutionCode, UnitOfMeasure.  
**Exception:** EX-RPT-024,025.  
**Audit Event:** AUD-RPT-025,026.  
**Test ID:** TC-SCR-WEB-RPT-010-01..08.  
**UAT:** UAT-28,115.  
**Acceptance Criteria:** total/detail/current/prior/source mismatch traceable; override audited; original values preserved.

## WEB-RPT-011 – Tổng hợp số liệu
**CRUD:** Run aggregation; Read historical aggregation runs; no in-place edit official result.  
**Bulk:** N/A calculation run; drill-down supports export selection.  
**Permission Code:** RPT.AGGREGATION.RUN, READ.  
**Data Scope:** cycle scope.  
**Allowed States:** NOT_READY, READY, RUNNING, SUCCEEDED, FAILED, STALE.  
**BRULE:** BRULE-075,080..083,095,101,102.  
**API:** API-RPT-015,016.  
**Master Data:** AggregationType, UnitOfMeasure, DimensionType.  
**Exception:** EX-RPT-019,022,026..028.  
**Audit Event:** AUD-RPT-027,028.  
**Test ID:** TC-SCR-WEB-RPT-011-01..08.  
**UAT:** UAT-15..17,116,117.  
**Acceptance Criteria:** deterministic engine; no LLM arithmetic; blockers/missing required submissions gate; drill-down to verified inputs.

## WEB-RPT-012 – Soạn báo cáo tổng
**CRUD:** Generate draft; Read; Edit narrative/text; create new draft version; Submit to workflow if configured.  
**Bulk:** N/A report editor.  
**Permission Code:** RPT.DRAFT.GENERATE, READ, UPDATE, SUBMIT.  
**Data Scope:** cycle/report scope.  
**Allowed States:** GENERATED, EDITING, STALE, SUBMITTED, APPROVED, FINAL.  
**BRULE:** BRULE-082,083,086,095,099,121,128,131.  
**API:** API-RPT-017,044..046 + WFL APIs if approval enabled.  
**Master Data:** ReportTemplate, DocumentType, NarrativeSectionType.  
**Exception:** EX-RPT-029; insufficient/conflicting evidence rules.  
**Audit Event:** AUD-RPT-029..031.  
**Test ID:** TC-SCR-WEB-RPT-012-01..08.  
**UAT:** UAT-29,118,119.  
**Acceptance Criteria:** narrative uses confirmed aggregation only; AI cannot alter numbers; stale when aggregation/source snapshot changes; submitted version immutable.

## WEB-RPT-013 – Xuất báo cáo
**CRUD:** Create export job; Read export history/artifact; archive artifact by retention policy.  
**Bulk:** Select/Select All export history; bulk download/archive eligible.  
**Permission Code:** RPT.EXPORT.RUN, READ.  
**Data Scope:** cycle/report scope.  
**Allowed States:** QUEUED, RUNNING, SUCCEEDED, FAILED, ARCHIVED.  
**BRULE:** BRULE-078,082,083,086,087,095,101,102,121,128.  
**API:** API-RPT-018,047.  
**Master Data:** OutputFormat, ReportTemplate, Classification.  
**Exception:** EX-RPT-030,031.  
**Audit Event:** AUD-RPT-032.  
**Test ID:** TC-SCR-WEB-RPT-013-01..07.  
**UAT:** UAT-120,23.  
**Acceptance Criteria:** export pins cycle/schema/aggregation/source snapshot; DOCX/XLSX/PDF output as configured; authorization on download.

# Batch Exit Criteria
SC-06 ENGINEERING READY khi:
- 13/13 màn đủ 13 trường cố định.
- Submission versioning explicit.
- Schema approval/versioning explicit.
- UnitOfMeasure canonical + conversion gate explicit.
- Source lineage field/cell/page explicit.
- Quality BLOCKER + override explicit.
- Reconciliation override explicit.
- Aggregation deterministic, LLM arithmetic prohibited.
- Narrative does not mutate numbers.
- Export pins full source/schema snapshot.
