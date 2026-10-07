# VWork – SC-06 Reporting UAT Appendix

## UAT-101 Reporting Cycle CRUD
Create/Edit/Close/Reopen/Archive đúng state; reopen cần reason/audit.

## UAT-102 Reporting Cycle Bulk
Select All + bulk archive/owner/notify phải re-authorize từng cycle và trả partial result.

## UAT-103 Reporting Obligation Initialization
Cycle tạo ra obligation list versioned; không duplicate cùng đơn vị/kỳ.

## UAT-104 Obligation Retire
Obligation có submission không hard delete; retire vẫn giữ lịch sử.

## UAT-105 Obligation Reminder
Bulk reminder theo policy/rate-limit; audit recipient/result.

## UAT-106 Submission Replace
Nộp lại tạo version mới, replaced_submission_id đúng, bản cũ còn truy được.

## UAT-107 Submission Scope
Đơn vị A không xem/replace submission của đơn vị B nếu không có quyền.

## UAT-108 Missing Submission Dashboard
Thiếu đơn vị phải hiện rõ finding/status; không tính như đã đủ dữ liệu.

## UAT-109 Schema Candidate to Draft
AI schema suggestion chỉ là candidate; human accept/reject trước khi vào draft schema.

## UAT-110 Schema Approval & Compatibility
Approved schema immutable; duplicate code/type-unit-aggregation incompatibility bị chặn.

## UAT-111 Extraction Provenance
Mỗi extracted metric drill-down về submission version + page/sheet/cell/section.

## UAT-112 Unit Normalization
Unit mismatch chỉ convert khi có approved conversion rule; nếu không tạo blocker.

## UAT-113 Quality Blocker
BLOCKER mở ngăn official aggregation/final report.

## UAT-114 Quality Override
Override blocker cần permission + reason + audit; original finding giữ nguyên.

## UAT-115 Reconciliation Override
Mismatch total/detail/current/prior/source phải giữ original values; override có reason.

## UAT-116 Aggregation Determinism
Cùng verified inputs + schema version phải cho cùng kết quả; LLM không tham gia arithmetic.

## UAT-117 Aggregation Gate
Schema chưa approve, required submission thiếu, unit mismatch hoặc blocker mở → aggregation official bị chặn.

## UAT-118 Narrative Grounding
AI narrative chỉ dùng AggregationResult/verified metrics và citation; không thay đổi số.

## UAT-119 Report Draft Stale
Source/aggregation version đổi sau khi draft sinh → draft STALE, không silently refresh official content.

## UAT-120 Export Provenance
Export phải pin cycle, schema version, aggregation run, submission/source snapshot và generated_by/generated_at.
