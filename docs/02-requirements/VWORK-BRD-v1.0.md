# VWork – Business Requirements Document (BRD) v1.0

**Sản phẩm:** VWork – Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh cho chính quyền cơ sở  
**Phạm vi:** Core v1  
**Đối tượng ưu tiên:** UBND xã/phường  
**Mục tiêu tài liệu:** Xác định nhu cầu kinh doanh, phạm vi, kết quả mong đợi, yêu cầu cấp nghiệp vụ và tiêu chí thành công làm baseline cho SRS.

---

## 1. Bối cảnh

Cán bộ cấp xã/phường phải xử lý lượng lớn văn bản, chỉ đạo, hồ sơ, báo cáo, cuộc họp và nhiệm vụ liên quan. Dữ liệu thường phân tán ở Word, PDF, scan, Excel và nhiều kênh trao đổi; việc theo dõi nguồn, người phụ trách, deadline và kết quả còn thủ công.

VWork được xây để:
- giảm thời gian đọc và soạn thảo;
- tăng tính nhất quán, đầy đủ và truy vết;
- biến văn bản/chỉ đạo/cuộc họp thành công việc có thể theo dõi;
- hỗ trợ tổng hợp báo cáo có nguồn;
- tạo kho tri thức của đơn vị;
- hỗ trợ lãnh đạo điều hành qua Web và Mobile.

---

## 2. Vấn đề kinh doanh

### P-01
Mất nhiều thời gian đọc, tóm tắt và bóc yêu cầu từ văn bản đến.

### P-02
Soạn thảo và hoàn thiện văn bản phụ thuộc nhiều vào kỹ năng cá nhân.

### P-03
Thông tin giao việc từ văn bản/cuộc họp không được cấu trúc thống nhất.

### P-04
Khó theo dõi deadline và trạng thái nhiều nhiệm vụ song song.

### P-05
Tổng hợp báo cáo từ nhiều đơn vị mất thời gian, dễ sai số và khó truy nguồn.

### P-06
Mẫu văn bản và tri thức cũ phân tán, khó tìm và tái sử dụng.

### P-07
Lãnh đạo thiếu một inbox thống nhất cho việc cần duyệt, việc khẩn và việc quá hạn.

### P-08
AI nếu chỉ ở dạng chatbot dễ sinh nội dung thiếu kiểm soát, khó truy vết và không gắn với quy trình hành chính.

---

## 3. Mục tiêu kinh doanh

| ID | Mục tiêu |
|---|---|
| OBJ-01 | Giảm thời gian xử lý văn bản đến |
| OBJ-02 | Rút ngắn thời gian tạo và hoàn thiện dự thảo |
| OBJ-03 | Chuẩn hóa giao việc từ văn bản/cuộc họp |
| OBJ-04 | Tăng khả năng theo dõi tiến độ và deadline |
| OBJ-05 | Chuẩn hóa tổng hợp báo cáo nhiều nguồn |
| OBJ-06 | Hình thành kho mẫu và kho tri thức dùng chung |
| OBJ-07 | Cung cấp Executive Inbox/Brief cho lãnh đạo |
| OBJ-08 | Đảm bảo AI có nguồn, có kiểm soát và có audit |
| OBJ-09 | Cho phép triển khai SaaS/Private/On-Premise từ một core product |

---

## 4. KPI mục tiêu ban đầu

Các KPI dưới đây là target sản phẩm, cần hiệu chỉnh trong Pilot.

| KPI | Target đề xuất |
|---|---:|
| Giảm thời gian đọc/tóm tắt văn bản | ≥50% |
| Giảm thời gian tạo dự thảo đầu tiên | ≥60% |
| Tỷ lệ nhiệm vụ có owner + deadline | ≥95% |
| Tỷ lệ văn bản/draft có version/audit | 100% |
| Tỷ lệ report metric có provenance khi nguồn hỗ trợ | ≥95% |
| Tỷ lệ workflow action có audit | 100% |
| Tỷ lệ AI output quan trọng qua human review | 100% |
| Cross-tenant leakage | 0 |
| Tỷ lệ file hợp lệ được ghi nhận an toàn | ≥99% |

---

## 5. Stakeholder

- Lãnh đạo UBND xã/phường.
- Văn phòng.
- Văn thư.
- Công chức chuyên môn.
- Quản trị đơn vị.
- Quản trị nền tảng VWork.
- Đơn vị gửi báo cáo.
- Đơn vị tích hợp bên ngoài.
- Bộ phận vận hành/hỗ trợ.

---

## 6. Phạm vi kinh doanh Core v1

### IN SCOPE
1. Identity & Organization.
2. Document Management.
3. Document Intelligence.
4. AI Draft & Review.
5. Incoming Document Processing.
6. Work Case & Task.
7. Workflow & Approval.
8. Meeting Intelligence.
9. Reporting & Data Consolidation.
10. Templates & Knowledge.
11. Executive Intelligence.
12. Governance/Audit/Integration.

### OUT OF SCOPE
- Kế toán/ngân sách.
- HRM/payroll.
- CRM/ERP.
- Một cửa điện tử hoàn chỉnh.
- GIS nền tảng.
- Hộ tịch/đất đai chuyên ngành.
- CA/ký số riêng.
- DMS cấp quốc gia.
- Legal/Tố tụng chuyên sâu trong Core v1.

---

# 7. Business Requirements

## BR-001 – Multi-tenant
Hệ thống phải cho phép nhiều xã/phường sử dụng chung nền tảng với dữ liệu và quyền tách biệt.

## BR-002 – Cơ cấu tổ chức
Mỗi tenant phải quản lý cơ quan, đơn vị, chức danh, người dùng, nhóm và phạm vi dữ liệu.

## BR-003 – Hồ sơ cấu hình văn bản
Đơn vị phải cấu hình được cơ quan chủ quản, cơ quan ban hành, ký hiệu, địa danh, người ký và nơi nhận mặc định.

## BR-004 – Tiếp nhận đa định dạng
Người dùng phải nhập được Word, PDF, ảnh, Excel, CSV và audio theo quyền.

## BR-005 – Repository
Mọi tài liệu phải được quản lý bằng ID, version, metadata, owner, scope và audit.

## BR-006 – OCR
Hệ thống phải số hóa scan/ảnh và cảnh báo confidence thấp.

## BR-007 – Phân loại
VWork phải hỗ trợ tự động/đề xuất loại văn bản, lĩnh vực và mức ưu tiên.

## BR-008 – Trích xuất metadata
Hệ thống phải trích cơ quan, số/ký hiệu, ngày, người ký và các metadata cốt lõi.

## BR-009 – Trích nhiệm vụ
VWork phải nhận diện việc phải làm, người/đơn vị liên quan, deadline và đầu ra yêu cầu từ văn bản.

## BR-010 – Provenance
Thông tin AI trích xuất/sinh ra quan trọng phải truy được về nguồn khi nguồn hỗ trợ.

## BR-011 – FACT/INFERENCE/MISSING
AI phải phân biệt thông tin có nguồn, suy luận và thông tin còn thiếu trong các workflow quan trọng.

## BR-012 – Không bịa dữ kiện
AI không được tự tạo số liệu/kết quả nghiệp vụ rồi trình bày như sự thật.

## BR-013 – AI Draft
Người dùng phải tạo dự thảo từ ý chỉ đạo, tài liệu nguồn, template và context của Work Case.

## BR-014 – Draft Mode
Phải hỗ trợ tối thiểu: trình ký, chi tiết và package.

## BR-015 – Template-aware
Dự thảo phải có thể dùng template theo cấu trúc/văn phong nhưng không tự tái sử dụng dữ kiện cũ.

## BR-016 – Document Package
Hệ thống phải có thể sinh nhiều tài liệu liên quan từ một context được người dùng xác nhận.

## BR-017 – AI Review
Hệ thống phải kiểm tra diễn đạt, cấu trúc, logic, số liệu, căn cứ và consistency.

## BR-018 – AI Editor
Người dùng phải chấp nhận/từ chối từng đề xuất AI và chỉnh thủ công.

## BR-019 – Review Evidence
Các cảnh báo liên quan nguồn/căn cứ phải liên kết về tài liệu đối chiếu.

## BR-020 – Incoming Document
Văn bản đến phải chuyển được thành phương án xử lý có cấu trúc.

## BR-021 – Work Case
Mỗi vấn đề có thể được quản lý thành Hồ sơ công việc xuyên tài liệu, task, meeting và output.

## BR-022 – Task
Task phải có owner, unit, deadline, priority, required output, status và evidence.

## BR-023 – Task từ AI
AI phải đề xuất Task từ văn bản/cuộc họp nhưng người dùng có quyền sửa trước khi giao.

## BR-024 – Tracking
Hệ thống phải theo dõi due/overdue/blocker và tiến độ.

## BR-025 – Reminder/Escalation
Phải hỗ trợ nhắc việc và escalation theo cấu hình.

## BR-026 – Collaboration
Người dùng có quyền phải comment, mention, đính kèm và bàn giao trong Work Case/Task.

## BR-027 – Workflow
Workflow phải cấu hình được bước, actor/role, condition, SLA và action.

## BR-028 – Approval
Phải hỗ trợ approve, return, reject, request clarification và delegate theo quyền.

## BR-029 – Audit Approval
Mọi hành động trình/duyệt phải có người, thời gian, version và ý kiến.

## BR-030 – Meeting Context
Cuộc họp phải liên kết được giấy mời, agenda, người tham dự và Work Case.

## BR-031 – STT
VWork phải chuyển audio thành transcript có timestamp.

## BR-032 – Meeting Extraction
AI phải đề xuất quyết định, nhiệm vụ, owner và deadline từ transcript.

## BR-033 – Meeting Follow-up
Decision đã xác nhận phải chuyển được thành Task.

## BR-034 – Minutes
Phải sinh dự thảo biên bản và liên kết nội dung quan trọng về timestamp.

## BR-035 – Reporting Cycle
Phải tạo được kỳ báo cáo, danh sách đơn vị phải nộp, deadline và trạng thái nộp.

## BR-036 – Schema Suggestion
AI phải đề xuất bộ chỉ tiêu từ báo cáo nguồn.

## BR-037 – Human Schema Gate
Người dùng phải duyệt/sửa schema trước khi tổng hợp chính thức.

## BR-038 – Metric Definition
Chỉ tiêu phải có tên, kiểu dữ liệu, đơn vị, cách tổng hợp và version.

## BR-039 – Report Extraction
Hệ thống phải trích số liệu, khó khăn, kiến nghị và narrative từ báo cáo.

## BR-040 – Data Quality
Phải phát hiện missing, duplicate, sai kiểu, outlier và mâu thuẫn cơ bản.

## BR-041 – Reconciliation
Hệ thống phải hỗ trợ đối soát nguồn–đầu ra và tổng–chi tiết.

## BR-042 – Report Provenance
Số liệu tổng hợp phải truy được về file/sheet/cell hoặc đoạn nguồn khi có thể.

## BR-043 – Report Draft
AI phải tạo nhận xét/dự thảo báo cáo từ dữ liệu đã được xác nhận.

## BR-044 – Structured Export
Phải xuất Word, Excel/CSV và package theo quyền.

## BR-045 – Template Library
Phải có template personal, tenant và system.

## BR-046 – Template Metadata
Template phải có taxonomy/metadata đủ để tìm và áp dụng đúng ngữ cảnh.

## BR-047 – Template Version
Mọi template phát hành phải có version và audit.

## BR-048 – Knowledge Base
Tenant phải có kho tri thức theo quyền.

## BR-049 – RAG Scope
AI chỉ được truy xuất tri thức trong tenant/data scope của người dùng.

## BR-050 – Citation
Kết quả RAG phải trả citation khi nguồn hỗ trợ.

## BR-051 – Executive Inbox
Lãnh đạo phải thấy một inbox thống nhất cho việc cần duyệt, khẩn, quá hạn, mới đến và sắp đến hạn.

## BR-052 – Executive Brief
Hệ thống phải tạo daily/weekly brief có citation.

## BR-053 – Ask VWork
Người dùng được hỏi theo context của document/case/task/meeting/report.

## BR-054 – Proactive Signal
Hệ thống phải cảnh báo việc quá hạn, báo cáo thiếu, dữ liệu mâu thuẫn và quyết định chưa theo dõi.

## BR-055 – Web Client
Web phải hỗ trợ toàn bộ nghiệp vụ Core v1.

## BR-056 – Mobile Client
Mobile phải hỗ trợ lãnh đạo và xử lý nhanh: inbox, viewer, summary, approval, task, meeting, AI.

## BR-057 – RBAC
Quyền phải dựa trên role và data scope.

## BR-058 – Object Permission
Đối tượng nhạy cảm phải có thể giới hạn quyền ở cấp object/workspace.

## BR-059 – Delegation
Hỗ trợ ủy quyền có thời hạn và phạm vi.

## BR-060 – Audit
Mọi hành động quan trọng, thay đổi dữ liệu, AI run, approval, export phải có audit.

## BR-061 – AI Governance
Phải quản lý model/provider, prompt version, policy và usage.

## BR-062 – AI Evaluation
Phải có cơ chế đánh giá chất lượng AI theo use case.

## BR-063 – Guardrails
AI phải có guardrails cho data scope, PII, injection và unsupported actions.

## BR-064 – Long-running Jobs
OCR/STT/LLM/report job phải chạy async, có progress, retry và recovery.

## BR-065 – API-first
Core capability phải có API contract phù hợp để Web/Mobile/tích hợp sử dụng.

## BR-066 – Integration Adapter
Tích hợp bên ngoài phải qua adapter/contract, tránh hard-code.

## BR-067 – Notification
Phải hỗ trợ in-app và push; email/SMS là extension/configuration.

## BR-068 – Retention
Retention phải cấu hình theo tenant/deployment và chính sách áp dụng.

## BR-069 – Backup/Restore
Phải có backup và quy trình restore kiểm thử được.

## BR-070 – Monitoring
Hệ thống phải có log, metric, trace và cảnh báo vận hành.

## BR-071 – Traceability
Mỗi requirement phải truy vết được sang use case, design, code, test, UAT và release.

## BR-072 – One Core
Không tạo fork codebase riêng cho từng xã/phường.

---

## 8. Business Constraints

### BC-01
AI là Copilot; không thay người có thẩm quyền.

### BC-02
Không được truy xuất cross-tenant trái phép.

### BC-03
Không dùng dữ kiện template cũ như sự thật mới.

### BC-04
Schema báo cáo phải có human approval trước aggregation chính thức.

### BC-05
Các extension ngành phải dùng Core, không làm fork độc lập.

### BC-06
Tích hợp hệ thống authoritative thay vì sao chép toàn bộ nghiệp vụ chuyên ngành.

### BC-07
Mọi thay đổi baseline phải qua change control.

---

## 9. Giả định

- Mỗi xã/phường có ít nhất một quản trị viên tenant.
- Khách hàng cung cấp cơ cấu tổ chức, người dùng và template khởi tạo.
- Internet/network đủ cho mô hình SaaS; Private/On-Premise có profile riêng.
- AI provider có thể thay đổi; VWork không khóa vào một provider.
- Ký số và hệ thống một cửa được tích hợp khi có yêu cầu, không phải Core engine v1.

---

## 10. Rủi ro kinh doanh chính

| ID | Rủi ro | Giảm thiểu |
|---|---|---|
| R-01 | AI hallucination | grounding + human review + rule engine |
| R-02 | Người dùng quá tin AI | UI cảnh báo + approval policy |
| R-03 | Dữ liệu nhạy cảm | isolation + RBAC + audit + encryption |
| R-04 | Tùy biến từng xã gây fork | configuration + extension packs |
| R-05 | Báo cáo nguồn không đồng nhất | schema approval + mapping + quality rules |
| R-06 | OCR thấp | confidence + review queue |
| R-07 | Chi phí AI cao | metering + model routing + quota |
| R-08 | Phụ thuộc provider | AI Gateway + failover |

---

## 11. Acceptance cấp BRD

BRD được coi là baseline khi:
- 12 core domain đều có requirement;
- không chứa nghiệp vụ ngoài Product Boundary;
- mỗi requirement có ID duy nhất;
- actor/process liên quan xác định được;
- có thể trace sang Use Case Catalog;
- stakeholder phê duyệt.

---

## 12. Mapping Business Objective → Requirement

| Objective | Requirement chính |
|---|---|
| OBJ-01 | BR-006..012, BR-020 |
| OBJ-02 | BR-013..019 |
| OBJ-03 | BR-021..033 |
| OBJ-04 | BR-024..029, BR-051..054 |
| OBJ-05 | BR-035..044 |
| OBJ-06 | BR-045..050 |
| OBJ-07 | BR-051..056 |
| OBJ-08 | BR-010..012, BR-060..063 |
| OBJ-09 | BR-001, BR-057..072 |
