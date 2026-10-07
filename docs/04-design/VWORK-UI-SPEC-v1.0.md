# VWork – UI Specification v1.0

**Mục tiêu:** Chuẩn hóa giao diện VWork để Web/Mobile nhất quán, dễ dùng cho cán bộ xã/phường và lãnh đạo.

---

# 1. Design Principles

1. Rõ hơn đẹp.
2. Ít jargon kỹ thuật trong UI.
3. Tiếng Việt tự nhiên.
4. Trạng thái công việc phải thấy ngay.
5. AI luôn phân biệt với nội dung người dùng.
6. Nguồn và mức tin cậy dễ truy cập.
7. Hành động quan trọng dễ nhận biết.
8. UI phù hợp cán bộ không chuyên công nghệ.
9. Dense vừa đủ cho nghiệp vụ văn phòng.
10. Accessibility từ đầu.

---

# 2. Terminology

UI dùng:
- Hồ sơ công việc
- Công việc
- Văn bản đến
- Dự thảo
- Trình duyệt
- Nguồn tham chiếu
- Mức tin cậy
- Chưa đủ thông tin
- Đề xuất của trợ lý

Hạn chế hiển thị:
- RAG
- embedding
- LLM
- token
- vector

Các thuật ngữ kỹ thuật chỉ ở màn quản trị kỹ thuật.

---

# 3. Typography

Web:
- base 14–16px.
- body line-height 1.5.
- H1 24–28.
- H2 20–22.
- H3 16–18.

Mobile:
- base 16.
- minimum readable 13–14 cho metadata.

Font:
- ưu tiên system sans hỗ trợ tiếng Việt tốt.
- không phụ thuộc font proprietary.

---

# 4. Spacing Scale

4, 8, 12, 16, 20, 24, 32, 40, 48.

Component dùng token:
- space-xs = 4
- sm = 8
- md = 16
- lg = 24
- xl = 32

---

# 5. Layout

Web:
- sidebar 240 expanded / 72 collapsed.
- header 64.
- page padding 24.
- card radius token.
- table row compact/comfortable option.

Mobile:
- edge padding 16.
- bottom nav.
- sticky primary action when needed.

---

# 6. Color Semantics

Không khóa mã màu ở tài liệu này; design system sẽ định token.

Semantic tokens:
- surface
- text-primary
- text-secondary
- border
- brand
- info
- success
- warning
- danger
- critical
- ai-accent
- citation
- focus

Severity:
INFO / WARNING / ERROR / BLOCKER phải phân biệt bằng icon + text, không chỉ màu.

---

# 7. Status Badges

Document:
Draft, Đang xử lý, Sẵn sàng, Cần rà soát, Đang trình, Hoàn tất, Lưu trữ, Lỗi.

Task:
Chưa giao, Đã giao, Đã nhận, Đang làm, Chờ, Chờ kiểm tra, Hoàn thành, Hủy.

Workflow:
Đang chạy, Chờ xử lý, Hoàn tất, Trả lại/Từ chối, Lỗi.

AI job:
Đang chờ, Đang xử lý, Hoàn tất, Thử lại, Lỗi.

---

# 8. Buttons

Hierarchy:
- Primary: 1 hành động chính mỗi vùng.
- Secondary.
- Tertiary/text.
- Danger.

Rule:
- Approve primary nếu đó là intent chính của màn.
- Delete/archive không cạnh primary mà không spacing/confirm.
- Loading button khóa double submit.

---

# 9. Form

Label trên input.
Required marker rõ.
Validation inline.
Không xóa dữ liệu khi server validation fail.
Date/deadline hỗ trợ timezone.
User/org picker searchable.

Long form chia section.

---

# 10. Data Table

Features:
- sticky header.
- sort.
- filter.
- pagination.
- column visibility optional.
- bulk action chỉ khi use case có.

Cell priority:
title > status > owner > due > metadata.

Không nhồi quá 8–10 cột mặc định.

---

# 11. AI Visual Language

AI content:
- icon/badge “Trợ lý VWork”.
- không giả như nội dung do cán bộ nhập.
- mỗi claim quan trọng có citation/confidence khi phù hợp.

AI states:
- Đang phân tích.
- Có đề xuất.
- Cần xác nhận.
- Chưa đủ cơ sở.
- Có xung đột nguồn.

---

# 12. Confidence

Hiển thị:
- Cao.
- Trung bình.
- Thấp.
hoặc % trong màn chuyên môn.

Không dùng % giả nếu engine không có calibrated confidence.

Low confidence phải có CTA xác nhận/sửa.

---

# 13. Provenance/Citation UI

Citation chip:
[Nguồn: Công văn 123, trang 3]

Click:
- mở source.
- đúng version.
- highlight vị trí nếu hỗ trợ.

Table:
- file / sheet / cell.

Audio:
- timestamp.

---

# 14. AI Review Findings

Finding card:
- severity.
- category.
- statement.
- why.
- source.
- suggested change.
- Accept / Reject / Override.

Override:
- require reason với BLOCKER.

---

# 15. Editor UX

Toolbar:
- formatting cơ bản.
- undo/redo.
- find.
- compare.
- source panel toggle.
- AI panel toggle.

Selection AI:
- Viết rõ hơn.
- Rút gọn.
- Cụ thể hóa.
- Sắp xếp lại.
- Yêu cầu khác.

Không auto-apply.

---

# 16. Notifications

Notification card:
- type icon.
- title.
- object.
- time.
- urgency.
- deep link.

Push không chứa nội dung nhạy cảm quá mức.

---

# 17. Empty States

Ví dụ:
“Chưa có văn bản nào. Tải văn bản đầu tiên để VWork hỗ trợ đọc và xử lý.”

Không dùng empty illustration làm thay lời hướng dẫn.

---

# 18. Error States

Có:
- tiêu đề ngắn.
- mô tả dễ hiểu.
- correlation id chỉ khi cần hỗ trợ.
- retry.
- alternative action.

Không hiện raw stack/provider error.

---

# 19. Accessibility

- keyboard navigation.
- visible focus.
- semantic headings.
- form labels.
- screen-reader-friendly icon labels.
- color contrast.
- no color-only status.
- reduced-motion respect.

---

# 20. Responsive

>=1280: 3-panel possible.
1024–1279: 2-panel.
768–1023: sidebar collapsed, drawers.
<768: mobile responsive fallback cho basic view; nghiệp vụ mobile chính dùng app/mobile.

---

# 21. Mobile Interaction

- bottom navigation.
- pull refresh.
- swipe chỉ cho non-destructive.
- sticky actions.
- large touch target.
- biometric reauth optional.
- file upload from camera/files.

---

# 22. Content Style

Dùng:
“Văn bản này có 3 yêu cầu cần thực hiện.”

Không dùng:
“AI detected 3 actionable items.”

Dùng:
“Chưa đủ thông tin để kết luận.”

Không dùng:
“Model confidence insufficient.”

---

# 23. UI Component Catalog

Core:
- AppShell
- PageHeader
- Breadcrumb
- Tabs
- Card
- StatCard
- DataTable
- StatusBadge
- PriorityBadge
- UserAvatar
- UserPicker
- OrgPicker
- DocumentViewer
- CitationChip
- ConfidenceBadge
- AIMessage
- ReviewFinding
- Timeline
- JobProgress
- EmptyState
- ErrorState
- PermissionState
- ApprovalBar
- FileUploader
- AudioPlayer
- TranscriptSegment
- MetricSchemaGrid
- SelectAllCheckbox
- RowSelectionCheckbox
- BulkActionBar
- SelectionSummary
- ConfirmBulkDialog
- CreateButton
- EditAction
- DeleteArchiveAction

---

---

# 24A. CRUD & Bulk Selection Standard

Mọi màn hình quản lý dữ liệu phải hỗ trợ:
- Thêm mới;
- Sửa;
- Xóa/Lưu trữ/Vô hiệu hóa/Thu hồi theo semantics;
- checkbox từng dòng;
- Chọn tất cả;
- Bỏ chọn tất cả;
- Bulk Action Bar.

Select All:
- mặc định áp dụng cho page hiện tại;
- nếu muốn chọn toàn bộ kết quả filter phải có bước xác nhận riêng;
- đổi filter/search phải reset selection hoặc cảnh báo.

Destructive bulk actions:
- luôn confirm;
- hiển thị số item;
- backend re-authorize từng item hoặc toàn query scope;
- trả kết quả partial success/failure rõ ràng.

Dữ liệu immutable:
- không cho sửa/xóa vật lý;
- dùng tạo version mới, lưu trữ, thu hồi hoặc vô hiệu hóa.

Component bổ sung:
- SelectAllCheckbox
- RowSelectionCheckbox
- BulkActionBar
- SelectionSummary
- ConfirmBulkDialog
- CreateButton
- EditAction
- DeleteArchiveAction

---

# 24. Frontend State Rules

Server state:
- query cache.
- stale/revalidate.

Form state:
- local.
- dirty warning.

Optimistic update:
- chỉ action dễ rollback như mark notification read.
- không optimistic approve/complete official action.

---

# 25. UI Acceptance

Mỗi P0 screen:
- matches Screen Catalog.
- primary use case usable.
- loading/empty/error/permission.
- keyboard web.
- citation interaction.
- async progress.
- no unauthorized data flash.
- Vietnamese copy reviewed.
