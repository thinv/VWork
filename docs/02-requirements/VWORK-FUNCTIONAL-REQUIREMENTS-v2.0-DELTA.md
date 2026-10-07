# VWork – Functional Requirements v2.0 Delta

**Status:** R3 System Requirement Refactor  
**Base:** FR v1.0 (134 FR)  
**Rule:** Không renumber hoặc rewrite v1.0. V2 chỉ bổ sung/relate requirement mới.

# 1. Delta Principles
- KEEP: giữ semantics v1.
- RELABEL: giữ backend semantics, đổi cách trình bày/đóng gói.
- ADD: yêu cầu mới.
- INTEGRATE: external system có thể là authoritative source.
- OPTIONAL: capability chỉ bật theo Integration Profile.
- DEPRECATE-UX: không xóa capability, nhưng không còn primary user-facing flow.

# 2. New Functional Requirements

## FR2-001 – Tool Catalog Resolution
Hệ thống phải trả danh sách Tool khả dụng theo tenant entitlement, permission, data scope, skill và connector readiness.  
Trace: V2-BR-001..006, V2-BR-032.

## FR2-002 – Personal Tool Launcher
Home phải hiển thị Tool theo nhóm Dùng thường xuyên / Công cụ của tôi / Tất cả công cụ.  
Trace: V2-BR-001,034,035.

## FR2-003 – Tool Pin/Reorder
User được pin/unpin/reorder Tool mà không làm thay đổi entitlement hoặc permission.  
Trace: V2-BR-034.

## FR2-004 – Skill Assignment
Hệ thống hỗ trợ 0..N Skill cho user theo user/role/org/default policy.  
Trace: V2-BR-003.

## FR2-005 – Skill Versioning
Skill phải versioned, publish/archive, effective date và immutable sau publish.  
Trace: V2-BR-005,033.

## FR2-006 – Skill Binding
Skill được bind Knowledge Collection, Prompt Version, Template Version, Checklist, Rule, Quick Action và applicable Tool.  
Trace: V2-BR-005.

## FR2-007 – Skill Security Isolation
Skill không được mở rộng Role/Permission/Data Scope hoặc bypass source policy.  
Trace: V2-BR-004.

## FR2-008 – Commercial Entitlement Resolution
Tool/Skill availability phải tách commercial entitlement khỏi authorization.  
Trace: V2-BR-032.

## FR2-009 – System-of-Record Registry
Mỗi integrated/hybrid object type phải resolve authoritative system, ownership, sync mode và action contract.  
Trace: V2-BR-006..010,027.

## FR2-010 – External Object Identity
Integrated object phải lưu sourceSystem/sourceObjectId/sourceVersion/sourceOfTruth/deepLink.  
Trace: V2-BR-007.

## FR2-011 – Sync State
Integrated object phải thể hiện lastSyncedAt, syncStatus, stale/conflict state.  
Trace: V2-BR-009,028,029.

## FR2-012 – External Mutation Protection
Nếu sourceOfTruth=EXTERNAL, VWork không được mutate authoritative field/state ngoài connector action.  
Trace: V2-BR-008.

## FR2-013 – Connector Action
Hệ thống phải gọi external action theo idempotency/correlation/authorization contract và không giả success khi chưa có xác nhận.  
Trace: V2-BR-010,028,037.

## FR2-014 – Deep-Link Action
Nếu không có write API, VWork phải mở deep-link an toàn tới external object/action và audit correlation khi khả thi.  
Trace: V2-BR-010,037.

## FR2-015 – Integration Profile
Tenant phải cấu hình mode/provider cho Document, Task, Calendar, Reporting, One-stop, Identity, Signature và Specialist Systems.  
Trace: V2-BR-006,027.

## FR2-016 – Capability Mode Resolution
Runtime phải resolve NATIVE/INTEGRATED/OPTIONAL theo Integration Profile.  
Trace: V2-BR-006,025.

## FR2-017 – Optional Capability Enablement
Optional capability disabled phải ẩn khỏi primary IA và không nhận action mới.  
Trace: V2-BR-025,030.

## FR2-018 – Unified Work Inbox
Hệ thống phải hợp nhất work item từ VWork và external systems thành một danh sách cá nhân có source/provenance.  
Trace: V2-BR-011.

## FR2-019 – Unified Work Item Normalization
Work item phải normalize title/source/type/priority/due/status projection/actionability/deepLink/contextRefs.  
Trace: V2-BR-011.

## FR2-020 – Work Item Reconciliation
Nếu source item thay đổi, projection phải refresh/reconcile và đánh dấu stale/conflict khi cần.  
Trace: V2-BR-011,029.

## FR2-021 – Tool Continuation Context
Output Tool phải tiếp tục sang Tool khác với contextRefs/sourceVersions/correlation được giữ nguyên.  
Trace: V2-BR-013,036.

## FR2-022 – Tool History
User phải xem lịch sử Tool runs/output gần đây theo quyền và retention.  
Trace: V2-BR-012.

## FR2-023 – Personal Workspace
User có vùng recent uploads, drafts, pinned tools, recent contexts và history.  
Trace: V2-BR-012.

## FR2-024 – Connected Data Indicator
UI phải phân biệt dữ liệu VWork-native, external, hybrid và stale.  
Trace: V2-BR-009.

## FR2-025 – Connector Health
Tool phụ thuộc external system phải biết connected/degraded/disconnected và hiển thị degraded path.  
Trace: V2-BR-028.

## FR2-026 – Tham mưu Tool Composition
TOOL-001 phải orchestrate extraction + knowledge + advice + optional draft mà không yêu cầu Work Case chính thức.  
Trace: V2-BR-014.

## FR2-027 – Review Tool Composition
TOOL-002 phải chạy review trên upload/draft/external-linked document theo quyền.  
Trace: V2-BR-016.

## FR2-028 – Incoming Tool Hybrid Mode
TOOL-003 phải xử lý upload hoặc external-linked incoming document; official registry ownership theo SoR.  
Trace: V2-BR-017.

## FR2-029 – Meeting Tool Hybrid Mode
TOOL-004 phải tách calendar ownership khỏi transcript/decision/minutes intelligence.  
Trace: V2-BR-018.

## FR2-030 – Reporting Tool Hybrid Mode
TOOL-005 phải tách reporting intelligence khỏi official submission system.  
Trace: V2-BR-019.

## FR2-031 – Conversion Tool
TOOL-007 phải tạo derivative artifact có provenance và OCR confidence.  
Trace: V2-BR-021.

## FR2-032 – Ask VWork Action Cards
Assistant có thể trả structured action suggestions nhưng action chính thức phải re-authorize/confirm.  
Trace: V2-BR-023.

## FR2-033 – Executive Multi-Source Brief
Executive Brief phải aggregate nguồn native/external theo scope và source freshness.  
Trace: V2-BR-024.

## FR2-034 – Screen Exposure Metadata
Mỗi Screen phải có Exposure/Mode/Audience/SourceOfTruth metadata.  
Trace: V2-BR-030.

## FR2-035 – User Navigation v2
Ordinary user navigation không expose admin/internal/optional screen ngoài entitlement/mode.  
Trace: V2-BR-030,038.

## FR2-036 – Mobile Completion Experience
Mobile phải ưu tiên quick ask/review/approve/work/meeting/notification thay vì full admin parity.  
Trace: V2-BR-031.

## FR2-037 – Guided Tool Onboarding
Mỗi Tool phải có one-line value, example, empty state và first action.  
Trace: V2-BR-035.

## FR2-038 – External Action Audit
Connector/deep-link initiated action phải lưu source, actor, correlation, requested action, result khi khả thi.  
Trace: V2-BR-037.

## FR2-039 – Backward Compatibility Guard
V2 UX/config refactor không được đổi state/API/data semantics v1 nếu chưa qua Delta Change Control.  
Trace: V2-BR-040.

## FR2-040 – Tool/Skill API Contract
Hệ thống phải có contract riêng để query Tool Catalog, effective Skills, entitlements, Integration Profile và Unified Work Inbox.  
Trace: V2-BR-001..013.

# 3. Existing FR Disposition Summary
- FR-001..009 Identity: KEEP, một phần INTEGRATE cho SSO/org.
- FR-010..020 Document: KEEP; official registry/issue RELABEL→INTEGRATE/OPTIONAL.
- FR-021..041 Intelligence/Draft: KEEP, USER_PRIMARY.
- FR-042..049 Incoming: KEEP nhưng official registration INTEGRATE khi SoR tồn tại.
- FR-050..060 Work/Task: KEEP platform; exposure OPTIONAL/HYBRID.
- FR-061..070 Workflow: KEEP platform; OPTIONAL/HYBRID.
- FR-071..079 Meeting: KEEP; calendar ownership INTEGRATE.
- FR-080..091 Reporting: KEEP; official submission INTEGRATE.
- FR-092..108 Knowledge/Assistant/Executive: KEEP, ưu tiên USER_PRIMARY.
- FR-109..124 Governance: KEEP, ADMIN.
- FR-125..134 Master Data: KEEP, ADMIN/PLATFORM_INTERNAL.

# 4. Exit
FR v2 Delta đủ đầu vào cho SRS v2, SoR Registry, Integration Profile, Tool/Skill model, Unified Work Inbox và R4 Screen Exposure Audit.