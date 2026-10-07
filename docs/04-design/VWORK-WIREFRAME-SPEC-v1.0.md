# VWork – Wireframe Specification v1.0

**Mục tiêu:** Quy định wireframe chuẩn cho các màn Web/Mobile trọng yếu trước khi thiết kế hi-fi hoặc code UI.

---

# 1. Nguyên tắc Wireframe

1. Nghiệp vụ trước thẩm mỹ.
2. Một màn = một mục tiêu chính rõ.
3. AI luôn có trạng thái nguồn/confidence khi cần.
4. Hành động nguy hiểm tách khỏi hành động chính.
5. Lãnh đạo thấy “việc cần xử lý” trước chi tiết.
6. Văn thư/tham mưu thấy nguồn + dữ liệu trích + thao tác.
7. Màn dài dùng sticky header/action.
8. Loading/Empty/Error/Permission luôn có.
9. Route-level screen theo Screen Catalog.
10. Không tạo UI chỉ để “trông giống AI chat”.

---

# 2. Web Grid

Desktop chuẩn:
- viewport baseline 1440.
- sidebar 240.
- header 64.
- content max-width flexible.
- page padding 24.
- 12-column grid.
- gap 16/24.

Tablet:
- sidebar collapse.
- panel phụ chuyển drawer.

1366x768 phải dùng được P0 flow.

---

# 3. Web Shell Wireframe

```text
┌─────────────────────────────────────────────────────────────┐
│ Logo VWork | Tenant/Đơn vị | Search | Jobs | Bell | User  │
├──────────────┬──────────────────────────────────────────────┤
│ Tổng quan    │ Breadcrumb / Page Title / Primary Action    │
│ Văn bản      ├──────────────────────────────────────────────┤
│ Hồ sơ CV     │                                              │
│ Công việc    │                Page Content                  │
│ Soạn thảo AI │                                              │
│ Họp          │                                              │
│ Báo cáo      │                                              │
│ Kho tri thức │                                              │
│ Quản trị     │                                              │
└──────────────┴──────────────────────────────────────────────┘
```

---

# 4. WEB-EXE-002 Executive Inbox

```text
┌ Executive Inbox ───────────────────────── [Filter] [Ask AI] ┐
│ [Cần duyệt 7] [Khẩn 3] [Quá hạn 12] [Sắp đến hạn 9]       │
├─────────────────────────────────────────────────────────────┤
│ Tabs: Tất cả | Duyệt | Khẩn | Quá hạn | Văn bản mới        │
├───────────────────────────────┬─────────────────────────────┤
│ List                          │ Preview / AI Brief          │
│ ● Công văn A      10:30      │ Tiêu đề                     │
│ ● Nhiệm vụ B      Hôm nay    │ Nguồn / hạn / người xử lý   │
│ ● Báo cáo C       Quá hạn    │ Tóm tắt có nguồn            │
│ ...                           │ [Mở] [Giao việc] [Duyệt]    │
└───────────────────────────────┴─────────────────────────────┘
```

Breakpoint:
- <1200: preview drawer.
- mobile dùng màn riêng.

---

# 5. WEB-DOC-003 Document Detail

```text
┌ Title / Status / Version      [Tạo hồ sơ] [Soạn] [Xuất]    ┐
├──────────────────────────┬──────────────────────────────────┤
│ Document Viewer          │ Tabs                             │
│                          │ Thông tin                        │
│  Page 1                  │ Trích xuất                       │
│                          │ Quan hệ                          │
│  [highlight source]      │ Phiên bản                        │
│                          │ Nhật ký                          │
│                          │                                  │
│                          │ Field | Value | Conf | Source    │
└──────────────────────────┴──────────────────────────────────┘
```

Citation click:
- viewer nhảy tới page/section.
- highlight source.
- side pane vẫn giữ context.

---

# 6. WEB-INC-003 Incoming Processing

```text
┌ Văn bản đến #... ─── [Tạo hồ sơ CV] [Tạo bộ phản hồi]      ┐
├───────────────────────┬─────────────────────────────────────┤
│ Viewer                │ AI Summary                         │
│                       ├─────────────────────────────────────┤
│                       │ Yêu cầu phải thực hiện              │
│                       │ ☐ Việc 1 | Hạn | Đơn vị | 92%      │
│                       │ ☐ Việc 2 | Hạn | ?      | 61%      │
│                       ├─────────────────────────────────────┤
│                       │ Thiếu thông tin / Xung đột          │
│                       │ Phương án xử lý                     │
└───────────────────────┴─────────────────────────────────────┘
```

Low confidence:
- badge vàng/đỏ.
- action “Xác nhận/Sửa”.

---

# 7. WEB-DRF-004 AI Draft Workspace

```text
┌ Draft title | Mode | v3      [Lưu version] [Review] [Trình]┐
├──────────────┬──────────────────────────────┬───────────────┤
│ Context      │ Editor                       │ AI Copilot    │
│ Sources      │                              │ Facts         │
│ Work Case    │   Nội dung dự thảo           │ Missing       │
│ Template     │                              │ Findings      │
│              │                              │ Rewrite       │
│              │                              │ Citations     │
└──────────────┴──────────────────────────────┴───────────────┘
```

Tỷ lệ baseline:
- context 20%.
- editor 55–60%.
- AI 20–25%.

Editor toolbar:
- undo/redo.
- heading.
- lists.
- table.
- find.
- compare.
- AI actions chỉ xuất hiện khi selection hợp lệ.

---

# 8. WEB-APR-002 Approval Detail

```text
┌ Hồ sơ trình | Hạn | Người trình | Version                   ┐
├──────────────────────┬──────────────────────┬───────────────┤
│ Preview              │ AI Summary / Issues  │ Workflow      │
│ Submitted version    │ Blockers             │ Step history  │
│ Compare optional     │ Key changes          │ Comments      │
│                      │ Sources              │               │
├──────────────────────┴──────────────────────┴───────────────┤
│ [Yêu cầu bổ sung] [Trả lại] [Từ chối]      [PHÊ DUYỆT]     │
└─────────────────────────────────────────────────────────────┘
```

Approve màu/priority là design token, không hard-code trong spec.

---

# 9. WEB-WC-003 Work Case

```text
┌ WC-2026-001 | Title | High | Due | Owner   [Ask VWork]     ┐
├ KPI: Progress | Tasks | Overdue | Approvals | Outputs       ┤
├ Tabs: Tổng quan | Task | Văn bản | Họp | Timeline | Output  ┤
│ Timeline / latest activity                                   │
│                                                            │
└─────────────────────────────────────────────────────────────┘
```

---

# 10. WEB-RPT-007 Metric Schema Editor

```text
┌ Bộ chỉ tiêu v1 (DRAFT)          [Validate] [APPROVE SCHEMA] ┐
├────┬──────────────┬──────┬──────┬────────────┬──────────────┤
│ #  │ Mã/Tên       │ Type │ Unit │ Aggregation│ Source sample│
├────┼──────────────┼──────┼──────┼────────────┼──────────────┤
│ 1  │ ...          │ NUM  │ %    │ AVG        │ 3 sources    │
└────┴──────────────┴──────┴──────┴────────────┴──────────────┘
│ [ + Thêm chỉ tiêu ]                                        │
└─────────────────────────────────────────────────────────────┘
```

Approved:
- readonly.
- CTA “Tạo phiên bản mới”.

---

# 11. WEB-RPT-009 Data Quality

```text
┌ Data Quality: [Blocker 2] [Error 8] [Warning 21]            ┐
├ Filter type/severity/unit                                   │
├──────────────────────┬──────────────────────────────────────┤
│ Findings list        │ Source Evidence                      │
│ Missing              │ file/sheet/cell                      │
│ Duplicate            │ extracted value                      │
│ Outlier              │ [Resolve] [Override w/reason]        │
└──────────────────────┴──────────────────────────────────────┘
```

---

# 12. WEB-MTG-005 Transcript

```text
┌ Meeting title                    [Extract Decisions]         ┐
├ Audio player / timeline                                      │
├────────────────────────────────┬─────────────────────────────┤
│ Transcript                     │ Decision candidates         │
│ 00:02:14 Chủ tịch ...          │ ☐ Kết luận A               │
│ 00:02:33 Văn phòng ...         │ ☐ Nhiệm vụ B - hạn ...     │
└────────────────────────────────┴─────────────────────────────┘
```

Tap segment → seek audio.

---

# 13. WEB-KNO-008 Knowledge Q&A

```text
┌ Ask VWork / Kho tri thức             Context: [Toàn đơn vị] ┐
├─────────────────────────────────────────────────────────────┤
│ User question                                                │
│ Assistant answer                                             │
│  [Nguồn 1 p.3] [Nguồn 2 §4]                                │
│  Evidence: Đủ / Chưa đủ                                     │
└─────────────────────────────────────────────────────────────┘
```

---

# 14. Mobile Home

```text
┌ Chào buổi sáng                               🔔             ┐
│ [7 cần duyệt] [3 khẩn]                                      │
│ [12 quá hạn] [9 sắp hạn]                                   │
├ Việc quan trọng                                               │
│ Công văn A                                    >             │
│ Nhiệm vụ B                                   >              │
├ Tóm tắt hôm nay                                              │
│ AI Brief ...                                                │
├ Cuộc họp tiếp theo                                          │
│ 14:00 ...                                                   │
└ Home | Inbox | Work | AI | Meeting | Profile                ┘
```

---

# 15. Mobile Approval Detail

```text
┌ < Hồ sơ trình                                               ┐
│ Title / người trình / hạn                                  │
├ AI Summary                                                  │
├ Document preview                                            │
├ Findings / Sources                                          │
├ Workflow history                                            │
│                                                            │
├ [Trả lại]                         [PHÊ DUYỆT]                │
└─────────────────────────────────────────────────────────────┘
```

Sticky action bar.

---

# 16. Mobile Task

```text
┌ < Task                                                     ┐
│ Title | High | Due today                                   │
│ Status: IN_PROGRESS  60%                                   │
├ Nguồn / Hồ sơ                                              │
├ Mô tả                                                      │
├ Đầu ra yêu cầu                                             │
├ Evidence                                                   │
├ Comments                                                   │
│                                                           │
├ [Cập nhật] [Nộp kết quả]                                  │
└─────────────────────────────────────────────────────────────┘
```

---

# 17. Wireframe States

Mỗi màn phải wireframe thêm:

Loading:
- skeleton giữ layout.

Empty:
- giải thích vì sao trống.
- CTA phù hợp.

Error:
- thông báo có hành động.
- retry nếu an toàn.

Permission:
- không render dữ liệu trước khi biết quyền.

Async:
- queued/running/progress/fail/done.

Offline mobile:
- clearly marked stale/cached.

---

# 18. Modal/Drawer Patterns

Modal:
- confirm.
- short create/edit.
- dangerous action.

Drawer:
- citation source.
- metadata.
- quick preview.
- filters.

Không dùng modal cho workflow dài.

---

# 19. Acceptance

Wireframe hoàn tất khi:
- P0 screens có wire.
- primary action rõ.
- data/API có chỗ hiển thị.
- permission state.
- AI provenance visible.
- desktop/mobile behavior rõ.
