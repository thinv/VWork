# VWork – Authority & Responsibility Matrix v1.0

**Mục tiêu:** Khóa rõ ai được làm gì, ở bước nào, trên đối tượng nào và trong phạm vi nào; tránh việc dev suy diễn quyền từ chức danh.

# 1. Nguyên tắc
1. Chức danh không đồng nghĩa với quyền hệ thống.
2. Quyền thực tế = Actor + Role + Data Scope + Object Permission + Delegation + Business State.
3. Mọi thao tác phê duyệt/phát hành/đóng hồ sơ phải kiểm tra server-side.
4. Người được ủy quyền chỉ có quyền trong thời gian/phạm vi ủy quyền.
5. Platform Admin không mặc định được đọc dữ liệu nghiệp vụ tenant.
6. AI không phải actor có thẩm quyền.
7. Mọi thay đổi quyền/thẩm quyền phải audit.

# 2. RACI tổng thể

| Nghiệp vụ | ACT-01 Lãnh đạo | ACT-02 Văn thư | ACT-03 VP/Tham mưu | ACT-04 Chuyên môn | ACT-05 Duyệt/Ký | ACT-06 Thư ký | ACT-08 Tổng hợp | ACT-10 Admin |
|---|---|---|---|---|---|---|---|---|
| Tiếp nhận văn bản | I | R/A | C | I | I | - | - | C |
| Đọc hiểu/xác nhận trích xuất | I | R | A/R | C | I | - | - | - |
| Tạo hồ sơ công việc | A/C | C | R | C | I | - | - | - |
| Giao việc | A/R | C | R | I | C | - | - | - |
| Thực hiện nhiệm vụ | I | I | C | R | I | - | - | - |
| Soạn thảo | I | C | A/R | R | C | C | C | - |
| Kiểm tra văn bản | I | C | A/R | R | C | - | C | - |
| Trình duyệt | C | C | R | C | A/R | - | - | - |
| Phát hành | I | A/R | C | I | C | - | - | - |
| Họp/biên bản | C | I | C | C | A/C | A/R | - | - |
| Tổng hợp báo cáo | I | I | C | C | C | - | A/R | - |
| Master Data | I | C | C | I | I | - | C | A/R |

R=Responsible, A=Accountable, C=Consulted, I=Informed.

# 3. Ma trận thao tác theo domain

## 3.1 Document
- Create: ACT-02/03/04 theo scope.
- Edit metadata: ACT-02/03.
- Delete draft: actor có quyền + chưa referenced.
- Archive/final: theo workflow.
- Restore archived: role đặc biệt.
- View: theo data scope.
- Select All/Bulk archive: ACT-02/03 nếu có quyền.

## 3.2 Incoming
- Register: ACT-02.
- Verify AI extraction: ACT-02/03.
- Approve proposed routing: ACT-01 hoặc role được cấu hình.
- Create Work Case: ACT-03, ACT-01.
- Bulk routing: chỉ khi cùng policy/owner rule.

## 3.3 Work Case
- Create: ACT-01/03/04 theo policy.
- Edit: owner/manager.
- Close: ACT-01/03 hoặc role đóng hồ sơ.
- Reopen: role đặc biệt.
- Delete: chỉ draft chưa referenced; còn lại archive.
- Bulk assign/status: manager trong scope.

## 3.4 Task
- Create: ACT-01/03.
- Edit before assignment: creator/manager.
- Accept: assignee.
- Progress: assignee.
- Reassign: manager/delegated manager.
- Complete: assignee submit; reviewer/manager accept completion nếu policy.
- Cancel: creator/manager theo rule.
- Bulk assign/priority/status: manager, có kiểm tra từng item.

## 3.5 Draft
- Create/Edit: ACT-03/04.
- Submit: creator hoặc actor có submit permission.
- Approve: ACT-05.
- Delete: draft chưa submitted.
- Archive: submitted/final history.

## 3.6 Workflow/Approval
- Create definition: ACT-10.
- Publish definition: ACT-10 hoặc workflow admin.
- Approve/Return/Reject: ACT-05 hoặc ACT-01 được assign.
- Delegate: actor có quyền ủy quyền.
- Không bulk approve mặc định; chỉ bật nếu business policy cho từng workflow type.

## 3.7 Reporting
- Create cycle: ACT-08.
- Edit cycle: ACT-08 trước lock.
- Approve schema: ACT-08 hoặc role được cấu hình.
- Submit source: ACT-09.
- Replace submission: ACT-09/08 theo policy.
- Finalize report: ACT-08/01/05 tùy workflow.
- Bulk select obligations/submissions: có.

## 3.8 Knowledge
- Create source: ACT-03/13.
- Edit metadata: ACT-13.
- Publish: ACT-13.
- Archive: ACT-13.
- Bulk publish/archive: chỉ khi cùng scope và không có blocker.

# 4. Quyền đặc biệt

AUTH-01 – Bulk destructive  
Chỉ role có permission BULK_DELETE/BULK_ARCHIVE.

AUTH-02 – Override blocker  
Cần permission REVIEW_OVERRIDE và lý do.

AUTH-03 – Reopen completed  
Cần permission REOPEN và phải audit.

AUTH-04 – Change official deadline  
Cần actor có quyền quản lý task/case; lưu before/after + reason.

AUTH-05 – Change owner after acceptance  
Cần reassign permission và handover history.

AUTH-06 – Edit final document  
Không được; tạo version mới.

AUTH-07 – Delete master data referenced  
Không được; inactive/retired.

# 5. Delegation
Delegation phải có:
- delegator;
- delegate;
- start/end;
- scope;
- object/domain;
- allowed actions;
- reason;
- status.

Không cho:
- chain delegation mặc định;
- delegation vượt quyền gốc;
- delegation không thời hạn;
- delegation sang tenant khác.

# 6. Backend Authorization Decision
Input:
- actor/membership;
- tenant;
- object;
- action;
- role;
- data scope;
- object permission;
- delegation;
- current state.

Output:
- ALLOW/DENY;
- reason code;
- matched policy;
- effective scope.

# 7. Acceptance
- Không có thao tác P0 nào chỉ dựa vào UI hide/show.
- Mỗi action quan trọng có permission code.
- Mỗi delegation có hiệu lực và scope.
- Bulk action re-authorize ở backend.
- Approval không suy từ chức danh.
