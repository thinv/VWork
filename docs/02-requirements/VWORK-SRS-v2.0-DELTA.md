# VWork – Software Requirements Specification v2.0 Delta

**Base:** SRS v1.0  
**Purpose:** Khóa thay đổi kiến trúc hệ thống do Product Refactor v2 mà không phá technical baseline.

# 1. Architectural Reframe
VWork v2 gồm ba lớp sản phẩm:
1. **AI Work Layer** – Tool/Assistant/Personal Workspace/Unified Work Inbox.
2. **Knowledge Layer** – Knowledge, Template, Skill context, citation/provenance.
3. **Integration Layer** – System-of-Record registry, connectors, sync, external actions.

12 technical domains v1 vẫn tồn tại dưới ba lớp này.

# 2. New Logical Components
- Tool Catalog Service
- Skill Registry
- Entitlement Resolver
- Integration Profile Service
- System-of-Record Registry
- Connector Gateway
- External Action Coordinator
- Unified Work Inbox Service
- Work Item Projection Store
- Personal Workspace Service
- Screen Exposure Resolver

# 3. New Core Entities
ToolDefinition, ToolEntitlement, SkillDefinition, SkillVersion, SkillAssignment, SkillBinding, IntegrationProfile, IntegrationBinding, SourceSystem, SourceObjectReference, SyncState, ExternalAction, ExternalActionAttempt, UnifiedWorkItem, WorkItemSourceRef, PersonalWorkspaceItem, UserToolPreference, ScreenExposurePolicy.

# 4. Runtime Authorization
Tool availability = entitlement ∩ permission ∩ data scope ∩ skill constraint ∩ connector readiness ∩ capability mode.

Skill tuyệt đối không cấp permission.

# 5. External Source Runtime
Mọi integrated object:
- giữ SourceObjectReference;
- có source freshness;
- re-authorize local action;
- connector action có correlation/idempotency;
- external error không bị map thành success giả;
- stale/conflict hiển thị được.

# 6. Unified Work Inbox
Inbox không phải Task database thứ hai.
Nó là projection hợp nhất:
- VWork Task;
- external Task;
- approval;
- incoming requirement;
- meeting action;
- report obligation;
- reminder/signal.

Projection có thể refresh/rebuild mà không mất authoritative source identity.

# 7. Tool Orchestration
Tool là orchestration layer, không phải domain mới làm duplicate dữ liệu.
Tool có thể invoke existing API/domain service theo workflow context.

# 8. Data Ownership
- AI run, Tool run, Skill, Personal Workspace: VWork.
- official record: theo SoR Registry.
- projection/cache: VWork non-authoritative.
- user annotation: VWork.
- official mutation: connector/native authoritative service.

# 9. Integration Modes
NATIVE / INTEGRATED / OPTIONAL được resolve per tenant/capability.

Mode switch cần:
- compatibility check;
- migration plan nếu ownership đổi;
- connector health;
- user notification;
- audit;
- rollback policy.

# 10. API Delta
Không thay 372 API hiện tại trong R3.
R4/R5 phải bổ sung API mới theo namespace dự kiến:
- TOOL
- SKL
- INTG
- UWI
hoặc reuse GOV/IAM nếu kiến trúc quyết định.
Mọi API mới phải qua OpenAPI/change control.

# 11. UI Delta
151 Screen IDs vẫn giữ.
R4 gắn metadata Exposure/Mode/Audience/SourceOfTruth.
Có thể thêm Golden Screens/service launcher sau khi Screen Exposure Matrix hoàn tất.

# 12. NFR Additions
- Connector action acknowledgment: target ≤2s nếu external async, trả accepted/correlation.
- Sync freshness phải configurable per connector.
- Work Inbox phải hiển thị source freshness.
- External action retry phải idempotent.
- Connector secret không xuất hiện log/audit payload.
- Tool launcher p95 ≤2s từ cached effective catalog.
- Screen exposure resolution deterministic.
- Cross-tenant connector credential isolation bắt buộc.

# 13. Observability
Metrics:
- connector health;
- sync lag;
- external action failure rate;
- stale projection count;
- conflict count;
- Tool success/failure;
- continuation conversion;
- first-value time;
- Skill usage.

# 14. Security
- connector credentials tenant-scoped;
- skill bindings không bypass knowledge ACL;
- deep-link không mang secret;
- external response data tiếp tục qua normal data-classification policy;
- tool action server-authorized.

# 15. Compatibility
SRS v1 remains authoritative cho domain behavior đến khi v2 delta được merge vào canonical v2 SRS.
R3 không deprecate API/state/data model hiện tại.

# 16. Exit
System architecture sẵn sàng cho R4 UX refactor và R5 engineering delta khi 9 tài liệu R3 cùng PASS.