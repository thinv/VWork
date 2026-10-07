# VWork – Product Requirement Refactor – Wave R4 Closure v1.0

## 1. Scope Completed
R4 – UX Reclassification đã hoàn thành:
1. 151-Screen Exposure Matrix v2.0
2. Exposure/Mode/Audience/SourceOfTruth classification cho 151/151 màn
3. User-facing IA v2.0
4. Service Launcher / Home Specification v1.0
5. Web Navigation v2.0
6. Mobile Navigation v2.0
7. Golden Screen Catalog v1.0
8. Visual Design Reference Pack v1.0
9. Claude/Codex UI Handoff v2.0

## 2. Screen Exposure Result
Total: 151
- USER_PRIMARY: 50
- USER_SECONDARY: 41
- ADMIN: 36
- OPTIONAL: 22
- PLATFORM_INTERNAL: 2

Mode:
- NATIVE: 95
- INTEGRATED: 32
- OPTIONAL: 24

SourceOfTruth:
- VWORK: 75
- EXTERNAL: 32
- HYBRID: 44

## 3. UX Decisions Locked
- Ordinary user primary navigation không còn 12 technical domain.
- Home là Service Launcher, không phải dashboard quản trị.
- Việc của tôi = Unified Work Inbox.
- WEB-TSK-001 và MOB-WRK-001 được relabel theo UWI experience.
- WEB-EXE-001/MOB-HOME-001 trở thành Home cá nhân chung, leader cards conditional.
- Admin/MD/Internal screens tách khỏi ordinary IA.
- Optional capabilities chỉ hiện khi Integration Profile bật.
- Integrated screen phải hiển thị source/freshness/action ownership.
- Leader là conditional experience layer, không app riêng.
- Mobile bottom navigation giới hạn 5 tab.

## 4. Golden Screen Baseline
18 Golden Screens:
- 12 Web
- 6 Mobile

Golden Screens là visual pattern source cho toàn bộ 151 screen, không cần 151 mockup riêng.

## 5. Visual Authority
Product-facing UI authority order:
1. Approved Golden Screen images
2. VWORK-VISUAL-DESIGN-REFERENCE-PACK-v1.0.md
3. VWORK-GOLDEN-SCREEN-CATALOG-v1.0.md
4. VWORK-USER-FACING-IA-v2.0.md
5. Design System/UI Spec v1
6. Screen behavior specs v1.1

Nếu visual conflict business/security semantics, business/security thắng.

## 6. Technical Baseline
R4 không:
- xóa Screen ID;
- đổi API ID;
- đổi state;
- đổi permission semantics;
- đổi database schema.

R4 là UX exposure/navigation/relabel baseline.

## 7. Next Gate
R5 – UI/Technical Delta Implementation Planning:
- allocate new API IDs cho Tool/Skill/UWI/Integration Profile nếu cần;
- add entity/data delta;
- add UAT v2;
- component contracts;
- actual Golden Screen image generation;
- visual QA;
- implementation tickets cho Claude/Codex.

## 8. Exit
R4 UX RECLASSIFICATION: PASS  
151/151 SCREEN CLASSIFIED: PASS  
USER-FACING IA v2: PASS  
GOLDEN SCREEN CATALOG: PASS  
VISUAL STYLE CONTRACT: PASS  
CLAUDE/CODEX UI HANDOFF v2: READY
