# VWork – Draft & Workflow Exception Catalog v1.0

## Draft / Review

EX-DRF-006 DRAFT_NOT_EDITABLE  
Draft đang SUBMITTED/APPROVED/FINALIZED hoặc actor không có quyền. Action: tạo version mới hoặc mở bản được phép.

EX-DRF-007 STALE_DRAFT_VERSION  
Version trên client cũ hơn server. Action: reload/compare/merge theo policy.

EX-DRF-008 CONTEXT_SOURCE_REVOKED  
Một source trong context bị thu hồi quyền/hết hiệu lực. Action: remove source, refresh context, rerun AI.

EX-DRF-009 TEMPLATE_VERSION_STALE  
Template source đã đổi. Action: tiếp tục với version pinned hoặc migrate sang template mới có xác nhận.

EX-DRF-010 REVIEW_BLOCKER_OPEN  
Còn finding BLOCKER chưa resolve. Action: resolve hoặc override bằng permission + reason.

EX-DRF-011 REVIEW_RESULT_STALE  
Draft thay đổi sau review. Action: review lại trước submit.

EX-DRF-012 REWRITE_SELECTION_INVALID  
Selection không còn khớp version hiện tại. Action: chọn lại đoạn.

EX-DRF-013 GENERATION_PROVIDER_FAILED  
AI provider lỗi/timeout. Action: retry/fallback theo policy; không mất draft hiện có.

EX-DRF-014 SUBMIT_VERSION_MISMATCH  
Version submit không phải version hiện tại/đã review. Action: reload và chọn đúng version.

EX-DRF-015 DRAFT_DELETE_NOT_ALLOWED  
Draft đã submitted/referenced. Action: archive thay vì hard delete.

EX-DRF-016 BULK_DRAFT_PARTIAL  
Bulk archive/delete gặp item không đủ quyền/không đúng state. Trả partial result.

## Workflow / Approval

EX-WFL-006 APPROVAL_NOT_ASSIGNED  
Actor không phải assignee/delegate hợp lệ.

EX-WFL-007 APPROVAL_STEP_NOT_ACTIVE  
Approval item không ở step active.

EX-WFL-008 APPROVAL_STALE_VERSION  
Subject version khác submitted version. Không approve.

EX-WFL-009 RETURN_REASON_REQUIRED  
Return thiếu lý do.

EX-WFL-010 REJECT_REASON_REQUIRED  
Reject thiếu lý do nếu policy yêu cầu.

EX-WFL-011 DELEGATION_INVALID  
Delegation hết hạn, ngoài scope hoặc vượt quyền.

EX-WFL-012 APPROVAL_ALREADY_TERMINAL  
Approval đã APPROVED/RETURNED/REJECTED/CANCELLED.

EX-WFL-013 PARALLEL_POLICY_NOT_MET  
ALL/ANY/QUORUM/ORDERED_GROUP chưa đạt điều kiện.

EX-WFL-014 BULK_APPROVAL_NOT_ALLOWED  
Workflow type không bật bulk hoặc các item khác step/subject policy.

EX-WFL-015 WORKFLOW_DEFINITION_IN_USE  
Definition/version đã published/đang có instance; không sửa in-place.

EX-WFL-016 WORKFLOW_ARCHIVE_BLOCKED  
Definition còn active instances hoặc policy chặn archive.

EX-WFL-017 WORKFLOW_CONFIG_INVALID  
Step/transition/approver rule/SLA không hợp lệ.

EX-WFL-018 BULK_WORKFLOW_PARTIAL  
Bulk publish/archive gặp definition không đủ điều kiện.

## Recovery UX
Mỗi exception phải map:
- code;
- message tiếng Việt;
- severity;
- retryable;
- suggested action;
- audit event nếu là action thay đổi trạng thái.
