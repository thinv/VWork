# VWork – Incoming & Outgoing Document Detailed Business Specification v1.0

**Phạm vi:** Văn bản đến, xử lý, dự thảo phản hồi, trình ký, phát hành và lưu hồ sơ.

# 1. Văn bản đến – lifecycle nghiệp vụ

RECEIVED → REGISTERED → ANALYZED → ROUTED → IN_PROCESS → RESPONSE_DRAFTED → APPROVAL → ISSUED/COMPLETED → ARCHIVED.

Không đồng nhất lifecycle này với Document Status kỹ thuật; đây là lifecycle nghiệp vụ.

# 2. Tiếp nhận

Nguồn:
- tải file;
- scan;
- DMS;
- email/import;
- API.

Bắt buộc ghi:
- thời điểm nhận;
- nguồn nhận;
- người tiếp nhận/system source;
- file gốc;
- checksum;
- tenant;
- trạng thái malware;
- registration metadata nếu có.

# 3. Đăng ký văn bản đến

Trường nghiệp vụ:
- số đến;
- ngày đến;
- số/ký hiệu;
- ngày ban hành;
- cơ quan ban hành;
- trích yếu;
- lĩnh vực;
- độ khẩn;
- độ mật;
- người ký;
- nơi nhận;
- file/attachments;
- deadline nếu có;
- văn bản liên quan.

Số đến:
- unique trong sổ/kỳ cấu hình;
- không reuse sau khi record đã chính thức;
- chỉnh số phải audit.

# 4. Phân tích AI

AI được phép đề xuất:
- document type;
- lĩnh vực;
- yêu cầu phải thực hiện;
- deadline;
- nơi/đơn vị có thể xử lý;
- priority;
- căn cứ;
- output cần nộp.

AI không được tự:
- giao việc chính thức;
- quyết định đơn vị chủ trì;
- thay đổi deadline chính thức;
- kết luận hoàn thành.

# 5. Phân luồng

Routing quyết định:
- chủ trì;
- phối hợp;
- người theo dõi;
- deadline;
- priority;
- có/không tạo Work Case;
- có/không tạo Task.

Nếu nhiều đơn vị:
- đúng 1 chủ trì mặc định;
- N phối hợp;
- có thể có nhiều Task với output riêng.

# 6. Xử lý

Một Incoming Record có thể:
- chỉ để biết;
- giao Task đơn;
- tạo Work Case;
- tạo Draft;
- xin ý kiến;
- trả lại/không thuộc thẩm quyền;
- chuyển cơ quan khác.

# 7. Không thuộc thẩm quyền

Phải có action:
- “Không thuộc thẩm quyền”;
- lý do;
- nơi đề xuất chuyển;
- actor xác nhận;
- audit.

Không được âm thầm archive.

# 8. Văn bản cần xin ý kiến

Cho phép:
- tạo request for opinion;
- nhiều người/đơn vị;
- deadline phản hồi;
- tổng hợp ý kiến;
- dùng làm source cho Draft.

# 9. Dự thảo phản hồi

Draft phải pin:
- incoming record;
- source document version;
- work case;
- template version;
- context snapshot;
- policy/rule version nếu liên quan.

# 10. Trình ký

Submitted package gồm:
- dự thảo version;
- văn bản nguồn;
- tài liệu liên quan;
- review findings;
- supporting evidence;
- approval metadata.

# 11. Phát hành

Chỉ phát hành khi:
- approval terminal hợp lệ;
- đúng final version;
- signing requirement hoàn tất nếu cấu hình;
- metadata phát hành đầy đủ.

Trường:
- số văn bản;
- ngày phát hành;
- người ký;
- nơi nhận;
- hình thức phát hành;
- signed artifact;
- issuing profile snapshot.

# 12. Thu hồi/đính chính/thay thế

Không xóa bản đã phát hành.

Quan hệ:
- REVOKES
- CORRECTS
- REPLACES
- SUPERSEDES
- REFERENCES

Mỗi action phải có reason + authority + timestamp.

# 13. Văn bản đi

Danh sách hỗ trợ:
- Thêm;
- Sửa trước final;
- lưu trữ;
- chọn;
- chọn all;
- bulk export;
- bulk send nếu integration/policy cho.

Không bulk ký/phát hành mặc định nếu từng văn bản cần xác nhận riêng.

# 14. Hồ sơ lưu

Khi hoàn thành:
- incoming source;
- extraction;
- routing decision;
- tasks;
- opinions;
- drafts;
- approvals;
- signed/final outgoing;
- audit timeline.

# 15. Acceptance

- Không mất file nguồn.
- AI không tự quyết định routing.
- Deadline có provenance.
- Version trình/phát hành khớp.
- Văn bản đã phát hành không hard delete.
- Quan hệ thay thế/đính chính giữ lịch sử.
