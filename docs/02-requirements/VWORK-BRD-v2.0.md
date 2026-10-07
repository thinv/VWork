# VWork – Business Requirements Document (BRD) v2.0

**Sản phẩm:** VWork – Trợ lý AI cho công việc hằng ngày của cán bộ, công chức  
**Đối tượng ưu tiên:** Cán bộ, công chức và lãnh đạo xã/phường  
**Status:** Product/Business Baseline v2  
**Relationship:** BRD v2.0 kế thừa năng lực kỹ thuật đã đặc tả ở v1.x nhưng thay đổi cách đóng gói, ownership và trải nghiệm sản phẩm.

# 1. Bối cảnh

Cán bộ xã/phường thường phải:
- đọc và xử lý nhiều văn bản;
- tham mưu và soạn thảo;
- tổng hợp Word/Excel/PDF;
- chuẩn bị và xử lý nội dung cuộc họp;
- thực hiện báo cáo;
- tra cứu quy định;
- theo dõi nhiều đầu việc từ nhiều nguồn.

Đồng thời, đơn vị có thể đã được tỉnh/thành phố cung cấp:
- hệ thống quản lý văn bản;
- hệ thống một cửa/TTHC;
- hệ thống báo cáo;
- lịch công tác;
- hệ thống giao việc;
- SSO/directory;
- CSDL chuyên ngành.

Vấn đề không phải lúc nào cũng là “thiếu hệ thống quản lý”, mà là:
- dữ liệu nằm ở nhiều nơi;
- người dùng mất thời gian đọc/tìm/tổng hợp;
- các hệ thống nguồn ít hỗ trợ AI theo ngữ cảnh cá nhân;
- một công việc phải đi qua nhiều tài liệu/hệ thống;
- cán bộ vẫn phải copy/paste, soạn Word, xử lý Excel thủ công;
- tri thức và mẫu chưa được khai thác như trợ lý.

# 2. Business Problem

VWork v2 phải giải quyết:

**BPB-01 – Cognitive overload**  
Người dùng mất thời gian đọc và hiểu tài liệu.

**BPB-02 – Fragmented work context**  
Một việc nằm rải rác ở văn bản, email, họp, báo cáo và hệ thống khác.

**BPB-03 – Repetitive drafting**  
Nhiều văn bản/báo cáo được tạo lại thủ công.

**BPB-04 – Weak knowledge reuse**  
Khó tái sử dụng mẫu, căn cứ, báo cáo và kinh nghiệm trước.

**BPB-05 – Data consolidation burden**  
Tổng hợp Excel/Word/PDF tốn thời gian và dễ sai.

**BPB-06 – Duplicate system risk**  
Nếu VWork xây lại eOffice/TTHC/reporting sẽ tạo dư thừa, khó triển khai và khó được chấp nhận.

# 3. Business Vision

VWork phải là:

> **AI Work Layer + Knowledge Layer + Integration Layer**

không phải mặc định là một eOffice hoặc ERP hành chính mới.

Người dùng nhìn thấy **công cụ để hoàn thành việc**.  
Platform phía sau vẫn có domain, workflow, task, governance, master data và audit.

# 4. Business Objectives

## OBJ2-01 – Personal Productivity
Giảm thời gian hoàn thành tác vụ văn phòng/tham mưu thường xuyên.

## OBJ2-02 – Better Advice
Tăng chất lượng tham mưu bằng nguồn, citation, template và tri thức dùng chung.

## OBJ2-03 – Reuse Existing Systems
Tận dụng các hệ thống tỉnh/thành phố đã có thay vì bắt khách hàng thay thế.

## OBJ2-04 – Unified Work Context
Gom ngữ cảnh công việc từ nhiều nguồn vào một trải nghiệm cá nhân.

## OBJ2-05 – Flexible Capability
Một cán bộ có thể dùng nhiều Tool/Skill không phụ thuộc một chức danh cố định.

## OBJ2-06 – Safe AI
AI không thay quyền chính thức, không bịa nguồn, không vượt data scope.

## OBJ2-07 – Configurable Deployment
Một codebase hoạt động ở SaaS/Private/On-Premise và nhiều Integration Profile.

# 5. Product Principles

P2-01 Task-centric, not module-centric.  
P2-02 Integration-first when external SoR exists.  
P2-03 Native AI where it tạo giá trị cá nhân.  
P2-04 Optional management capability, không mặc định ép dùng.  
P2-05 Skill is configuration/content, not privilege.  
P2-06 Human-in-the-loop.  
P2-07 Source-grounded and provenance-first.  
P2-08 One Core, no tenant fork.  
P2-09 Mobile is completion-oriented.  
P2-10 Admin complexity hidden from ordinary users.

# 6. Product Actors

V2 giữ 14 actor kỹ thuật/business của baseline và bổ sung cách nhìn theo Experience Persona:

## Persona P-01 – Cán bộ tác nghiệp
Cần hoàn thành việc nhanh, không muốn học cấu trúc hệ thống.

## Persona P-02 – Cán bộ tham mưu/văn phòng
Dùng nhiều văn bản, báo cáo, họp, template, tri thức.

## Persona P-03 – Cán bộ chuyên môn
Cần Tool chung + Skill chuyên ngành.

## Persona P-04 – Lãnh đạo
Cần nắm việc, brief, duyệt, hỏi nhanh theo context.

## Persona P-05 – Admin/Steward
Cấu hình tenant, connector, skill, knowledge, master data.

Một người có thể mang nhiều persona.

# 7. Business Requirements v2

## V2-BR-001 – Personal Tool Launcher
Hệ thống phải cung cấp Home theo Tool/công việc, không bắt buộc người dùng điều hướng qua 12 technical domain.

## V2-BR-002 – Core Tool Availability
Các Core Tool phải có thể được cấp theo entitlement và permission độc lập với Skill chuyên ngành.

## V2-BR-003 – Multi-Skill User
Một user phải có thể được gán 0..N Skill cùng lúc.

## V2-BR-004 – Skill Does Not Grant Permission
Skill không được tự mở rộng Role/Permission/Data Scope.

## V2-BR-005 – Custom Skill
Tenant phải có khả năng tạo/version/publish Custom Skill từ knowledge/template/prompt/checklist/rule/quick action mà không cần fork code.

## V2-BR-006 – Native/Integrated/Optional Resolution
Mỗi capability phải resolve mode theo tenant Integration Profile.

## V2-BR-007 – System of Record Registry
Mỗi integrated/hybrid object phải biết authoritative source và source object identity.

## V2-BR-008 – External State Protection
VWork không được tự đổi authoritative state của external object ngoài connector/action contract.

## V2-BR-009 – Connected Data Transparency
UI phải cho người dùng biết dữ liệu/action nào đến từ hệ thống nguồn.

## V2-BR-010 – Deep Link and Connector Action
VWork phải có thể mở hệ thống nguồn hoặc gọi connector cho action chính thức.

## V2-BR-011 – Unified Work Inbox
VWork phải gom work item từ nhiều nguồn thành “Việc của tôi” mà không làm mất provenance/source ownership.

## V2-BR-012 – Personal Workspace
Người dùng phải có workspace cho recent items, drafts, uploads, history, pinned tools và personal context trong phạm vi policy.

## V2-BR-013 – Tool Continuation
Output của Tool phải có thể tiếp tục sang Tool liên quan mà giữ context/provenance.

Ví dụ:
Incoming → Advice → Draft → Review → Export/Send.

## V2-BR-014 – Tham mưu có căn cứ
Tham mưu phải phân biệt FACT/INFERENCE/MISSING và gắn nguồn khi có.

## V2-BR-015 – AI Draft
Người dùng phải có thể sinh draft từ instruction + selected context + template/skill.

## V2-BR-016 – AI Review
AI Review không silent mutate; user kiểm soát accept/reject/override.

## V2-BR-017 – Incoming Intelligence
VWork phải xử lý được văn bản upload hoặc văn bản đồng bộ từ eOffice mà không yêu cầu VWork sở hữu sổ văn bản chính thức.

## V2-BR-018 – Meeting Intelligence
VWork phải hỗ trợ transcript/decision/minutes intelligence độc lập với hệ thống lịch họp authoritative.

## V2-BR-019 – Reporting Intelligence
VWork phải tổng hợp/kiểm tra/đối soát/soạn báo cáo mà không yêu cầu thay thế hệ thống báo cáo cấp trên.

## V2-BR-020 – Deterministic Number Handling
Số liệu official phải được tính bằng deterministic engine; LLM chỉ diễn giải.

## V2-BR-021 – Document Conversion
Người dùng phải chuyển PDF/scan/image/table sang artifact có thể biên tập/tái sử dụng và giữ source provenance.

## V2-BR-022 – Knowledge & Template Reuse
Tool phải khai thác được kho mẫu và tri thức theo permission, version và authority.

## V2-BR-023 – Ask VWork
Người dùng phải hỏi được trên dữ liệu được phép và nhận answer có citation/evidence state.

## V2-BR-024 – Executive Intelligence
Lãnh đạo phải có brief/inbox/signal trên dữ liệu VWork và external sources đã được phép.

## V2-BR-025 – Optional Basic Management
Khi tenant không có external system tương đương, VWork có thể bật basic Document/Task/Workflow/Meeting/Reporting capability.

## V2-BR-026 – No Forced Replacement
Không được yêu cầu khách hàng bỏ hệ thống tỉnh/thành phố chỉ để sử dụng Tool AI của VWork.

## V2-BR-027 – Integration Profile
Tenant phải có cấu hình cho Document, Task, Calendar, Reporting, One-stop, Identity, Signature và Specialist Systems.

## V2-BR-028 – Connector Health
Tool phụ thuộc connector phải biết connected/degraded/disconnected và không giả action thành công.

## V2-BR-029 – Sync Conflict
Conflict giữa local context và external source phải hiển thị/resolve theo policy, không silent merge.

## V2-BR-030 – Screen Exposure
151 platform screens phải được phân lớp Exposure/Mode/Audience/SourceOfTruth; ordinary users chỉ thấy subset phù hợp.

## V2-BR-031 – Mobile Tool Experience
Mobile phải tập trung vào Ask/Review/Approve/Work/Meeting/Notification/Quick Tool, không copy toàn bộ admin Web.

## V2-BR-032 – Entitlement Separate from Authorization
Commercial entitlement quyết định Tool/Skill được mua; authorization quyết định action/data user được phép.

## V2-BR-033 – Skill Version Trace
AI output chịu ảnh hưởng Skill phải lưu skillVersionId cùng prompt/template/source versions.

## V2-BR-034 – Personalization
User có thể pin/reorder/favorite Tool trong phạm vi entitlement.

## V2-BR-035 – Guided Onboarding
Tool phải có examples/empty-state hướng dẫn để user đạt first value nhanh.

## V2-BR-036 – Provenance Across Tools
Khi chuyển Tool, source/context/version/correlation phải được bảo toàn.

## V2-BR-037 – Audit Across External Actions
Connector/deep-link initiated action cần audit correlation trong VWork khi khả thi.

## V2-BR-038 – Admin Separation
Governance/Master Data/Provider/Audit/Integration không nằm trong primary IA của ordinary user.

## V2-BR-039 – Extension without Fork
Skill/sector extension phải dùng configuration/content/API, không fork VWork Core.

## V2-BR-040 – Backward Compatibility
V2 product refactor không được tự động phá state/API/data semantics đã baseline ở v1.x; thay đổi cần Delta Audit.

# 8. Core Tool Requirements

## TOOL-001 Tham mưu văn bản
P0.

## TOOL-002 Hoàn thiện văn bản
P0.

## TOOL-003 Xử lý văn bản đến
P0.

## TOOL-004 Trợ lý cuộc họp
P1 cho pilot tối thiểu; P0 cho full commune profile.

## TOOL-005 Tổng hợp báo cáo
P0.

## TOOL-006 Tổng hợp số liệu
P0.

## TOOL-007 Chuyển đổi tài liệu
P0.

## TOOL-008 Kho mẫu
P0.

## TOOL-009 Hỏi VWork
P0.

## TOOL-010 Việc của tôi
P0.

## TOOL-011 Tra cứu quy định
P0.

## TOOL-012 Soạn nhanh theo mẫu
P0.

# 9. Integration Requirements

Mỗi Integration Profile phải xác định:
- provider/system;
- ownership;
- auth mode;
- read/write capability;
- webhook/polling;
- object mapping;
- field mapping;
- deep-link;
- sync SLA;
- error handling;
- conflict handling;
- audit;
- retention/cache policy.

# 10. Unified Work Item

Unified Work Item không nhất thiết là official Task.

Minimum fields:
- workItemId;
- title;
- sourceSystem;
- sourceType;
- sourceObjectId;
- sourceOfTruth;
- priority;
- dueAt;
- actor/owner candidate;
- status projection;
- actionability;
- deepLink;
- contextRefs;
- lastSyncedAt;
- stale/conflict state.

Action có tính official phải re-authorize và thực hiện qua source contract.

# 11. Skill Requirements

Skill phải hỗ trợ:
- multi-assignment;
- version;
- effective date;
- owner;
- knowledge bindings;
- prompt bindings;
- template bindings;
- checklist/rule;
- quick actions;
- tool applicability;
- archive;
- audit.

Skill không được chứa arbitrary executable code ở v1.

# 12. User-facing IA Requirement

Primary navigation đề xuất:

1. Trang chủ
2. Việc của tôi
3. Công cụ
4. Hỏi VWork
5. Tri thức
6. Thông báo
7. Hồ sơ

Leader có thêm:
- Điều hành.

Admin tách riêng:
- Quản trị.

# 13. Success Criteria

SC2-01 User có thể sử dụng ít nhất một Tool AI mà không cần tích hợp eOffice trước.  
SC2-02 Khi eOffice được tích hợp, user không phải nhập lại official document metadata nếu connector cung cấp được.  
SC2-03 User có nhiều Skill vẫn có một Home thống nhất.  
SC2-04 Tool transition giữ context.  
SC2-05 External authoritative state không bị VWork mutate sai.  
SC2-06 100% grounded answer quan trọng theo citation policy.  
SC2-07 0 cross-tenant leak.  
SC2-08 0 permission escalation từ Skill.  
SC2-09 0 official arithmetic bằng LLM.  
SC2-10 Admin configuration không làm phức tạp ordinary user IA.

# 14. Non-Goals

BRD v2 không yêu cầu:
- xây full eOffice;
- xây full one-stop;
- thay provincial reporting SoR;
- xây HR/payroll/accounting;
- biến Skill thành hệ thống chuyên ngành đầy đủ;
- expose 151 screens cho mọi user.

# 15. Compatibility with v1.x

Các baseline v1.x vẫn là technical evidence:
- 151 Screen;
- 372 APIs;
- state machines;
- permission/audit catalogs;
- data model;
- tests/UAT.

Wave R3/R4 phải tạo **Delta Matrix**:
V2-BR → existing BR/UC/FR/Screen/API → KEEP / RELABEL / ADD / DEPRECATE / INTEGRATE / OPTIONAL.

Không đổi canonical technical baseline trước khi Delta Matrix được duyệt.

# 16. BRD v2 Exit Criteria

BRD v2 được coi là BUSINESS READY khi:
- Product Positioning v2 approved;
- Product Boundary v2 approved;
- N/I/O Matrix approved;
- Core Tool/Skill Catalog approved;
- không còn mâu thuẫn giữa “AI assistant” và “management replacement”;
- Wave R3 có đủ đầu vào để cập nhật FR/SRS/System-of-Record/Integration/Profile;
- Wave R4 có đủ đầu vào để reclassify 151 screens và thiết kế Golden Screens.
