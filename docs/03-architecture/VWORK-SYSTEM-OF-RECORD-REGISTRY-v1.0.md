# VWork – System-of-Record Registry v1.0

# 1. Purpose
Xác định hệ thống authoritative cho từng nhóm dữ liệu để VWork không tạo record cạnh tranh với hệ thống tỉnh/thành phố.

# 2. Ownership Types
- VWORK
- EXTERNAL
- HYBRID

# 3. Registry Schema
Mỗi entry:
SoRCode, ObjectType, TenantScope, DefaultOwner, SourceSystemType, SyncMode, ReadCapability, WriteCapability, DeepLinkCapability, ConflictPolicy, FreshnessSLA, RetentionPolicy, MappingVersion.

# 4. Initial Registry
| Object Type | Default SoR | VWork role |
|---|---|---|
| AI Draft | VWORK | authoritative |
| AI Review | VWORK | authoritative |
| Tool Run | VWORK | authoritative |
| Skill | VWORK | authoritative |
| Knowledge Index | VWORK | authoritative |
| Template | VWORK | authoritative |
| Official Incoming Document | EXTERNAL when eOffice exists | context/projection/intelligence |
| Official Outgoing Document | EXTERNAL when eOffice exists | draft/intelligence/deep-link |
| Signature/Issue Status | EXTERNAL | read/action connector |
| TTHC Case | EXTERNAL | contextual read/deep-link |
| Official Calendar | EXTERNAL when configured | projection |
| Meeting Transcript | VWORK | authoritative |
| Meeting Decision Candidate | VWORK | candidate |
| Official Meeting Conclusion | HYBRID | VWork draft/confirmed state or external if configured |
| Official Task | EXTERNAL when task system exists | projection |
| VWork Task | VWORK | optional authoritative |
| Unified Work Item | VWORK projection | non-authoritative projection |
| Provincial Report Submission | EXTERNAL | intelligence + deep-link |
| Report Analysis/Aggregation | VWORK | authoritative analytic artifact |
| User Identity | EXTERNAL when SSO/directory configured | linked membership |
| VWork Role/Data Scope | VWORK | authoritative for VWork |
| Org Directory | EXTERNAL or OPTIONAL VWORK | projection/fallback |
| Specialist Record | EXTERNAL | contextual only unless contract allows write |

# 5. Required Source Reference
sourceSystem, sourceObjectId, sourceVersion, sourceOfTruth, syncMode, lastSyncedAt, syncStatus, deepLink, mappingVersion, correlationId.

# 6. Conflict Policies
- EXTERNAL_WINS
- VWORK_WINS
- MANUAL_RECONCILE
- FIELD_LEVEL_POLICY
- IMMUTABLE_SNAPSHOT

# 7. Rules
- Không silently promote projection thành official record.
- Không reuse external ID như VWork primary key.
- Historical snapshot giữ source version đã dùng.
- External deletion phải map theo tombstone/retention policy, không hard delete evidence.
- Deep-link luôn re-authorize local access trước khi hiển thị.

# 8. Governance
Registry versioned per tenant/deployment.
Change ownership requires Change Request + migration impact + rollback.

# 9. Acceptance
Mọi integrated/hybrid capability phải resolve được SoR entry trước khi production enable.