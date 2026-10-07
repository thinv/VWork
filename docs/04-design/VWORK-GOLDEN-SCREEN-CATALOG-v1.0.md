# VWork – Golden Screen Catalog v1.0

**Purpose:** Bộ màn hình chuẩn đại diện để Design/Claude/Codex suy rộng style và interaction cho 151 Screen ID. Không cần tạo 151 mockup riêng.

# 1. Golden Screen Principle
Một Golden Screen phải định nghĩa:
- visual hierarchy;
- layout;
- component pattern;
- source/AI language;
- state pattern;
- responsive behavior;
- linked Screen IDs;
- implementation notes.

# 2. Web Golden Screens

## GS-WEB-01 – Home / Service Launcher
Maps: WEB-EXE-001, WEB-SHELL-001.
Purpose: default landing cho ordinary user.
Must show:
- Ask VWork hero input;
- Công cụ của tôi;
- Việc cần làm;
- Gần đây;
- connector status compact.
Style anchor: product-level primary reference.

## GS-WEB-02 – Việc của tôi / Unified Work Inbox
Maps: WEB-TSK-001, WEB-EXE-002/003.
Must show:
- source badges;
- normalized status;
- due/priority;
- source freshness;
- native/connector/deep-link action distinction;
- list + preview pattern.

## GS-WEB-03 – Tool Launcher / All Tools
New experience surface using existing domain routes.
Must show:
- favorite tools;
- all tools;
- skill recommendations;
- entitlement unavailable state;
- search/filter.

## GS-WEB-04 – Tham mưu văn bản Workspace
Maps: WEB-DRF-002/003/004 + KNO citation pattern.
3-panel:
- Context/Sources
- Draft/Advice canvas
- AI/Citation panel
Primary tool reference for content work.

## GS-WEB-05 – Hoàn thiện văn bản
Maps: WEB-DRF-005/006/007.
Must show:
- document/editor
- review score/findings
- blocker/warning
- Accept/Reject/Override
- citations
- no silent mutation.

## GS-WEB-06 – Xử lý văn bản đến
Maps: WEB-INC-003/004/005/007.
Must show:
- source badge “Từ hệ thống văn bản”
- viewer
- AI-extracted requirements
- deadline candidate
- action cards
- continue to tham mưu/draft
- official-record distinction.

## GS-WEB-07 – Trợ lý cuộc họp
Maps: WEB-MTG-003/005/006/007.
Must show:
- audio timeline
- transcript
- decision candidates
- confirmed decisions/tasks
- minutes
- source/calendar ownership marker.

## GS-WEB-08 – Tổng hợp báo cáo
Maps: WEB-RPT-005..013.
Must show:
- source intake
- extraction progress
- data-quality gate
- reconcile
- deterministic totals
- narrative draft
- export.

## GS-WEB-09 – Hỏi VWork
Maps: WEB-EXE-006, WEB-KNO-008.
Must show:
- conversational UI
- context selector
- evidence state
- citation chips
- action cards
- insufficient/conflict states.

## GS-WEB-10 – Kho mẫu & Tri thức
Maps: WEB-KNO-001/002/004/007.
Must show:
- search
- category/taxonomy
- template cards/list
- source authority/effective date
- recent/shared.

## GS-WEB-11 – Leader Home / Executive Brief
Maps: WEB-EXE-002..005, APR-001/002.
Must show:
- Daily Brief
- cần duyệt
- risk/overdue
- upcoming meeting
- grounded brief with source.

## GS-WEB-12 – Admin Integration & Mode
Maps: WEB-ADM-010 + Integration Profile R3.
Must show:
- capability bindings
- Native/Integrated/Optional
- provider health
- source-of-truth
- masked credentials
- test/activate/version.

# 3. Mobile Golden Screens

## GS-MOB-01 – Home
Maps: MOB-HOME-001.
- Ask quick input
- favorite tools
- top work
- recent
- leader cards conditional.

## GS-MOB-02 – Việc
Maps: MOB-WRK-001 + MOB-INB-001.
- Unified Work Inbox
- source badge
- quick filter
- native/external action marker.

## GS-MOB-03 – Ask VWork
Maps: MOB-AI-001/002/003.
- text/voice/upload
- citation bottom sheet
- action card.

## GS-MOB-04 – Review / Approval
Maps: MOB-APR-001..003.
- submitted artifact
- summary/findings
- source/version
- sticky approve/return.

## GS-MOB-05 – Meeting Assistant
Maps: MOB-MTG-002..005.
- audio/transcript
- decision candidates
- confirmed conclusion.

## GS-MOB-06 – Tool Launcher
New experience surface.
- favorites
- all tools
- recent
- skill recommendations.

# 4. Golden Screen Coverage
These 18 screens cover patterns for:
- app shell/navigation
- service cards
- data list/preview
- editor/AI panel
- document viewer
- transcript
- reporting grids
- knowledge/search/chat
- leader summary
- admin configuration
- mobile list/detail/action.

# 5. Golden Screen States
Each Golden Screen must have:
- normal
- loading
- empty
- error
- permission
- degraded connector if relevant
- stale/conflict if integrated
- AI processing if relevant.

# 6. Visual Source of Truth
Priority order:
1. approved Golden Screen image
2. Visual Design Reference Pack
3. Design System v1
4. UI Spec v1
5. Screen Spec v1.1/v2 Exposure Matrix

If visual conflicts with business/security semantics, business/security semantics win.

# 7. Implementation
Claude/Codex must implement reusable components from Golden Screens; no per-screen arbitrary styling.

# 8. Acceptance
Golden Screen set is sufficient when all 151 screens can identify at least one parent visual pattern plus screen-specific business spec.