# VWork – Web Screen Catalog v1.0

**Mục tiêu:** Danh mục màn hình Web Core v1, trace trực tiếp tới Use Case, FR, API và domain.  
**Nguyên tắc:** Desktop-first, tiếng Việt, permission-aware, mọi màn có loading/empty/error/permission state. Mọi màn quản lý dữ liệu phải tuân `VWORK-CRUD-BULK-INTERACTION-STANDARD-v1.0`: Thêm, Sửa, Xóa/Lưu trữ, chọn từng dòng, Chọn tất cả và thao tác hàng loạt theo quyền.

## 1. Navigation cấp 1

1. Tổng quan
2. Văn bản
3. Hồ sơ công việc
4. Công việc
5. Soạn thảo AI
6. Họp
7. Báo cáo
8. Kho tri thức
9. Quản trị
10. Dữ liệu dùng chung

Global:
- Search
- Notification
- Job progress
- Profile/Tenant switch nếu được phép

---

# 2. Screen Catalog

## A. Authentication & Shell

| ID | Màn hình | Route | Actor | API chính |
|---|---|---|---|---|
| WEB-AUTH-001 | Đăng nhập | /login | All | IAM-001 |
| WEB-AUTH-002 | Chọn tenant/ngữ cảnh | /select-context | multi-membership | IAM-003 |
| WEB-SHELL-001 | App Shell | /* | All | IAM-003, GOV-016 |
| WEB-SHELL-002 | Thông báo | /notifications | All | GOV-016/017 |
| WEB-SHELL-003 | Tác vụ nền | /jobs | authorized | GOV-013/014 |

## B. Tổng quan & Executive

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-EXE-001 | Tổng quan cá nhân | / | All | WRK-007, WFL-007 |
| WEB-EXE-002 | Executive Inbox | /inbox | ACT-01 | EXE-001 |
| WEB-EXE-003 | Việc khẩn/quá hạn | /inbox/risks | ACT-01 | EXE-001/002 |
| WEB-EXE-004 | Daily Brief | /brief/daily | ACT-01 | EXE-003/004 |
| WEB-EXE-005 | Weekly Brief | /brief/weekly | ACT-01 | EXE-003/004 |
| WEB-EXE-006 | Ask VWork | /assistant | authorized | AST-001..004 |

## C. Văn bản

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-DOC-001 | Danh sách văn bản | /documents | ACT-02/03/04 | DOC-001..005/011/012/017 |
| WEB-DOC-002 | Tải tài liệu | /documents/upload | ACT-02/03/04 | DOC-001..003 |
| WEB-DOC-003 | Chi tiết văn bản | /documents/:id | authorized | DOC-005/007/015 |
| WEB-DOC-004 | Trình xem tài liệu | /documents/:id/view | authorized | DOC-009 |
| WEB-DOC-005 | Metadata | /documents/:id/metadata | ACT-02/03 | DOC-006 |
| WEB-DOC-006 | Phiên bản | /documents/:id/versions | authorized | DOC-007/008 |
| WEB-DOC-007 | So sánh phiên bản | /documents/:id/compare | ACT-03/05 | DOC-010 |
| WEB-DOC-008 | OCR & rà soát | /documents/:id/ocr | ACT-02/03 | INT-001/006/007 |
| WEB-DOC-009 | Dữ liệu trích xuất | /documents/:id/extraction | ACT-02/03 | INT-002..005 |
| WEB-DOC-010 | Quan hệ văn bản | /documents/:id/relations | authorized | DOC-015/016/018 |

## D. Văn bản đến

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-INC-001 | Danh sách văn bản đến | /incoming | ACT-02/03/01 | INC-001..003/011..013 |
| WEB-INC-002 | Đăng ký văn bản đến | /incoming/new | ACT-02 | INC-001 |
| WEB-INC-003 | Chi tiết xử lý | /incoming/:id | ACT-02/03/01 | INC-003/004/008..010/012/013 |
| WEB-INC-004 | Yêu cầu AI bóc tách | /incoming/:id/requirements | ACT-03 | INC-005/006 |
| WEB-INC-005 | Phương án xử lý | /incoming/:id/advice | ACT-03/01 | INC-007 |
| WEB-INC-006 | Tạo hồ sơ công việc | /incoming/:id/create-case | ACT-03/01 | INC-008 |
| WEB-INC-007 | Tạo bộ hồ sơ phản hồi | /incoming/:id/response-package | ACT-03 | INC-010 |

## E. Soạn thảo AI

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-DRF-001 | Danh sách dự thảo | /drafts | ACT-03/04 | DRF-001..003/013..015 |
| WEB-DRF-002 | Tạo dự thảo – Brief | /drafts/new | ACT-03/04 | DRF-001 |
| WEB-DRF-003 | Chọn nguồn & mẫu | /drafts/:id/context | ACT-03/04 | DOC-004, KNO-002 |
| WEB-DRF-004 | AI Draft Workspace | /drafts/:id/editor | ACT-03/04 | DRF-003..006, WFL-005 |
| WEB-DRF-005 | AI Review Panel | /drafts/:id/review | ACT-03/04 | DRF-007..009 |
| WEB-DRF-006 | Rewrite | editor side action | ACT-03/04 | DRF-010 |
| WEB-DRF-007 | Document Package | /packages/:id | ACT-03 | DRF-011/012 |
| WEB-DRF-008 | Lịch sử phiên bản | /drafts/:id/versions | ACT-03/05 | DRF-006 |

## F. Hồ sơ công việc

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-WC-001 | Danh sách hồ sơ | /work-cases | ACT-01/03/04 | WRK-001..004/017..020 |
| WEB-WC-002 | Tạo hồ sơ | /work-cases/new | ACT-03/04 | WRK-001 |
| WEB-WC-003 | Tổng quan hồ sơ | /work-cases/:id | authorized | WRK-003/004/017..019/021 |
| WEB-WC-004 | Timeline | /work-cases/:id/timeline | authorized | WRK-005 |
| WEB-WC-005 | Tài liệu liên quan | /work-cases/:id/documents | authorized | DOC-004 |
| WEB-WC-006 | Nhiệm vụ trong hồ sơ | /work-cases/:id/tasks | authorized | WRK-006..009/028/031 |
| WEB-WC-007 | Cuộc họp liên quan | /work-cases/:id/meetings | authorized | MTG-002 |
| WEB-WC-008 | Kết quả/đầu ra | /work-cases/:id/outputs | authorized | WRK-021..023 |

## G. Công việc

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-TSK-001 | Việc của tôi | /tasks/my | ACT-04/03/01 | WRK-007 |
| WEB-TSK-002 | Toàn bộ công việc | /tasks | authorized manager | WRK-006..009/024/027..029/031 |
| WEB-TSK-003 | Chi tiết Task | /tasks/:id | authorized | WRK-008..016/024..030 |
| WEB-TSK-004 | Tạo/Giao Task | /work-cases/:id/tasks/new | ACT-01/03 | WRK-006/009 |
| WEB-TSK-005 | Cập nhật tiến độ | /tasks/:id/progress | ACT-04 | WRK-011 |
| WEB-TSK-006 | Nộp kết quả | /tasks/:id/evidence | ACT-04 | WRK-012/013/030 |
| WEB-TSK-007 | Lịch sử & bàn giao | /tasks/:id/history | authorized | WRK-014/016 |
| WEB-TSK-008 | Quá hạn/Blocked | /tasks/risks | manager | WRK-007/028/031 |

## H. Trình duyệt

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-APR-001 | Hàng đợi cần duyệt | /approvals | ACT-01/05 | WFL-007/009..014 |
| WEB-APR-002 | Chi tiết hồ sơ trình | /approvals/:id | ACT-01/05 | WFL-008 |
| WEB-APR-003 | Lịch sử workflow | /workflow/:id/history | authorized | WFL-006 |
| WEB-APR-004 | Cấu hình workflow | /admin/workflows | ACT-10 | WFL-001..004/015..017 |

## I. Họp

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-MTG-001 | Danh sách cuộc họp | /meetings | ACT-01/03/06/07 | MTG-001..004/014/015 |
| WEB-MTG-002 | Tạo cuộc họp | /meetings/new | ACT-06 | MTG-001 |
| WEB-MTG-003 | Tổng quan cuộc họp | /meetings/:id | authorized | MTG-003/004/015..020/026/030 |
| WEB-MTG-004 | Giấy mời/Agenda | /meetings/:id/context | ACT-06 | MTG-005/016..026 |
| WEB-MTG-005 | Audio & Transcript | /meetings/:id/transcript | ACT-06/07 | MTG-006..009/027 |
| WEB-MTG-006 | Quyết định/Nhiệm vụ | /meetings/:id/decisions | ACT-06/07 | MTG-010..012/028/029 |
| WEB-MTG-007 | Biên bản | /meetings/:id/minutes | ACT-06/07 | MTG-013/030..033 |

## J. Báo cáo

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-RPT-001 | Danh sách kỳ báo cáo | /reports | ACT-08/01 | RPT-001..003/019..023 |
| WEB-RPT-002 | Tạo kỳ báo cáo | /reports/new | ACT-08 | RPT-001/019 |
| WEB-RPT-003 | Dashboard kỳ báo cáo | /reports/:id | ACT-08/01 | RPT-003/005/013/016/028/042/047 |
| WEB-RPT-004 | Đơn vị phải nộp | /reports/:id/obligations | ACT-08 | RPT-004/005/024..027 |
| WEB-RPT-005 | Nguồn báo cáo | /reports/:id/submissions | ACT-08 | RPT-006/028..031 |
| WEB-RPT-006 | AI đề xuất chỉ tiêu | /reports/:id/schema/suggest | ACT-08 | RPT-007/009/032..035 |
| WEB-RPT-007 | Metric Schema Editor | /reports/:id/schema | ACT-08 | RPT-008..010/032..035 |
| WEB-RPT-008 | Kết quả trích xuất | /reports/:id/extraction | ACT-08 | RPT-011/036..038 |
| WEB-RPT-009 | Data Quality | /reports/:id/quality | ACT-08 | RPT-012/013/039..041 |
| WEB-RPT-010 | Đối soát | /reports/:id/reconcile | ACT-08 | RPT-014/042/043 |
| WEB-RPT-011 | Tổng hợp số liệu | /reports/:id/aggregate | ACT-08 | RPT-015/016 |
| WEB-RPT-012 | Soạn báo cáo tổng | /reports/:id/draft | ACT-08 | RPT-017/044..046 |
| WEB-RPT-013 | Xuất báo cáo | /reports/:id/export | ACT-08 | RPT-018/047 |

## K. Kho mẫu & tri thức

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-KNO-001 | Kho mẫu | /templates | ACT-03/13 | KNO-001..005/014..016 |
| WEB-KNO-002 | Chi tiết mẫu | /templates/:id | authorized | KNO-003/004/014/015 |
| WEB-KNO-003 | Tạo/phiên bản mẫu | /templates/:id/edit | ACT-13 | KNO-004/005 |
| WEB-KNO-004 | Kho tri thức | /knowledge | authorized | KNO-006..011/017..021/024/025 |
| WEB-KNO-005 | Thêm nguồn tri thức | /knowledge/new | ACT-13 | KNO-006 |
| WEB-KNO-006 | Chi tiết nguồn | /knowledge/:id | ACT-13 | KNO-008..011/017..025 |
| WEB-KNO-007 | Tìm kiếm tri thức | /knowledge/search | authorized | KNO-012/023/026 |
| WEB-KNO-008 | Hỏi đáp có nguồn | /knowledge/ask | authorized | KNO-013/022/023 |

## L. Quản trị

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| WEB-ADM-001 | Cơ cấu tổ chức | /admin/organization | ACT-10 | IAM-008..010 |
| WEB-ADM-002 | Người dùng | /admin/users | ACT-10 | IAM-011..013 |
| WEB-ADM-003 | Vai trò & phạm vi | /admin/roles | ACT-10 | IAM-014..016 |
| WEB-ADM-004 | Ủy quyền | /admin/delegations | ACT-10 | IAM-017/018 |
| WEB-ADM-005 | Hồ sơ văn bản | /admin/document-profiles | ACT-10 | IAM-019/020 |
| WEB-ADM-006 | AI Providers/Models | /admin/ai | ACT-12 | GOV-002..005 |
| WEB-ADM-007 | Prompt Registry | /admin/prompts | ACT-12 | GOV-006/007 |
| WEB-ADM-008 | Evaluation | /admin/evaluations | ACT-12/14 | GOV-008 |
| WEB-ADM-009 | AI Usage | /admin/ai-usage | ACT-10/12 | GOV-009 |
| WEB-ADM-010 | Integrations | /admin/integrations | ACT-10/11 | GOV-010..012 |
| WEB-ADM-011 | Audit | /admin/audit | ACT-10/14 | GOV-001 |
| WEB-ADM-012 | Retention | /admin/retention | ACT-10 | GOV-018/019 |
| WEB-ADM-013 | Job Operations | /admin/jobs | ACT-11 | GOV-013..015 |

## M. Dữ liệu dùng chung / Master Data

Chi tiết đầy đủ xem: `VWORK-SHARED-MASTER-DATA-SCREEN-CATALOG-v1.0.md`.

Nhóm này gồm WEB-MD-001..020: Code Lists, Administrative Units, External Agencies, Units of Measure, Document Types, Domains, Recipient Groups, Work Case Types, Meeting Types, Report Types, Taxonomy, Import/Diff và History.


**Tổng catalog Core theo Screen ID:** 97 màn/route-level views. Bộ `VWORK-SHARED-MASTER-DATA-SCREEN-CATALOG-v1.0.md` bổ sung 20 màn quản trị dữ liệu dùng chung, nâng tổng baseline Web lên **117 màn/route-level views**. Một số side panel/modal dùng chung không tính thành màn riêng.

---

# 3. Đặc tả chi tiết màn trọng yếu

## WEB-EXE-002 – Executive Inbox
**Mục tiêu:** một hàng đợi duy nhất cho lãnh đạo.  
**Actor:** ACT-01.  
**FR:** FR-101,102,108.  
**API:** GET /executive/inbox.

Layout:
- Header + date/context.
- KPI strip: cần duyệt, khẩn, quá hạn, sắp đến hạn.
- Filter tabs.
- List items.
- AI summary panel tùy chọn.

Item fields:
- type.
- title.
- source/unit.
- priority.
- dueAt.
- status.
- action required.

Actions:
- mở.
- duyệt nhanh nếu policy cho.
- giao việc.
- Ask VWork.

States:
- loading skeleton.
- empty “Không có việc cần xử lý”.
- partial error theo widget.
- permission denied.

Acceptance:
- không hiển thị object ngoài data scope.
- overdue calculation nhất quán backend.
- click deep-link re-check authorization.

---

## WEB-DOC-003 – Chi tiết văn bản
**FR:** FR-015..020, FR-027.  
Layout 3 cột tùy viewport:
1. Viewer.
2. Metadata/Extraction tabs.
3. Activity/relations.

Header:
- title.
- type/status.
- version selector.
- source.
- actions: process, create case, draft, export.

Tabs:
- Thông tin.
- Trích xuất.
- Quan hệ.
- Phiên bản.
- Nhật ký.

Acceptance:
- version final read-only.
- provenance click scroll tới nguồn.
- malware/quarantine không preview content.

---

## WEB-DRF-004 – AI Draft Workspace
**FR:** FR-029..040.  
**API:** DRF-003..010.

Layout:
- Left: source/context drawer.
- Center: editor.
- Right: AI Copilot/Review panel.
- Top: draft mode, version, save, review, submit.

Editor:
- rich text.
- section anchors.
- selection actions.
- undo/redo.
- find.
- comment future.

AI panel:
- facts/missing.
- rewrite actions.
- review findings.
- citations.
- quality score.

Rules:
- AI không auto-apply.
- stale version warning.
- blocker gate trước submit.
- template version hiển thị.

---

## WEB-INC-003 – Chi tiết xử lý văn bản đến
Sections:
- viewer.
- AI summary.
- requirements table.
- deadlines.
- suggested units.
- missing information.
- actions.

Requirement row:
description, provenance, deadline, output, suggested owner, confidence, verified.

CTA:
- Xác nhận tất cả hợp lệ.
- Tạo Work Case.
- Tạo Task.
- Tạo bộ hồ sơ phản hồi.

---

## WEB-WC-003 – Tổng quan Work Case
Header:
code, title, status, priority, due, owner.

Widgets:
- progress summary.
- task status.
- latest events.
- documents.
- meetings.
- approvals.
- outputs.
- Ask VWork.

Rules:
- cannot complete if blocking active task.
- access inherited by related objects unless overridden.

---

## WEB-APR-002 – Chi tiết hồ sơ trình
Left: subject/document preview.  
Center: submitted version + compare.  
Right: AI summary, review findings, history.

Actions:
- Approve.
- Return.
- Reject.
- Request clarification.
- Delegate.

Validation:
- stale submitted version → disable approve.
- Return/Reject comment required.
- all actions server-authorized and audited.

---

## WEB-MTG-005 – Audio & Transcript
Layout:
- audio player waveform/timeline.
- transcript segment list.
- speaker labels.
- timestamp.
- confidence warning.
- side panel decision candidates.

Interaction:
- click transcript seeks audio.
- edit text/speaker.
- mark verified.
- extract decision.

---

## WEB-RPT-007 – Metric Schema Editor
Columns:
- code.
- name.
- datatype.
- unit.
- aggregation.
- required.
- source examples.
- status.

Actions:
- add/remove.
- reorder.
- validate.
- approve schema.

Rules:
- approved+used schema cannot mutate; create new version.
- duplicate code blocking.
- aggregation compatible datatype.

---

## WEB-RPT-009 – Data Quality
Views:
- finding summary by severity/type/unit.
- detail grid.
- source drill-down.
- resolve/override.

Blocking findings must clear before final report.

---

## WEB-KNO-008 – Hỏi đáp có nguồn
UI:
- context selector.
- conversation.
- citation cards.
- evidence sufficiency indicator.

Rule:
- insufficient evidence displayed explicitly.
- citations open source in permitted viewer.

---

# 4. Shared Components

- VwDataTable
- VwFilterBar
- VwStatusBadge
- VwPriorityBadge
- VwDocumentViewer
- VwSourceCitation
- VwAIConfidence
- VwJobProgress
- VwTimeline
- VwUserPicker
- VwOrgPicker
- VwPermissionGuard
- VwApprovalActions
- VwEmptyState
- VwErrorState

---

# 5. Global UX Rules

1. Mọi màn danh sách quản lý dữ liệu phải có **Thêm – Sửa – Xóa/Lưu trữ – checkbox từng dòng – Chọn tất cả – bulk action bar**.
2. Mọi màn chi tiết đối tượng có thể thay đổi phải có **Sửa** và **Xóa/Lưu trữ/Thu hồi** theo quyền.
3. Dữ liệu immutable/history/audit không được sửa/xóa vật lý; dùng Export/Compare/Archive hoặc action nghiệp vụ phù hợp.
4. Select All mặc định chọn trang hiện tại; chọn toàn bộ kết quả phải có bước xác nhận riêng.
5. Destructive bulk action phải confirm và hiển thị số bản ghi bị ảnh hưởng.
6. Form dirty-state warning.
7. Destructive action confirmation.
8. Async AI action luôn có progress/job state.
9. Không dùng spinner vô hạn không trạng thái.
10. Permission denied khác Not Found theo security policy.
11. AI-generated content có visual marker.
12. Citation có thể click.
13. Date/time hiển thị theo tenant/user timezone.
14. Table hỗ trợ filter/sort/pagination.
15. P0 flow usable ở 1366x768 trở lên.

---

# 6. Screen Traceability

Mỗi screen implementation phải có frontmatter/metadata hoặc catalog mapping:
Screen ID → UC → FR → API → Entity → Test.

Ví dụ:
WEB-DRF-004 → UC-025/030/031/032 → FR-029..040 → API-DRF-* → Draft/Review → TC-WEB-DRF-*.
