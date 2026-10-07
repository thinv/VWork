# VWork – Post-Approval Action Catalog v1.0

**Mục tiêu:** Khóa các hành động tự động sau approval; không cho code suy diễn từ comment/nội dung văn bản.

## 1. Nguyên tắc
- Default = NONE.
- Chỉ chạy action được cấu hình trong WorkflowDefinitionVersion đã publish.
- Action pin subject version.
- Mỗi action có idempotency key.
- Backend re-authorize service policy và validate target scope.
- Failure không đảo ngược approval đã hoàn tất; tạo job/finding để retry/khắc phục theo policy.

## 2. Action Types
PA-001 NONE  
Không tạo side effect.

PA-002 FINALIZE_DRAFT  
Đưa exact approved DraftVersion sang trạng thái APPROVED/FINALIZED theo workflow.

PA-003 CREATE_WORK_CASE  
Tạo Work Case từ approved subject với source/provenance.

PA-004 CREATE_TASK  
Tạo Task theo mapping owner/deadline/output đã cấu hình; không derive owner từ free-text comment.

PA-005 GENERATE_DOCUMENT_PACKAGE  
Tạo package từ exact approved version/context.

PA-006 REQUEST_DIGITAL_SIGNATURE  
Tạo signing request cho exact artifact hash/version.

PA-007 NOTIFY  
Gửi notification theo recipient rule.

PA-008 EMIT_INTEGRATION_EVENT  
Phát external integration event đã whitelist/versioned.

## 3. Configuration Schema
Mỗi PostAction:
- actionId
- actionType
- enabled
- trigger = WORKFLOW_COMPLETED | STEP_APPROVED
- subjectType
- condition expression optional
- target resolver
- owner resolver optional
- deadline resolver optional
- output mapping
- idempotency strategy
- retry policy
- failure policy
- audit event
- version

## 4. Resolver Rules
Owner resolver chỉ được dùng:
- fixed membership/role/org rule;
- confirmed routing;
- workflow actor mapping;
- explicit deterministic expression.

Không được lấy owner từ LLM free-text inference ở thời điểm execute.

Deadline resolver:
- confirmed source deadline;
- fixed offset/SLA;
- explicit workflow field.

## 5. Validation
Publish workflow bị chặn nếu:
- action type không hỗ trợ subject;
- target resolver thiếu;
- owner resolver không deterministic;
- action tạo Task nhưng không có owner policy;
- signing action không pin artifact;
- external event chưa có contract version.

## 6. Audit
Mỗi post-action ghi:
- workflowInstanceId
- approval/step
- subjectId/version
- actionType/version
- idempotencyKey
- target object
- result
- correlationId

## 7. Acceptance
- Approval comment không tự tạo Task.
- Replay event không tạo duplicate.
- Exact subject version được dùng.
- Failure có retry/dead-letter evidence.
