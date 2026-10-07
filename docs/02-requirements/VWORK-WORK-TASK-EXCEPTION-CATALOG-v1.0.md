# VWork – Work Case & Task Exception Catalog v1.0

## Work Case
EX-WRK-007 CASE_OWNER_REQUIRED  
Work Case mở chính thức nhưng thiếu owner/owner unit.

EX-WRK-008 CASE_HAS_BLOCKING_TASK  
Không được complete khi còn blocking task active.

EX-WRK-009 CASE_REQUIRED_OUTPUT_MISSING  
Thiếu đầu ra bắt buộc.

EX-WRK-010 CASE_APPROVAL_PENDING  
Còn approval critical chưa hoàn tất.

EX-WRK-011 CASE_REOPEN_REASON_REQUIRED  
Reopen thiếu lý do.

EX-WRK-012 CASE_ARCHIVE_NOT_ALLOWED  
Case chưa terminal hoặc policy chặn archive.

EX-WRK-013 CASE_DELETE_NOT_ALLOWED  
Case đã referenced/OPEN trở lên; chỉ archive.

EX-WRK-014 CASE_OUTPUT_CONFLICT  
Output trùng/không thuộc case/out of scope.

EX-WRK-015 BULK_CASE_PARTIAL  
Bulk action có item ngoài scope/không đúng state.

## Task
EX-TSK-001 PRIMARY_OWNER_REQUIRED  
Không assign task nếu không có đúng một primary owner.

EX-TSK-002 OWNER_NOT_ACTIVE  
Owner membership/unit không active.

EX-TSK-003 INVALID_DEADLINE  
Deadline không hợp lệ hoặc ngoài policy.

EX-TSK-004 DEADLINE_CHANGE_REASON_REQUIRED  
Đổi deadline chính thức phải có reason.

EX-TSK-005 TASK_NOT_ACCEPTABLE  
Task không ở ASSIGNED hoặc policy auto-accept.

EX-TSK-006 TASK_PROGRESS_STATE_INVALID  
Không cập nhật progress ở state terminal.

EX-TSK-007 REQUIRED_EVIDENCE_MISSING  
Không submit/complete nếu thiếu evidence/output bắt buộc.

EX-TSK-008 EVIDENCE_DELETE_NOT_ALLOWED  
Evidence đã dùng trong review/final output không được hard delete.

EX-TSK-009 TASK_REVIEW_NOT_ACTIVE  
Accept/return review khi Task không ở REVIEW.

EX-TSK-010 HANDOVER_REASON_REQUIRED  
Reassign sau ACCEPTED cần handover reason.

EX-TSK-011 TASK_CANCEL_NOT_ALLOWED  
Task terminal/critical dependency không được cancel theo policy.

EX-TSK-012 TASK_REOPEN_REASON_REQUIRED  
Reopen task thiếu lý do/quyền.

EX-TSK-013 TASK_HAS_BLOCKER  
Task bị blocker; completion bị chặn nếu blocker severity/policy blocking.

EX-TSK-014 CHILD_TASK_POLICY_NOT_MET  
Parent completion chưa thỏa ALL_REQUIRED_CHILDREN/MANUAL_REVIEW.

EX-TSK-015 BULK_TASK_PARTIAL  
Bulk assign/priority/remind/archive có item ngoài scope/state.

EX-TSK-016 BULK_COMPLETE_NOT_ALLOWED  
Bulk complete mặc định OFF vì evidence/review có thể khác từng task.

EX-TSK-017 STALE_TASK_VERSION  
Concurrent update; reload trước khi ghi.

EX-TSK-018 SOURCE_SCOPE_REVOKED  
Nguồn/provenance liên quan bị thu hồi quyền; không leak qua task detail.

## Recovery UX
Mỗi exception map:
- code;
- message tiếng Việt;
- severity;
- retryable;
- suggested action;
- audit requirement.
