# VWork – Claude/Codex UI Handoff v2.0

# 1. Status
R1 Product Strategy: PASS  
R2 BRD v2: PASS  
R3 System Requirement Refactor: PASS  
R4 UX Reclassification: UI baseline defined by this package.

# 2. Mandatory UI Sources
Read in order:
1. Product Positioning v2
2. Product Boundary v2
3. Native/Integrated/Optional Matrix
4. Core Tools & Skill Catalog
5. BRD v2
6. FR/SRS v2 Delta
7. 151-Screen Exposure Matrix v2
8. User-facing IA v2
9. Service Launcher/Home Spec
10. Web Navigation v2
11. Mobile Navigation v2
12. Golden Screen Catalog
13. Visual Design Reference Pack
14. Design System v1 + UI Spec v1
15. Screen Spec v1.1 for behavior

# 3. Main Rule
Do not implement UI by walking the 12 technical domains and turning each domain into a menu.

Implement product surfaces:
- Home
- Unified Work Inbox
- Tools
- Ask VWork
- Knowledge
- Notifications
- Leader space conditional
- Admin conditional

# 4. Screen Exposure
Respect:
USER_PRIMARY
USER_SECONDARY
ADMIN
PLATFORM_INTERNAL
OPTIONAL

Do not expose ADMIN/INTERNAL/disabled OPTIONAL screens to ordinary users.

# 5. Integrated Object UX
Must show source/freshness/action type.
Never silently render external object as VWork-owned.

CTA taxonomy:
- native action
- connector action
- deep-link action

# 6. Existing Screen IDs
151 existing IDs remain valid for behavior/testing.
R4 may relabel experience:
- WEB-TSK-001 → Việc của tôi / Unified Work Inbox
- MOB-WRK-001 → Việc / Unified Work Inbox
- WEB-EXE-001 → Home / Service Launcher
- MOB-HOME-001 → Home personal, not leader-only shell

Any deeper semantic change requires change control.

# 7. Component Priority
Build reusable:
- VwAppShellV2
- VwPrimaryNav
- VwToolCard
- VwToolLauncher
- VwAskBox
- VwUnifiedWorkList
- VwWorkItemCard
- VwSourceBadge
- VwSyncStatus
- VwExternalAction
- VwCitationChip
- VwAIMessage
- VwReviewFinding
- VwContextPanel
- VwAssistantPanel
- VwConnectorHealth
- VwEmptyState
- VwErrorState

Reuse existing CRUD/admin components for ADMIN screens.

# 8. Styling
Use tokens only.
Do not invent per-domain themes.
Light theme baseline.
Brand = navy/deep blue + cyan/teal intelligence accent + neutral surfaces.

# 9. Responsive
Web baseline 1440 and P0 at 1366x768.
Mobile app is intentional experience, not squeezed Web.
Tablet collapses panels/navigation.

# 10. Golden Screen Implementation Order
1. GS-WEB-01 Home
2. GS-WEB-03 Tools
3. GS-WEB-09 Ask VWork
4. GS-WEB-02 Unified Work Inbox
5. GS-WEB-04 Tham mưu
6. GS-WEB-05 Hoàn thiện
7. GS-WEB-06 Incoming
8. GS-WEB-07 Meeting
9. GS-WEB-08 Reporting
10. GS-WEB-10 Knowledge
11. GS-WEB-11 Leader
12. GS-WEB-12 Admin Integration
Then Mobile GS-MOB-01..06.

# 11. Mock Data
Mock only UI until real contract ready, but mock model must match documented Source/Tool/UWI semantics.
Do not invent a new task/document ownership model.

# 12. Visual Review Gate
No UI PR is READY if:
- sidebar still reproduces v1 12-domain navigation;
- source ownership unclear;
- Tool card copy is technical;
- AI content lacks source/evidence states;
- ordinary user sees admin/internal screen;
- optional disabled capability is visible;
- layout diverges from approved Golden Screen style without design change.

# 13. Behavioral Review Gate
UI must still satisfy Screen Spec:
- permission
- state
- exception
- audit-triggering action
- test/UAT
- CRUD/Bulk for applicable admin/management screens.

# 14. Handoff
Once Golden Screen images are approved, image references become visual source of truth for component composition; this document remains behavioral/implementation guardrail.