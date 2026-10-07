# VWork – Tool / Skill / Entitlement Model v1.0

# 1. Purpose
Tách rõ trải nghiệm người dùng, năng lực chuyên môn, quyền hệ thống và quyền thương mại.

# 2. Core Relationship
User → Role → Permission → Skill → Tool → Data Scope

Commercial Entitlement đứng song song, không thay thế Authorization.

# 3. ToolDefinition
Fields:
- toolCode
- name
- description
- category
- status
- defaultMode
- requiredPermissions[]
- optionalPermissions[]
- requiredCapabilities[]
- requiredConnectors[]
- supportedSkills[]
- inputSchema
- outputSchema
- primaryAction
- continuationActions[]
- iconKey
- displayOrder
- version

Lifecycle:
DRAFT → ACTIVE → INACTIVE → RETIRED.

# 4. SkillDefinition / SkillVersion
Fields:
- skillCode
- name
- category
- version
- owner
- status
- applicableTools[]
- knowledgeCollectionRefs[]
- promptVersionRefs[]
- templateVersionRefs[]
- checklistRefs[]
- ruleRefs[]
- outputTypes[]
- quickActions[]
- effectiveFrom/To

Lifecycle:
DRAFT → REVIEW → PUBLISHED → SUPERSEDED → ARCHIVED.

Published SkillVersion immutable.

# 5. SkillAssignment
Assignment targets:
- USER
- ROLE
- ORG_UNIT
- TENANT_DEFAULT

Fields:
assignmentId, skillCode, skillVersionPolicy, targetType, targetId, effectiveFrom/To, enabled.

Effective skill set = union assignments after authorization context.
Explicit security deny vẫn ưu tiên.

# 6. Entitlement
Entitlement answers: tenant/user đã mua/bật Tool/Skill nào.

Fields:
entitlementId, tenantId, subjectType, subjectId, featureType, featureCode, quota, effectiveFrom/To, status, commercialPlanRef.

Entitlement không:
- cấp permission;
- mở data scope;
- bypass connector policy.

# 7. Effective Tool Availability
Tool visible/actionable khi:
1. Tool active;
2. entitlement allows;
3. actor has required permission;
4. data scope valid;
5. skill constraint satisfied nếu có;
6. required connector health acceptable;
7. capability mode enabled;
8. tenant policy allows.

Return:
AVAILABLE / READ_ONLY / DEGRADED / UNAVAILABLE / HIDDEN
và reason codes.

# 8. UserToolPreference
User được:
- pin;
- unpin;
- reorder;
- favorite;
- hide optional presentation.

Không được dùng preference để bật Tool không có entitlement.

# 9. Custom Skill
Admin/Knowledge Admin có thể tạo Skill từ cấu hình.
Không arbitrary code execution.
Rule extension chỉ từ allowlisted rule types/plugin contracts.

# 10. Traceability
Mỗi Tool Run lưu:
toolCode, toolVersion, effectiveSkillVersions[], entitlementSnapshotRef, actor, dataScopeSnapshot, sourceRefs, prompt/model refs, correlationId.

# 11. Security
- Skill content không phải trusted instruction tự động.
- Knowledge ACL enforce độc lập.
- Prompt/tool action vẫn qua policy.
- Commercial admin không tự thành security admin.

# 12. Acceptance
- User không có Skill chuyên ngành vẫn dùng Core Tool chung nếu entitlement/permission cho.
- User có nhiều Skill nhưng một Home thống nhất.
- Skill không tăng quyền.
- Entitlement và Permission có thể thay đổi độc lập.
- Historical run biết Tool/Skill version đã dùng.