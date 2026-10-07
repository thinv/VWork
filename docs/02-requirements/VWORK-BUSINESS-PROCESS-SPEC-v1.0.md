# VWork – Business Process Specification v1.0

**Phạm vi:** VWork Core v1 cho UBND xã/phường  
**Nguồn baseline:** Product Capability Map v1.0; Product Boundary v1.0; Feature Harvest v1.0  
**Mục tiêu:** Mô tả các quy trình nghiệp vụ chuẩn làm đầu vào cho BRD, Use Case, SRS, Screen Catalog, API, dữ liệu và kiểm thử.

---

## 1. Nguyên tắc mô hình hóa quy trình

Mỗi quy trình VWork phải:
- có điểm bắt đầu và kết thúc rõ;
- xác định actor chịu trách nhiệm;
- phân biệt bước do người dùng thực hiện và bước AI hỗ trợ;
- luôn giữ Human-in-the-loop với quyết định hành chính quan trọng;
- tạo audit trail;
- gắn tenant, organization và data scope;
- có thể truy vết về nguồn dữ liệu;
- ưu tiên cấu hình thay vì hard-code;
- có trạng thái, SLA và ngoại lệ.

Trạng thái chuẩn dùng chung:
DRAFT → READY → IN_PROGRESS → WAITING → REVIEW → APPROVED/REJECTED → COMPLETED → ARCHIVED.

---

# BP-01 – Tiếp nhận và số hóa tài liệu

## Mục tiêu
Đưa tài liệu Word/PDF/ảnh/Excel/CSV/audio vào VWork theo một cơ chế thống nhất, an toàn và có metadata.

## Actor
Văn thư, cán bộ chuyên môn, lãnh đạo, hệ thống VWork.

## Luồng chính
1. Người dùng chọn tải file hoặc nhập tài liệu.
2. Hệ thống kiểm tra loại file, kích thước, malware và quyền.
3. Tạo Document ID.
4. Xác định tenant, đơn vị, người tạo, thời điểm.
5. Trích metadata cơ bản.
6. Nếu scan/ảnh thì đưa vào OCR queue.
7. Nếu bảng thì đưa vào parser.
8. Nếu audio thì đăng ký media asset.
9. Người dùng rà metadata.
10. Lưu Document Repository và tạo audit event.

## Ngoại lệ
- File lỗi/không hỗ trợ.
- Không đủ quyền.
- File nhiễm mã độc.
- OCR confidence thấp.
- Duplicate nghi ngờ.

## Đầu ra
Document + version + metadata + source asset + processing status.

## KPI
- ≥99% upload hợp lệ được ghi nhận không mất file.
- Mọi document có owner, tenant, audit.
- Duplicate được cảnh báo.

---

# BP-02 – Đọc hiểu và phân loại văn bản

## Mục tiêu
Chuyển tài liệu thô thành dữ liệu có cấu trúc phục vụ tham mưu, giao việc, báo cáo và tri thức.

## Luồng
1. Parser/OCR lấy text và layout.
2. AI/rule engine nhận diện loại văn bản.
3. Trích cơ quan ban hành, số/ký hiệu, ngày, người ký.
4. Trích căn cứ, yêu cầu, nhiệm vụ, deadline, số liệu.
5. Gắn confidence và provenance.
6. Kiểm tra FACT / INFERENCE / MISSING.
7. Người dùng xác nhận các trường quan trọng nếu confidence dưới ngưỡng.
8. Lưu structured extraction.

## Đầu ra
Document Intelligence Record.

## KPI
- Trường bắt buộc có confidence.
- Mọi extraction quan trọng truy được về nguồn.

---

# BP-03 – Xử lý văn bản đến

## Mục tiêu
Biến văn bản đến thành phương án xử lý, hồ sơ công việc và nhiệm vụ có thể theo dõi.

## Actor
Văn thư, lãnh đạo, văn phòng, cán bộ chuyên môn, AI.

## Luồng
1. Văn thư tiếp nhận văn bản.
2. VWork phân tích nội dung và metadata.
3. AI bóc:
   - việc phải làm;
   - đơn vị/người liên quan;
   - thời hạn;
   - đầu ra phải nộp;
   - nơi nhận báo cáo;
   - căn cứ.
4. AI đề xuất mức ưu tiên và hướng xử lý.
5. Người có thẩm quyền rà soát.
6. Tạo Work Case.
7. Tạo một hoặc nhiều Task.
8. Giao người/đơn vị thực hiện.
9. Khởi chạy workflow.
10. Theo dõi deadline.
11. Nhận kết quả.
12. Tạo dự thảo phản hồi/báo cáo.
13. Trình duyệt.
14. Hoàn thành hồ sơ.

## Ngoại lệ
- Không xác định được deadline.
- Không đủ thông tin.
- Nhiều đơn vị cùng xử lý.
- Văn bản khẩn.
- Văn bản cần trả lại/xin ý kiến.

## Đầu ra
Work Case + Tasks + Response Package + audit trail.

---

# BP-04 – Tham mưu và soạn thảo văn bản

## Mục tiêu
Tạo dự thảo có căn cứ từ ý chỉ đạo, hồ sơ nguồn, template và tri thức đơn vị.

## Luồng
1. Người dùng nhập yêu cầu/ý chỉ đạo.
2. Chọn loại văn bản.
3. Chọn Work Case hoặc nguồn tài liệu.
4. Chọn template nếu cần.
5. Chọn Draft Mode:
   - trình ký;
   - chi tiết;
   - package.
6. VWork kiểm tra dữ kiện.
7. AI sinh outline.
8. AI sinh dự thảo có citation/provenance khi có nguồn.
9. Đánh dấu MISSING và INFERENCE.
10. Người dùng chỉnh trong editor.
11. Chạy Review.
12. Lưu version.
13. Trình duyệt hoặc xuất.

## Đầu ra
Draft Document / Document Package.

---

# BP-05 – Kiểm tra và hoàn thiện văn bản

## Mục tiêu
Đánh giá chất lượng văn bản trước trình ký/phát hành.

## Luồng
1. Chọn draft/document.
2. Chọn tài liệu/căn cứ đối chiếu.
3. Chạy các nhóm kiểm tra:
   - chính tả/diễn đạt;
   - cấu trúc;
   - logic;
   - số liệu;
   - căn cứ;
   - thể thức;
   - consistency;
   - evidence.
4. Hệ thống trả issue list và quality score.
5. Người dùng xem đề xuất tại AI panel.
6. Accept/Reject từng đề xuất.
7. Có thể yêu cầu rewrite.
8. Re-run review.
9. Đạt threshold hoặc người có quyền override.
10. Chuyển trình duyệt.

## Đầu ra
Reviewed version + review report + audit.

---

# BP-06 – Hồ sơ công việc và giao việc

## Mục tiêu
Quản lý một vấn đề xuyên suốt từ nguồn đầu vào đến kết quả.

## Luồng
1. Tạo Work Case thủ công hoặc từ văn bản/họp.
2. Gắn mục tiêu, nguồn, lĩnh vực, priority, deadline tổng.
3. Tạo Task.
4. Giao owner/unit.
5. Xác định required output.
6. Người nhận xác nhận/tiếp nhận.
7. Cập nhật tiến độ.
8. Bổ sung evidence.
9. Theo dõi overdue/blocker.
10. Nhắc việc/escalation.
11. Review kết quả.
12. Đóng Task.
13. Khi đủ điều kiện, đóng Work Case.

## Đầu ra
Work Case timeline đầy đủ.

---

# BP-07 – Trình duyệt và phê duyệt

## Mục tiêu
Kiểm soát vòng đời trình/duyệt/trả lại/delegate theo thẩm quyền.

## Luồng
1. Người dùng gửi đối tượng vào workflow.
2. Engine xác định bước hiện tại và actor.
3. Tạo approval item.
4. Người duyệt xem hồ sơ, nguồn, AI brief.
5. Chọn:
   - approve;
   - return;
   - reject;
   - request clarification;
   - delegate nếu được phép.
6. Ghi ý kiến.
7. Hệ thống chuyển bước.
8. Gửi notification.
9. Nếu quá SLA thì reminder/escalation.
10. Hoàn tất workflow và khóa approval record.

## Đầu ra
Approval history + final state.

---

# BP-08 – Trợ lý cuộc họp

## Mục tiêu
Chuyển cuộc họp thành biên bản, quyết định và nhiệm vụ có theo dõi.

## Luồng
1. Tạo meeting từ giấy mời hoặc nhập thủ công.
2. Gắn Work Case nếu có.
3. Upload/record audio.
4. STT sinh transcript.
5. Speaker/timestamp.
6. Người dùng rà transcript.
7. AI trích:
   - kết luận;
   - quyết định;
   - nhiệm vụ;
   - owner;
   - deadline;
   - vấn đề chưa chốt.
8. Người chủ trì/thư ký xác nhận.
9. Sinh dự thảo biên bản.
10. Tạo Task từ quyết định.
11. Trình duyệt biên bản.
12. Theo dõi follow-up.

## Đầu ra
Transcript + Minutes + Decisions + Tasks.

---

# BP-09 – Thu thập và tổng hợp báo cáo

## Mục tiêu
Chuẩn hóa việc nhận nhiều báo cáo và tổng hợp có chứng cứ.

## Luồng
1. Tạo Reporting Cycle.
2. Xác định kỳ báo cáo và danh sách đơn vị phải nộp.
3. Nhận Word/PDF/Excel/CSV.
4. AI phân tích và đề xuất Metric Schema.
5. Người dùng sửa/duyệt schema.
6. Lock version của schema.
7. Hệ thống trích số liệu/nội dung.
8. Gắn provenance.
9. Chạy Data Quality.
10. Cảnh báo thiếu đơn vị, missing, duplicate, outlier.
11. Reconcile.
12. Aggregate.
13. AI sinh nhận xét/dự thảo.
14. Người dùng review.
15. Xuất Word/XLSX/CSV.

## Điểm kiểm soát bắt buộc
Không chạy aggregation chính thức trước khi schema được duyệt.

---

# BP-10 – Quản lý mẫu và kho tri thức

## Mục tiêu
Tạo nguồn tham chiếu có quản trị cho draft, review và hỏi đáp.

## Luồng Template
1. Upload/lưu từ document.
2. Gắn metadata.
3. Xác định scope personal/tenant/system.
4. Extract structure/style.
5. Khai báo field/rule nếu structured template.
6. Review/publish.
7. Versioning.
8. Sử dụng trong draft.
9. Theo dõi version đã dùng.

## Luồng Knowledge
1. Ingest tài liệu.
2. Phân loại/taxonomy.
3. Kiểm tra quyền.
4. Parse/chunk.
5. Index/search/vector.
6. Publish.
7. RAG truy xuất theo data scope.
8. Trả citation.
9. Re-index khi version thay đổi.

---

# BP-11 – Trợ lý lãnh đạo và điều hành

## Mục tiêu
Cung cấp một điểm truy cập để lãnh đạo biết việc gì cần xử lý và trạng thái tổ chức.

## Luồng
1. Tổng hợp Executive Inbox.
2. Phân nhóm:
   - cần duyệt;
   - khẩn;
   - quá hạn;
   - sắp đến hạn;
   - mới đến;
   - họp sắp tới.
3. Tạo Daily/Weekly Brief.
4. Lãnh đạo mở item.
5. Xem source/evidence.
6. Cho ý kiến/duyệt/giao việc.
7. Ask VWork theo context.
8. Ghi audit mọi hành động.

## Nguyên tắc
Executive Brief phải dựa trên dữ liệu có scope và citation.

---

# BP-12 – Quản trị nền tảng, an toàn và vận hành

## Mục tiêu
Đảm bảo VWork có thể cung cấp cho nhiều xã/phường bằng một core product.

## Luồng quản trị chính
- tạo/cấu hình tenant;
- cơ cấu tổ chức;
- user/role/data scope;
- document profile/signatory;
- workflow configuration;
- taxonomy;
- template/knowledge scope;
- AI model/provider;
- quota/entitlement;
- audit;
- retention;
- backup/restore;
- monitoring;
- integration adapters.

## Nguyên tắc
- Không có truy cập cross-tenant ngoài vai trò platform được kiểm soát.
- Mọi thay đổi cấu hình quan trọng có audit.
- AI provider không quyết định quyền dữ liệu.
- Retention configurable theo tenant/deployment.

---

## 13. Chuỗi quy trình end-to-end tiêu chuẩn

### Kịch bản A – Văn bản đến
BP-01 → BP-02 → BP-03 → BP-06 → BP-07 → BP-04/BP-05 → BP-07 → đóng hồ sơ.

### Kịch bản B – Cuộc họp
BP-08 → BP-06 → BP-07 → theo dõi → BP-09 nếu cần báo cáo.

### Kịch bản C – Báo cáo định kỳ
BP-09 → BP-05 → BP-07 → xuất/phát hành → BP-10.

### Kịch bản D – Tham mưu chủ động
BP-04 → BP-05 → BP-07 → BP-06 nếu phát sinh nhiệm vụ.

---

## 14. Business Process Exit Criteria

Một process chỉ được coi là đủ baseline khi:
- actor đã có trong Actor Catalog;
- bước chính map được sang Use Case;
- business rules được định danh;
- input/output entity xác định;
- exception chính được ghi;
- acceptance/KPI có thể kiểm thử;
- traceability sang Requirement được thiết lập.

---

## 15. Traceability Matrix sơ bộ

| Process | Capability chính |
|---|---|
| BP-01 | CAP-02, CAP-03 |
| BP-02 | CAP-03 |
| BP-03 | CAP-05, CAP-06, CAP-07 |
| BP-04 | CAP-04, CAP-10 |
| BP-05 | CAP-04, CAP-12 |
| BP-06 | CAP-06 |
| BP-07 | CAP-07 |
| BP-08 | CAP-08, CAP-06 |
| BP-09 | CAP-09 |
| BP-10 | CAP-10 |
| BP-11 | CAP-11 |
| BP-12 | CAP-01, CAP-12 |
