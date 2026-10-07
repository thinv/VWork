# VWork – Business State Machine Catalog v1.0

**Mục tiêu:** Chuẩn hóa trạng thái và chuyển trạng thái của các đối tượng lõi để API, UI và Test dùng cùng một logic.

# 1. Quy tắc chung
1. Client không được tự set trạng thái tùy ý.
2. Mọi transition đi qua command/use case.
3. Transition kiểm tra actor, condition và version.
4. Transition quan trọng phải audit.
5. Invalid transition trả lỗi nghiệp vụ rõ.
6. Final/locked state không sửa trực tiếp.

# 2. Document State
DRAFT → PROCESSING → READY → REVIEW_REQUIRED → APPROVAL → FINAL → ARCHIVED.

Nhánh lỗi:
PROCESSING → FAILED  
PROCESSING → QUARANTINED

Quy tắc:
- FINAL không quay lại DRAFT.
- Sửa FINAL = tạo version mới.
- QUARANTINED không preview/process trước khi cleared.
- ARCHIVED không làm mất history.

# 3. Work Case State
DRAFT → OPEN → IN_PROGRESS → WAITING → REVIEW → COMPLETED → ARCHIVED.

Nhánh:
DRAFT/OPEN/IN_PROGRESS → CANCELLED.

Điều kiện:
- OPEN cần owner hoặc responsible unit.
- COMPLETED không còn blocking task active.
- ARCHIVED chỉ sau COMPLETED/CANCELLED.
- Reopen COMPLETED cần quyền đặc biệt, lý do và audit.

# 4. Task State
DRAFT → ASSIGNED → ACCEPTED → IN_PROGRESS → REVIEW → COMPLETED.

Nhánh:
ASSIGNED/ACCEPTED/IN_PROGRESS → WAITING  
DRAFT/ASSIGNED/ACCEPTED/IN_PROGRESS/WAITING → CANCELLED  
REVIEW → IN_PROGRESS nếu bị trả lại.

Điều kiện:
- ASSIGNED cần owner.
- COMPLETED cần evidence nếu required output.
- Đổi owner sau ACCEPTED tạo handover.
- Deadline quá hạn không tự đổi status; tạo overdue flag/event.

# 5. Draft State
DRAFT → GENERATED → EDITING → REVIEWING → READY_FOR_APPROVAL → SUBMITTED → APPROVED → FINALIZED → ARCHIVED.

Nhánh:
REVIEWING → EDITING  
SUBMITTED → RETURNED → EDITING  
SUBMITTED → REJECTED

Điều kiện:
- BLOCKER không được READY_FOR_APPROVAL nếu chưa resolved/override.
- Submitted version phải pin.
- Nội dung thay đổi sau submit tạo version mới và invalidate pending approval theo policy.

# 6. Approval State
PENDING → APPROVED  
PENDING → RETURNED  
PENDING → REJECTED  
PENDING → CLARIFICATION_REQUIRED  
PENDING → DELEGATED  
PENDING → CANCELLED

Không sửa action đã final.

# 7. Workflow Instance State
CREATED → RUNNING → WAITING → COMPLETED.

Nhánh:
RUNNING/WAITING → FAILED  
RUNNING/WAITING → CANCELLED

Không complete chỉ bằng PATCH status; workflow engine xác định terminal state.

# 8. Meeting State
DRAFT → SCHEDULED → IN_PROGRESS → ENDED → TRANSCRIBED → REVIEWED → MINUTES_DRAFTED → SUBMITTED → APPROVED → ARCHIVED.

Điều kiện:
- Decision candidate chưa human-confirmed không official.
- Minutes submitted phải pin transcript/context version.

# 9. Reporting Cycle State
DRAFT → OPEN → COLLECTING → SCHEMA_REVIEW → EXTRACTION → QUALITY_REVIEW → RECONCILIATION → AGGREGATION → REPORT_DRAFT → SUBMITTED → APPROVED → CLOSED → ARCHIVED.

Điều kiện:
- Aggregation cần schema approved.
- Final/report submit cần quality blocker clear hoặc override.
- CLOSED không nhận submission mới trừ reopen có quyền.

# 10. Knowledge Source State
DRAFT → REVIEW → PUBLISHED → STALE → REINDEXING → PUBLISHED.

Nhánh:
DRAFT/REVIEW/PUBLISHED → ARCHIVED.

Chỉ PUBLISHED được dùng trong RAG chính thức.

# 11. Master Data State
DRAFT → ACTIVE → INACTIVE → RETIRED.

Không hard delete item đã referenced.

# 12. Job State
QUEUED → RUNNING → SUCCEEDED  
RUNNING → RETRYING → RUNNING  
RUNNING/RETRYING → FAILED → DEAD_LETTER  
QUEUED/RUNNING → CANCELLED nếu supported.

# 13. Transition Error Codes
INVALID_STATE_TRANSITION  
STATE_REQUIRES_OWNER  
STATE_REQUIRES_EVIDENCE  
STATE_HAS_BLOCKING_TASK  
STATE_HAS_REVIEW_BLOCKER  
STALE_VERSION  
WORKFLOW_STEP_NOT_ACTIVE  
OBJECT_LOCKED  
OBJECT_ARCHIVED  
OBJECT_QUARANTINED

# 14. Test Requirement
Mỗi transition phải có:
- positive test;
- unauthorized test;
- invalid predecessor test;
- stale version test nếu versioned;
- audit assertion với transition quan trọng.
