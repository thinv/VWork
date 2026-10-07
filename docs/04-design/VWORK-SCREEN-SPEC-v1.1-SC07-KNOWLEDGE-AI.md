# VWork – Screen Specification v1.1 – Batch SC-07 Knowledge / AI

**Phạm vi:** 11 Screen ID  
**Format:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước chung
- Permission filter trước semantic retrieval/ranking.
- Published template/knowledge version immutable.
- Revoke/Archive/permission-reduced phải invalidate retrieval/index/cache.
- Citation pin exact source/version/locator.
- Grounded answer thiếu bằng chứng → INSufficient Evidence, không bịa FACT.
- Source content là untrusted data; prompt injection không được override policy.
- Conversation phải re-evaluate permission ở mỗi message.
- Historical answer giữ retrieval snapshot và source refs.

## WEB-KNO-001 – Kho mẫu
**CRUD:** Create; Read; Edit draft template; Archive; published template thay đổi qua new version.  
**Bulk:** Select/Select All; bulk archive/tag/category nếu eligible.  
**Permission Code:** KNO.TEMPLATE.READ, CREATE, UPDATE, ARCHIVE, BULK.  
**Data Scope:** OWNED_SOURCE / ORG_UNIT / ORG_TREE / TENANT / EXPLICIT.  
**Allowed States:** DRAFT, REVIEW, PUBLISHED, SUPERSEDED, ARCHIVED.  
**BRULE:** BRULE-095,111..120,143.  
**API:** API-KNO-001..005,014..016.  
**Master Data:** TemplateType, DocumentType, Taxonomy, AuthorityLevel.  
**Exception:** EX-KNO-005,006,019.  
**Audit Event:** AUD-KNO-001..006.  
**Test ID:** TC-SCR-WEB-KNO-001-01..08.  
**UAT:** UAT-121,136,23.  
**Acceptance Criteria:** CRUD/select-all/bulk; published immutable; archive không làm mất historical pin.

## WEB-KNO-002 – Chi tiết mẫu
**CRUD:** Read; edit metadata nếu draft; archive; create version.  
**Bulk:** N/A detail.  
**Permission Code:** KNO.TEMPLATE.READ, UPDATE, CREATE_VERSION, ARCHIVE.  
**Data Scope:** template scope.  
**Allowed States:** DRAFT/REVIEW editable; PUBLISHED/SUPERSEDED/ARCHIVED read-only trừ lifecycle action.  
**BRULE:** BRULE-095,115,119,143.  
**API:** API-KNO-003,004,014,015.  
**Master Data:** TemplateType, Taxonomy, DocumentType.  
**Exception:** EX-KNO-005,006.  
**Audit Event:** AUD-KNO-002,003,005.  
**Test ID:** TC-SCR-WEB-KNO-002-01..05.  
**UAT:** UAT-121.  
**Acceptance Criteria:** exact version shown; published version không mutate; usage refs không leak ngoài scope.

## WEB-KNO-003 – Tạo/phiên bản mẫu
**CRUD:** Create new version; edit draft; publish.  
**Bulk:** N/A.  
**Permission Code:** KNO.TEMPLATE.CREATE_VERSION, UPDATE, PUBLISH.  
**Data Scope:** template scope.  
**Allowed States:** DRAFT → REVIEW → PUBLISHED.  
**BRULE:** BRULE-095,109,143.  
**API:** API-KNO-004,005.  
**Master Data:** TemplateType, DocumentType, Taxonomy.  
**Exception:** EX-KNO-005,006.  
**Audit Event:** AUD-KNO-003,004.  
**Test ID:** TC-SCR-WEB-KNO-003-01..06.  
**UAT:** UAT-121.  
**Acceptance Criteria:** publish exact version; stale draft conflict; historical version unchanged.

## WEB-KNO-004 – Kho tri thức
**CRUD:** Create source; Read; Update metadata; Archive/Restore; Create version.  
**Bulk:** Select/Select All; bulk archive/restore/reindex/taxonomy assignment.  
**Permission Code:** KNO.SOURCE.READ, CREATE, UPDATE, ARCHIVE, RESTORE, BULK, REINDEX, TAXONOMY.ASSIGN.  
**Data Scope:** OWNED_SOURCE / SHARED_WITH_ME / ORG_UNIT / ORG_TREE / TENANT / EXPLICIT.  
**Allowed States:** DRAFT, INGESTING, READY, PUBLISHED, STALE, REVOKED, ARCHIVED.  
**BRULE:** BRULE-088,089,092,095,111..120,133..136,142.  
**API:** API-KNO-006..011,017..021,024,025.  
**Master Data:** KnowledgeSourceType, AuthorityLevel, Taxonomy, Classification.  
**Exception:** EX-KNO-007..013,019.  
**Audit Event:** AUD-KNO-007..016.  
**Test ID:** TC-SCR-WEB-KNO-004-01..08.  
**UAT:** UAT-122..125,132,136.  
**Acceptance Criteria:** revoked source bị loại retrieval; bulk partial result; cross-tenant = 0.

## WEB-KNO-005 – Thêm nguồn tri thức
**CRUD:** Create source/version; edit draft metadata before ingest.  
**Bulk:** Multi-source upload/import optional; remove pending items before submit.  
**Permission Code:** KNO.SOURCE.CREATE, CREATE_VERSION, TAXONOMY.ASSIGN.  
**Data Scope:** target tenant/org scope.  
**Allowed States:** DRAFT → INGESTING → READY.  
**BRULE:** BRULE-088,095,109,133,134,139,142.  
**API:** API-KNO-006,009,021.  
**Master Data:** SourceType, AuthorityLevel, Taxonomy, EffectivePeriod.  
**Exception:** EX-KNO-007,011,017.  
**Audit Event:** AUD-KNO-007,009,015.  
**Test ID:** TC-SCR-WEB-KNO-005-01..06.  
**UAT:** UAT-123,130,132.  
**Acceptance Criteria:** authority/effective period required; duplicate warning; source content never treated as instructions.

## WEB-KNO-006 – Chi tiết nguồn
**CRUD:** Read; Update metadata; Create/Publish version; Reindex; Revoke/Restore; Archive.  
**Bulk:** N/A detail.  
**Permission Code:** KNO.SOURCE.READ, UPDATE, CREATE_VERSION, PUBLISH, REINDEX, REVOKE_VERSION, RESTORE, ARCHIVE, TAXONOMY.ASSIGN.  
**Data Scope:** source scope.  
**Allowed States:** DRAFT/INGESTING/READY/PUBLISHED/STALE/REVOKED/ARCHIVED.  
**BRULE:** BRULE-092,095,115,119,134..136,141,142.  
**API:** API-KNO-008..011,017..025.  
**Master Data:** AuthorityLevel, Taxonomy, SourceType, Classification.  
**Exception:** EX-KNO-008..012.  
**Audit Event:** AUD-KNO-008..015.  
**Test ID:** TC-SCR-WEB-KNO-006-01..08.  
**UAT:** UAT-123,125,126,132.  
**Acceptance Criteria:** revoke triggers invalidation; restore không tự publish nếu policy yêu cầu review; exact version visible.

## WEB-KNO-007 – Tìm kiếm tri thức
**CRUD:** Read/search; optional bulk action trên results nếu actor có admin permission.  
**Bulk:** Select/Select All filtered results; bulk archive/reindex/taxonomy only with matching permission.  
**Permission Code:** KNO.SEARCH.USE, KNO.SEARCH.BULK plus target action permission.  
**Data Scope:** current effective user/tenant scope trước ranking.  
**Allowed States:** source PUBLISHED/READY effective; REVOKED/ARCHIVED excluded from active results.  
**BRULE:** BRULE-088,089,095,133..136,142,144.  
**API:** API-KNO-012,023,026.  
**Master Data:** Taxonomy, AuthorityLevel, SourceType, EffectiveDate.  
**Exception:** EX-KNO-010,013,015,018,019.  
**Audit Event:** AUD-KNO-017,020.  
**Test ID:** TC-SCR-WEB-KNO-007-01..08.  
**UAT:** UAT-124,125,129,136,23.  
**Acceptance Criteria:** permission-before-ranking; revoked source excluded; retrieval trace restricted; no metadata leak.

## WEB-KNO-008 – Hỏi đáp có nguồn
**CRUD:** Create query/answer; Read history where embedded; answer immutable snapshot; regenerate creates new answer/run.  
**Bulk:** N/A answer surface.  
**Permission Code:** KNO.QUERY.USE, KNO.CITATION.READ, KNO.RETRIEVAL_TRACE.READ optional.  
**Data Scope:** current effective scope at query time and citation-open time.  
**Allowed States:** QUEUED/RUNNING/ANSWERED/INSUFFICIENT_EVIDENCE/CONFLICTING_EVIDENCE/FAILED/STALE.  
**BRULE:** BRULE-089..091,095,099,133..141,144.  
**API:** API-KNO-013,022,023.  
**Master Data:** AuthorityLevel, GroundingType, EvidenceStatus.  
**Exception:** EX-KNO-013..018, EX-AST-009..011.  
**Audit Event:** AUD-KNO-018..020, AUD-AST-006..008.  
**Test ID:** TC-SCR-WEB-KNO-008-01..09.  
**UAT:** UAT-18,19,124..131.  
**Acceptance Criteria:** grounded claim có citation; thiếu nguồn thì abstain; conflict explicit; prompt injection blocked; exact version citation.

## MOB-AI-001 – Ask VWork
**CRUD:** Create/read/update/archive own conversations; create/read messages.  
**Bulk:** Selection mode cho conversation list; Select All/Bulk archive.  
**Permission Code:** AST.CONVERSATION.CREATE, READ_OWN, UPDATE_OWN, ARCHIVE_OWN, AST.MESSAGE.CREATE, READ_OWN.  
**Data Scope:** own conversation + current authorized knowledge/object scope.  
**Allowed States:** conversation ACTIVE/ARCHIVED; answer RUNNING/ANSWERED/INSUFFICIENT_EVIDENCE/CONFLICTING_EVIDENCE/STALE/FAILED.  
**BRULE:** BRULE-089..091,095,099,133..141,144.  
**API:** API-AST-001..008, API-KNO-022.  
**Master Data:** AI UseCase, AuthorityLevel, GroundingType.  
**Exception:** EX-KNO-014..017, EX-AST-009..011.  
**Audit Event:** AUD-AST-001..008.  
**Test ID:** TC-SCR-MOB-AI-001-01..07.  
**UAT:** UAT-128..133,23.  
**Acceptance Criteria:** permission reevaluated mỗi message; stale/revoked source excluded; archive không xóa audit/history.

## MOB-AI-002 – Chat theo hồ sơ
**CRUD:** Create/read messages scoped to selected object; conversation lifecycle như MOB-AI-001.  
**Bulk:** N/A within chat.  
**Permission Code:** AST.MESSAGE.CREATE, READ_OWN + permission domain của context object.  
**Data Scope:** context object + current source scope.  
**Allowed States:** context ACTIVE/INACCESSIBLE/STALE; answer states như trên.  
**BRULE:** BRULE-095,129,133..141,144.  
**API:** API-AST-003,004 + context domain API + API-KNO-022.  
**Master Data:** ContextObjectType, GroundingType.  
**Exception:** EX-KNO-013,016, EX-AST-009..011.  
**Audit Event:** AUD-AST-004,005,006,007.  
**Test ID:** TC-SCR-MOB-AI-002-01..05.  
**UAT:** UAT-133,134,128,129.  
**Acceptance Criteria:** mất quyền object giữa conversation → không tiếp tục dùng context cũ; source citations exact.

## MOB-AI-003 – Nguồn trích dẫn
**CRUD:** Read-only exact citation/source locator.  
**Bulk:** N/A.  
**Permission Code:** KNO.CITATION.READ.  
**Data Scope:** current effective source permission, không phải quyền tại thời điểm answer.  
**Allowed States:** AVAILABLE, REVOKED, ARCHIVED, PERMISSION_DENIED, VERSION_MISSING.  
**BRULE:** BRULE-090,095,135,136,140,144.  
**API:** API-KNO-022.  
**Master Data:** CitationLocatorType, SourceType.  
**Exception:** EX-KNO-010,016.  
**Audit Event:** AUD-KNO-019.  
**Test ID:** TC-SCR-MOB-AI-003-01..05.  
**UAT:** UAT-126,127,135.  
**Acceptance Criteria:** mở đúng source/version/locator; revoked/denied không leak metadata; không fallback sang latest version.

# Batch Exit Criteria
SC-07 ENGINEERING READY khi:
- 11/11 màn đủ 13 trường.
- permission-before-ranking explicit.
- authority/version/effective-date policy explicit.
- revoke invalidation explicit.
- insufficient/conflicting evidence explicit.
- exact citation/version explicit.
- prompt injection isolation explicit.
- assistant per-message reauthorization explicit.
- API/Permission/Audit/Exception/Test/UAT mapping tồn tại.
