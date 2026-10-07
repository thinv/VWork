# VWork – User-facing Information Architecture v2.0

**Principle:** Task-centric, AI-first, integration-first.

# 1. Ordinary User IA

## Primary Navigation
1. **Trang chủ**
2. **Việc của tôi**
3. **Công cụ**
4. **Hỏi VWork**
5. **Tri thức**
6. **Thông báo**
7. **Hồ sơ**

Không đưa Văn bản / Workflow / Master Data / AI Provider thành top-level menu cho ordinary user.

# 2. Trang chủ
Mục tiêu: trong 10 giây user biết:
- tôi cần làm gì;
- tôi có thể dùng công cụ gì;
- việc nào cần chú ý;
- hỏi VWork ở đâu.

Sections:
- Greeting + tenant/context
- Ask VWork quick input
- Công cụ của tôi
- Việc cần làm hôm nay
- Sắp đến hạn / quá hạn
- Gần đây
- Gợi ý phù hợp Skill
- Hệ thống đã kết nối (secondary/status)

# 3. Việc của tôi
Unified Work Inbox:
- Hôm nay
- Quá hạn
- Sắp tới
- Chờ tôi
- Cần duyệt
- Họp
- Báo cáo
- Tất cả

Không phân biệt module ở navigation; mỗi item hiển thị nguồn.

# 4. Công cụ
Service Launcher theo task:
- Tham mưu văn bản
- Hoàn thiện văn bản
- Xử lý văn bản đến
- Trợ lý cuộc họp
- Tổng hợp báo cáo
- Tổng hợp số liệu
- Chuyển đổi tài liệu
- Kho mẫu
- Tra cứu quy định
- Soạn nhanh theo mẫu
- các Tool khác theo entitlement

Views:
- Dùng thường xuyên
- Tất cả công cụ
- Theo Skill
- Mới dùng
- Đã ghim

# 5. Hỏi VWork
Global Assistant:
- no-context question
- attach/upload
- choose current context
- citation
- action cards
- continue to Tool

# 6. Tri thức
User-facing:
- Tìm kiếm
- Kho mẫu
- Nguồn được chia sẻ
- Gần đây

Admin knowledge management tách khỏi ordinary IA.

# 7. Lãnh đạo
Chỉ hiện nếu audience=LEADER:
- Điều hành
- Daily Brief
- Executive Inbox
- Cảnh báo/Rủi ro
- Phê duyệt

Leader section không thay ordinary Home.

# 8. Secondary Context Navigation
Contextual only:
- Document viewer/detail
- Draft versions
- Meeting detail
- Report detail
- Task/source detail
- Approval history
- Citation source

Không nằm global primary navigation.

# 9. Admin IA
Tách khu **Quản trị**:
- Người dùng & quyền
- Tổ chức
- Ủy quyền
- Công cụ & Skill
- Tích hợp
- AI Providers/Models/Prompts
- Workflow optional
- Knowledge administration
- Master Data
- Audit
- Retention
- Job Operations

# 10. Exposure Resolution
Navigation item visible khi:
- Screen exposure cho phép;
- tenant entitlement;
- actor permission;
- audience;
- Integration Profile mode;
- connector readiness.

Exposure không thay backend authorization.

# 11. IA Guardrails
- ordinary user tối đa 7 primary nav items;
- không hiển thị admin item do search/global command trừ có quyền;
- integrated external data có source badge;
- optional capability disabled không hiện;
- Tool card phải nói outcome, không nói engine/domain;
- deep context screen có breadcrumb/source context.

# 12. IA Acceptance
- cán bộ mới hiểu Home và Tools không cần biết 12 technical domain;
- multi-skill user vẫn một IA;
- leader có lớp điều hành bổ sung, không app riêng;
- admin complexity separated;
- external SoR visible nhưng không chiếm primary nav.