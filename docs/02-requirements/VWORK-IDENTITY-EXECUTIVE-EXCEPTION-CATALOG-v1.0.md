# VWork – Identity / Session / Executive Exception Catalog v1.0

## Authentication
EX-AUTH-001 INVALID_CREDENTIALS  
Thông báo: Thông tin đăng nhập không hợp lệ. Không tiết lộ username tồn tại hay không.

EX-AUTH-002 ACCOUNT_DISABLED  
Thông báo: Tài khoản hiện không thể sử dụng. Hướng dẫn liên hệ quản trị.

EX-AUTH-003 NO_ACTIVE_MEMBERSHIP  
Đăng nhập thành công về identity nhưng không có ngữ cảnh tenant ACTIVE.

EX-AUTH-004 SESSION_EXPIRED  
Yêu cầu reauth; giữ safe return path nhưng không giữ sensitive form content nếu policy cấm.

EX-AUTH-005 REAUTH_FAILED  
Không thực hiện action nhạy cảm; session có thể bị revoke theo security policy.

EX-AUTH-006 CONTEXT_NOT_ALLOWED  
Membership bị disable/revoke hoặc actor đoán tenant context.

EX-AUTH-007 MFA_REQUIRED  
Nếu deployment bật MFA, flow chuyển bước xác minh bổ sung.

## Shell / Notification / Job
EX-SHELL-001 NOTIFICATION_RESOURCE_GONE  
Notification còn nhưng object đã archive/revoke; hiển thị trạng thái và không leak.

EX-SHELL-002 JOB_NOT_VISIBLE  
Job tồn tại nhưng actor không có scope; trả 404/403 theo security policy.

EX-SHELL-003 JOB_NOT_RETRYABLE  
Job terminal/loại job không hỗ trợ retry.

EX-SHELL-004 BULK_NOTIFICATION_PARTIAL  
Một số notification đã biến mất/thay state; trả partial result.

## Executive
EX-EXE-001 INBOX_ITEM_STALE  
Projection/inbox item cũ; reload authoritative resource.

EX-EXE-002 INBOX_RESOURCE_DENIED  
Actor thấy projection cũ nhưng quyền object gốc đã bị thu hồi; không mở nội dung.

EX-EXE-003 BRIEF_SOURCE_CHANGED  
Source version thay đổi sau brief; đánh dấu brief historical/stale.

EX-EXE-004 BRIEF_INSUFFICIENT_EVIDENCE  
Không đủ dữ liệu → không tạo claim khẳng định.

EX-EXE-005 ASSISTANT_SCOPE_REVOKED  
Conversation context còn nhưng source permission đã đổi; retrieval lại theo quyền hiện tại.

EX-EXE-006 SIGNAL_EXPIRED  
Signal không còn actionable; hiển thị resolved/expired, không xóa lịch sử.
