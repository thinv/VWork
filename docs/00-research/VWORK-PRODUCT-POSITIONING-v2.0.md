# VWork – Product Positioning v2.0

**Status:** Product Strategy Baseline  
**Target:** Cán bộ, công chức và lãnh đạo cấp xã/phường; có thể mở rộng sang cơ quan hành chính khác.

# 1. Product Statement

**VWork – Trợ lý AI cho công việc hằng ngày của cán bộ, công chức.**

VWork giúp người dùng:
- hiểu nhanh việc phải làm;
- tìm đúng căn cứ;
- tham mưu tốt hơn;
- soạn thảo và rà soát nhanh hơn;
- tổng hợp báo cáo/số liệu chính xác hơn;
- biến nội dung họp, văn bản và dữ liệu thành hành động;
- truy vấn tri thức có nguồn;
- theo dõi công việc cá nhân từ nhiều nguồn.

# 2. Positioning Principle

VWork **không định vị là một hệ thống quản lý hành chính thay thế** các nền tảng tỉnh/thành phố đang cấp.

VWork định vị là:

> **AI Work Layer + Knowledge Layer + Integration Layer** đặt trên các hệ thống đang tồn tại.

Các hệ thống như eOffice, một cửa, báo cáo tỉnh, lịch công tác, CSDL chuyên ngành có thể tiếp tục là **System of Record**.

VWork tập trung vào phần việc mà một cán bộ trực tiếp phải hoàn thành.

# 3. User Value Proposition

## 3.1 Với cán bộ
- Ít đọc thủ công hơn.
- Ít copy/paste giữa Word/Excel/PDF.
- Tìm căn cứ nhanh hơn.
- Có trợ lý tham mưu theo ngữ cảnh.
- Dự thảo nhanh nhưng vẫn có nguồn.
- Không phải học thêm một hệ thống quản lý phức tạp.

## 3.2 Với lãnh đạo
- Một nơi nhìn việc cần xử lý.
- Biết việc nào quá hạn/rủi ro.
- Nắm kết luận cuộc họp và tiến độ.
- Nhận brief có nguồn.
- Không phải mở nhiều hệ thống chỉ để nắm tình hình.

## 3.3 Với đơn vị
- Không phải thay thế hệ thống cấp trên.
- Có thể triển khai theo từng công cụ.
- Một core codebase, nhiều cấu hình.
- Dùng chung tri thức, template và skill.
- Giảm rủi ro tạo thêm silo dữ liệu.

# 4. Product Experience Model

VWork mặt trước được tổ chức theo **việc cần làm**, không theo cấu trúc backend.

## 4.1 Core Tools
- Tham mưu văn bản.
- Hoàn thiện văn bản.
- Xử lý văn bản đến.
- Trợ lý cuộc họp.
- Tổng hợp báo cáo.
- Tổng hợp số liệu.
- Chuyển đổi PDF/scan.
- Kho mẫu.
- Hỏi VWork.
- Việc của tôi.
- Tra cứu quy định.
- Soạn nhanh theo mẫu.

## 4.2 Skill Packs
Skill Pack không khóa người dùng vào một nghề/chức danh. Một người có thể bật nhiều skill:
- Tư pháp – Hộ tịch.
- Văn hóa – Xã hội.
- Kinh tế – Hạ tầng.
- Địa chính.
- Tài chính.
- Nội vụ.
- Lãnh đạo – Điều hành.
- Skill khác do tenant cấu hình.

## 4.3 Custom Skills
Tenant có thể bổ sung:
- prompt;
- template;
- checklist;
- knowledge source;
- rule;
- output type;
- quick action.

# 5. Product Relationship

Không dùng:
> User → một gói cố định.

Dùng:
> **User → Role → Permission → Skill → Tool → Data Scope**

Role quyết định quyền.  
Skill quyết định năng lực/ngữ cảnh bổ sung.  
Tool quyết định trải nghiệm.  
Data Scope quyết định dữ liệu được phép dùng.

# 6. Product Backbone v2

User-facing backbone:

**NHẬN VIỆC → HIỂU VIỆC → TÌM CĂN CỨ → THAM MƯU → SOẠN/RÀ SOÁT → TỔNG HỢP → HOÀN THÀNH**

Platform backbone phía dưới vẫn có thể dùng:

**Document → Intelligence → Work → Workflow → Reporting → Knowledge → Governance**

# 7. Competitive Position

VWork học cách đóng gói theo tác vụ từ các sản phẩm trợ lý văn phòng AI, nhưng khác biệt ở:
- context liên tục giữa các công cụ;
- knowledge/RAG có citation;
- integration với hệ thống nguồn;
- Unified Work Inbox;
- provenance xuyên chuỗi;
- meeting/reporting intelligence;
- skill model;
- tenant governance;
- API-first;
- triển khai SaaS/Private/On-Premise.

# 8. Commercial Positioning

Không bán theo “151 màn hình”.

Có thể đóng gói thương mại theo:
- số người dùng;
- AI allowance;
- storage;
- enabled tools;
- enabled skills;
- connectors;
- deployment profile;
- support/SLA.

Một user có thể được cấp nhiều skill mà không đổi account hay fork codebase.

# 9. Communication Rule

Thông điệp mặc định cho xã/phường:

> **Không thay thế phần mềm tỉnh/thành phố đang sử dụng.**

> **VWork bổ sung một lớp trợ lý AI giúp cán bộ đọc nhanh hơn, tham mưu tốt hơn, soạn thảo nhanh hơn, tổng hợp báo cáo dễ hơn và nắm việc rõ hơn.**

# 10. Success Metrics

- Time-to-first-value < 10 phút với Tool không cần connector.
- Người dùng hiểu công dụng Tool trong < 10 giây từ Home.
- Giảm thời gian xử lý tác vụ lặp lại.
- Tăng tỷ lệ output có nguồn/provenance.
- Giảm thao tác chuyển đổi Word/PDF/Excel thủ công.
- Không phát sinh yêu cầu thay thế System of Record nếu connector đủ đáp ứng.
- Người dùng có thể dùng nhiều Skill mà không bị giới hạn theo chức danh.

# 11. Product Guardrail

**VWork phải tối đa hóa giá trị cá nhân cho cán bộ nhưng tối thiểu hóa việc thay thế các hệ thống quản lý đã tồn tại.**
