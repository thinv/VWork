# VWork – Screen Specification v1.1 – Batch SC-08 Governance

**Phạm vi:** 18 Screen ID = WEB-ADM-001..013 + MOB-NOT-001 + MOB-PRO-001..004.  
**Format:** Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## WEB-ADM-001 – Cơ cấu tổ chức
**CRUD:** Create/Read/Update/Retire; không hard delete unit đã tham chiếu.  
**Bulk:** Select All; bulk activate/retire/change parent/export theo policy.  
**Permission Code:** GOV.ORG.READ/CREATE/UPDATE/RETIRE/BULK.  
**Data Scope:** TENANT/ORG_TREE/EXPLICIT.  
**Allowed States:** DRAFT/ACTIVE/INACTIVE/RETIRED.  
**BRULE:** 145,147,149,157,160,111..120.  
**API:** IAM-008..010,022,023.  
**Master Data:** OrgType, AdministrativeUnit, Status.  
**Exception:** EX-GOV-002,023.  
**Audit Event:** AUD-GOV-001..004.  
**Test ID:** TC-SCR-WEB-ADM-001-01..08.  
**UAT:** 137,157,158.  
**Acceptance Criteria:** retire preserves history; child/reference validation; bulk partial-safe.

## WEB-ADM-002 – Người dùng
**CRUD:** Create/Read/Update/Deactivate/Reactivate.  
**Bulk:** Select All; bulk deactivate/reactivate/assign policy-limited actions.  
**Permission Code:** GOV.USER.READ/CREATE/UPDATE/DEACTIVATE/REACTIVATE/BULK.  
**Data Scope:** tenant admin scope.  
**Allowed States:** INVITED/ACTIVE/INACTIVE/SUSPENDED.  
**BRULE:** 145,147,148,157,111..120.  
**API:** IAM-011..013,024..027.  
**Master Data:** UserStatus, OrgUnit, Position.  
**Exception:** EX-GOV-003,004,023.  
**Audit Event:** AUD-GOV-005..009.  
**Test ID:** TC-SCR-WEB-ADM-002-01..09.  
**UAT:** 138,139,157,158.  
**Acceptance Criteria:** deactivate revokes access/session; history retained; cross-tenant zero leak.

## WEB-ADM-003 – Vai trò & phạm vi
**CRUD:** Create/Read/Update/Archive role; assign/remove role.  
**Bulk:** Select All roles/assignments; bulk assignment/removal with preview.  
**Permission Code:** GOV.ROLE.*, GOV.PERMISSION.READ, GOV.DATA_SCOPE.READ.  
**Data Scope:** admin-manageable scope only.  
**Allowed States:** DRAFT/ACTIVE/ARCHIVED; assignment ACTIVE/REVOKED.  
**BRULE:** 145..147,157,111..120.  
**API:** IAM-014..016,028..035.  
**Master Data:** PermissionCode, DataScopeType, RoleType.  
**Exception:** EX-GOV-001,005,006,023.  
**Audit Event:** AUD-GOV-010..014.  
**Test ID:** TC-SCR-WEB-ADM-003-01..10.  
**UAT:** 139,140,157,158.  
**Acceptance Criteria:** no privilege escalation; explicit scope required; archived role history retained.

## WEB-ADM-004 – Ủy quyền
**CRUD:** Create/Read/Update/Revoke.  
**Bulk:** Select All; bulk revoke/end-date where policy allows.  
**Permission Code:** GOV.DELEGATION.READ/CREATE/UPDATE/REVOKE/BULK.  
**Data Scope:** delegator/admin manageable scope.  
**Allowed States:** DRAFT/ACTIVE/EXPIRED/REVOKED.  
**BRULE:** 145,150,151,157,111..120.  
**API:** IAM-017,018,036..038.  
**Master Data:** DelegationType, ActionScope, OrgUnit.  
**Exception:** EX-GOV-007..009,023.  
**Audit Event:** AUD-GOV-015..018.  
**Test ID:** TC-SCR-WEB-ADM-004-01..08.  
**UAT:** 141,142,157.  
**Acceptance Criteria:** effective window/scope/action enforced; revoke immediate; no chain by default.

## WEB-ADM-005 – Hồ sơ văn bản
**CRUD:** Create/Read/Update draft/Create version/Publish/Archive.  
**Bulk:** Select All; bulk archive/tag/profile mapping.  
**Permission Code:** GOV.DOCUMENT_PROFILE.*.  
**Data Scope:** tenant config scope.  
**Allowed States:** DRAFT/REVIEW/PUBLISHED/SUPERSEDED/ARCHIVED.  
**BRULE:** 115,119,143,152.  
**API:** IAM-019,020,039..044.  
**Master Data:** DocumentType, FieldSchema, NumberingProfile.  
**Exception:** EX-GOV-010,023.  
**Audit Event:** AUD-GOV-019..023.  
**Test ID:** TC-SCR-WEB-ADM-005-01..07.  
**UAT:** 143.  
**Acceptance Criteria:** published immutable; historical document pins exact profile version.

## WEB-ADM-006 – AI Providers/Models
**CRUD:** Create/Read/Update/Disable provider/model.  
**Bulk:** Select All; bulk disable/tag/use-case assignment.  
**Permission Code:** GOV.AI_PROVIDER.*, GOV.AI_MODEL.*.  
**Data Scope:** tenant/platform AI admin scope.  
**Allowed States:** ACTIVE/DISABLED/UNHEALTHY/DEPRECATED.  
**BRULE:** 152..154,157.  
**API:** GOV-002..005,024..029.  
**Master Data:** ProviderType, ModelCapability, AIUseCase.  
**Exception:** EX-GOV-011..013,023.  
**Audit Event:** AUD-GOV-024..029.  
**Test ID:** TC-SCR-WEB-ADM-006-01..09.  
**UAT:** 144,145,157.  
**Acceptance Criteria:** secret masked; disabled config not used for new runs; fallback allowlist only.

## WEB-ADM-007 – Prompt Registry
**CRUD:** Create/Read/Create version/Publish/Archive.  
**Bulk:** Select All; bulk archive/tag/use-case mapping.  
**Permission Code:** GOV.PROMPT.*.  
**Data Scope:** AI admin scope.  
**Allowed States:** DRAFT/REVIEW/PUBLISHED/ARCHIVED.  
**BRULE:** 152,155,157.  
**API:** GOV-006,007,030..034.  
**Master Data:** AIUseCase, PromptStatus, ModelCapability.  
**Exception:** EX-GOV-014,023.  
**Audit Event:** AUD-GOV-030..033.  
**Test ID:** TC-SCR-WEB-ADM-007-01..07.  
**UAT:** 146,157.  
**Acceptance Criteria:** production run pins published prompt version; history immutable.

## WEB-ADM-008 – Evaluation
**CRUD:** Create run/Read list-detail/Cancel eligible run; result immutable.  
**Bulk:** Select All; bulk export/compare; no destructive result delete.  
**Permission Code:** GOV.EVALUATION.READ/RUN/CANCEL.  
**Data Scope:** AI admin/QA scope.  
**Allowed States:** QUEUED/RUNNING/SUCCEEDED/FAILED/CANCELLED.  
**BRULE:** 156,159.  
**API:** GOV-008,035..037.  
**Master Data:** EvalMetric, DatasetVersion, AIUseCase.  
**Exception:** EX-GOV-015,020.  
**Audit Event:** AUD-GOV-034,035.  
**Test ID:** TC-SCR-WEB-ADM-008-01..07.  
**UAT:** 147.  
**Acceptance Criteria:** all reproducibility inputs pinned; completed result immutable.

## WEB-ADM-009 – AI Usage
**CRUD:** Read-only usage/chargeback projection.  
**Bulk:** Select All rows for export/filter snapshot.  
**Permission Code:** GOV.AI_USAGE.READ/EXPORT.  
**Data Scope:** tenant/org/use-case scope.  
**Allowed States:** projection current/historical.  
**BRULE:** 095,157.  
**API:** GOV-009,038.  
**Master Data:** Provider, Model, AIUseCase, CostUnit.  
**Exception:** EX-GOV-018.  
**Audit Event:** AUD-GOV-036.  
**Test ID:** TC-SCR-WEB-ADM-009-01..05.  
**UAT:** 158.  
**Acceptance Criteria:** usage scope correct; export audited; no secret/prompt raw leakage.

## WEB-ADM-010 – Integrations
**CRUD:** Create/Read/Update/Test/Disable/Rotate secret.  
**Bulk:** Select All; bulk disable/test where safe.  
**Permission Code:** GOV.INTEGRATION.*.  
**Data Scope:** tenant integration admin scope.  
**Allowed States:** DRAFT/ACTIVE/DEGRADED/DISABLED.  
**BRULE:** 105,152,153,157.  
**API:** GOV-010..012,039..042.  
**Master Data:** IntegrationType, AuthType, ContractVersion.  
**Exception:** EX-GOV-016,017,023.  
**Audit Event:** AUD-GOV-037..041.  
**Test ID:** TC-SCR-WEB-ADM-010-01..09.  
**UAT:** 148,149,157.  
**Acceptance Criteria:** secret masked; test/rotate audited; disabled integration stops new outbound calls.

## WEB-ADM-011 – Audit
**CRUD:** Read-only append-only events.  
**Bulk:** Select All filtered events; export only.  
**Permission Code:** GOV.AUDIT.READ/EXPORT.  
**Data Scope:** audit scope by tenant/org/security role.  
**Allowed States:** immutable.  
**BRULE:** 097,098,157.  
**API:** GOV-001,043.  
**Master Data:** AuditEventType, ActorType, ObjectType.  
**Exception:** EX-GOV-018.  
**Audit Event:** AUD-GOV-042 for export.  
**Test ID:** TC-SCR-WEB-ADM-011-01..06.  
**UAT:** 150,158.  
**Acceptance Criteria:** no edit/delete; export uses filter snapshot; scope enforced.

## WEB-ADM-012 – Retention
**CRUD:** Read/Update policy; no physical delete from config screen.  
**Bulk:** Select All policies; bulk retention update/activate.  
**Permission Code:** GOV.RETENTION.READ/UPDATE/BULK.  
**Data Scope:** tenant policy scope.  
**Allowed States:** DRAFT/ACTIVE/SUPERSEDED.  
**BRULE:** 152,158.  
**API:** GOV-018,019,044.  
**Master Data:** ObjectType, RetentionClass, LegalHoldType.  
**Exception:** EX-GOV-019,023.  
**Audit Event:** AUD-GOV-043,044.  
**Test ID:** TC-SCR-WEB-ADM-012-01..07.  
**UAT:** 151,157.  
**Acceptance Criteria:** legal hold wins; policy changes audited/versioned.

## WEB-ADM-013 – Job Operations
**CRUD:** Read; Retry/Cancel eligible jobs; no delete history.  
**Bulk:** Select All; bulk retry/cancel state-aware.  
**Permission Code:** GOV.JOB.READ/RETRY/CANCEL/BULK.  
**Data Scope:** ops scope.  
**Allowed States:** QUEUED/RUNNING/SUCCEEDED/RETRYING/FAILED/CANCELLED/DEAD_LETTER.  
**BRULE:** 101..103,159.  
**API:** GOV-013..015,023,045.  
**Master Data:** JobStatus, JobType.  
**Exception:** EX-GOV-020,023.  
**Audit Event:** existing job events + AUD-GOV-045.  
**Test ID:** TC-SCR-WEB-ADM-013-01..08.  
**UAT:** 152,157.  
**Acceptance Criteria:** state-aware/idempotent; succeeded not retried implicitly; bulk partial result.

## MOB-NOT-001 – Thông báo
**CRUD:** Read notifications; mark read/clear projection; preference via settings.  
**Bulk:** selection mode/Select All; bulk read/clear.  
**Permission Code:** own-notification + ME.NOTIFICATION_PREFERENCE.*.  
**Data Scope:** SELF.  
**Allowed States:** UNREAD/READ/CLEARED.  
**BRULE:** 104,160,112..117.  
**API:** GOV-016,017,022,046,047.  
**Master Data:** NotificationType, Channel.  
**Exception:** EX-GOV-024,023.  
**Audit Event:** notification events + AUD-GOV-049.  
**Test ID:** TC-SCR-MOB-NOT-001-01..06.  
**UAT:** 155,157.  
**Acceptance Criteria:** own notifications only; bulk safe; preferences separate from authorization.

## MOB-PRO-001 – Hồ sơ cá nhân
**CRUD:** Read/Edit self profile.  
**Bulk:** N/A.  
**Permission Code:** ME.PROFILE.READ.  
**Data Scope:** SELF.  
**Allowed States:** ACTIVE/INACTIVE read policy.  
**BRULE:** 160.  
**API:** IAM-003,048.  
**Master Data:** Position/OrgUnit read-only snapshots where applicable.  
**Exception:** EX-GOV-022.  
**Audit Event:** profile update audit under user/self-service event.  
**Test ID:** TC-SCR-MOB-PRO-001-01..05.  
**UAT:** 154.  
**Acceptance Criteria:** self-service only; cannot edit role/scope/org authority fields.

## MOB-PRO-002 – Ủy quyền của tôi
**CRUD:** Create/Read/Update/Revoke own permitted delegations.  
**Bulk:** selection mode; bulk revoke.  
**Permission Code:** GOV.DELEGATION.READ/CREATE/UPDATE/REVOKE/BULK.  
**Data Scope:** SELF as delegator/delegatee.  
**Allowed States:** DRAFT/ACTIVE/EXPIRED/REVOKED.  
**BRULE:** 150,151,160.  
**API:** IAM-017,018,036..038.  
**Master Data:** DelegationType, ActionScope.  
**Exception:** EX-GOV-007..009.  
**Audit Event:** AUD-GOV-015..018.  
**Test ID:** TC-SCR-MOB-PRO-002-01..06.  
**UAT:** 141,142.  
**Acceptance Criteria:** only own/authorized delegation; effective window visible; revoke immediate.

## MOB-PRO-003 – Phiên đăng nhập
**CRUD:** Read own sessions; revoke one/revoke all.  
**Bulk:** Select All sessions; bulk revoke via revoke-all policy.  
**Permission Code:** ME.SESSION.READ/REVOKE.  
**Data Scope:** SELF.  
**Allowed States:** ACTIVE/REVOKED/EXPIRED.  
**BRULE:** 148,160.  
**API:** IAM-004,005,045.  
**Master Data:** DeviceType, SessionStatus.  
**Exception:** EX-GOV-021.  
**Audit Event:** AUD-GOV-046,047.  
**Test ID:** TC-SCR-MOB-PRO-003-01..06.  
**UAT:** 153.  
**Acceptance Criteria:** cannot revoke others; revoke-all policy explicit; current session behavior explicit.

## MOB-PRO-004 – Thiết lập ứng dụng
**CRUD:** Read/Update app + notification preferences.  
**Bulk:** N/A.  
**Permission Code:** ME.PREFERENCE.READ/UPDATE, ME.NOTIFICATION_PREFERENCE.READ/UPDATE.  
**Data Scope:** SELF.  
**Allowed States:** ACTIVE preference snapshot.  
**BRULE:** 160.  
**API:** IAM-046,047, GOV-046,047.  
**Master Data:** Language, Theme, NotificationChannel, DigestPolicy.  
**Exception:** EX-GOV-022,024.  
**Audit Event:** AUD-GOV-048,049.  
**Test ID:** TC-SCR-MOB-PRO-004-01..06.  
**UAT:** 155,156.  
**Acceptance Criteria:** preferences cannot alter permission/security; validation + audit.

# Batch Exit Criteria
- 18/18 màn đủ 13 trường.
- privilege escalation prevention explicit.
- organization/user/role/delegation lifecycle explicit.
- secrets never returned raw.
- AI provider/model/prompt lifecycle versioned.
- evaluation reproducible.
- audit append-only.
- retention respects legal hold.
- jobs state-aware/idempotent.
- mobile session/profile/preferences self-scoped.
