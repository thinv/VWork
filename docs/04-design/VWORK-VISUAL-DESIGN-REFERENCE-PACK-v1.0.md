# VWork – Visual Design Reference Pack v1.0

**Purpose:** Style contract để mockup và code thống nhất.

# 1. Brand Character
VWork phải tạo cảm giác:
- tin cậy;
- sáng;
- hiện đại;
- hành chính chuyên nghiệp nhưng không nặng nề;
- AI hữu ích, không khoa trương;
- dễ dùng với cán bộ không chuyên công nghệ.

Không dùng phong cách:
- cyberpunk/dark AI;
- dashboard tài chính quá dày;
- gradient neon;
- chatbot-only;
- eOffice cổ điển nhiều menu;
- marketing illustration trong màn nghiệp vụ.

# 2. Brand Assets
Dùng logo VWork chính thức do Product cung cấp.
Logo:
- top-left Web AppShell;
- splash/login/mobile header khi phù hợp;
- không tự vẽ lại hoặc đổi tỷ lệ.

# 3. Color Direction
Primary family:
- Navy / deep blue: trust, structure.
- Cyan/teal accent: VWork intelligence/action.
- White/light-neutral surfaces.

Semantic:
- Success: positive green
- Warning: amber
- Danger/Blocker: red
- Info: blue
- AI accent: cyan/teal
- Citation/source: neutral-blue

Implementation phải qua design tokens, không hard-code screen-level colors.

# 4. Surface System
Light theme default.
Layers:
- app background: very light neutral
- sidebar/header: white or subtle neutral
- cards: white
- active/selected: subtle brand tint
- AI panel: differentiated softly, not neon
- external-source panel: subtle source badge, not a different app theme.

# 5. Typography
Use system sans with strong Vietnamese rendering.
Web:
- H1 24–28
- H2 20–22
- H3 16–18
- body 14–16
- metadata 12–13
Mobile:
- body 16
- title 20–24
Hierarchy by weight/spacing, not oversized type.

# 6. Geometry
- spacing scale: 4/8/12/16/20/24/32/40/48
- card radius: 10–12px recommended
- control radius: 8px
- pills only for badge/chip
- subtle shadows; borders preferred for dense enterprise surfaces.

# 7. Desktop Shell
Baseline:
- 1440 canvas
- sidebar ~232–248 expanded
- top bar 60–64
- page padding 24
- max content flexible

Sidebar v2:
Trang chủ
Việc của tôi
Công cụ
Hỏi VWork
Tri thức
Thông báo
[Điều hành if leader]
[Quản trị if admin]

# 8. Home Visual Pattern
Hero is not KPI dashboard.
Top:
- greeting
- large Ask VWork input

Next:
- 8 Tool cards maximum above/near fold
- task/outstanding section
- recent

Leader KPI/brief appears conditionally below/alongside.

# 9. Tool Card
Icon in restrained branded container.
Name 1 line.
Description max 2 lines.
Optional small badge.
Whole card clickable.
No miniature dashboard inside card.

# 10. Integrated Data Visual Language
Every integrated item may show:
- source badge/icon
- freshness
- “Mở nguồn”
- sync status

Do not visually imply VWork owns external record.

# 11. AI Visual Language
AI output:
- VWork assistant marker
- source/evidence
- FACT/INFERENCE/MISSING when needed
- processing state
- suggested action cards

No magic sparkle overload.

# 12. Workspace Layouts
For complex tools use:
- 2-panel 40/60 or
- 3-panel 20/55/25

Primary canvas center.
Source/context left.
AI/findings right.

Panels collapsible.

# 13. Lists/Tables
Ordinary user:
- prefer readable list/table hybrid
- 5–7 key columns
- action menu secondary

Admin:
- denser DataTable
- selection/bulk controls

# 14. Status
Status uses:
icon + text + semantic token.
Never color-only.

External:
- Connected
- Degraded
- Disconnected
- Stale
- Syncing

AI:
- Đang phân tích
- Có đề xuất
- Cần xác nhận
- Chưa đủ cơ sở
- Có xung đột nguồn

# 15. CTA Hierarchy
One primary CTA per region.
External official action labels explicit:
- Gửi sang hệ thống nguồn
- Mở trong hệ thống nguồn
- Đồng bộ lại

Native:
- Tạo dự thảo
- Rà soát
- Xác nhận
- Xuất file

# 16. Iconography
Use one consistent outlined icon family.
Avoid decorative 3D icons.
Tool cards may use simple duotone/brand accent but same geometry.

# 17. Charts
Only where decision value exists.
No decorative charts on Home.
Prefer:
- progress
- trend
- distribution
- risk count
with direct labels.

# 18. Mobile
Bottom nav 5 items.
Cards single-column/2-up only for compact tools.
Sticky CTA for approve/submit.
Bottom sheet for citation/filter/action.
Avoid desktop table squeezed onto mobile.

# 19. Empty/Loading/Error
Loading: skeleton.
Empty: explain + primary next action.
Error: plain Vietnamese + retry/alternative.
Permission: no unauthorized data flash.
Connector degraded: source-specific explanation.

# 20. Visual Consistency Rules for Claude/Codex
- no new color outside token;
- no new radius/spacing scale;
- no custom button variant without DS update;
- no screen-specific sidebar;
- no module-specific theme;
- same Tool card component across Web Home/Tools;
- same source badge component across all integrated contexts;
- same AI/citation components across tools.

# 21. Golden Image Production
Recommended first image set:
1. GS-WEB-01 Home
2. GS-WEB-02 Unified Work Inbox
3. GS-WEB-04 Tham mưu
4. GS-WEB-05 Hoàn thiện văn bản
5. GS-WEB-06 Văn bản đến
6. GS-WEB-07 Meeting
7. GS-WEB-08 Reporting
8. GS-WEB-09 Ask VWork
9. GS-WEB-10 Knowledge/Templates
10. GS-WEB-11 Leader
11. GS-WEB-12 Admin Integration
12. GS-MOB-01 Home
13. GS-MOB-02 Work
14. GS-MOB-03 Ask
15. GS-MOB-04 Approval

Image set should use same logo, shell, tokens and component family.

# 22. Visual QA
Each mockup reviewed for:
- correct IA;
- correct source ownership cue;
- correct primary action;
- Vietnamese copy;
- no unauthorized admin/menu;
- same spacing/type/card system;
- no accidental “eOffice replacement” impression.

# 23. Authority
For product-facing visuals this pack + Golden Screen Catalog supersede v1 wireframe navigation examples, while v1 business screen specs remain authoritative for behavior.