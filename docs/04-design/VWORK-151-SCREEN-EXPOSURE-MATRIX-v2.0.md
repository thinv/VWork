# VWork – 151-Screen Exposure Matrix v2.0

**Scope:** 117 Web + 34 Mobile = 151 Screen ID.  
**Purpose:** phân lớp Platform Capability Model thành Product Experience Model v2.

## 1. Dimensions
- Exposure: USER_PRIMARY | USER_SECONDARY | ADMIN | PLATFORM_INTERNAL | OPTIONAL
- Mode: NATIVE | INTEGRATED | OPTIONAL
- Audience: COMMON | SKILL_BASED | LEADER | ADMIN
- SourceOfTruth: VWORK | EXTERNAL | HYBRID

**Lưu ý:** Exposure không thay authorization. Mode/SoR được resolve runtime theo Integration Profile; bảng này là default product profile cho xã/phường.

## 2. Summary

Exposure: USER_PRIMARY=50, USER_SECONDARY=41, OPTIONAL=22, ADMIN=36, PLATFORM_INTERNAL=2  
Mode: NATIVE=95, INTEGRATED=32, OPTIONAL=24  
Audience: COMMON=87, LEADER=14, ADMIN=37, SKILL_BASED=13  
SourceOfTruth: HYBRID=76, VWORK=75

## 3. Full Matrix

| Screen ID | Screen | Exposure | Mode | Audience | SourceOfTruth | R4 Note |
|---|---|---|---|---|---|---|
| MOB-AI-001 | Ask VWork | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-AI-002 | Chat theo hồ sơ | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-AI-003 | Nguồn trích dẫn | USER_SECONDARY | NATIVE | COMMON | HYBRID |  |
| MOB-APR-001 | Danh sách cần duyệt | USER_PRIMARY | INTEGRATED | LEADER | HYBRID | Approval source có thể VWork hoặc external |
| MOB-APR-002 | Chi tiết hồ sơ trình | USER_PRIMARY | INTEGRATED | LEADER | HYBRID | Approval source có thể VWork hoặc external |
| MOB-APR-003 | Cho ý kiến/Phê duyệt | USER_PRIMARY | INTEGRATED | LEADER | HYBRID | Approval source có thể VWork hoặc external |
| MOB-AUTH-001 | Đăng nhập | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | SSO/identity external khi cấu hình; local fallback tùy deployment |
| MOB-AUTH-002 | Chọn ngữ cảnh | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | SSO/identity external khi cấu hình; local fallback tùy deployment |
| MOB-AUTH-003 | Khóa/đăng nhập lại | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | SSO/identity external khi cấu hình; local fallback tùy deployment |
| MOB-DOC-001 | Danh sách văn bản | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| MOB-DOC-002 | Xem văn bản | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| MOB-DOC-003 | AI tóm tắt văn bản | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-DOC-004 | Dữ liệu chính & deadline | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-HOME-001 | Home lãnh đạo | USER_PRIMARY | NATIVE | COMMON | HYBRID | RELABEL Home cá nhân / Service Launcher |
| MOB-HOME-002 | Daily Brief card view | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| MOB-HOME-003 | Cảnh báo | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| MOB-INB-001 | Executive Inbox | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| MOB-INB-002 | Chi tiết Inbox item | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| MOB-MTG-001 | Lịch họp | USER_SECONDARY | INTEGRATED | COMMON | HYBRID |  |
| MOB-MTG-002 | Chi tiết cuộc họp | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-MTG-003 | Transcript | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-MTG-004 | Kết luận & nhiệm vụ | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-MTG-005 | Upload/ghi âm | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| MOB-NOT-001 | Thông báo | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| MOB-PRO-001 | Hồ sơ cá nhân | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| MOB-PRO-002 | Ủy quyền của tôi | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| MOB-PRO-003 | Phiên đăng nhập | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| MOB-PRO-004 | Thiết lập ứng dụng | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| MOB-WRK-001 | Việc của tôi | USER_PRIMARY | NATIVE | COMMON | HYBRID | RELABEL thành Unified Work Inbox |
| MOB-WRK-002 | Chi tiết Task | USER_SECONDARY | INTEGRATED | COMMON | HYBRID |  |
| MOB-WRK-003 | Cập nhật tiến độ | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| MOB-WRK-004 | Nộp kết quả nhanh | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| MOB-WRK-005 | Hồ sơ công việc | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| MOB-WRK-006 | Giao việc nhanh | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-ADM-001 | Cơ cấu tổ chức | ADMIN | INTEGRATED | ADMIN | HYBRID |  |
| WEB-ADM-002 | Người dùng | ADMIN | INTEGRATED | ADMIN | HYBRID |  |
| WEB-ADM-003 | Vai trò & phạm vi | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-004 | Ủy quyền | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-005 | Hồ sơ văn bản | ADMIN | OPTIONAL | ADMIN | HYBRID |  |
| WEB-ADM-006 | AI Providers/Models | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-007 | Prompt Registry | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-008 | Evaluation | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-009 | AI Usage | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-010 | Integrations | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-011 | Audit | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-012 | Retention | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-ADM-013 | Job Operations | PLATFORM_INTERNAL | NATIVE | ADMIN | VWORK |  |
| WEB-APR-001 | Hàng đợi cần duyệt | USER_PRIMARY | INTEGRATED | LEADER | HYBRID | Approval source có thể VWork hoặc external |
| WEB-APR-002 | Chi tiết hồ sơ trình | USER_PRIMARY | INTEGRATED | LEADER | HYBRID | Approval source có thể VWork hoặc external |
| WEB-APR-003 | Lịch sử workflow | USER_SECONDARY | INTEGRATED | LEADER | HYBRID | Approval source có thể VWork hoặc external |
| WEB-APR-004 | Cấu hình workflow | ADMIN | OPTIONAL | ADMIN | HYBRID |  |
| WEB-AUTH-001 | Đăng nhập | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | SSO/identity external khi cấu hình; local fallback tùy deployment |
| WEB-AUTH-002 | Chọn tenant/ngữ cảnh | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | SSO/identity external khi cấu hình; local fallback tùy deployment |
| WEB-DOC-001 | Danh sách văn bản | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| WEB-DOC-002 | Tải tài liệu | USER_SECONDARY | NATIVE | COMMON | HYBRID |  |
| WEB-DOC-003 | Chi tiết văn bản | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| WEB-DOC-004 | Trình xem tài liệu | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| WEB-DOC-005 | Metadata | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| WEB-DOC-006 | Phiên bản | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| WEB-DOC-007 | So sánh phiên bản | USER_SECONDARY | NATIVE | COMMON | HYBRID |  |
| WEB-DOC-008 | OCR & rà soát | USER_SECONDARY | NATIVE | COMMON | HYBRID |  |
| WEB-DOC-009 | Dữ liệu trích xuất | USER_SECONDARY | NATIVE | COMMON | HYBRID |  |
| WEB-DOC-010 | Quan hệ văn bản | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Official document SoR external khi eOffice tồn tại |
| WEB-DRF-001 | Danh sách dự thảo | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-002 | Tạo dự thảo – Brief | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-003 | Chọn nguồn & mẫu | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-004 | AI Draft Workspace | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-005 | AI Review Panel | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-006 | Rewrite | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-007 | Document Package | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-DRF-008 | Lịch sử phiên bản | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| WEB-EXE-001 | Tổng quan cá nhân | USER_PRIMARY | NATIVE | COMMON | HYBRID | Home cá nhân/service launcher v2 |
| WEB-EXE-002 | Executive Inbox | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| WEB-EXE-003 | Việc khẩn/quá hạn | USER_SECONDARY | NATIVE | LEADER | HYBRID |  |
| WEB-EXE-004 | Daily Brief | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| WEB-EXE-005 | Weekly Brief | USER_PRIMARY | NATIVE | LEADER | HYBRID |  |
| WEB-EXE-006 | Ask VWork | USER_PRIMARY | NATIVE | COMMON | HYBRID | Ask VWork |
| WEB-INC-001 | Danh sách văn bản đến | USER_SECONDARY | INTEGRATED | COMMON | HYBRID |  |
| WEB-INC-002 | Đăng ký văn bản đến | OPTIONAL | OPTIONAL | COMMON | HYBRID | Official registration chỉ dùng khi không có eOffice |
| WEB-INC-003 | Chi tiết xử lý | USER_PRIMARY | NATIVE | COMMON | HYBRID | Intelligence native; official record may be external |
| WEB-INC-004 | Yêu cầu AI bóc tách | USER_PRIMARY | NATIVE | COMMON | HYBRID | Intelligence native; official record may be external |
| WEB-INC-005 | Phương án xử lý | USER_PRIMARY | NATIVE | COMMON | HYBRID | Intelligence native; official record may be external |
| WEB-INC-006 | Tạo hồ sơ công việc | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-INC-007 | Tạo bộ hồ sơ phản hồi | USER_PRIMARY | NATIVE | COMMON | HYBRID | Intelligence native; official record may be external |
| WEB-KNO-001 | Kho mẫu | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-KNO-002 | Chi tiết mẫu | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| WEB-KNO-003 | Tạo/phiên bản mẫu | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-KNO-004 | Kho tri thức | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| WEB-KNO-005 | Thêm nguồn tri thức | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-KNO-006 | Chi tiết nguồn | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-KNO-007 | Tìm kiếm tri thức | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-KNO-008 | Hỏi đáp có nguồn | USER_PRIMARY | NATIVE | COMMON | VWORK |  |
| WEB-MD-001 | MD-049/050/030 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-002 | MD-001..005/031/032 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-003 | MD-003..005/031 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-004 | MD-002/004/005 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-005 | MD-006..012 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-006 | MD-007..011 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-007 | MD-013..017/033..039 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-008 | MD-014/034/037/038 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-009 | MD-018..020/040/041 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-010 | MD-021..024/042/043 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-011 | MD-003/006..012 (DOCUMENT_TYPE) | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-012 | MD-003/006..012 (DOCUMENT_FIELD) | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-013 | MD-003/006..012 (RECIPIENT_GROUP) | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-014 | MD-003/006..012 (WORK_CASE_TYPE) | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-015 | MD-003/006..012 (MEETING_TYPE) | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-016 | MD-003/006..012 (REPORT_TYPE) | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-017 | MD-025..029/044 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-018 | MD-015..017/045..047 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-019 | MD-016/017/045/046 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MD-020 | MD-030/048 | ADMIN | NATIVE | ADMIN | VWORK |  |
| WEB-MTG-001 | Danh sách cuộc họp | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Calendar source có thể external |
| WEB-MTG-002 | Tạo cuộc họp | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-MTG-003 | Tổng quan cuộc họp | USER_SECONDARY | INTEGRATED | COMMON | HYBRID |  |
| WEB-MTG-004 | Giấy mời/Agenda | USER_SECONDARY | INTEGRATED | COMMON | HYBRID |  |
| WEB-MTG-005 | Audio & Transcript | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| WEB-MTG-006 | Quyết định/Nhiệm vụ | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| WEB-MTG-007 | Biên bản | USER_PRIMARY | NATIVE | COMMON | HYBRID |  |
| WEB-RPT-001 | Danh sách kỳ báo cáo | USER_SECONDARY | INTEGRATED | SKILL_BASED | HYBRID |  |
| WEB-RPT-002 | Tạo kỳ báo cáo | OPTIONAL | OPTIONAL | SKILL_BASED | HYBRID |  |
| WEB-RPT-003 | Dashboard kỳ báo cáo | USER_SECONDARY | INTEGRATED | SKILL_BASED | HYBRID |  |
| WEB-RPT-004 | Đơn vị phải nộp | USER_SECONDARY | INTEGRATED | SKILL_BASED | HYBRID |  |
| WEB-RPT-005 | Nguồn báo cáo | USER_SECONDARY | INTEGRATED | SKILL_BASED | HYBRID |  |
| WEB-RPT-006 | AI đề xuất chỉ tiêu | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-RPT-007 | Metric Schema Editor | USER_SECONDARY | NATIVE | SKILL_BASED | VWORK |  |
| WEB-RPT-008 | Kết quả trích xuất | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-RPT-009 | Data Quality | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-RPT-010 | Đối soát | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-RPT-011 | Tổng hợp số liệu | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-RPT-012 | Soạn báo cáo tổng | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-RPT-013 | Xuất báo cáo | USER_PRIMARY | NATIVE | SKILL_BASED | HYBRID |  |
| WEB-SHELL-001 | App Shell | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| WEB-SHELL-002 | Thông báo | USER_SECONDARY | NATIVE | COMMON | VWORK |  |
| WEB-SHELL-003 | Tác vụ nền | PLATFORM_INTERNAL | NATIVE | COMMON | VWORK |  |
| WEB-TSK-001 | Việc của tôi | USER_PRIMARY | NATIVE | COMMON | HYBRID | RELABEL thành Unified Work Inbox / Việc của tôi |
| WEB-TSK-002 | Toàn bộ công việc | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-TSK-003 | Chi tiết Task | USER_SECONDARY | INTEGRATED | COMMON | HYBRID | Detail có thể native hoặc external projection |
| WEB-TSK-004 | Tạo/Giao Task | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-TSK-005 | Cập nhật tiến độ | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-TSK-006 | Nộp kết quả | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-TSK-007 | Lịch sử & bàn giao | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-TSK-008 | Quá hạn/Blocked | OPTIONAL | OPTIONAL | COMMON | VWORK |  |
| WEB-WC-001 | Danh sách hồ sơ | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-002 | Tạo hồ sơ | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-003 | Tổng quan hồ sơ | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-004 | Timeline | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-005 | Tài liệu liên quan | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-006 | Nhiệm vụ trong hồ sơ | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-007 | Cuộc họp liên quan | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |
| WEB-WC-008 | Kết quả/đầu ra | OPTIONAL | OPTIONAL | COMMON | VWORK | Platform capability; chỉ bật khi tenant cần VWork-native Work Case |

## 4. R4 Rules
1. USER_PRIMARY có thể xuất hiện trực tiếp ở Home/Nav/Tool flows.
2. USER_SECONDARY chỉ xuất hiện theo context/deep-link/secondary navigation.
3. ADMIN chỉ cho admin/steward; không nằm primary IA của ordinary user.
4. PLATFORM_INTERNAL không hiện trong ordinary IA; chỉ ops/diagnostic.
5. OPTIONAL chỉ hiện khi Integration Profile bật capability.
6. INTEGRATED screen phải hiển thị source/freshness/deep-link/action semantics.
7. HYBRID SourceOfTruth phải phân biệt authoritative field và VWork annotation/intelligence.
8. Screen ID không bị xóa; R4 chỉ reclassify/relable exposure.
