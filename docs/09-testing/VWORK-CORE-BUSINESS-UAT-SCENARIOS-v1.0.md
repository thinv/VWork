# VWork – Core Business UAT Scenarios v1.0

**Mục tiêu:** Bộ kịch bản nghiệm thu nghiệp vụ lõi để xã/phường, BA, QA và đội triển khai cùng kiểm tra.

# UAT-01 Văn bản đến đầy đủ
Given văn bản có số/ký hiệu, đơn vị ban hành, yêu cầu, deadline.
When văn thư tiếp nhận và AI phân tích.
Then:
- metadata đúng;
- requirement có provenance;
- người dùng xác nhận;
- tạo Work Case/Task;
- owner/deadline rõ;
- audit đầy đủ.

# UAT-02 Văn bản đến không có deadline
Hệ thống không tự bịa deadline; cho phép bổ sung thủ công với source=user.

# UAT-03 Văn bản nhiều đơn vị phối hợp
Phải có chủ trì + phối hợp; không tạo nhiều owner chính mơ hồ.

# UAT-04 Văn bản thay thế/đính chính
Giữ văn bản cũ, tạo relation thay thế/đính chính.

# UAT-05 Soạn thảo có đủ căn cứ
AI sinh draft có citation; người dùng sửa; review; lưu version.

# UAT-06 Soạn thảo thiếu căn cứ
AI báo MISSING/chưa đủ cơ sở; không tạo fact giả.

# UAT-07 Review có BLOCKER
Không submit nếu chưa resolve/override có quyền+lý do.

# UAT-08 Trình duyệt đúng version
Người duyệt thấy đúng submitted version; approve được audit.

# UAT-09 Nội dung đổi sau trình
Approval cũ stale/invalid; không được approve version mới bằng approval cũ.

# UAT-10 Ủy quyền
Delegate chỉ xử lý trong thời gian/scope cho phép.

# UAT-11 Task giao và theo dõi
Assignee nhận, cập nhật, nộp evidence, complete đúng state.

# UAT-12 Task thay owner
Tạo handover history, không mất lịch sử owner cũ.

# UAT-13 Work Case closure
Không đóng nếu còn blocking task active.

# UAT-14 Meeting to Task
Transcript → decision candidate → human confirm → Task; có timestamp provenance.

# UAT-15 Báo cáo chuẩn
Cycle → submissions → schema approve → extract → quality → reconcile → aggregate → draft.

# UAT-16 Báo cáo thiếu đơn vị
Tạo finding missing obligation; không im lặng aggregate như đầy đủ.

# UAT-17 Schema chưa duyệt
Không chạy official aggregation.

# UAT-18 Knowledge grounded answer
Answer có citation đúng source/version.

# UAT-19 Knowledge không đủ nguồn
Trả “chưa đủ cơ sở”, không bịa.

# UAT-20 CRUD cơ bản
Trên màn quản lý phải kiểm:
- Thêm;
- Sửa;
- Xóa/Archive;
- chọn dòng;
- chọn tất cả;
- bulk action;
- audit.

# UAT-21 Select All phân trang
Given 1.245 bản ghi.
When chọn 50 dòng trang đầu.
Then UI đề nghị chọn toàn bộ 1.245 nếu muốn.
Bulk action dùng query/filter snapshot.

# UAT-22 Bulk partial failure
Given một số item immutable/không đủ quyền.
Then trả số thành công/thất bại và lý do.

# UAT-23 Cross-tenant
Tenant A không xem/sửa/xóa/search/RAG/export dữ liệu Tenant B.

# UAT-24 Master Data rename
Đổi tên đơn vị không làm thay đổi snapshot lịch sử của văn bản đã phát hành.

# UAT-25 Master Data retire
Item đã tham chiếu không hard delete; chuyển inactive/retired.

# Exit Criteria
- 100% UAT P0 PASS.
- Không workaround cho lỗi thẩm quyền, data loss, versioning, tenant isolation.
- Evidence gắn build/commit/environment.
