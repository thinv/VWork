# VWork – Work Case & Task Detailed Business Specification v1.0

# 1. Mục tiêu
Chuẩn hóa quản lý công việc từ nguồn chỉ đạo/văn bản/họp đến kết quả, trách nhiệm và bằng chứng.

# 2. Work Case

Work Case là “hồ sơ xử lý một vấn đề”, không chỉ là folder.

Bắt buộc:
- code;
- title;
- source;
- owner unit;
- owner;
- priority;
- status;
- scope;
- timeline;
- related documents/tasks/meetings/approvals;
- output/result.

# 3. Nguồn tạo Work Case
- văn bản đến;
- chỉ đạo lãnh đạo;
- cuộc họp;
- báo cáo;
- tạo thủ công;
- integration.

# 4. Task

Task là đơn vị công việc có:
- title;
- description;
- owner;
- coordinating unit optional;
- deadline optional;
- required output;
- priority;
- status;
- evidence;
- parent task optional;
- source/provenance.

# 5. Owner Model

Một Task có:
- primary owner: một cá nhân hoặc một đơn vị;
- coordinator(s): 0..N;
- watcher(s): 0..N.

Không dùng nhiều primary owner.

# 6. Giao việc

Khi giao:
- validate owner active;
- validate data scope;
- ghi assigned_by;
- ghi assigned_at;
- notification;
- audit.

# 7. Tiếp nhận

Policy:
- auto-accept hoặc explicit accept.

Nếu explicit:
ASSIGNED → ACCEPTED.

Nếu quá SLA chưa accept:
- reminder;
- escalation theo policy.

# 8. Tiến độ

progress_percent chỉ là thông tin hỗ trợ, không thay status.

Progress update có thể gồm:
- %;
- note;
- blocker;
- expected completion;
- evidence.

# 9. Blocker

Blocker phải có:
- description;
- severity;
- created_by;
- created_at;
- resolved_at;
- resolution.

Blocking Task ảnh hưởng Work Case closure.

# 10. Evidence

Loại:
- file;
- document;
- comment;
- form;
- metric;
- meeting decision;
- external reference.

Nếu required output cấu hình bắt buộc, không complete khi thiếu.

# 11. Deadline

Nguồn:
- source document;
- leader assignment;
- manual;
- derived SLA.

Thay đổi deadline:
- old;
- new;
- reason;
- actor;
- timestamp.

# 12. Reassign/Handover

Sau ACCEPTED:
- không overwrite owner silently;
- tạo Handover record;
- original owner history vẫn giữ.

# 13. Task phụ

Parent task có thể chia subtask.

Parent completion policy:
- ALL_REQUIRED_CHILDREN;
- MANUAL_REVIEW;
- INDEPENDENT.

Không mặc định tất cả child đều blocking.

# 14. Review kết quả

Task có thể dùng:
IN_PROGRESS → REVIEW → COMPLETED.

Reviewer có thể:
- accept;
- return;
- request additional evidence.

# 15. Work Case Completion

Điều kiện:
- blocking task complete/cancelled hợp lệ;
- required outputs đủ;
- pending approval critical đã xong;
- owner xác nhận closure nếu policy.

# 16. Reopen

Reopen:
- permission REOPEN;
- reason;
- status transition;
- audit;
- optional new task.

# 17. Bulk Operations

Cho phép:
- assign;
- change priority;
- add tag/category;
- remind;
- archive eligible;
- export.

Không bulk complete mặc định nếu mỗi task cần evidence/review.

# 18. Dashboard

Các chỉ số:
- total;
- due soon;
- overdue;
- blocked;
- unassigned;
- awaiting review;
- completion rate.

Tất cả dựa core state, không dựa notification.

# 19. Acceptance

- Một primary owner.
- Deadline history.
- Handover history.
- Evidence enforcement.
- Blocking semantics.
- Bulk partial result.
- Closure rule.
