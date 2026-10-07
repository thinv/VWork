# VWork – Competitor Benchmark v1.0

**Benchmark:** Trợ lý Văn phòng AI – trolyvanphongai.com  
**Ngày rà soát:** 07/10/2026  
**Mục tiêu:** Thu thập có hệ thống các ý tưởng nghiệp vụ, UX, AI workflow và mô hình thương mại công khai để làm đầu vào phát triển VWork. Tài liệu không nhằm sao chép mã nguồn, giao diện, thương hiệu hay nội dung độc quyền.

## 1. Phạm vi rà soát
Nguồn công khai đã rà:
- Trang chủ và các màn chức năng công khai.
- Tham mưu văn bản.
- Đánh giá và hoàn thiện văn bản.
- Xử lý văn bản đến.
- Trợ lý cuộc họp.
- Tổng hợp báo cáo.
- Tổng hợp bảng số liệu.
- Chuyển PDF/scan sang Word.
- Kho mẫu văn bản.
- Hồ sơ pháp lý.
- Hồ sơ tố tụng hình sự.
- Lịch sử xử lý.
- Gói dịch vụ, điểm sử dụng và gói đơn vị.
- Hướng dẫn sử dụng và ví dụ nghiệp vụ cho UBND xã.

Nguồn tham chiếu chính:
- https://trolyvanphongai.com/
- https://trolyvanphongai.com/danh-gia-hoan-thien-van-ban
- https://trolyvanphongai.com/kho-mau-van-ban

> Benchmark chỉ phản ánh những gì quan sát được công khai tại thời điểm rà soát. Không suy đoán kiến trúc nội bộ hoặc năng lực chưa công bố.

## 2. Định vị sản phẩm tham chiếu
Sản phẩm được định vị như một bộ công cụ AI hỗ trợ công việc hành chính hằng ngày: soạn thảo, kiểm tra, hoàn thiện, tạo hồ sơ, tổng hợp số liệu, chuyển scan/PDF sang Word và tái sử dụng mẫu.

Trọng tâm hiện tại là **tác vụ văn phòng theo từng công cụ**, chưa thể hiện như một nền tảng quản trị toàn bộ vòng đời công việc cấp tổ chức.

### 2.1 Đối tượng người dùng quan sát được
- Cán bộ văn phòng, văn thư, tham mưu.
- Công chức xã/phường.
- Người xử lý hồ sơ pháp lý.
- Điều tra viên/cán bộ điều tra trong module thử nghiệm.
- Cá nhân xử lý văn bản.
- Cơ quan/đơn vị dùng gói nhiều người.

### 2.2 Mô hình tương tác chính
Thay vì chatbot tổng quát, sản phẩm chia thành workflow chuyên biệt. Mỗi workflow thường có:
1. Dữ liệu đầu vào rõ.
2. Form cấu hình.
3. AI phân tích.
4. Kết quả có cấu trúc.
5. Người dùng rà soát.
6. Xuất Word/Excel.

Đây là quyết định sản phẩm quan trọng VWork cần học.

## 3. Danh mục capability quan sát được

| Mã | Capability | Trạng thái | Đầu vào | Đầu ra |
|---|---|---|---|---|
| REF-01 | Tham mưu văn bản | Có | Ý chỉ đạo, tài liệu, mẫu | DOCX dự thảo |
| REF-02 | Hoàn thiện văn bản | Có | DOCX/PDF, tài liệu đối chiếu | Văn bản + đề xuất |
| REF-03 | Xử lý văn bản đến | Có | Văn bản đến + dữ kiện thực tế | Bộ hồ sơ phản hồi |
| REF-04 | Trợ lý cuộc họp | Đang phát triển | Giấy mời, audio | Transcript, nhiệm vụ, biên bản |
| REF-05 | Tổng hợp báo cáo | Có | Nhiều Word/PDF/TXT | Bộ chỉ tiêu + báo cáo tổng |
| REF-06 | Tổng hợp bảng | Có | XLSX/CSV/DOCX | XLSX tổng hợp |
| REF-07 | PDF/scan → Word | Có | PDF/JPG/PNG | DOCX dựng lại |
| REF-08 | Kho mẫu | Có | DOC/DOCX/PDF/TXT | Template |
| REF-09 | Hồ sơ pháp lý | MVP | Dữ liệu vụ việc | Bộ Word + checklist |
| REF-10 | Tố tụng hình sự | MVP | Hồ sơ + người + vai trò | Bộ Word |
| REF-11 | Lịch sử xử lý | Có | Log tác vụ | Lịch sử + điểm |
| REF-12 | Gói điểm/thanh toán | Có | Tài khoản/gói | Điểm, lịch sử |
| REF-13 | Cấu hình văn bản | Có | Cơ quan, người ký, nơi nhận | Auto-fill |
| REF-14 | CTV/hoa hồng | Có | Referral | Tracking/hoa hồng |

## 4. Benchmark chi tiết

### 4.1 Tham mưu văn bản
Luồng: Ý chỉ đạo/vấn đề → chọn loại văn bản → chọn loại chi tiết → tải tài liệu → chọn hệ văn bản/cấu hình → chọn mẫu → chọn cách dùng mẫu → chọn kiểu dự thảo → AI phân tích → tạo dự thảo → tải Word.

Đầu vào hỗ trợ quan sát được: Word, PDF, TXT, Excel, CSV, JPG, PNG, WebP.

Cấu hình thể thức gồm: cơ quan chủ quản, cơ quan ban hành/đơn vị soạn, ký hiệu, địa danh, chức vụ người ký, họ tên người ký và nơi nhận ở các luồng phù hợp.

Ba kiểu dự thảo:
1. **Dự thảo trình ký:** gọn, ít placeholder, ưu tiên bản chính.
2. **Dự thảo chi tiết:** nhiều bối cảnh, nhiệm vụ, tiến độ.
3. **Dự thảo nâng cao:** có thể tạo nhóm văn bản liên quan.

Điểm đáng học:
- Chọn workflow theo công việc thay vì bắt người dùng biết prompt.
- Cấu hình tổ chức được lưu và tái sử dụng.
- Template chỉ áp dụng khi người dùng chủ động chọn.
- Phân biệt giữ văn phong/logic và tạo mới dựa trên mẫu.
- Đầu ra DOCX phù hợp công việc thực tế.

### 4.2 Đánh giá và hoàn thiện văn bản
Luồng: Upload DOCX/PDF → chọn hệ/loại văn bản → tài liệu nguồn đối chiếu → tùy chọn nghiên cứu quy định → AI đánh giá → editor + panel AI → người dùng chỉnh → tải bản hoàn thiện.

UX nổi bật:
- Hai vùng văn bản và trợ lý.
- Undo/redo, tìm kiếm, so sánh, chỉnh sửa thủ công, zoom.
- Lệnh AI: mạch lạc hơn, ngắn gọn hơn, cụ thể hơn, rút gọn, sắp xếp lại, sửa theo yêu cầu.
- Hỏi tiếp về văn bản.

Bài học:
- AI không sửa âm thầm.
- Kết hợp editor với AI review.
- Có nguồn đối chiếu, không chỉ sửa ngữ pháp.
- Có thể nâng thành compliance/rule checking.

### 4.3 Xử lý văn bản đến
Luồng: văn bản đến → thông tin thực tế → mẫu nếu có → kiểu dự thảo → AI bóc tách yêu cầu → tạo bộ hồ sơ phản hồi/triển khai → tải bộ Word.

Đầu ra quan sát: dự thảo báo cáo, công văn gửi kèm, bảng tổng hợp, checklist.

Nguyên tắc đáng giữ: AI chỉ dùng **thông tin thực tế đã có**, không tự bịa kết quả hoặc số liệu.

Khoảng trống để VWork mở rộng:
- giao việc chính thức;
- owner/deadline/SLA;
- trạng thái nhiều người;
- Work Case xuyên suốt;
- escalation và follow-up.

### 4.4 Trợ lý cuộc họp
Quy trình 4 bước:
1. Chuẩn bị thông tin và âm thanh.
2. Nhận dạng và trích xuất.
3. Rà soát transcript và nguồn.
4. Tạo văn bản.

Ý tưởng tốt:
- Giấy mời tạo context.
- Transcript có timestamp.
- Trích quyết định và nhiệm vụ.
- Biên bản có nguồn.

VWork phải nối thêm: Decision → Task → Owner → Deadline → Follow-up → Report.

### 4.5 Tổng hợp báo cáo
Đây là workflow đặc biệt đáng học.

Luồng: nhiều báo cáo → AI tạo bộ chỉ tiêu → **người dùng duyệt bộ chỉ tiêu** → chỉnh tên/đơn vị/cách tổng hợp → AI trích số liệu → gom chứng cứ → gom khó khăn/kiến nghị → tạo nhận xét/dự thảo → tải CSV/Word.

Bài học cốt lõi: LLM không nên tự quyết schema cuối cùng. VWork cần gate: AI đề xuất schema → người dùng duyệt → extraction → validation → aggregation.

### 4.6 Tổng hợp bảng số liệu
Đầu vào: XLSX, CSV, DOCX có bảng.  
Năng lực: gộp bảng, phát hiện thiếu/trùng/sai, xuất Excel.

VWork mở rộng:
- mapping cột;
- type validation;
- công thức tổng/tỷ lệ;
- lineage file/sheet/cell;
- reconciliation;
- kỳ báo cáo;
- đơn vị chưa nộp.

### 4.7 PDF/scan → Word
Luồng: PDF hoặc nhiều ảnh → sắp thứ tự → OCR → cảnh báo → dựng DOCX mới → tải Word hoặc chuyển sang Review/Kho mẫu.

Quyết định đúng: dựng DOCX sạch thay vì sao chép nguyên lỗi scan.

VWork mở rộng:
- OCR confidence;
- review queue;
- table reconstruction;
- provenance theo trang;
- import vào Document Repository.

### 4.8 Kho mẫu
Metadata: tên, hệ văn bản, loại, vai trò tệp, ngành/cơ quan, lĩnh vực, năm, ghi chú.

Hai nguồn: mẫu tài khoản và mẫu hệ thống.  
Hai cách dùng: giữ văn phong/logic hoặc tạo mới dựa trên mẫu.

VWork nâng cấp template thành cấu trúc gồm metadata, section schema, field schema, business rule, style và renderer.

### 4.9 Hồ sơ pháp lý
Pattern đáng học:
- form động theo case;
- rule engine;
- kiểm tra dữ liệu bắt buộc;
- trạng thái đỏ/vàng/xanh;
- một nguồn dữ liệu sinh nhiều tài liệu.

Không đưa domain pháp lý vào Core v1.

### 4.10 Tố tụng hình sự
Pattern đáng học:
- một hồ sơ nguồn;
- nhiều người và vai trò;
- thủ tục;
- cấu hình mặc định;
- kiểm tra trước khi sinh;
- batch document generation.

Không đưa domain này vào Core v1.

## 5. Benchmark UX tổng thể

Điểm mạnh:
- chọn công việc thay vì prompt;
- form cụ thể;
- hướng dẫn cần chuẩn bị gì;
- đầu ra Word/Excel;
- review trước khi sử dụng;
- template có chủ đích;
- empty state hướng dẫn;
- ví dụ gần thực tế xã/phường.

Cơ hội VWork:
- global inbox;
- Work Case;
- Task/Workflow Engine;
- dashboard lãnh đạo;
- mobile;
- API/integration;
- version/audit lineage sâu;
- retention dài hạn theo chính sách đơn vị.

## 6. AI safety/governance
Thực hành tốt quan sát:
- người dùng chịu trách nhiệm kiểm tra/phê duyệt;
- không bịa số liệu trong luồng văn bản đến;
- mẫu không là nguồn dữ kiện mới;
- có tài liệu đối chiếu;
- một số luồng có chứng cứ nguồn.

VWork nâng cấp:
- FACT / INFERENCE / MISSING;
- citation/provenance tới trang/đoạn/bảng/ô;
- prompt/model version;
- AI run audit;
- evaluation dataset;
- groundedness;
- PII/security guardrails;
- prompt injection defense;
- provider failover;
- tenant-scoped RAG;
- rule engine tách khỏi LLM.

## 7. Mô hình thương mại
Quan sát:
- gói cá nhân;
- tính điểm;
- ước tính điểm trước tác vụ;
- hoàn điểm khi lỗi;
- gói đơn vị;
- chương trình CTV.

VWork đề xuất:
- thuê bao tenant/năm;
- tier theo user/storage/AI allowance;
- overage minh bạch;
- Private/On-Premise theo license + bảo trì;
- SLA/quota rõ ràng.

## 8. So sánh định vị

| Chiều | Hệ thống tham chiếu | VWork mục tiêu |
|---|---|---|
| Đơn vị giá trị | Tác vụ AI | Hồ sơ công việc |
| Trung tâm | Document tool | Work platform |
| AI | Theo module | Xuyên vòng đời |
| Tổ chức | Cấu hình đơn vị | Multi-tenant + org + scope |
| Văn bản đến | Sinh hồ sơ phản hồi | Sinh việc + workflow + báo cáo |
| Họp | Transcript/biên bản | Decision → Task → follow-up |
| Báo cáo | Tổng hợp | Schema governance + lineage |
| Knowledge | Kho mẫu | Knowledge + RAG + graph |
| Lãnh đạo | Chưa rõ | Executive Inbox/Brief |
| Mobile | Chưa thấy | Client chính thức |
| Workflow | Chưa thấy rõ | Configurable engine |
| Audit | Lịch sử tác vụ | Full audit/traceability |
| Integration | Chưa thấy rõ | API-first |
| Commercial | Points/SaaS | SaaS/Private/On-Premise |

## 9. Kết luận
Các pattern đáng kế thừa nhất:
1. Soạn thảo theo nghiệp vụ thay vì chat.
2. Editor + AI Review.
3. Văn bản đến → bộ hồ sơ.
4. Tổng hợp báo cáo có bước duyệt schema.
5. Kho mẫu phân loại sâu.
6. PDF/scan → DOCX sạch.
7. Case + rule engine.
8. Human-in-the-loop.
9. Word/Excel là đầu ra thật.
10. Cấu hình tổ chức tái sử dụng.

Khoảng trống để VWork khác biệt là **biến năng lực tài liệu thành nền tảng điều hành công việc cấp tổ chức**: Document → Work Case → Task → Workflow → Approval → Report → Knowledge → Executive Intelligence.

## 10. Quy tắc sử dụng benchmark
- Không sao chép UI/branding/nội dung độc quyền.
- Chỉ dùng pattern nghiệp vụ và ý tưởng chức năng công khai.
- Mọi capability phải tái thiết kế theo bài toán VWork.
- Feature không phục vụ Core phải chuyển Extension/Future.
- Adopt/Improve/Defer/Reject được quản lý trong Feature Harvest.
