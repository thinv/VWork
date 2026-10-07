# VWork – Service Launcher / Home Specification v1.0

# 1. Product Goal
Home là nơi bắt đầu công việc, không phải dashboard quản trị.

# 2. Above-the-fold Layout
## Header
- VWork logo
- tenant/context switch
- global search
- notification
- profile

## Greeting
“Chào buổi sáng, [Tên]. Hôm nay bạn cần làm gì?”

## Ask VWork
Large input:
“Nhập việc bạn cần hỗ trợ, hoặc tải văn bản/tệp lên...”
Actions:
- Đính kèm
- Chọn ngữ cảnh
- Gửi

## Công cụ của tôi
Grid 2x4 desktop / horizontal mobile.
Default candidates:
1. Tham mưu văn bản
2. Hoàn thiện văn bản
3. Xử lý văn bản đến
4. Trợ lý cuộc họp
5. Tổng hợp báo cáo
6. Tổng hợp số liệu
7. Chuyển đổi tài liệu
8. Kho mẫu

Secondary:
- Tra cứu quy định
- Soạn nhanh theo mẫu
- Hỏi VWork
- Tất cả công cụ

# 3. Tool Card Contract
Fields:
- icon
- name
- one-line outcome
- optional badge: Mới / Được gợi ý / Đã kết nối
- primary CTA
- recent-state optional

Không hiển thị technical capability name.

# 4. Work Section
“Việc cần làm”
Top 5–8 Unified Work Items:
- title
- source badge
- due
- priority
- normalized status
- primary action

Link: “Xem tất cả việc của tôi”.

# 5. Recent Section
“Gần đây”
- recent draft
- recent document
- recent report
- recent meeting
- recent Tool run

# 6. Skill Recommendations
Nếu user có nhiều Skill:
“Gợi ý cho công việc của bạn”
- không dùng Skill như role label bắt buộc;
- recommendation không cấp permission.

# 7. Connected Systems
Secondary compact strip:
- Văn bản: Connected/Degraded
- Lịch: Connected
- Báo cáo: Connected
- Một cửa: Not connected

Không làm thành hero section.

# 8. Empty State
New user:
- 3 sample tasks
- upload sample
- Try Ask VWork
- view quick tour
- no fake metrics/dashboard.

# 9. Leader Variant
Giữ Home cơ bản và thêm:
- cần duyệt
- việc rủi ro
- Daily Brief
- upcoming meeting

Không thay Tool launcher.

# 10. Error/Degraded
- Tool dependent connector degraded → badge + fallback.
- Ask VWork unavailable → clear status.
- partial section errors isolated.

# 11. Personalization
User can:
- pin Tool
- reorder
- hide optional recommendations
- set default landing preference if policy allows.

# 12. Accessibility/Responsive
Desktop 1366x768 P0.
Tablet/mobile cards responsive.
Keyboard navigation and visible focus.
No meaning by color alone.

# 13. Acceptance
- first useful action reachable in ≤2 clicks;
- core Tool visible without scrolling on common desktop;
- ordinary user không thấy Admin cards;
- no source-system replacement messaging;
- connector state truthful;
- Home still useful without any connector.