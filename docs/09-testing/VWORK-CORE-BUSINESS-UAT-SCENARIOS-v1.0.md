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

# UAT-26 Reporting submission version
Nộp lại báo cáo phải tạo version mới; lịch sử version cũ còn truy cập được.

# UAT-27 Reporting unit mismatch
Metric dùng đơn vị đo khác canonical phải convert theo rule hoặc tạo blocker.

# UAT-28 Reporting reconciliation mismatch
Tổng khác chi tiết phải tạo finding và drill-down được về source.

# UAT-29 Reporting narrative
AI narrative không được thay đổi số liệu AggregationResult.

# UAT-30 Meeting speaker uncertainty
Speaker confidence thấp phải hiển thị UNKNOWN/low confidence, không tự gán chắc chắn.

# UAT-31 Meeting decision candidate
Candidate chưa xác nhận không được tạo Task chính thức.

# UAT-32 Meeting decision correction
Decision đã tạo Task rồi bị sửa phải tạo reconciliation warning, không silent update Task.

# UAT-33 Knowledge revoked source
Nguồn bị revoke/archived không còn xuất hiện trong retrieval sau SLA invalidation.

# UAT-34 Knowledge conflicting sources
RAG phải nêu conflict hoặc áp source authority policy có giải thích.

# UAT-35 Knowledge source version
Citation cũ phải mở đúng source version đã dùng tại thời điểm answer.

# UAT-36 Master Data import diff
Import phải có preview NEW/CHANGED/INVALID/CONFLICT trước khi apply.

# UAT-37 Administrative data effective date
Query lịch sử phải trả tên/mã theo version có hiệu lực tại thời điểm phát sinh.

# UAT-38 Taxonomy circular move
Không cho move node tạo vòng lặp hierarchy.

# UAT-39 Master Data select all
Chọn toàn bộ filtered result và bulk deactivate phải re-authorize, có confirm và audit.

# UAT-40 Master Data referenced delete
Item đã được tham chiếu không hard delete; chuyển inactive/retired.

# UAT-41 Authentication
Đăng nhập đúng/sai/disabled phải trả trạng thái phù hợp, không làm lộ username tồn tại.

# UAT-42 Context Selection
User nhiều membership chỉ được chọn membership ACTIVE; context bị revoke không được tiếp tục dùng.

# UAT-43 Reauthentication
Action nhạy cảm yêu cầu reauth; reauth fail không thực hiện action.

# UAT-44 Notification Bulk
Select All + bulk mark read/clear chỉ tác động notification của actor hiện tại và trả partial result nếu state thay đổi.

# UAT-45 Job Operations
Actor chỉ xem/retry/cancel job trong scope và chỉ khi job state cho phép.

# UAT-46 Executive Inbox Stale
Inbox item projection cũ phải re-check quyền và resource state trước khi mở/action.

# UAT-47 Executive Brief Source Change
Brief đã sinh phải giữ source reference/version; source đổi thì brief cũ được đánh dấu historical/stale.

# UAT-48 Assistant Scope Revocation
Conversation cũ không cho phép RAG tiếp tục dùng nguồn đã bị thu hồi quyền; mọi message mới retrieval theo scope hiện tại.

# UAT-49 Document Upload & Quarantine
Upload file hợp lệ tạo Document/Version; file malware bị quarantine, không preview/OCR/extract.

# UAT-50 Document Duplicate
Upload tài liệu trùng phải cảnh báo, hiển thị bản nghi trùng và không tự tạo duplicate nếu người dùng chưa xác nhận.

# UAT-51 Document Version Immutability
Bản FINAL không sửa trực tiếp; thay đổi tạo version mới, lịch sử và compare vẫn truy được.

# UAT-52 OCR Low Confidence
OCR confidence thấp phải đánh dấu để rà soát; correction lưu người sửa và audit.

# UAT-53 Extracted Field Verification
FACT/INFERENCE/MISSING hiển thị rõ; field chưa xác minh không được coi là official fact.

# UAT-54 Document Bulk
Select All + bulk archive/export phải re-authorize từng item và trả partial result với item immutable/out-of-scope.

# UAT-55 Incoming Registration
Đăng ký văn bản đến lưu số đến, nguồn, file gốc, checksum, metadata và chống trùng số theo sổ/kỳ.

# UAT-56 Incoming Missing/Ambiguous Deadline
Không có hạn hoặc có nhiều hạn → giữ null/candidate; không tự gán deadline chính thức.

# UAT-57 Incoming Routing
AI chỉ đề xuất chủ trì/phối hợp; người có quyền xác nhận trước khi giao/tạo việc.

# UAT-58 Incoming Multi-unit Ownership
Một việc nhiều đơn vị phải có đúng một chủ trì và N đơn vị phối hợp.

# UAT-59 Incoming Convert to Work
Tạo Work Case/Task từ requirement đã xác nhận, giữ source/provenance và không tạo duplicate chính ngoài policy.

# UAT-60 Response Package
Bộ hồ sơ phản hồi phải pin nguồn, context, template/version; thiếu context thì không tạo official package.

# UAT-61 Draft Context Pinning
Draft phải pin source document version, template version và context snapshot; source/template đổi sau đó không silently đổi draft cũ.

# UAT-62 Draft Review Stale
Sau AI review, nếu người dùng sửa nội dung thì review result phải được đánh dấu stale và yêu cầu review lại trước submit theo policy.

# UAT-63 Review Blocker Override
BLOCKER chặn submit; chỉ actor có DRF.REVIEW.OVERRIDE_BLOCKER mới override, bắt buộc lý do và audit.

# UAT-64 Draft Bulk
Select All + bulk archive/delete chỉ tác động draft đủ quyền/state; draft submitted/referenced không hard delete.

# UAT-65 Approval Exact Version
Approve chỉ hợp lệ với đúng submitted version; version đổi sau submit phải chặn bằng stale-version conflict.

# UAT-66 Approval Return/Reject
Return/Reject giữ lịch sử, lý do bắt buộc theo policy; không overwrite action cũ.

# UAT-67 Approval Delegation
Delegate chỉ hợp lệ trong effective window/scope; không chain delegation mặc định và không vượt quyền gốc.

# UAT-68 Parallel Approval
ALL/ANY/QUORUM/ORDERED_GROUP phải thực thi đúng policy đã publish.

# UAT-69 Approval Bulk
Bulk approval mặc định bị chặn; chỉ chạy khi workflow policy bật, cùng step/subject rule và re-authorize từng item.

# UAT-70 Workflow Definition Versioning
Definition đã publish không sửa in-place; thay đổi tạo version mới và instance đang chạy tiếp tục pin version cũ.

# UAT-71 Workflow Definition Archive
Definition còn active instance không được archive nếu policy chặn; audit đầy đủ.

# UAT-72 Mobile Approval Stale
Mobile approval phải refresh submitted version/state trước action; stale/offline cached action không được gửi thành công.

# Exit Criteria
- 100% UAT P0 PASS.
- Không workaround cho lỗi thẩm quyền, data loss, versioning, tenant isolation.
- Evidence gắn build/commit/environment.
