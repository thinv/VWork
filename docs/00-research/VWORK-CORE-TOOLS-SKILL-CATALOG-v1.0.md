# VWork – Core Tools & Skill Catalog v1.0

**Status:** Product Experience Baseline  
**Principle:** Tool hoàn thành một việc cụ thể; Skill bổ sung tri thức/quy tắc/ngữ cảnh; Role/Permission vẫn kiểm soát quyền.

# 1. Model

VWork dùng mô hình:

**User → Role → Permission → Skill → Tool → Data Scope**

Trong đó:
- **Role**: vai trò/quyền hành chính.
- **Permission**: action được phép.
- **Data Scope**: dữ liệu được phép truy cập.
- **Skill**: năng lực/ngữ cảnh chuyên môn được bật.
- **Tool**: trải nghiệm hoàn thành một công việc.
- **Entitlement**: quyền sử dụng thương mại theo tenant/user.

Skill không tự cấp Permission hoặc Data Scope.

# 2. Core Tool Catalog

## TOOL-001 – Tham mưu văn bản
**Outcome:** từ nhiệm vụ/chỉ đạo/nguồn → đề xuất hướng xử lý + dự thảo.

Input:
- instruction;
- source documents;
- context;
- desired output.

Output:
- requirement summary;
- legal/policy basis;
- missing information;
- recommended handling;
- draft option.

Uses:
CAP-03 + CAP-04 + CAP-10 + CAP-11.

Default Mode: NATIVE.

## TOOL-002 – Hoàn thiện văn bản
**Outcome:** rà soát và nâng chất lượng tài liệu trước khi sử dụng chính thức.

Checks:
- chính tả/ngôn ngữ;
- logic;
- cấu trúc;
- căn cứ;
- số liệu;
- consistency;
- thể thức/rule;
- source support.

Output:
- score;
- findings;
- BLOCKER;
- suggested changes;
- revised version under human control.

Default Mode: NATIVE.

## TOOL-003 – Xử lý văn bản đến
**Outcome:** hiểu văn bản đến và biến thành việc có thể xử lý.

Input:
- upload;
- eOffice-linked document;
- email/file source.

Output:
- summary;
- yêu cầu;
- deadline candidate;
- output required;
- relevant basis;
- handling suggestion;
- optional work/task/draft.

Mode: HYBRID.

## TOOL-004 – Trợ lý cuộc họp
**Outcome:** từ context/audio → transcript → kết luận → nhiệm vụ → biên bản.

Mode: HYBRID.

## TOOL-005 – Tổng hợp báo cáo
**Outcome:** nhiều nguồn Word/Excel/PDF → kiểm tra → tổng hợp → báo cáo.

Mode: HYBRID.

## TOOL-006 – Tổng hợp số liệu
**Outcome:** hợp nhất bảng, chuẩn hóa chỉ tiêu, đối soát và xuất dữ liệu.

Mode: NATIVE.

Official arithmetic phải deterministic.

## TOOL-007 – Chuyển đổi tài liệu
Use cases:
- PDF → Word;
- scan/image → Word;
- bảng PDF → Excel;
- multi-image → document;
- OCR review.

Mode: NATIVE.

## TOOL-008 – Kho mẫu
**Outcome:** tìm/dùng/quản lý template theo quyền.

Mode: NATIVE.

## TOOL-009 – Hỏi VWork
**Outcome:** hỏi đáp có nguồn trên context người dùng được phép truy cập.

Mode: NATIVE.

Rules:
- permission-before-ranking;
- citation;
- insufficient/conflicting evidence;
- current-scope reauthorization.

## TOOL-010 – Việc của tôi
**Outcome:** Unified Work Inbox gom việc từ nhiều nguồn.

Sources:
- VWork Task;
- external task;
- incoming requirement;
- approval;
- meeting decision;
- reporting obligation;
- reminder;
- AI-discovered candidate after confirmation.

Mode: NATIVE/HYBRID.

## TOOL-011 – Tra cứu quy định
**Outcome:** tìm và giải thích văn bản/quy định có citation và authority.

Mode: NATIVE + connected knowledge.

## TOOL-012 – Soạn nhanh theo mẫu
**Outcome:** chọn mẫu → điền context → sinh draft nhanh.

Mode: NATIVE.

# 3. Tool UX Contract

Mỗi Tool phải có:
- tên theo hành động/ngôn ngữ người dùng;
- mô tả một câu;
- input tối thiểu;
- examples;
- recent history;
- primary CTA;
- output rõ;
- source/citation;
- continue-to-next-action;
- empty state hướng dẫn.

Không expose domain engine nếu không cần.

# 4. Tool Continuation

Tools phải nối tiếp nhau.

Ví dụ:
TOOL-003 Xử lý văn bản đến
→ TOOL-001 Tham mưu
→ TOOL-012 Soạn theo mẫu
→ TOOL-002 Hoàn thiện
→ Export/Send to eOffice.

TOOL-004 Meeting
→ confirmed decision
→ TOOL-010 Việc của tôi
→ TOOL-001/012 nếu cần soạn thông báo.

TOOL-005 Reporting
→ TOOL-006 Data
→ narrative draft
→ TOOL-002 Review.

# 5. Skill Model

Skill = cấu hình chuyên môn có thể gắn nhiều user.

SkillDefinition:
- skillCode;
- name;
- description;
- category;
- status;
- version;
- owner;
- applicableTools[];
- requiredKnowledgeCollections[];
- promptBindings[];
- templates[];
- rules[];
- checklists[];
- outputTypes[];
- recommendedQuickActions[];
- entitlementPolicy;
- effectiveFrom/To.

# 6. Initial Skill Catalog

## SKILL-COMMON-001 – Văn phòng hành chính
- văn bản;
- báo cáo;
- họp;
- tổng hợp;
- template chung.

## SKILL-LEADER-001 – Lãnh đạo & Điều hành
- executive brief;
- review/approval support;
- meeting decision;
- work signals;
- Ask VWork leadership context.

## SKILL-JUSTICE-001 – Tư pháp – Hộ tịch
- knowledge;
- template;
- checklist;
- domain prompts.
Không biến VWork thành hệ thống hộ tịch.

## SKILL-CULTURE-001 – Văn hóa – Xã hội
## SKILL-ECON-001 – Kinh tế – Hạ tầng
## SKILL-LAND-001 – Địa chính
## SKILL-FIN-001 – Tài chính
## SKILL-HR-001 – Nội vụ
## SKILL-CUSTOM-* – Tenant-defined

Các skill chuyên ngành ban đầu là content/configuration pack, không phải code fork.

# 7. Personalization

Home của user có:
- Dùng thường xuyên.
- Công cụ của tôi.
- Được gợi ý cho công việc của bạn.
- Tất cả công cụ được cấp.
- Thêm công cụ.

User có thể pin/unpin/reorder Tool nếu entitlement cho phép.

Recommendation không được tự cấp entitlement.

# 8. Tool Availability Resolution

Tool visible khi:
1. user authenticated;
2. tenant entitlement allows Tool;
3. user role/permission allows relevant actions;
4. required connector/profile available nếu Tool phụ thuộc;
5. skill constraint satisfied nếu Tool/flow yêu cầu;
6. source/data scope hợp lệ.

# 9. Skill Assignment

Một user có:
- 0..N skills;
- skill theo user;
- skill theo role;
- skill theo org unit;
- tenant default skill.

Effective skill set = union theo policy, nhưng không override explicit deny.

# 10. Custom Skill Builder – Scope v1

Admin/Knowledge Admin có thể:
- tạo Skill;
- chọn Tools áp dụng;
- chọn Knowledge Collection;
- bind Template;
- bind Prompt;
- tạo checklist;
- thêm quick action;
- version/publish/archive.

Không cho arbitrary code execution.

# 11. Governance

- Skill version published immutable.
- Run pin skillVersionId khi output phụ thuộc skill.
- Knowledge permission vẫn enforce độc lập.
- Prompt/template version được pin.
- Skill archive không phá historical trace.
- Changes audited.

# 12. Commercial Entitlement

License có thể giới hạn:
- Tool;
- Skill;
- AI quota;
- connector;
- storage;
- advanced feature.

Commercial entitlement khác Permission.

# 13. Golden Home Recommendation

Default user Home không dùng menu 12 domain.

Primary service launcher:
1. Tham mưu văn bản
2. Hoàn thiện văn bản
3. Xử lý văn bản đến
4. Trợ lý cuộc họp
5. Tổng hợp báo cáo
6. Tổng hợp số liệu
7. PDF/scan → Word
8. Kho mẫu
9. Hỏi VWork
10. Việc của tôi

Các công cụ khác nằm trong “Tất cả công cụ”.

# 14. Acceptance

- User không thuộc skill chuyên ngành vẫn dùng Core Tools theo entitlement.
- User có thể được gán nhiều skills.
- Skill không làm tăng quyền dữ liệu.
- Core Tools hoạt động độc lập với việc tỉnh đã có eOffice/TTHC.
- Tool flow có continuation thay vì silo.
- Backend platform capability được tái sử dụng, không fork.
