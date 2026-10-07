# VWork – Web Navigation v2.0

# 1. Primary Sidebar
1. Trang chủ
2. Việc của tôi
3. Công cụ
4. Hỏi VWork
5. Tri thức
6. Thông báo

Conditional:
7. Điều hành — LEADER only
8. Quản trị — ADMIN only

# 2. Route Intent
/ → Home/Service Launcher
/work → Unified Work Inbox
/tools → Tool Catalog
/assistant → Ask VWork
/knowledge → user knowledge/search
/notifications → notification center
/executive → leader space
/admin → admin space

# 3. Tool Routes
/tools/advice
/tools/review
/tools/incoming
/tools/meeting
/tools/report
/tools/data
/tools/convert
/tools/templates
/tools/legal-search
/tools/quick-draft

Existing v1 routes may be reused internally; R4 route aliases do not imply API changes.

# 4. Secondary Navigation
Open from Tool/context:
- source viewer
- metadata
- versions
- citation
- task detail
- report schema/quality
- transcript
- approval detail

Breadcrumb:
Home/Tool → Context → Current screen.

# 5. Admin Navigation
/admin/users
/admin/roles
/admin/delegations
/admin/tools-skills
/admin/integrations
/admin/ai
/admin/prompts
/admin/evaluations
/admin/audit
/admin/retention
/admin/master-data
/admin/jobs

# 6. Optional Capability Navigation
Document registry / Work Case / Task management / Workflow config / internal reporting only appears when mode=OPTIONAL enabled.

# 7. Search / Command
Global command supports:
- find document/context
- open Tool
- Ask VWork
- go to source
- recent items

Must not return unauthorized/admin destinations.

# 8. Source Navigation
Integrated object action labels:
- Mở nguồn
- Đồng bộ lại
- Gửi sang hệ thống nguồn
Không dùng generic “Lưu” nếu VWork không authoritative.

# 9. Active State
Sidebar active by experience area, not underlying technical route.
Example:
Draft Editor opened from Tham mưu → sidebar active “Công cụ”, Tool subcontext “Tham mưu”.

# 10. Acceptance
- <=8 primary nav items for any ordinary persona;
- no technical domain menu dump;
- leader/admin additions conditional;
- optional/integrated state respected;
- backward route deep-links remain supported during migration.