# VWork – Mobile Screen Catalog v1.0

**Định vị:** Mobile client chính thức cho lãnh đạo và xử lý nhanh. Không phải bản sao Web. Với mọi danh sách quản lý dữ liệu có quyền chỉnh sửa, Mobile phải hỗ trợ Thêm – Sửa – Xóa/Lưu trữ, multi-select và Chọn tất cả; bulk action có thể triển khai qua selection mode/bottom sheet.

## 1. Bottom Navigation

1. Home
2. Inbox
3. Work
4. AI
5. Meeting
6. Profile

Global:
- notification deep link.
- job status lightweight.
- secure session.

---

# 2. Screen Catalog

## Authentication

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-AUTH-001 | Đăng nhập | login | All | IAM-001 |
| MOB-AUTH-002 | Chọn ngữ cảnh | context | multi-membership | IAM-003 |
| MOB-AUTH-003 | Khóa/đăng nhập lại | reauth | All | auth/session |

## Home

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-HOME-001 | Home lãnh đạo | home | ACT-01 | EXE-001 |
| MOB-HOME-002 | Daily Brief card view | brief/daily | ACT-01 | EXE-004/005 |
| MOB-HOME-003 | Cảnh báo | signals | ACT-01 | EXE-002 |

## Inbox/Approval

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-INB-001 | Executive Inbox | inbox | ACT-01 | EXE-001 |
| MOB-INB-002 | Chi tiết Inbox item | inbox/:id | ACT-01 | resource API |
| MOB-APR-001 | Danh sách cần duyệt | approvals | ACT-01/05 | WFL-007/014 |
| MOB-APR-002 | Chi tiết hồ sơ trình | approvals/:id | ACT-01/05 | WFL-008 + subject API |
| MOB-APR-003 | Cho ý kiến/Phê duyệt | approvals/:id/action | ACT-01/05 | WFL-009..013 |

## Documents

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-DOC-001 | Danh sách văn bản | documents | authorized | DOC-001..004/011/017 |
| MOB-DOC-002 | Xem văn bản | documents/:id | authorized | DOC-005/009/011/014 |
| MOB-DOC-003 | AI tóm tắt văn bản | documents/:id/summary | authorized | INT-010/011 |
| MOB-DOC-004 | Dữ liệu chính & deadline | documents/:id/facts | authorized | INT-003..005 |

## Work

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-WRK-001 | Việc của tôi | work | ACT-01/03/04 | WRK-007/010/028 |
| MOB-WRK-002 | Chi tiết Task | tasks/:id | authorized | WRK-008..016/024..030 |
| MOB-WRK-003 | Cập nhật tiến độ | tasks/:id/progress | ACT-04 | WRK-011 |
| MOB-WRK-004 | Nộp kết quả nhanh | tasks/:id/evidence | ACT-04 | WRK-012/013/030 |
| MOB-WRK-005 | Hồ sơ công việc | cases/:id | authorized | WRK-003/005/017/018/021 |
| MOB-WRK-006 | Giao việc nhanh | cases/:id/assign | ACT-01/03 | WRK-006/009 |

## AI

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-AI-001 | Ask VWork | ai | authorized | AST-001..008, KNO-022 |
| MOB-AI-002 | Chat theo hồ sơ | ai/context/:id | authorized | AST-003/004 + context API + KNO-022 |
| MOB-AI-003 | Nguồn trích dẫn | ai/citation/:id | authorized | KNO-022 |

## Meeting

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-MTG-001 | Lịch họp | meetings | ACT-01/06/07 | MTG-001..004/014/015 |
| MOB-MTG-002 | Chi tiết cuộc họp | meetings/:id | authorized | MTG-003/004/016/018/020/026/030 |
| MOB-MTG-003 | Transcript | meetings/:id/transcript | ACT-06/07 | MTG-008/009/027 |
| MOB-MTG-004 | Kết luận & nhiệm vụ | meetings/:id/decisions | ACT-01/06/07 | MTG-010..012/028/029 |
| MOB-MTG-005 | Upload/ghi âm | meetings/:id/audio | ACT-06 | MTG-006 |

## Notifications/Profile

| ID | Màn hình | Route | Actor | API |
|---|---|---|---|---|
| MOB-NOT-001 | Thông báo | notifications | All | GOV-016/017/022/046/047 |
| MOB-PRO-001 | Hồ sơ cá nhân | profile | All | IAM-003/048 |
| MOB-PRO-002 | Ủy quyền của tôi | profile/delegation | ACT-01/05 | IAM-017/018/036..038 |
| MOB-PRO-003 | Phiên đăng nhập | profile/sessions | All | IAM-004/005/045 |
| MOB-PRO-004 | Thiết lập ứng dụng | settings | All | IAM-046/047, GOV-046/047 |

**Tổng theo Screen ID:** 34 màn.

---

# 3. Đặc tả chi tiết màn trọng yếu

## MOB-HOME-001 – Home lãnh đạo

Mục tiêu:
trả lời trong 5–10 giây: hôm nay cần xử lý gì?

Layout:
- greeting/date.
- KPI cards: cần duyệt, khẩn, quá hạn, sắp đến hạn.
- Top 5 priority items.
- Daily Brief preview.
- Upcoming meeting.
- Quick Ask VWork.

Interactions:
- tap card → filtered Inbox.
- swipe/action không được approve destructive trực tiếp nếu chưa mở context theo policy.
- pull-to-refresh.

States:
- skeleton.
- offline cached-safe summary nếu policy cho.
- partial error widget.

Acceptance:
- item ngoài scope không xuất hiện.
- số badge khớp API.
- sensitive data không nằm trong push/cache quá mức.

---

## MOB-APR-002 – Chi tiết hồ sơ trình

Sections:
1. Title/status/due.
2. AI summary.
3. Submitted document preview.
4. Key findings.
5. Sources.
6. Workflow history.
7. Sticky action bar.

Actions:
- Duyệt.
- Trả lại.
- Từ chối.
- Yêu cầu bổ sung.
- Ủy quyền.

Rules:
- stale version disable approve.
- return/reject require comment.
- biometric/PIN re-auth có thể bật theo tenant policy cho action nhạy cảm.

---

## MOB-DOC-002 – Xem văn bản

Features:
- PDF/image/native preview tùy format.
- page navigation.
- search text nếu available.
- metadata drawer.
- AI summary shortcut.
- create task/share internal action theo quyền.

Không hỗ trợ full rich-text editing trên mobile Core v1.

---

## MOB-WRK-002 – Chi tiết Task

Header:
title, status, priority, deadline.

Sections:
- description.
- source/work case.
- required output.
- progress.
- evidence.
- comments/history.

CTA theo actor:
- accept.
- update.
- upload evidence.
- complete/request review.

Offline:
- read cache tùy policy.
- write phải queue an toàn hoặc báo chưa gửi; không giả thành công.

---

## MOB-AI-001 – Ask VWork

Context chips:
- Không ngữ cảnh.
- Văn bản.
- Hồ sơ.
- Task.
- Cuộc họp.

Answer:
- text.
- evidence sufficiency.
- citations.
- action suggestions.

Rule:
- suggestion action phải mở flow chính thức và re-authorize.

---

## MOB-MTG-003 – Transcript

- audio mini player.
- transcript segments.
- tap segment seek.
- highlight low confidence.
- decision candidate marker.

Mobile Core v1 ưu tiên review, không làm transcript editor phức tạp như Web.

---

# 4. Mobile UX Rules

1. Danh sách quản lý dữ liệu phải có selection mode: chọn từng item, Chọn tất cả, Bỏ chọn tất cả và bulk action.
2. Thêm/Sửa/Xóa hoặc Lưu trữ phải có trên Mobile khi actor có quyền và nghiệp vụ phù hợp.
3. Với dữ liệu immutable/audit/history chỉ cho phép chọn/export/share/compare; không sửa/xóa vật lý.
4. Bulk destructive action phải confirm và hiển thị số item.
5. Touch target đủ lớn.
6. Primary action sticky ở màn duyệt/task.
7. Không đặt nhiều hơn 1 destructive primary action.
8. Push payload tối thiểu.
9. Deep link luôn load resource từ server và authz lại.
10. Secure storage cho token.
11. Screenshot protection có thể bật ở tenant profile đặc thù.
12. Không cache raw restricted document nếu policy không cho.
13. Network error phải phân biệt chưa gửi/gửi thành công.
14. Async AI job có state: queued/running/done/failed.

---

# 5. Mobile Architecture Trace

MOB-APR-* → UC-050..056 → FR-063..069 → API-WFL-* → ApprovalItem.  
MOB-WRK-* → UC-043..048 → FR-052..057 → API-WRK-* → Task.  
MOB-AI-* → UC-080/085 → FR-099/105 → API-AST/KNO → Assistant/Citation.  
MOB-MTG-* → UC-057..064 → FR-071..079 → API-MTG-* → Meeting.

---

# 6. P0 Mobile Release

P0 bắt buộc:
- AUTH-001/002.
- HOME-001.
- INB-001/002.
- APR-001/002/003.
- DOC-002/003.
- WRK-001/002/003/004/005.
- AI-001/002/003.
- NOT-001.
- PRO-001/003.

Meeting mobile là P1 nếu timeline cần rút gọn.
