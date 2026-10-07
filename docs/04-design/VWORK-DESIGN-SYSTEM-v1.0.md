# VWork – Design System v1.0

## Mục tiêu
Baseline dùng chung cho Web/Mobile, ưu tiên rõ ràng, nhất quán và dễ dùng cho cán bộ xã/phường.

## Nguyên tắc
1. Tiếng Việt tự nhiên.
2. Trạng thái công việc nhìn thấy ngay.
3. AI phân biệt rõ với nội dung người dùng.
4. Không dùng màu làm tín hiệu duy nhất.
5. Một vùng chỉ có một hành động chính nổi bật.
6. Component dùng token, không hard-code theo màn.
7. Desktop tối ưu nghiệp vụ; Mobile tối ưu đọc/duyệt/giao việc nhanh.

## Design Tokens
Spacing: 4, 8, 12, 16, 20, 24, 32, 40, 48.
Radius: 4, 6, 8, 12, pill.
Typography Web: body 14–16, H1 28, H2 22, H3 18, metadata 12–13.
Typography Mobile: body 16, title 20–24, metadata >=13.
Semantic colors: surface, text, muted, border, brand, info, success, warning, danger, critical, ai, citation, focus.

## Component Foundation
DS-C001 Button – primary/secondary/tertiary/danger, loading chống double-submit.
DS-C002 Input – label, helper, inline validation.
DS-C003 Combobox – searchable cho user/org/template.
DS-C004 DataTable – sort/filter/pagination/sticky header.
DS-C005 StatusBadge.
DS-C006 PriorityBadge.
DS-C007 AppShell.
DS-C008 PageHeader.
DS-C009 DocumentViewer.
DS-C010 CitationChip – mở đúng source version/page/cell/timestamp.
DS-C011 AIConfidence – Cao/Trung bình/Thấp.
DS-C012 AIMessage – “Trợ lý VWork”, citations, evidence sufficiency.
DS-C013 ReviewFinding – severity/category/source/Accept/Reject/Override.
DS-C014 JobProgress.
DS-C015 Timeline.
DS-C016 ApprovalBar.
DS-C017 EmptyState.
DS-C018 ErrorState.
DS-C019 PermissionState.
DS-C020 FileUploader.
DS-C021 AudioPlayer.
DS-C022 TranscriptSegment.
DS-C023 MetricSchemaGrid.

## Layout
Web >=1280: có thể 3 panel.
1024–1279: 2 panel.
768–1023: sidebar collapse + drawer.
<768: fallback cơ bản; app Mobile là client chính.

Mobile: BottomTabs, BottomSheet, StickyCTA, ListCard, SecureDocumentView.

## AI UX
- Không auto-apply.
- Claim quan trọng có citation khi có nguồn.
- “Chưa đủ cơ sở” là trạng thái hợp lệ.
- AI suggestion không phải quyết định chính thức.
- Action từ AI luôn vào flow chuẩn và backend re-authorize.

## Accessibility
Keyboard, focus visible, semantic label, contrast, no color-only state, reduced motion, touch target mobile mục tiêu >=44px.

## Content Style
Dùng: “Văn bản này có 3 yêu cầu cần thực hiện.”
Không dùng: “AI detected 3 actionable items.”

Dùng: “Chưa đủ thông tin để kết luận.”
Không dùng: “Model confidence insufficient.”

## Definition of Done cho component
Props contract, variants, states, accessibility, Web/Mobile applicability, example/story, component test, visual-regression candidate, token-only styling.
