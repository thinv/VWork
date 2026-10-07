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

# UAT-73 Work Case Creation
Tạo Work Case phải có source/provenance, owner unit, owner, priority và scope hợp lệ.

# UAT-74 Work Case Closure
Không complete khi còn blocking task, required output thiếu hoặc approval critical đang pending.

# UAT-75 Work Case Reopen
Reopen cần permission + reason; history và previous completion state phải giữ.

# UAT-76 Work Case Output
Add/remove output phải giữ type/source/provenance; output đã final/referenced không hard delete.

# UAT-77 Task Assignment
Task phải có đúng một primary owner; owner inactive hoặc ngoài scope phải bị chặn.

# UAT-78 Task Accept
ASSIGNED → ACCEPTED đúng policy; auto-accept và explicit accept không được trộn semantic.

# UAT-79 Task Progress & Blocker
Progress percent không thay state; blocker phải lưu severity/resolution và chặn completion khi policy yêu cầu.

# UAT-80 Task Deadline Change
Đổi deadline phải lưu old/new/reason/actor/time; deadline nguồn từ văn bản phải giữ provenance.

# UAT-81 Task Evidence
Required output/evidence phải có trước submit/complete; evidence referenced trong review không hard delete.

# UAT-82 Task Review Return
REVIEW → COMPLETED khi accept; REVIEW → IN_PROGRESS khi return; không mất evidence/history.

# UAT-83 Task Handover
Reassign sau ACCEPTED tạo handover history; không overwrite owner cũ.

# UAT-84 Task Cancel/Reopen
Cancel/Reopen phải đúng state, permission, reason và audit.

# UAT-85 Task Bulk
Select All + bulk assign/priority/remind phải re-authorize từng item và trả partial result; bulk complete mặc định OFF.

# UAT-86 Parent/Child Task
Parent completion phải tuân ALL_REQUIRED_CHILDREN/MANUAL_REVIEW/INDEPENDENT.

# UAT-87 Mobile Work Stale
Mobile Task/Case action phải refresh authoritative state trước update; cached stale action bị conflict.

# UAT-88 Work Source Scope
Related document/meeting/output bị revoke quyền không được leak qua Work Case/Task.

# UAT-89 Meeting CRUD & Bulk
Danh sách cuộc họp hỗ trợ Add/Edit/Archive/Select All/Bulk theo quyền; archive trả partial result khi có item không đủ điều kiện.

# UAT-90 Participant & Attendance
Participant CRUD, proxy/represented participant và attendance status phải được quản lý rõ; bulk attendance không tạo participant mới ngầm.

# UAT-91 Agenda CRUD
Agenda Add/Edit/Delete/Reorder/Select All/Bulk phải chống duplicate order/cycle logic không hợp lệ.

# UAT-92 Audio Preservation
Upload audio hợp lệ giữ source checksum/duration; transcript không được thay thế/xóa audio nguồn.

# UAT-93 Transcript Correction
Low-confidence segment hiển thị cảnh báo; sửa text/speaker phải audit và không mất original/reference.

# UAT-94 Speaker Resolution
Không chắc speaker phải giữ UNKNOWN; AI không được tự gán chắc chắn để tạo official decision.

# UAT-95 Decision Confirmation
Decision Candidate chỉ trở thành MeetingDecision sau human confirmation; reject candidate không tạo Task.

# UAT-96 Meeting Decision to Task
Task chỉ tạo từ confirmed decision; giữ meetingId/decisionId/timestamp/source provenance và đúng một primary owner.

# UAT-97 Decision Correction Reconciliation
Decision đã có Task rồi bị sửa phải tạo reconciliation warning; Task không silent update.

# UAT-98 Minutes Generation
Minutes sinh từ meeting metadata + attendance + transcript + confirmed decisions; thiếu context bắt buộc thì chặn hoặc đánh dấu draft/incomplete.

# UAT-99 Minutes Versioning
Minutes submitted/approved/final không sửa in-place; thay đổi tạo version mới và workflow lại theo policy.

# UAT-100 Mobile Meeting Stale
Mobile transcript/decision/action phải refresh authoritative state trước confirm/create Task; cached stale action bị conflict.

# UAT-101 Reporting Cycle CRUD
Create/Edit/Close/Reopen/Archive đúng state; reopen cần reason/audit.

# UAT-102 Reporting Cycle Bulk
Select All + bulk archive/owner/notify phải re-authorize từng cycle và trả partial result.

# UAT-103 Reporting Obligation Initialization
Cycle tạo ra obligation list versioned; không duplicate cùng đơn vị/kỳ.

# UAT-104 Obligation Retire
Obligation có submission không hard delete; retire vẫn giữ lịch sử.

# UAT-105 Obligation Reminder
Bulk reminder theo policy/rate-limit; audit recipient/result.

# UAT-106 Submission Replace
Nộp lại tạo version mới, replaced_submission_id đúng, bản cũ còn truy được.

# UAT-107 Submission Scope
Đơn vị A không xem/replace submission của đơn vị B nếu không có quyền.

# UAT-108 Missing Submission Dashboard
Thiếu đơn vị phải hiện rõ finding/status; không tính như đã đủ dữ liệu.

# UAT-109 Schema Candidate to Draft
AI schema suggestion chỉ là candidate; human accept/reject trước khi vào draft schema.

# UAT-110 Schema Approval & Compatibility
Approved schema immutable; duplicate code/type-unit-aggregation incompatibility bị chặn.

# UAT-111 Extraction Provenance
Mỗi extracted metric drill-down về submission version + page/sheet/cell/section.

# UAT-112 Unit Normalization
Unit mismatch chỉ convert khi có approved conversion rule; nếu không tạo blocker.

# UAT-113 Quality Blocker
BLOCKER mở ngăn official aggregation/final report.

# UAT-114 Quality Override
Override blocker cần permission + reason + audit; original finding giữ nguyên.

# UAT-115 Reconciliation Override
Mismatch total/detail/current/prior/source phải giữ original values; override có reason.

# UAT-116 Aggregation Determinism
Cùng verified inputs + schema version phải cho cùng kết quả; LLM không tham gia arithmetic.

# UAT-117 Aggregation Gate
Schema chưa approve, required submission thiếu, unit mismatch hoặc blocker mở → aggregation official bị chặn.

# UAT-118 Narrative Grounding
AI narrative chỉ dùng AggregationResult/verified metrics và citation; không thay đổi số.

# UAT-119 Report Draft Stale
Source/aggregation version đổi sau khi draft sinh → draft STALE, không silently refresh official content.

# UAT-120 Export Provenance
Export phải pin cycle, schema version, aggregation run, submission/source snapshot và generated_by/generated_at.

# Exit Criteria
- 100% UAT P0 PASS.
- Không workaround cho lỗi thẩm quyền, data loss, versioning, tenant isolation.
- Evidence gắn build/commit/environment.
