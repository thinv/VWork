# VWork – Workflow, Approval & Delegation Detailed Business Specification v1.0

# 1. Mục tiêu
Đảm bảo mọi trình duyệt/phê duyệt đúng người, đúng version, đúng bước, đúng thẩm quyền và có audit.

# 2. Workflow Definition

Gồm:
- code;
- name;
- subject type;
- steps;
- transition;
- approver resolution rule;
- SLA;
- escalation;
- required comment;
- delegation policy;
- terminal states;
- version.

Published definition immutable.

# 3. Approver Resolution

Có thể theo:
- membership cụ thể;
- role;
- position;
- organization unit;
- manager hierarchy;
- rule expression.

Resolution phải tạo snapshot tại step activation.

# 4. Step Types

- REVIEW
- APPROVAL
- SIGN
- ACKNOWLEDGE
- PARALLEL_APPROVAL
- CONDITIONAL
- NOTIFICATION

# 5. Submit

Khi submit:
- pin subject version;
- validate required fields;
- validate review blockers;
- create workflow instance;
- resolve first step;
- create approval item;
- audit.

# 6. Approval Actions

Approve  
Return  
Reject  
Request clarification  
Delegate

Mỗi action lưu:
- actor;
- step;
- subject version;
- comment;
- time;
- delegation context nếu có;
- correlation id.

# 7. Return

Return phải:
- có reason;
- xác định target step/state;
- không xóa history;
- nếu sửa content thì version mới.

# 8. Reject

Reject là terminal hoặc branch theo workflow definition.

Không đồng nghĩa Delete.

# 9. Clarification

Clarification không làm mất approval item.
Có thể:
- pause SLA;
- không pause SLA;
theo policy.

# 10. Parallel Approval

Policy:
- ALL;
- ANY;
- QUORUM;
- ORDERED_GROUP.

Phải định nghĩa trước; không hard-code.

# 11. Version Change

Nếu subject version thay đổi:
- pending approval trở stale;
- workflow restart/return/resubmit theo policy;
- không cho approve version mới bằng approval cũ.

# 12. Delegation

Delegation có:
- effective window;
- domain/object scope;
- action scope;
- reason.

Không chain delegation mặc định.

# 13. SLA

Step activation ghi:
- activated_at;
- due_at;
- SLA policy/version.

Reminder/escalation là event, không tự approve/reject.

# 14. Bulk Approval

Mặc định OFF.

Chỉ bật khi:
- workflow type cho phép;
- subject type đồng nhất;
- cùng step;
- cùng approver;
- không có blocker;
- action không cần review nội dung riêng.

Vẫn re-authorize từng subject.

# 15. Signing

Nếu SIGN step:
- pin exact file hash/version;
- create signing request;
- signed artifact verify;
- lưu provider request id;
- status mapping canonical.

# 16. Audit

Approval history append-only.

Không admin nào được sửa action lịch sử.

# 17. Acceptance

- exact submitted version.
- stale protection.
- approver resolution snapshot.
- delegation scope.
- SLA.
- parallel rule.
- immutable history.
