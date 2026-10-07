# VWork – Business Exception & Edge Case Catalog v1.0

**Mục tiêu:** Khóa các ngoại lệ nghiệp vụ để Claude/Codex không chỉ code happy path.

# 1. Văn bản đến

EX-INC-001 Không có thời hạn  
→ deadline = null/UNKNOWN; không tự bịa; người có quyền bổ sung thủ công.

EX-INC-002 Có nhiều thời hạn  
→ tách theo từng requirement/task, không ép một deadline chung.

EX-INC-003 Một việc giao nhiều đơn vị  
→ bắt buộc có đơn vị chủ trì; đơn vị khác là phối hợp.

EX-INC-004 Không xác định được đơn vị chủ trì  
→ AI chỉ đề xuất; trạng thái cần xác nhận.

EX-INC-005 Văn bản khẩn/hỏa tốc  
→ priority/escalation theo master data/policy.

EX-INC-006 Văn bản trùng  
→ cảnh báo duplicate; người dùng quyết định relation/version hay record mới.

EX-INC-007 Văn bản thay thế/đính chính  
→ tạo relation REPLACES/CORRECTS, không xóa văn bản cũ.

EX-INC-008 Văn bản đến sau deadline  
→ vẫn đăng ký; đánh dấu đã quá hạn tại thời điểm tiếp nhận.

# 2. Soạn thảo

EX-DRF-001 Không đủ căn cứ  
→ AI báo MISSING.

EX-DRF-002 Nguồn mâu thuẫn  
→ hiển thị conflict, không tự chọn một nguồn làm fact.

EX-DRF-003 Template chứa dữ liệu cũ  
→ chỉ tái sử dụng cấu trúc; dữ kiện cũ không thành fact mới.

EX-DRF-004 Số liệu thay đổi sau khi draft  
→ cảnh báo stale context/re-run review.

EX-DRF-005 Người dùng sửa sau AI review  
→ finding cũ có thể stale; đánh dấu cần re-review.

# 3. Trình duyệt

EX-WFL-001 Người duyệt nghỉ/ủy quyền  
→ delegation hợp lệ mới chuyển quyền.

EX-WFL-002 Người duyệt thay đổi giữa workflow  
→ assignment thay đổi phải audit.

EX-WFL-003 Nội dung đổi sau khi trình  
→ pending approval invalid/stale.

EX-WFL-004 Hai người duyệt đồng thời  
→ optimistic lock; action sau nhận conflict nếu step đã terminal.

EX-WFL-005 Return nhiều lần  
→ mỗi vòng giữ history, không overwrite comment cũ.

# 4. Task/Work Case

EX-WRK-001 Task không có deadline  
→ cho phép nếu policy; hiển thị Chưa xác định.

EX-WRK-002 Deadline thay đổi  
→ lưu previous deadline + reason + actor.

EX-WRK-003 Owner nghỉ/chuyển đơn vị  
→ handover/reassign; giữ owner history.

EX-WRK-004 Task hoàn thành nhưng output bị trả  
→ REVIEW → IN_PROGRESS.

EX-WRK-005 Work Case còn task không blocking  
→ có thể complete nếu policy và mọi blocking task đã xong.

EX-WRK-006 Bulk assign có item ngoài scope  
→ partial result; không fail silently.

# 5. Meeting

EX-MTG-001 Audio thiếu đoạn  
→ transcript đánh dấu missing interval.

EX-MTG-002 Speaker không chắc chắn  
→ UNKNOWN SPEAKER hoặc low confidence.

EX-MTG-003 Quyết định không có owner  
→ candidate chưa được tạo task chính thức.

EX-MTG-004 Một kết luận tạo nhiều task  
→ cho phép 1 decision → N task.

EX-MTG-005 Biên bản sửa sau khi submit  
→ version mới, workflow lại theo policy.

# 6. Reporting

EX-RPT-001 Đơn vị không nộp  
→ missing obligation finding.

EX-RPT-002 Nộp nhiều version  
→ version mới thay thế nhưng giữ lịch sử.

EX-RPT-003 Đơn vị gửi sai kỳ  
→ reject hoặc remap có audit.

EX-RPT-004 Đơn vị dùng đơn vị đo khác nhau  
→ convert theo rule hoặc blocker.

EX-RPT-005 Tổng không bằng chi tiết  
→ reconciliation finding.

EX-RPT-006 Thiếu schema metric  
→ không aggregate chính thức.

EX-RPT-007 Một nguồn có số liệu nhiều bảng  
→ provenance theo sheet/cell/table.

# 7. Knowledge/RAG

EX-KNO-001 Nguồn hết hiệu lực  
→ stale/archived, không dùng nếu policy cấm.

EX-KNO-002 Quyền nguồn thay đổi  
→ retrieval phản ánh theo cache invalidation SLA.

EX-KNO-003 Hai nguồn mâu thuẫn  
→ answer nêu conflict hoặc ưu tiên theo authority policy.

EX-KNO-004 Không có nguồn  
→ abstain.

# 8. Master Data

EX-MD-001 Đổi tên đơn vị  
→ reference cập nhật label hiện tại; hồ sơ lịch sử giữ snapshot.

EX-MD-002 Sáp nhập/giải thể đơn vị  
→ inactive/retired + mapping successor.

EX-MD-003 Đổi địa giới hành chính  
→ version/effective date; không rewrite lịch sử.

EX-MD-004 Xóa item đã dùng  
→ denied; chỉ inactive.

# 9. CRUD/Bulk

EX-CRUD-001 Chọn tất cả rồi đổi filter  
→ reset/cảnh báo.

EX-CRUD-002 Bulk delete gồm item immutable  
→ partial result, nêu item không thể xóa.

EX-CRUD-003 User mất quyền sau khi selection  
→ backend re-authorize; deny item.

EX-CRUD-004 Hai user cùng sửa  
→ stale version.

EX-CRUD-005 Bulk action lớn  
→ async job + progress.

# 10. Error UX Requirement
Mỗi exception phải map:
- business error code;
- message tiếng Việt;
- recoverable action;
- audit requirement;
- retryable/non-retryable.
