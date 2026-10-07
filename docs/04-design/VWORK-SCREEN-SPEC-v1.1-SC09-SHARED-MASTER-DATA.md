# VWork – Screen Specification v1.1 – Batch SC-09 Shared / Master Data

**Phạm vi:** WEB-MD-001..020  
**Format:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước chung
- System-owned: tenant không sửa semantic/code.
- Tenant-owned: full CRUD theo quyền.
- Hybrid: system baseline + tenant extension có kiểm soát.
- Referenced item không hard delete.
- Code ổn định; label/description/effective dates version được.
- Administrative data và UoM semantic dùng version/effective date.
- Import bắt buộc Validate → Diff → Confirm → Apply.
- Master change phải audit + cache invalidation khi publish.
- Historical business record giữ snapshot/version cũ.

## WEB-MD-001 – Tổng quan Master Data
**CRUD:** Read dashboard; drill-down datasets; không sửa aggregate.  
**Bulk:** N/A dashboard.  
**Permission Code:** MD.OVERVIEW.READ.  
**Data Scope:** PLATFORM_ADMIN/TENANT_ADMIN/DATA_STEWARD/DOMAIN_STEWARD.  
**Allowed States:** dataset ACTIVE/INACTIVE/RETIRED/STAGING.  
**BRULE:** 161..176.  
**API:** MD-049,050,030.  
**Master Data:** DatasetType, OwnershipType.  
**Exception:** EX-MD-024.  
**Audit Event:** read audit nếu policy.  
**Test ID:** TC-SCR-WEB-MD-001-01..05.  
**UAT:** 159,163,175.  
**Acceptance Criteria:** overview counts authoritative; system/tenant/hybrid ownership visible; stale cache indicator supported.

## WEB-MD-002 – Danh sách Code List
**CRUD:** Create/Read/Update/Retire tenant-owned list; system-owned read-only.  
**Bulk:** Select All; bulk retire/activate/export eligible.  
**Permission Code:** MD.CODE_LIST.READ/CREATE/UPDATE/RETIRE/BULK.  
**Data Scope:** SYSTEM_READONLY/PLATFORM_ADMIN/TENANT_ADMIN/DATA_STEWARD.  
**Allowed States:** DRAFT/ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,173,175,176.  
**API:** MD-001..005,031,032.  
**Master Data:** OwnershipType, DatasetStatus.  
**Exception:** EX-MD-001,002,003,004,022.  
**Audit Event:** AUD-MD-001..005,039.  
**Test ID:** TC-SCR-WEB-MD-002-01..08.  
**UAT:** 159,161,174.  
**Acceptance Criteria:** system semantic protected; referenced list not hard delete; bulk partial-safe.

## WEB-MD-003 – Chi tiết Code List
**CRUD:** Read; update metadata; create version; retire.  
**Bulk:** item-level navigation only; list itself N/A.  
**Permission Code:** MD.CODE_LIST.READ/UPDATE/CREATE_VERSION/RETIRE.  
**Data Scope:** dataset owner scope.  
**Allowed States:** DRAFT/ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 162..165,173,174,176.  
**API:** MD-003..005,031.  
**Master Data:** OwnershipType, VersionStatus.  
**Exception:** EX-MD-001,004,005.  
**Audit Event:** AUD-MD-002..004.  
**Test ID:** TC-SCR-WEB-MD-003-01..06.  
**UAT:** 159,160,176.  
**Acceptance Criteria:** exact version/effective range shown; historical usage counts; system-owned editing disabled.

## WEB-MD-004 – Tạo/Sửa Code List
**CRUD:** Create/Edit draft/create version; no direct semantic mutation of referenced published version.  
**Bulk:** N/A form.  
**Permission Code:** MD.CODE_LIST.CREATE/UPDATE/CREATE_VERSION.  
**Data Scope:** tenant/platform steward scope.  
**Allowed States:** DRAFT/ACTIVE with new-version flow.  
**BRULE:** 161..165.  
**API:** MD-002,004,005.  
**Master Data:** OwnershipType, ScopeType.  
**Exception:** EX-MD-001,002,004,005.  
**Audit Event:** AUD-MD-001..003.  
**Test ID:** TC-SCR-WEB-MD-004-01..06.  
**UAT:** 159,160.  
**Acceptance Criteria:** unique code; ownership enforced; semantic change creates version when required.

## WEB-MD-005 – Danh sách Code List Item
**CRUD:** Add/Read/Edit/Activate/Deactivate/Retire.  
**Bulk:** Select All; bulk activate/deactivate/retire/category/export.  
**Permission Code:** MD.CODE_ITEM.READ/CREATE/UPDATE/ACTIVATE/DEACTIVATE/RETIRE/BULK.  
**Data Scope:** parent dataset scope.  
**Allowed States:** DRAFT/ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 162..165,173..176.  
**API:** MD-006..012.  
**Master Data:** ItemStatus, Category.  
**Exception:** EX-MD-001..005,022,023.  
**Audit Event:** AUD-MD-006..011,039.  
**Test ID:** TC-SCR-WEB-MD-005-01..10.  
**UAT:** 160,161,176.  
**Acceptance Criteria:** stable code; referenced retire only; Select All filter snapshot; partial result.

## WEB-MD-006 – Tạo/Sửa Code List Item
**CRUD:** Create/Edit; lifecycle actions available by state.  
**Bulk:** N/A form.  
**Permission Code:** MD.CODE_ITEM.CREATE/UPDATE/ACTIVATE/DEACTIVATE/RETIRE.  
**Data Scope:** parent dataset scope.  
**Allowed States:** DRAFT/ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 162..165.  
**API:** MD-007..011.  
**Master Data:** Category, Status.  
**Exception:** EX-MD-001..005.  
**Audit Event:** AUD-MD-006..010.  
**Test ID:** TC-SCR-WEB-MD-006-01..07.  
**UAT:** 160,176.  
**Acceptance Criteria:** code immutable after reference; effective period validated; retired item read-only.

## WEB-MD-007 – Đơn vị hành chính
**CRUD:** Read effective data; create/edit staging; retire/map successor via controlled flow.  
**Bulk:** Select All; bulk validate/publish/retire eligible staging/effective units by platform policy.  
**Permission Code:** MD.ADMIN_UNIT.READ/STAGE/UPDATE_STAGING/VALIDATE/PUBLISH/RETIRE/MAP_SUCCESSOR/BULK.  
**Data Scope:** SYSTEM_READONLY/PLATFORM_ADMIN.  
**Allowed States:** DRAFT/APPROVED/EFFECTIVE/EXPIRED/RETIRED.  
**BRULE:** 165..167,170..176.  
**API:** MD-013..017,033..039.  
**Master Data:** AdministrativeLevel, SourceSystem.  
**Exception:** EX-MD-005..009,022,024.  
**Audit Event:** AUD-MD-012..018,039.  
**Test ID:** TC-SCR-WEB-MD-007-01..10.  
**UAT:** 162..164,174,176.  
**Acceptance Criteria:** no tenant direct official edit; version/effective-date tree; successor mapping; no hard-coded 34 logic.

## WEB-MD-008 – Chi tiết đơn vị hành chính
**CRUD:** Read historical/current versions; edit staging only; map successor/retire controlled.  
**Bulk:** N/A detail.  
**Permission Code:** MD.ADMIN_UNIT.READ/UPDATE_STAGING/RETIRE/MAP_SUCCESSOR.  
**Data Scope:** platform-authoritative scope.  
**Allowed States:** all admin lifecycle states.  
**BRULE:** 165..167,174,176.  
**API:** MD-014,034,037,038.  
**Master Data:** AdministrativeLevel, SourceSystem.  
**Exception:** EX-MD-005..009,024.  
**Audit Event:** AUD-MD-013,016,017.  
**Test ID:** TC-SCR-WEB-MD-008-01..07.  
**UAT:** 163,164,176.  
**Acceptance Criteria:** as-of resolution works; predecessor/successor visible; historical label preserved.

## WEB-MD-009 – Cơ quan bên ngoài
**CRUD:** Create/Read/Update/Retire.  
**Bulk:** Select All; bulk retire/classify/export.  
**Permission Code:** MD.AGENCY.READ/CREATE/UPDATE/RETIRE/BULK.  
**Data Scope:** PLATFORM_ADMIN/TENANT_ADMIN/DATA_STEWARD.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,174,175.  
**API:** MD-018..020,040,041.  
**Master Data:** AgencyType, AdministrativeUnit.  
**Exception:** EX-MD-002,003,022,023.  
**Audit Event:** AUD-MD-019..022.  
**Test ID:** TC-SCR-WEB-MD-009-01..08.  
**UAT:** 165,161,176.  
**Acceptance Criteria:** source_system/external_id retained; referenced retire only; bulk partial-safe.

## WEB-MD-010 – Đơn vị đo
**CRUD:** Create/Read/Update/Create Version/Retire.  
**Bulk:** Select All; bulk activate/retire/conversion-group assignment.  
**Permission Code:** MD.UOM.READ/CREATE/UPDATE/CREATE_VERSION/RETIRE/BULK.  
**Data Scope:** PLATFORM_ADMIN/DATA_STEWARD.  
**Allowed States:** DRAFT/ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 165,168,173..176.  
**API:** MD-021..024,042,043.  
**Master Data:** DataTypeCompatibility, ConversionGroup.  
**Exception:** EX-MD-003,005,010,011,022.  
**Audit Event:** AUD-MD-023..027,039.  
**Test ID:** TC-SCR-WEB-MD-010-01..09.  
**UAT:** 166,174,176.  
**Acceptance Criteria:** incompatible conversion blocked; reporting-impact change versioned; historical metric unit preserved.

## WEB-MD-011 – Loại văn bản
**CRUD:** CRUD/retire via canonical DOCUMENT_TYPE code list.  
**Bulk:** Select All; bulk activate/deactivate/retire/export.  
**Permission Code:** MD.CODE_ITEM.*.  
**Data Scope:** hybrid system+tenant.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,174,175.  
**API:** MD-003,006..012.  
**Master Data:** DOCUMENT_TYPE.  
**Exception:** EX-MD-001..005,022,023.  
**Audit Event:** AUD-MD-006..011.  
**Test ID:** TC-SCR-WEB-MD-011-01..07.  
**UAT:** 167,161,176.  
**Acceptance Criteria:** tenant extension permitted without semantic collision; issued documents retain snapshot.

## WEB-MD-012 – Lĩnh vực
**CRUD:** CRUD/retire via DOCUMENT_FIELD/domain code list.  
**Bulk:** Select All; bulk activate/deactivate/retire.  
**Permission Code:** MD.CODE_ITEM.*.  
**Data Scope:** TENANT_ADMIN/DOMAIN_STEWARD.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,175.  
**API:** MD-003,006..012.  
**Master Data:** DOCUMENT_FIELD.  
**Exception:** EX-MD-002,003,022.  
**Audit Event:** AUD-MD-006..011.  
**Test ID:** TC-SCR-WEB-MD-012-01..06.  
**UAT:** 168,161.  
**Acceptance Criteria:** unique tenant code; referenced retire only; bulk safe.

## WEB-MD-013 – Nhóm nơi nhận
**CRUD:** CRUD/retire via RECIPIENT_GROUP.  
**Bulk:** Select All; bulk activate/deactivate/retire.  
**Permission Code:** MD.CODE_ITEM.*.  
**Data Scope:** TENANT_ADMIN/DOMAIN_STEWARD.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,175.  
**API:** MD-003,006..012.  
**Master Data:** RECIPIENT_GROUP.  
**Exception:** EX-MD-002,003,022.  
**Audit Event:** AUD-MD-006..011.  
**Test ID:** TC-SCR-WEB-MD-013-01..06.  
**UAT:** 168,161.  
**Acceptance Criteria:** referenced group remains historical; bulk state-aware.

## WEB-MD-014 – Loại hồ sơ công việc
**CRUD:** CRUD/retire via WORK_CASE_TYPE.  
**Bulk:** Select All; bulk lifecycle/export.  
**Permission Code:** MD.CODE_ITEM.*.  
**Data Scope:** TENANT_ADMIN/DOMAIN_STEWARD.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,174,175.  
**API:** MD-003,006..012.  
**Master Data:** WORK_CASE_TYPE.  
**Exception:** EX-MD-002,003,022,023.  
**Audit Event:** AUD-MD-006..011.  
**Test ID:** TC-SCR-WEB-MD-014-01..06.  
**UAT:** 168,176.  
**Acceptance Criteria:** existing Work Case snapshot not rewritten; retire preserves resolution.

## WEB-MD-015 – Loại cuộc họp
**CRUD:** CRUD/retire via MEETING_TYPE.  
**Bulk:** Select All; bulk lifecycle/export.  
**Permission Code:** MD.CODE_ITEM.*.  
**Data Scope:** TENANT_ADMIN/DOMAIN_STEWARD.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,174,175.  
**API:** MD-003,006..012.  
**Master Data:** MEETING_TYPE.  
**Exception:** EX-MD-002,003,022,023.  
**Audit Event:** AUD-MD-006..011.  
**Test ID:** TC-SCR-WEB-MD-015-01..06.  
**UAT:** 168,176.  
**Acceptance Criteria:** historical meeting snapshot stable; select-all/bulk complete.

## WEB-MD-016 – Loại báo cáo
**CRUD:** CRUD/retire via REPORT_TYPE.  
**Bulk:** Select All; bulk lifecycle/export.  
**Permission Code:** MD.CODE_ITEM.*.  
**Data Scope:** TENANT_ADMIN/DOMAIN_STEWARD.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 161..165,174,175.  
**API:** MD-003,006..012.  
**Master Data:** REPORT_TYPE.  
**Exception:** EX-MD-002,003,022,023.  
**Audit Event:** AUD-MD-006..011.  
**Test ID:** TC-SCR-WEB-MD-016-01..06.  
**UAT:** 168,176.  
**Acceptance Criteria:** reporting cycle/history retains type snapshot/version.

## WEB-MD-017 – Taxonomy
**CRUD:** Add root/child; edit; move; retire.  
**Bulk:** Select branch/All; bulk move/retire/category assignment.  
**Permission Code:** MD.TAXONOMY.READ/CREATE/UPDATE/MOVE/RETIRE/BULK.  
**Data Scope:** tenant/domain steward scope.  
**Allowed States:** ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 169,173..176.  
**API:** MD-025..029,044.  
**Master Data:** TaxonomyNodeType.  
**Exception:** EX-MD-006,007,012,013,022.  
**Audit Event:** AUD-MD-028..032,039.  
**Test ID:** TC-SCR-WEB-MD-017-01..09.  
**UAT:** 169,161,174.  
**Acceptance Criteria:** no cycle/duplicate sibling; retired node historical resolution; bulk move validated.

## WEB-MD-018 – Import Master Data
**CRUD:** Create import batch; Read status; Cancel before apply.  
**Bulk:** multi-file/upload rows supported by import batch semantics; no direct apply from first step.  
**Permission Code:** MD.IMPORT.CREATE/READ/VALIDATE/DIFF/APPLY/CANCEL.  
**Data Scope:** target dataset steward scope.  
**Allowed States:** UPLOADED/PARSED/MAPPED/VALIDATED/DIFF_READY/CONFIRMED/APPLIED/FAILED/CANCELLED.  
**BRULE:** 170..173,175.  
**API:** MD-015..017,045..047.  
**Master Data:** DatasetType, ImportFormat.  
**Exception:** EX-MD-014..020.  
**Audit Event:** AUD-MD-033,034,036,037,039.  
**Test ID:** TC-SCR-WEB-MD-018-01..09.  
**UAT:** 170,172,173,174.  
**Acceptance Criteria:** cannot skip Validate/Diff; checksum/idempotency; cancel before apply; source file retained by policy.

## WEB-MD-019 – Preview/Diff Import
**CRUD:** Read diff; confirm selections; Apply batch; no mutation of source rows outside resolution actions.  
**Bulk:** Select All NEW/CHANGED/RETIRE_CANDIDATE; bulk include/exclude/resolve compatible conflicts.  
**Permission Code:** MD.IMPORT.READ/DIFF/APPLY.  
**Data Scope:** import batch target scope.  
**Allowed States:** VALIDATED/DIFF_READY/CONFIRMED/APPLIED.  
**BRULE:** 170..172,175.  
**API:** MD-016,017,045,046.  
**Master Data:** DiffStatus.  
**Exception:** EX-MD-016..019,022.  
**Audit Event:** AUD-MD-035,036.  
**Test ID:** TC-SCR-WEB-MD-019-01..09.  
**UAT:** 171..173.  
**Acceptance Criteria:** statuses NEW/CHANGED/UNCHANGED/INVALID/CONFLICT/RETIRE_CANDIDATE; blocking conflict prevents apply; partial result explicit.

## WEB-MD-020 – Lịch sử Master Data
**CRUD:** Read-only append-only history/import/version changes.  
**Bulk:** Select All filtered records; export only.  
**Permission Code:** MD.HISTORY.READ/EXPORT.  
**Data Scope:** dataset/admin audit scope.  
**Allowed States:** immutable.  
**BRULE:** 165,174,176.  
**API:** MD-030,048.  
**Master Data:** ChangeType, DatasetType.  
**Exception:** EX-MD-021,024.  
**Audit Event:** AUD-MD-038.  
**Test ID:** TC-SCR-WEB-MD-020-01..06.  
**UAT:** 175,176.  
**Acceptance Criteria:** no edit/delete; historical value/version/effective date visible; export audited/filter snapshot.

# Batch Exit Criteria
- 20/20 màn đủ 13 trường.
- System/Tenant/Hybrid ownership explicit.
- CRUD/Select All/Bulk complete.
- referenced item never hard deleted.
- administrative version/effective/successor explicit.
- UoM version/conversion explicit.
- taxonomy integrity explicit.
- Import Validate→Diff→Confirm→Apply explicit.
- cache invalidation + snapshot preservation explicit.
- history append-only.
