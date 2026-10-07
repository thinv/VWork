# VWork – Use Case Catalog v1.0

**Phạm vi:** VWork Core v1  
**Mục tiêu:** Danh mục use case cấp nghiệp vụ, có ID ổn định để trace sang BRD, Business Rules, SRS, Screen, API, Data và Test.

## 1. Chuẩn use case

Mỗi use case chi tiết ở giai đoạn SRS phải có:
- Use Case ID.
- Tên.
- Capability.
- Primary actor / Secondary actor.
- Trigger.
- Pre-condition.
- Post-condition.
- Main Flow.
- Alternate Flow.
- Exception.
- Business Rules.
- Input/Output.
- Permission/Data Scope.
- Audit Event.
- Acceptance Criteria.
- Requirement IDs.
- Screen/API/Data/Test IDs.

Priority:
- **P0:** bắt buộc cho MVP/Core usable.
- **P1:** bắt buộc cho v1.
- **P2:** sau v1 hoặc nâng cao.

---

# 2. Catalog tổng thể – 104 Use Cases

## Domain 1 – Identity & Organization

| ID | Use Case | Primary Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-001 | Đăng nhập VWork | Người dùng | BP-12 | P0 | Phiên hợp lệ theo tenant |
| UC-002 | Quản lý phiên đăng nhập | Người dùng | BP-12 | P0 | Session/device được kiểm soát |
| UC-003 | Cấu hình tenant | ACT-10/11 | BP-12 | P0 | Tenant profile |
| UC-004 | Quản lý cơ cấu tổ chức | ACT-10 | BP-12 | P0 | Organization tree |
| UC-005 | Quản lý người dùng | ACT-10 | BP-12 | P0 | User lifecycle |
| UC-006 | Gán role và data scope | ACT-10 | BP-12 | P0 | Permission assignment |
| UC-007 | Thiết lập ủy quyền | ACT-01/05/10 | BP-07/12 | P1 | Delegation có hạn |
| UC-008 | Cấu hình hồ sơ văn bản/người ký | ACT-10 | BP-12 | P0 | Default document profile |

## Domain 2 – Document Management

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-009 | Tải một tài liệu | ACT-02/03/04 | BP-01 | P0 | Document record |
| UC-010 | Tải nhiều tài liệu | ACT-02/03/04 | BP-01 | P0 | Batch intake |
| UC-011 | Nhập nhiều ảnh theo thứ tự trang | ACT-02/03 | BP-01 | P1 | Multi-page source |
| UC-012 | Xem tài liệu | Người dùng có quyền | BP-01 | P0 | Viewer |
| UC-013 | Chỉnh metadata tài liệu | ACT-02/03 | BP-01 | P0 | Metadata verified |
| UC-014 | Tạo phiên bản tài liệu mới | ACT-02/03/04 | BP-01 | P0 | New version |
| UC-015 | So sánh phiên bản | ACT-03/05 | BP-05/07 | P1 | Version diff |
| UC-016 | Xuất/tải tài liệu hoặc package | Người dùng có quyền | BP-04/09 | P0 | Export artifact |

## Domain 3 – Document Intelligence

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-017 | OCR tài liệu scan | ACT-02/03 | BP-02 | P0 | OCR text/layout |
| UC-018 | Rà và sửa OCR confidence thấp | ACT-02/03 | BP-02 | P1 | Verified OCR |
| UC-019 | Phân loại loại văn bản | SYS/ACT-02 | BP-02 | P0 | Classification |
| UC-020 | Trích metadata văn bản | SYS/ACT-02 | BP-02 | P0 | Structured metadata |
| UC-021 | Trích nhiệm vụ/deadline | SYS/ACT-03 | BP-02/03 | P0 | Requirement extraction |
| UC-022 | Trích số liệu/bảng | SYS/ACT-03/08 | BP-02/09 | P0 | Structured data |
| UC-023 | Xem provenance của thông tin | Người dùng có quyền | BP-02 | P0 | Source location |
| UC-024 | Xác nhận FACT/INFERENCE/MISSING | ACT-03/04 | BP-02/04 | P0 | Grounding state |

## Domain 4 – AI Draft & Review

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-025 | Tạo draft từ ý chỉ đạo | ACT-03/04 | BP-04 | P0 | Draft |
| UC-026 | Chọn loại và chế độ dự thảo | ACT-03/04 | BP-04 | P0 | Draft policy |
| UC-027 | Tạo draft từ Work Case | ACT-03/04 | BP-04 | P0 | Context-grounded draft |
| UC-028 | Tạo draft theo template | ACT-03/04 | BP-04 | P0 | Template-aware draft |
| UC-029 | Tạo document package | ACT-03 | BP-04 | P1 | Multi-doc package |
| UC-030 | Chạy AI Review | ACT-03/04 | BP-05 | P0 | Review issues |
| UC-031 | Accept/Reject đề xuất AI | ACT-03/04 | BP-05 | P0 | Edited version |
| UC-032 | Rewrite theo thao tác ngữ cảnh | ACT-03/04 | BP-05 | P0 | Revised section |

## Domain 5 – Incoming Document Processing

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-033 | Đăng ký văn bản đến | ACT-02 | BP-03 | P0 | Incoming record |
| UC-034 | AI tóm tắt văn bản đến | ACT-02/03/01 | BP-03 | P0 | Summary |
| UC-035 | AI bóc yêu cầu phải thực hiện | ACT-03 | BP-03 | P0 | Requirement list |
| UC-036 | Đề xuất đơn vị/người xử lý | ACT-03/01 | BP-03 | P1 | Assignment suggestion |
| UC-037 | Đề xuất phương án xử lý | ACT-03/01 | BP-03 | P0 | Handling advice |
| UC-038 | Tạo Work Case từ văn bản đến | ACT-03/01 | BP-03 | P0 | Work Case |
| UC-039 | Tạo Task từ yêu cầu văn bản | ACT-03/01 | BP-03 | P0 | Tasks |
| UC-040 | Tạo bộ hồ sơ phản hồi | ACT-03 | BP-03/04 | P1 | Response package |

## Domain 6 – Work Case & Task

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-041 | Tạo Work Case thủ công | ACT-03/04 | BP-06 | P0 | Work Case |
| UC-042 | Xem timeline Work Case | Người dùng có quyền | BP-06 | P0 | Case timeline |
| UC-043 | Tạo Task | ACT-01/03/04 | BP-06 | P0 | Task |
| UC-044 | Giao Task | ACT-01/03 | BP-06 | P0 | Assigned task |
| UC-045 | Tiếp nhận Task | ACT-04 | BP-06 | P0 | Accepted task |
| UC-046 | Cập nhật tiến độ | ACT-04 | BP-06 | P0 | Progress |
| UC-047 | Nộp kết quả/evidence | ACT-04 | BP-06 | P0 | Deliverable |
| UC-048 | Đóng/đánh giá Task | ACT-01/03 | BP-06 | P0 | Completed task |

## Domain 7 – Workflow & Approval

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-049 | Khởi chạy workflow | ACT-03/04 | BP-07 | P0 | Workflow instance |
| UC-050 | Xem hàng đợi cần duyệt | ACT-01/05 | BP-07 | P0 | Approval queue |
| UC-051 | Xem hồ sơ trình | ACT-01/05 | BP-07 | P0 | Review context |
| UC-052 | Phê duyệt | ACT-01/05 | BP-07 | P0 | Approved state |
| UC-053 | Trả lại chỉnh sửa | ACT-01/05 | BP-07 | P0 | Returned state |
| UC-054 | Từ chối | ACT-01/05 | BP-07 | P1 | Rejected state |
| UC-055 | Yêu cầu giải trình/bổ sung | ACT-01/05 | BP-07 | P1 | Clarification state |
| UC-056 | Ủy quyền xử lý bước duyệt | ACT-01/05 | BP-07 | P1 | Delegated approval |

## Domain 8 – Meeting Intelligence

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-057 | Tạo cuộc họp | ACT-06 | BP-08 | P1 | Meeting |
| UC-058 | Đọc giấy mời/agenda | ACT-06 | BP-08 | P1 | Meeting context |
| UC-059 | Upload/ghi âm cuộc họp | ACT-06 | BP-08 | P1 | Audio asset |
| UC-060 | Chuyển audio thành transcript | ACT-06/SYS | BP-08 | P1 | Transcript |
| UC-061 | Rà speaker/timestamp | ACT-06 | BP-08 | P1 | Verified transcript |
| UC-062 | AI trích quyết định/nhiệm vụ | ACT-06/07 | BP-08 | P1 | Decision candidates |
| UC-063 | Xác nhận kết luận cuộc họp | ACT-07 | BP-08 | P1 | Approved decisions |
| UC-064 | Sinh biên bản và tạo Task | ACT-06/07 | BP-08 | P1 | Minutes + tasks |

## Domain 9 – Reporting & Data Consolidation

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-065 | Tạo kỳ báo cáo | ACT-08 | BP-09 | P0 | Reporting Cycle |
| UC-066 | Thiết lập đơn vị phải nộp | ACT-08 | BP-09 | P0 | Obligation list |
| UC-067 | Nhận/nộp báo cáo nguồn | ACT-08/09 | BP-09 | P0 | Submission |
| UC-068 | AI đề xuất bộ chỉ tiêu | ACT-08 | BP-09 | P0 | Metric schema draft |
| UC-069 | Duyệt/sửa bộ chỉ tiêu | ACT-08 | BP-09 | P0 | Approved schema |
| UC-070 | Trích dữ liệu theo schema | ACT-08/SYS | BP-09 | P0 | Extracted dataset |
| UC-071 | Chạy Data Quality/Reconciliation | ACT-08 | BP-09 | P0 | Findings |
| UC-072 | Tổng hợp và sinh báo cáo | ACT-08 | BP-09 | P0 | Report + XLSX |

## Domain 10 – Templates & Knowledge

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-073 | Tạo template từ file | ACT-03/13 | BP-10 | P0 | Template |
| UC-074 | Lưu draft thành template | ACT-03 | BP-10 | P1 | Template |
| UC-075 | Gắn metadata/taxonomy template | ACT-13 | BP-10 | P0 | Classified template |
| UC-076 | Publish/version/archive template | ACT-13 | BP-10 | P1 | Managed template |
| UC-077 | Ingest tài liệu tri thức | ACT-13 | BP-10 | P0 | Knowledge item |
| UC-078 | Publish/unpublish nguồn tri thức | ACT-13 | BP-10 | P0 | Published source |
| UC-079 | Tìm kiếm kho tri thức | Người dùng có quyền | BP-10 | P0 | Search results |
| UC-080 | Hỏi đáp RAG có citation | Người dùng có quyền | BP-10/11 | P0 | Grounded answer |

## Domain 11 – Executive Intelligence

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-081 | Xem Executive Inbox | ACT-01 | BP-11 | P0 | Unified inbox |
| UC-082 | Xem việc khẩn/quá hạn | ACT-01 | BP-11 | P0 | Risk list |
| UC-083 | Nhận Daily Brief | ACT-01 | BP-11 | P1 | Brief |
| UC-084 | Nhận Weekly Brief | ACT-01 | BP-11 | P1 | Weekly brief |
| UC-085 | Ask VWork trên một hồ sơ | ACT-01/03/04 | BP-11 | P0 | Context answer |
| UC-086 | Hỏi trạng thái nhiệm vụ theo đơn vị | ACT-01 | BP-11 | P1 | Status answer |
| UC-087 | Xem cảnh báo báo cáo thiếu/mâu thuẫn | ACT-01/08 | BP-11 | P1 | Signal |
| UC-088 | Thực hiện hành động từ Brief/Inbox | ACT-01 | BP-11/07 | P0 | Approval/assignment |

## Domain 12 – Governance, Audit & Integration

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-089 | Xem Audit Log | ACT-10/14 | BP-12 | P0 | Audit query |
| UC-090 | Cấu hình AI provider/model | ACT-12 | BP-12 | P0 | AI routing config |
| UC-091 | Quản lý prompt version | ACT-12 | BP-12 | P1 | Prompt registry |
| UC-092 | Chạy AI evaluation | ACT-12/14 | BP-12 | P1 | Evaluation result |
| UC-093 | Theo dõi AI usage/quota | ACT-10/12 | BP-12 | P1 | Usage dashboard |
| UC-094 | Quản lý integration adapter | ACT-10/11 | BP-12 | P1 | Integration config |
| UC-095 | Theo dõi hệ thống/long-running jobs | ACT-11 | BP-12 | P0 | Operations view |
| UC-096 | Backup/restore và kiểm tra khôi phục | ACT-11 | BP-12 | P0 | Recovery evidence |

---

## Cross-cutting – Shared / Master Data

| ID | Use Case | Actor | Process | Priority | Kết quả |
|---|---|---|---|---|---|
| UC-097 | Quản lý Code List và Item | ACT-10 | BP-12 | P0 | Canonical code lists |
| UC-098 | Quản lý dữ liệu hành chính | ACT-10/11 | BP-12 | P0 | Versioned administrative reference |
| UC-099 | Quản lý cơ quan ngoài và đơn vị đo | ACT-10/08 | BP-12 | P0 | Shared agencies/UoM |
| UC-100 | Quản lý danh mục nghiệp vụ tenant | ACT-10 | BP-12 | P0 | Document/Domain/Recipient/Work/Meeting/Report types |
| UC-101 | Quản lý taxonomy | ACT-10/13 | BP-10/12 | P0 | Governed taxonomy tree |
| UC-102 | Import Master Data | ACT-10 | BP-12 | P0 | Validated diff/apply batch |
| UC-103 | Xem lịch sử/effective version | ACT-10/14 | BP-12 | P0 | Historical resolution |
| UC-104 | Publish và invalidate Master Data cache | ACT-10/11 | BP-12 | P0 | Consistent shared data cache |

# 3. Use Case chi tiết trọng yếu

## UC-025 – Tạo draft từ ý chỉ đạo

**Primary Actor:** ACT-03 Cán bộ Văn phòng/Tham mưu  
**Secondary:** ACT-04, SYS-02  
**Process:** BP-04  
**Requirements:** BR-013, BR-014, BR-015, BR-011, BR-012

### Trigger
Người dùng cần tạo văn bản mới từ chỉ đạo/yêu cầu.

### Pre-condition
- Đã đăng nhập.
- Có quyền tạo draft.
- Tenant/document profile hợp lệ.

### Main Flow
1. Người dùng chọn “Soạn thảo AI”.
2. Nhập ý chỉ đạo.
3. Chọn loại văn bản.
4. Chọn Draft Mode.
5. Thêm nguồn/Work Case.
6. Chọn template.
7. Hệ thống kiểm tra thiếu dữ kiện.
8. AI tạo outline.
9. AI tạo draft.
10. Hệ thống gắn FACT/INFERENCE/MISSING và citation.
11. Người dùng mở editor.
12. Lưu version.

### Alternate
- Không dùng template.
- Không có nguồn: hệ thống phải cảnh báo giới hạn grounding.
- Package mode: sinh nhiều draft candidates.

### Post-condition
Draft có version, provenance và audit.

---

## UC-030 – Chạy AI Review

**Actor:** ACT-03/04  
**Process:** BP-05  
**Requirements:** BR-017..019

### Main Flow
1. Chọn version cần review.
2. Chọn scope kiểm tra.
3. Chọn tài liệu đối chiếu.
4. Engine chạy rule + AI review.
5. Sinh issue list.
6. Gắn severity, source, explanation.
7. Tính quality score.
8. Người dùng mở từng issue.
9. Chấp nhận/từ chối/sửa.
10. Re-run review.

### Acceptance
Không được tự sửa bản chính mà không có action của người dùng.

---

## UC-035 – AI bóc yêu cầu phải thực hiện

**Actor:** ACT-03  
**Process:** BP-03  
**Requirements:** BR-009, BR-020, BR-021..023

### Main Flow
1. Chọn văn bản đến.
2. Hệ thống lấy structured text.
3. AI xác định từng yêu cầu.
4. Với mỗi yêu cầu: nội dung, căn cứ, deadline, output, suggested owner.
5. Gắn provenance/confidence.
6. Người dùng sửa/xác nhận.
7. Có thể chuyển thành Work Case/Task.

### Acceptance
Mỗi Task candidate phải truy được về đoạn nguồn hoặc được đánh dấu inference.

---

## UC-038 – Tạo Work Case từ văn bản đến

**Actor:** ACT-03/01  
**Process:** BP-03  
**Requirements:** BR-020, BR-021

### Main Flow
1. Chọn văn bản đến đã phân tích.
2. Chọn “Tạo hồ sơ công việc”.
3. Hệ thống đề xuất tên, deadline, lĩnh vực, priority.
4. Người dùng xác nhận.
5. Gắn source document.
6. Gắn extracted requirements.
7. Sinh Work Case.
8. Chuyển sang tạo/giao Task.

---

## UC-052 – Phê duyệt

**Actor:** ACT-01/05  
**Process:** BP-07  
**Requirements:** BR-027..029, BR-059, BR-060

### Main Flow
1. Mở approval item.
2. Xem version trình, summary, issue, source.
3. Xem lịch sử xử lý.
4. Chọn Approve.
5. Có thể nhập ý kiến.
6. Hệ thống kiểm tra actor/thẩm quyền/delegation.
7. Ghi approval record.
8. Chuyển workflow bước tiếp theo.
9. Gửi notification.
10. Audit.

### Exception
Version trình đã thay đổi → yêu cầu refresh/review lại trước approve.

---

## UC-062 – AI trích quyết định/nhiệm vụ cuộc họp

**Actor:** ACT-06/07  
**Process:** BP-08  
**Requirements:** BR-032..034

### Main Flow
1. Chọn transcript đã xử lý.
2. AI trích Decision candidates.
3. AI trích Task candidates.
4. Mỗi candidate có timestamp.
5. Thư ký rà.
6. Chủ trì xác nhận.
7. Candidate được chuyển thành structured Decision/Task.

---

## UC-068 – AI đề xuất bộ chỉ tiêu

**Actor:** ACT-08  
**Process:** BP-09  
**Requirements:** BR-036..038

### Main Flow
1. Chọn tập báo cáo nguồn.
2. AI đọc cấu trúc và phát hiện chỉ tiêu lặp lại.
3. Tạo Metric Schema draft.
4. Mỗi metric có tên, datatype, unit, aggregation.
5. Người dùng sang UC-069 để duyệt.

### Guardrail
Schema draft không được dùng aggregation chính thức trước approval.

---

## UC-069 – Duyệt/sửa bộ chỉ tiêu

**Actor:** ACT-08  
**Process:** BP-09

### Main Flow
1. Mở schema draft.
2. Sửa tên/đơn vị/datatype/aggregation.
3. Thêm/xóa metric.
4. Kiểm tra duplicate/conflict.
5. Approve schema.
6. Hệ thống tạo schema version và lock.
7. Cho phép chạy extraction.

---

## UC-080 – Hỏi đáp RAG có citation

**Actor:** Người dùng có quyền  
**Process:** BP-10/11  
**Requirements:** BR-048..050, BR-053

### Main Flow
1. Người dùng đặt câu hỏi.
2. Hệ thống xác định tenant/data scope/context.
3. Search/RAG truy xuất nguồn.
4. Rerank.
5. AI sinh câu trả lời.
6. Gắn citation.
7. Nếu evidence không đủ, trả trạng thái thiếu cơ sở thay vì bịa.

---

## UC-081 – Xem Executive Inbox

**Actor:** ACT-01  
**Process:** BP-11  
**Requirements:** BR-051, BR-054

### Main Flow
1. Lãnh đạo mở Home/Inbox.
2. Hệ thống tổng hợp theo quyền:
   - approval;
   - urgent incoming;
   - overdue;
   - due soon;
   - new task;
   - upcoming meeting.
3. Sắp theo priority/risk.
4. Người dùng mở item.
5. Có thể approve, assign, comment hoặc Ask VWork.

---

# 4. Mapping Use Case → Business Process

| Process | Use Cases |
|---|---|
| BP-01 | UC-009..016 |
| BP-02 | UC-017..024 |
| BP-03 | UC-033..040 |
| BP-04 | UC-025..029 |
| BP-05 | UC-030..032 |
| BP-06 | UC-041..048 |
| BP-07 | UC-049..056 |
| BP-08 | UC-057..064 |
| BP-09 | UC-065..072 |
| BP-10 | UC-073..080 |
| BP-11 | UC-081..088 |
| BP-12 | UC-001..008, UC-089..096 |

---

# 5. Coverage theo Product Capability

| Capability | Use Case |
|---|---|
| CAP-01 | UC-001..008 |
| CAP-02 | UC-009..016 |
| CAP-03 | UC-017..024 |
| CAP-04 | UC-025..032 |
| CAP-05 | UC-033..040 |
| CAP-06 | UC-041..048 |
| CAP-07 | UC-049..056 |
| CAP-08 | UC-057..064 |
| CAP-09 | UC-065..072 |
| CAP-10 | UC-073..080 |
| CAP-11 | UC-081..088 |
| CAP-12 | UC-089..096 |

---

# 6. Exit Criteria của Use Case Catalog

Catalog v1 được coi là đủ baseline khi:
- 12 Core Domains có coverage.
- Mọi P0 capability có ít nhất một Use Case.
- Primary actor tồn tại trong Actor Catalog.
- Use Case map được về Business Process.
- Business Requirement trọng yếu map được sang Use Case.
- Use Case ngoài Product Boundary không được đưa vào Core.
- ID được giữ ổn định từ đây; thay đổi tên không làm đổi ID nếu bản chất use case không đổi.

---

# 7. Bước kế tiếp

Từ 104 Use Case này, tài liệu kế tiếp phải sinh:
1. VWORK-BUSINESS-RULE-CATALOG-v1.0.md
2. VWORK-FUNCTIONAL-REQUIREMENTS-v1.0.md
3. VWORK-NON-FUNCTIONAL-REQUIREMENTS-v1.0.md
4. VWORK-SRS-v1.0.md

Sau SRS mới freeze Screen Catalog, API Catalog và Data Model.
