# VWork – Reporting Detailed Business Specification v1.0

**Phạm vi:** Quản lý kỳ báo cáo, nghĩa vụ nộp, nguồn báo cáo, schema chỉ tiêu, trích xuất, kiểm tra chất lượng, đối soát, tổng hợp, soạn thảo và phát hành báo cáo.

# 1. Mục tiêu
Biến quá trình tổng hợp báo cáo từ Word/Excel/PDF/CSV thành luồng có cấu trúc, có nguồn, có kiểm soát, có khả năng tái kiểm chứng.

# 2. Actor
- ACT-08 Cán bộ tổng hợp báo cáo: owner chính.
- ACT-09 Đơn vị/người gửi báo cáo.
- ACT-01 Lãnh đạo: xem/duyệt.
- ACT-03 Tham mưu: phối hợp.
- ACT-05 Người duyệt/ký: nếu report đi vào workflow.

# 3. Đối tượng nghiệp vụ
- ReportingCycle
- ReportingObligation
- ReportSubmission
- SubmissionVersion
- MetricSchema
- MetricSchemaVersion
- MetricDefinition
- ExtractedMetricValue
- DataQualityFinding
- ReconciliationResult
- AggregationResult
- ReportDraft
- ReportExport

# 4. Reporting Cycle
Bắt buộc:
- code
- name
- report type
- period type
- period_start/end
- due_at
- owner
- reporting units
- schema policy
- status
- workflow policy optional

Quy tắc:
- code unique theo tenant.
- period_end >= period_start.
- cycle đã CLOSED không nhận submission mới nếu chưa reopen.
- reopen cần quyền + lý do + audit.

# 5. Reporting Obligation
Mỗi đơn vị phải nộp có một obligation:
- unit
- due_at
- required format
- required sections/metrics
- status
- latest submission
- reminder/escalation state

Trạng thái:
NOT_SUBMITTED → SUBMITTED → VALIDATING → ACCEPTED/REJECTED/REPLACED
Có cờ LATE nếu nộp sau hạn.

# 6. Submission
Nguồn:
- Word
- Excel
- PDF
- CSV
- form/API future

Submission phải lưu:
- submitted_by
- submitted_at
- source files
- reporting unit snapshot
- period
- checksum
- version_no
- replaced_submission_id nếu có

Nộp lại:
- không overwrite.
- version mới thay version cũ.
- lịch sử giữ đầy đủ.

# 7. Metric Schema
AI có thể đề xuất schema nhưng không được tự approve.

MetricDefinition gồm:
- code
- name
- data_type
- unit
- required
- aggregation_type
- source rule
- validation rule
- dimension definition optional
- formula optional

Approved schema:
- immutable.
- thay đổi tạo version mới.
- cycle đang chạy phải pin schema version.

# 8. Unit of Measure
Mọi metric có đơn vị phải dùng canonical UnitOfMeasure.

Nếu nguồn dùng đơn vị khác:
- convert theo conversion rule đã phê duyệt; hoặc
- tạo blocker.

Không để AI tự quy đổi khi không có rule xác định.

# 9. Extraction
Mỗi extracted value phải có:
- submission/version
- metric definition
- raw value
- normalized value
- unit
- provenance
- confidence
- verification status

FACT/INFERENCE/MISSING áp dụng như Document Intelligence.

# 10. Data Quality
Rule classes:
- missing
- duplicate
- type mismatch
- outlier
- invalid range
- inconsistent total
- unit mismatch
- unexpected text
- missing reporting unit
- duplicate reporting unit

Severity:
INFO / WARNING / ERROR / BLOCKER.

BLOCKER phải được resolve hoặc override có quyền trước final aggregate/report.

# 11. Reconciliation
Các loại:
- total vs detail
- current vs previous period
- submission vs authoritative source
- same metric across documents
- unit conversion consistency

ReconciliationResult:
- matched
- mismatch
- unresolved
- accepted_override

Mọi override có reason, actor, timestamp.

# 12. Aggregation
Aggregation chỉ chạy khi:
- schema approved;
- required submissions đủ hoặc có waiver;
- blocking findings clear/override;
- metric units compatible.

Aggregation engine deterministic.
Không dùng LLM để tính tổng, trung bình, tỷ lệ nếu có thể tính bằng rule/code.

# 13. Narrative Generation
AI chỉ sinh:
- nhận xét
- xu hướng
- điểm nổi bật
- diễn giải

AI narrative phải:
- dựa AggregationResult/verified data;
- có citation tới metric/source;
- đánh dấu inference;
- không sửa số.

# 14. Report Draft
Draft report pin:
- cycle
- schema version
- aggregation run
- source submissions
- AI run/prompt/model
- template version

# 15. Export
Hỗ trợ:
- DOCX
- XLSX
- PDF
- CSV nếu phù hợp

Export phải ghi:
- generated_at
- generated_by
- cycle version
- schema version
- source snapshot/reference

# 16. CRUD/Bulk
Reporting Cycle:
- Add/Edit/Archive/Select/Select All/Bulk archive.

Obligation:
- Add/Edit/Remove trước lock.
- Select All.
- Bulk remind.
- Bulk change deadline theo quyền.
- Bulk export status.

Submission:
- Add/Replace.
- Archive version không active.
- Select All.
- Bulk validate/re-extract theo policy.

Metric Definition:
- Add/Edit/Delete trong DRAFT schema.
- Select All.
- Bulk required/optional, unit, category.
- Approved schema không edit in-place.

Quality Findings:
- Select All.
- Bulk resolve chỉ với cùng resolution reason/rule phù hợp.
- BLOCKER override yêu cầu permission.

# 17. Exception Cases
- đơn vị không nộp;
- nộp trễ;
- nộp sai kỳ;
- nhiều version;
- file lỗi;
- schema thiếu metric;
- unit mismatch;
- tổng lệch chi tiết;
- metric đổi definition giữa kỳ;
- source mâu thuẫn;
- submission từ đơn vị đã sáp nhập;
- cycle reopen.

# 18. Permission
ACT-08 quản lý cycle/schema.
ACT-09 chỉ nộp/xem phần của đơn vị mình.
ACT-01/05 xem/duyệt theo workflow.
Không actor nào được xem submission ngoài scope.

# 19. Audit
Audit bắt buộc:
- create/close/reopen cycle;
- obligation change;
- submission/replace;
- schema approve/version;
- quality override;
- reconciliation override;
- aggregation run;
- report submit/finalize/export.

# 20. Acceptance
1. Không aggregate khi schema chưa approved.
2. Submission version không overwrite.
3. Mọi số tổng hợp drill-down được về nguồn.
4. Unit mismatch không bị im lặng bỏ qua.
5. LLM không là nguồn tính toán.
6. BLOCKER chặn final.
7. Tenant/data scope đúng.
8. CRUD + Select All + Bulk đầy đủ.
