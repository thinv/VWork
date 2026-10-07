# VWork – Product Boundary v2.0

**Status:** Product Boundary Baseline v2
**Supersedes for product positioning:** Product Boundary v1.0
**Compatibility:** giữ lại toàn bộ platform capability/screen/API baseline v1.x trừ khi có Change Request riêng.

# 1. Boundary Principle

VWork không được mặc định coi mọi capability của platform là một hệ thống quản lý mà xã/phường phải sử dụng trực tiếp.

Mỗi capability phải được phân loại theo một trong ba mode:
- **NATIVE** – VWork là hệ thống thực thi chính.
- **INTEGRATED** – hệ thống bên ngoài là System of Record; VWork đọc/ghi qua connector trong phạm vi được phép.
- **OPTIONAL** – VWork có capability thay thế tối thiểu khi khách hàng chưa có hệ thống tương đương.

# 2. Native Boundary

Các capability mặc định NATIVE:

## 2.1 AI Assistance
- Tham mưu văn bản.
- Soạn thảo AI.
- Rà soát/hoàn thiện văn bản.
- Hỏi VWork theo context.
- Tra cứu có nguồn.
- AI action suggestions.

## 2.2 Knowledge
- Kho tri thức tenant.
- Personal knowledge/context.
- Template library.
- RAG.
- Citation.
- Source authority/versioning.
- Skill knowledge.

## 2.3 Document Intelligence
- OCR.
- Parse.
- Extraction.
- Classification.
- Provenance.
- PDF/scan conversion.
- Excel/Word extraction.

## 2.4 Meeting Intelligence
- Audio/STT.
- Transcript.
- Decision candidate.
- Minutes draft.
- Task/action extraction.
- Follow-up intelligence.

## 2.5 Reporting Intelligence
- Intake dữ liệu.
- Schema suggestion.
- Data quality.
- Reconciliation.
- Deterministic aggregation.
- Draft narrative.
- Export package.

## 2.6 Personal Work Intelligence
- Unified Work Inbox.
- Personal workspace.
- My Drafts.
- My Recent.
- Reminder/signals.
- Context/history.

# 3. Integrated Boundary

Mặc định ưu tiên tích hợp khi hệ thống authoritative đã tồn tại:
- Quản lý văn bản chính thức/eOffice.
- Sổ văn bản đến/đi chính thức.
- Ký số/phát hành.
- Một cửa/TTHC.
- Lịch công tác.
- Hệ thống thông tin báo cáo cấp tỉnh/thành phố.
- Hệ thống giao việc/chỉ đạo nếu địa phương đã có.
- HR/user directory/SSO.
- CSDL chuyên ngành.
- CSDL quốc gia hoặc nền tảng chia sẻ dữ liệu.
- Email/Drive/File system được phép.

VWork không được tự nhận ownership của dữ liệu authoritative chỉ vì đã sync/import dữ liệu.

# 4. Optional Boundary

Các capability sau tồn tại trong platform nhưng chỉ bật khi deployment profile yêu cầu:
- Basic Document Workspace.
- Basic Work Case.
- Basic Task Management.
- Basic Internal Workflow/Approval.
- Basic Meeting Calendar.
- Basic Internal Reporting.
- Basic Organization Directory.
- Basic Notification Hub.

OPTIONAL không đồng nghĩa mặc định user-facing.

# 5. System-of-Record Rule

Mỗi object/data class phải có tối thiểu:
- sourceSystem;
- sourceObjectId;
- sourceOfTruth = VWORK | EXTERNAL | HYBRID;
- syncMode = NONE | READ | READ_WRITE | EVENT_DRIVEN;
- lastSyncedAt;
- sourceVersion;
- deepLink nếu có;
- conflict policy.

Khi sourceOfTruth = EXTERNAL:
- VWork không được tự đổi authoritative state ngoài connector/action contract.
- UI phải phân biệt data copy/context với record chính thức.
- action chính thức có thể deep-link hoặc gọi connector.

# 6. Platform Capability vs Product Exposure

151-screen baseline được giữ như **Platform Capability Model**.

Mỗi Screen phải được gắn:
- Exposure = USER_PRIMARY | USER_SECONDARY | ADMIN | PLATFORM_INTERNAL | OPTIONAL
- Mode = NATIVE | INTEGRATED | OPTIONAL
- Audience = COMMON | SKILL_BASED | LEADER | ADMIN
- SourceOfTruth = VWORK | EXTERNAL | HYBRID

Không mặc định đưa toàn bộ 151 màn vào navigation cho cán bộ.

# 7. User-facing Product Boundary

Mặt trước của cán bộ ưu tiên:
1. Home / Công cụ của tôi.
2. Việc của tôi.
3. Tham mưu.
4. Hoàn thiện văn bản.
5. Xử lý văn bản đến.
6. Họp & Kết luận.
7. Báo cáo & Số liệu.
8. Chuyển đổi tài liệu.
9. Kho mẫu / Kho tri thức.
10. Hỏi VWork.
11. Kết nối / Dữ liệu nguồn khi cần.

Admin/Governance không xuất hiện trong primary navigation của người dùng thường.

# 8. Skill Boundary

Skill Pack không phải một module độc lập và không fork code.

Một Skill có thể bao gồm:
- knowledge collections;
- taxonomy;
- prompt versions;
- templates;
- checklists;
- validation rules;
- recommended tools;
- output types;
- quick actions.

Skill không được:
- tự cấp permission;
- mở rộng data scope;
- override security policy;
- làm thay đổi System of Record ownership.

# 9. Core Technical Capabilities Retained

Vẫn giữ 12 domain kỹ thuật:
1. Identity & Organization
2. Document Management
3. Document Intelligence
4. AI Draft & Review
5. Incoming Document Processing
6. Work Case & Task
7. Workflow & Approval
8. Meeting Intelligence
9. Reporting & Data Consolidation
10. Templates & Knowledge
11. AI Assistant & Executive Intelligence
12. Governance, Audit & Integration

Nhưng domain kỹ thuật không đồng nghĩa module menu.

# 10. Out of Scope

VWork không mặc định xây thay:
- full eOffice;
- full one-stop/TTHC;
- HRM/payroll;
- accounting/budget;
- asset ERP;
- GIS core;
- civil-status core;
- land core;
- digital signature/CA;
- enterprise email;
- provincial reporting SoR;
- vertical information system đã có authoritative owner.

# 11. Deployment Profile

Mỗi tenant có IntegrationProfile xác định:
- document system;
- task system;
- calendar;
- reporting;
- one-stop;
- identity/SSO;
- digital signature;
- specialist systems.

Mỗi capability được resolve thành NATIVE/INTEGRATED/OPTIONAL theo profile.

# 12. UX Boundary

UI phải ưu tiên completion-oriented flow.

Không yêu cầu user hiểu:
- Work Case engine;
- workflow state machine;
- master data;
- provider registry;
- job queue;
- audit internals.

Những thành phần đó phải làm nền cho các Tool.

# 13. Data Boundary

VWork owns:
- AI run/context/provenance;
- personal workspace;
- VWork-native drafts;
- transcript/minutes draft;
- knowledge index;
- tool history;
- skill definitions;
- VWork-native task/work objects khi profile bật;
- audit của VWork.

External system may own:
- official incoming/outgoing document;
- official signature/issue status;
- TTHC case;
- provincial reporting submission;
- official calendar;
- official task;
- authoritative organization directory;
- specialist records.

# 14. Product Guardrails v2

G-01 Không tạo eOffice thứ hai nếu eOffice đã có.
G-02 Không tạo TTHC system thứ hai.
G-03 Mọi integrated object phải biết authoritative source.
G-04 User-facing IA phải task-centric.
G-05 Skill không cấp quyền.
G-06 Tool không bypass state/security.
G-07 AI output quan trọng human-in-loop.
G-08 Source-grounded / FACT-INFERENCE-MISSING.
G-09 One Core, configurable deployment.
G-10 151-screen platform baseline được tái sử dụng, không phá bỏ.

# 15. Change Impact

v2.0 chủ yếu thay:
- product exposure;
- packaging;
- navigation;
- integration ownership;
- entitlement/skill;
- user journey.

Không tự động thay:
- state semantics;
- permission semantics;
- API IDs;
- audit rules;
- test/UAT baseline.

Mọi thay đổi kỹ thuật phát sinh sau v2.0 phải qua Delta Audit.