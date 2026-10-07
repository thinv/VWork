# VWork – Domain Model v1.0

**Phạm vi:** VWork Core v1  
**Nguồn:** SRS v1.0, FR-001..124, NFR-001..094, BRULE-001..110  
**Mục tiêu:** Xác định bounded context, aggregate, entity, value object, domain event và quan hệ nghiệp vụ làm baseline cho Database Design, API, Service và Screen.

---

# 1. Nguyên tắc Domain Model

1. Multi-tenant by design.
2. Aggregate boundary rõ để kiểm soát transaction.
3. Entity có ID ổn định; versioned entity không overwrite bản đã khóa.
4. Business invariant nằm tại domain/service, không dồn vào UI.
5. Audit/event được phát ra tại state-changing command.
6. AI output là dữ liệu có trạng thái/nguồn, không đồng nhất với dữ liệu authoritative.
7. Các relation xuyên domain ưu tiên ID/reference, tránh coupling object graph quá sâu.
8. Eventual consistency được phép ở Search, RAG, notification, analytics; approval/task state phải strong consistency trong aggregate.

---

# 2. Bounded Context

| BC | Tên | Aggregate chính |
|---|---|---|
| BC-01 | Identity & Organization | Tenant, User, Role, Delegation |
| BC-02 | Document | Document, FileAsset, ExportPackage |
| BC-03 | Document Intelligence | ExtractionRun |
| BC-04 | Draft & Review | Draft, ReviewRun, DocumentPackage |
| BC-05 | Incoming | IncomingRecord |
| BC-06 | Work Management | WorkCase, Task |
| BC-07 | Workflow | WorkflowDefinition, WorkflowInstance |
| BC-08 | Meeting | Meeting |
| BC-09 | Reporting | ReportingCycle, MetricSchema |
| BC-10 | Template & Knowledge | Template, KnowledgeSource |
| BC-11 | Executive & Assistant | ExecutiveBrief, Signal, AssistantConversation |
| BC-12 | Governance & Platform | AuditEvent, AIProvider, Job, IntegrationAdapter |

---

# 3. BC-01 Identity & Organization

## DM-001 Tenant
**Aggregate Root.** Đại diện một khách hàng/đơn vị thuê VWork.

Thuộc tính chính:
- tenant_id
- code
- name
- status
- deployment_profile: SAAS/PRIVATE/ON_PREMISE
- timezone
- locale
- subscription_plan
- storage_quota
- ai_quota
- settings_json
- created_at/updated_at

Invariant:
- code unique toàn platform.
- tenant disabled không cho business session mới.

## DM-002 OrganizationUnit
Entity cây cơ cấu tổ chức.
- organization_unit_id
- tenant_id
- parent_id
- code
- name
- type
- status
- path/depth
- effective_from/to

## DM-003 Position
Chức danh.
- position_id
- tenant_id
- code
- name
- level
- approval_rank

## DM-004 User
Identity dùng chung platform.
- user_id
- username/email/phone
- display_name
- status
- last_login_at

## DM-005 Membership
Quan hệ User ↔ Tenant/Organization.
- membership_id
- tenant_id
- user_id
- organization_unit_id
- position_id
- is_primary
- status

## DM-006 Role
Role nghiệp vụ/configurable.
- role_id
- tenant_id nullable cho system role
- code
- name
- scope_type
- status

## DM-007 Permission
Permission atom.
- permission_id
- code
- resource
- action

## DM-008 RoleAssignment
- assignment_id
- tenant_id
- membership_id
- role_id
- data_scope_id
- effective_from/to

## DM-009 DataScope
Value/Entity mô tả phạm vi dữ liệu.
- scope_id
- tenant_id
- type: SELF/UNIT/SUBTREE/TENANT/OBJECT_SET/CUSTOM
- expression_json

## DM-010 Delegation
Aggregate nhỏ cho ủy quyền.
- delegation_id
- tenant_id
- delegator_membership_id
- delegate_membership_id
- scope_json
- start_at/end_at
- status
- reason

## DM-011 DocumentProfile
Cấu hình thể thức mặc định.
- profile_id
- tenant_id
- organization_unit_id nullable
- supervising_agency
- issuing_agency
- symbol_prefix
- locality
- default_recipients
- version/effective dates

## DM-012 SignatoryProfile
- signatory_profile_id
- tenant_id
- membership_id
- title_text
- signing_scope
- effective_from/to
- status

Domain Events:
TenantCreated, MembershipDisabled, RoleAssigned, DelegationCreated, DocumentProfileChanged.

---

# 4. BC-02 Document

## DM-013 Document
**Aggregate Root.**
- document_id
- tenant_id
- document_type
- title
- source_type
- status
- current_version_id
- owner_membership_id
- access_scope_id
- retention_policy_id
- created_at

Invariant:
- document_id bất biến.
- current_version phải thuộc document.

## DM-014 DocumentVersion
- document_version_id
- document_id
- version_no
- file_asset_id
- content_hash
- mime_type
- size_bytes
- lifecycle_state
- created_by
- created_at
- locked_at
- submitted_at
- final_at

## DM-015 FileAsset
- file_asset_id
- tenant_id
- storage_provider
- storage_key
- checksum
- original_filename
- mime_type
- size_bytes
- malware_status
- encryption_key_ref
- created_at

## DM-016 DocumentMetadata
Key/value hoặc typed fields:
- metadata_id
- document_version_id
- field_code
- value_json
- source
- confidence
- verified

## DM-017 DocumentRelation
- relation_id
- tenant_id
- from_document_id
- to_document_id
- relation_type: REFERENCES/REPLIES_TO/ATTACHMENT_OF/SUPERSEDES/RELATED
- note

## DM-018 ExportPackage
Aggregate cho tải bộ.
- package_id
- tenant_id
- name
- status
- created_by
- output_asset_id

## DM-019 ExportPackageItem
- package_item_id
- package_id
- document_version_id
- sequence_no
- output_format

Events:
DocumentCreated, VersionCreated, VersionLocked, DocumentArchived, PackageGenerated.

---

# 5. BC-03 Document Intelligence

## DM-020 ExtractionRun
**Aggregate Root.**
- extraction_run_id
- tenant_id
- document_version_id
- pipeline_version
- status
- started_at/completed_at
- confidence_summary
- ai_job_id

## DM-021 Classification
- classification_id
- extraction_run_id
- taxonomy_type
- value_code
- confidence
- verified_by

## DM-022 ExtractedField
- extracted_field_id
- extraction_run_id
- field_code
- value_json
- grounding_type: FACT/INFERENCE/MISSING
- confidence
- verification_status

## DM-023 Provenance
- provenance_id
- tenant_id
- source_type: DOCUMENT/AUDIO/TABLE/USER
- document_version_id nullable
- page_no
- section_ref
- paragraph_ref
- sheet_name
- cell_ref
- audio_asset_id
- start_ms/end_ms
- excerpt_hash
- confidence

## DM-024 ExtractedFieldProvenance
N:N field ↔ provenance.

## DM-025 OCRPage
- ocr_page_id
- extraction_run_id
- page_no
- text
- layout_json
- confidence
- status

## DM-026 VerificationRecord
- verification_id
- tenant_id
- subject_type
- subject_id
- decision: VERIFIED/CORRECTED/REJECTED
- old_value/new_value
- verified_by
- verified_at

Events:
ExtractionCompleted, LowConfidenceDetected, FieldVerified, ConflictDetected.

---

# 6. BC-04 Draft & Review

## DM-027 Draft
**Aggregate Root.**
- draft_id
- tenant_id
- work_case_id nullable
- document_type
- draft_mode
- status
- current_version_id
- created_by

## DM-028 DraftVersion
- draft_version_id
- draft_id
- version_no
- content_json/html
- rendered_asset_id nullable
- context_snapshot_id
- template_version_id nullable
- created_by
- created_at
- locked_at

## DM-029 DraftContextSnapshot
- context_snapshot_id
- tenant_id
- instruction
- source_refs_json
- work_case_snapshot_ref
- missing_items_json
- policy_version

## DM-030 AIJob
Reference sang platform Job nhưng giữ business use-case metadata:
- ai_job_id
- tenant_id
- use_case_code
- input_snapshot_ref
- output_ref
- status

## DM-031 AIOutput
- ai_output_id
- ai_job_id
- output_type
- content_json
- grounding_summary
- usage_record_id

## DM-032 ReviewRun
**Aggregate Root.**
- review_run_id
- tenant_id
- subject_type
- subject_version_id
- policy_version
- status
- quality_score
- created_by

## DM-033 ReviewFinding
- finding_id
- review_run_id
- category
- severity
- message
- suggestion
- status: OPEN/ACCEPTED/REJECTED/OVERRIDDEN/RESOLVED
- provenance_id nullable
- rule_code nullable

## DM-034 RewriteOperation
- rewrite_id
- tenant_id
- draft_version_id
- scope_type
- selection_ref
- instruction
- source_text_hash
- result_text
- accepted

## DM-035 DocumentPackage
- document_package_id
- tenant_id
- work_case_id nullable
- context_snapshot_id
- status

## DM-036 DocumentPackageItem
- item_id
- package_id
- draft_id
- role_code
- sequence_no

Events:
DraftGenerated, ReviewCompleted, FindingOverridden, DraftSubmitted.

---

# 7. BC-05 Incoming

## DM-037 IncomingRecord
**Aggregate Root.**
- incoming_record_id
- tenant_id
- document_id
- registration_no
- received_at
- source_agency
- urgency
- confidentiality
- status
- work_case_id nullable

## DM-038 IncomingRequirement
- incoming_requirement_id
- incoming_record_id
- description
- required_output
- deadline
- suggested_unit_id
- suggested_owner_id
- grounding_type
- confidence
- provenance_id
- verification_status

## DM-039 HandlingSuggestion
- suggestion_id
- incoming_record_id
- suggestion_type
- content
- confidence
- status

## DM-040 AssignmentSuggestion
- assignment_suggestion_id
- incoming_requirement_id
- target_type
- target_id
- score
- rationale
- status

Events:
IncomingRegistered, RequirementVerified, IncomingConvertedToCase.

---

# 8. BC-06 Work Management

## DM-041 WorkCase
**Aggregate Root.**
- work_case_id
- tenant_id
- code
- title
- description
- domain_code
- priority
- status
- owner_unit_id
- owner_membership_id
- start_at/due_at/completed_at
- source_type/source_id
- access_scope_id

## DM-042 WorkCaseRelation
Liên kết document/meeting/report/case khác.

## DM-043 Task
**Aggregate Root.**
- task_id
- tenant_id
- work_case_id
- parent_task_id nullable
- title
- description
- owner_unit_id
- owner_membership_id
- assigned_by
- priority
- required_output
- due_at
- status
- progress_percent
- blocker_text
- blocking_flag
- completed_at

## DM-044 TaskAssignment
Lịch sử giao/bàn giao.
- assignment_id
- task_id
- from_owner/to_owner
- assigned_by
- reason
- assigned_at

## DM-045 TaskEvidence
- evidence_id
- task_id
- evidence_type
- document_id/file_asset_id/url
- note
- submitted_by

## DM-046 TaskComment
- comment_id
- task_id
- author_id
- body
- visibility
- created_at

## DM-047 TaskStatusHistory
- history_id
- task_id
- from_status/to_status
- reason
- changed_by
- changed_at

## DM-048 Reminder
- reminder_id
- tenant_id
- subject_type/id
- schedule_at
- status
- channel_policy

## DM-049 Escalation
- escalation_id
- tenant_id
- subject_type/id
- policy_id
- level
- triggered_at
- target_id
- status

Events:
WorkCaseCreated, TaskAssigned, TaskOverdue, TaskCompleted, CaseCompleted.

---

# 9. BC-07 Workflow

## DM-050 WorkflowDefinition
**Aggregate Root.**
- workflow_definition_id
- tenant_id
- code
- name
- subject_type
- status
- current_version_id

## DM-051 WorkflowVersion
- workflow_version_id
- workflow_definition_id
- version_no
- definition_json
- status
- published_at

## DM-052 WorkflowStep
Logical projection từ definition.
- step_id
- workflow_version_id
- code
- name
- actor_rule
- condition_expr
- sla_minutes
- allowed_actions

## DM-053 WorkflowInstance
**Aggregate Root.**
- workflow_instance_id
- tenant_id
- workflow_version_id
- subject_type
- subject_id
- subject_version_id
- current_step_code
- status
- started_by/started_at/completed_at

## DM-054 WorkflowTransition
- transition_id
- instance_id
- from_step/to_step
- action
- actor_id
- comment
- occurred_at

## DM-055 ApprovalItem
- approval_item_id
- instance_id
- step_code
- assignee_membership_id
- status
- due_at
- submitted_version_id

## DM-056 ApprovalAction
- approval_action_id
- approval_item_id
- action
- actor_id
- comment
- acted_at

## DM-057 SLAClock
- sla_clock_id
- instance_id/approval_item_id
- started_at
- paused_duration
- due_at
- breached_at

Events:
WorkflowStarted, ApprovalRequested, ApprovalReturned, ApprovalApproved, SLABreached.

---

# 10. BC-08 Meeting

## DM-058 Meeting
**Aggregate Root.**
- meeting_id
- tenant_id
- title
- work_case_id nullable
- scheduled_start/end
- location
- chair_membership_id
- secretary_membership_id
- status

## DM-059 Participant
- participant_id
- meeting_id
- membership_id/external_name
- role
- attendance_status

## DM-060 AgendaItem
- agenda_item_id
- meeting_id
- sequence_no
- title
- description

## DM-061 AudioAsset
- audio_asset_id
- meeting_id
- file_asset_id
- duration_ms
- status

## DM-062 Transcript
- transcript_id
- meeting_id
- audio_asset_id
- status
- language
- version_no

## DM-063 TranscriptSegment
- segment_id
- transcript_id
- sequence_no
- start_ms/end_ms
- speaker_ref
- text
- confidence
- verified

## DM-064 MeetingDecision
- decision_id
- meeting_id
- text
- status: CANDIDATE/CONFIRMED/REJECTED
- owner_ref
- due_at
- provenance_id

## DM-065 MeetingTaskCandidate
- candidate_id
- decision_id
- title
- owner_ref
- due_at
- status
- task_id nullable

## DM-066 Minutes
- minutes_id
- meeting_id
- document_id/draft_id
- version_no
- status

Events:
TranscriptCompleted, DecisionConfirmed, MeetingTaskCreated, MinutesSubmitted.

---

# 11. BC-09 Reporting

## DM-067 ReportingCycle
**Aggregate Root.**
- reporting_cycle_id
- tenant_id
- code
- name
- period_start/end
- due_at
- status
- current_schema_version_id

## DM-068 ReportingObligation
- obligation_id
- reporting_cycle_id
- organization_unit_id/external_unit
- required
- due_at
- status

## DM-069 ReportSubmission
- submission_id
- reporting_cycle_id
- obligation_id
- submitter
- document_id
- version_no
- status
- submitted_at

## DM-070 MetricSchema
**Aggregate Root.**
- metric_schema_id
- tenant_id
- reporting_cycle_id nullable
- code
- name
- current_version_id

## DM-071 MetricSchemaVersion
- metric_schema_version_id
- metric_schema_id
- version_no
- status
- approved_by/approved_at
- locked_at

## DM-072 MetricDefinition
- metric_definition_id
- schema_version_id
- code
- name
- datatype
- unit
- aggregation_rule
- required
- sequence_no

## DM-073 ExtractedMetricValue
- extracted_value_id
- submission_id
- metric_definition_id
- value_json
- validation_status
- provenance_id
- confidence

## DM-074 DataQualityFinding
- finding_id
- reporting_cycle_id
- submission_id nullable
- metric_definition_id nullable
- type
- severity
- message
- status

## DM-075 ReconciliationRun
- reconciliation_run_id
- reporting_cycle_id
- rule_version
- status
- result_summary

## DM-076 AggregationResult
- aggregation_result_id
- reporting_cycle_id
- schema_version_id
- metric_definition_id
- group_key
- value_json
- computed_at

## DM-077 ReportDraft
- report_draft_id
- reporting_cycle_id
- draft_id
- dataset_snapshot_ref
- status

Events:
SubmissionReceived, SchemaApproved, QualityBlocked, AggregationCompleted, ReportGenerated.

---

# 12. BC-10 Template & Knowledge

## DM-078 Template
**Aggregate Root.**
- template_id
- tenant_id nullable cho system
- scope
- name
- taxonomy_id
- status
- current_version_id

## DM-079 TemplateVersion
- template_version_id
- template_id
- version_no
- source_document_version_id
- structure_json
- style_json
- status
- published_at

## DM-080 TemplateField
- template_field_id
- template_version_id
- code
- label
- datatype
- required
- binding_rule

## DM-081 Taxonomy
- taxonomy_id
- tenant_id nullable
- taxonomy_type
- code
- name
- parent_id

## DM-082 KnowledgeSource
**Aggregate Root.**
- knowledge_source_id
- tenant_id
- name
- source_type
- access_scope_id
- status
- current_version_id

## DM-083 KnowledgeVersion
- knowledge_version_id
- knowledge_source_id
- version_no
- document_version_id
- checksum
- status
- indexed_at

## DM-084 Chunk
- chunk_id
- knowledge_version_id
- sequence_no
- text
- metadata_json
- access_scope_id

## DM-085 IndexRecord
- index_record_id
- chunk_id
- index_type
- provider
- vector_ref/search_ref
- status

## DM-086 Citation
- citation_id
- tenant_id
- answer_ref
- provenance_id
- rank
- relevance_score

Events:
TemplatePublished, KnowledgePublished, ReindexRequested, KnowledgeArchived.

---

# 13. BC-11 Executive & Assistant

## DM-087 ExecutiveBrief
**Aggregate Root.**
- brief_id
- tenant_id
- target_membership_id
- type: DAILY/WEEKLY/ADHOC
- period_start/end
- status
- generated_at

## DM-088 BriefItem
- brief_item_id
- brief_id
- category
- priority
- title
- summary
- source_type/id
- citation_refs

## DM-089 Signal
- signal_id
- tenant_id
- type
- severity
- subject_type/id
- rationale
- rule_code
- status
- generated_at

## DM-090 AssistantConversation
**Aggregate Root.**
- conversation_id
- tenant_id
- owner_membership_id
- context_type/id
- title
- status

## DM-091 AssistantMessage
- message_id
- conversation_id
- role
- content
- ai_job_id nullable
- created_at

Events:
BriefGenerated, SignalRaised, AssistantAnswered.

---

# 14. BC-12 Governance & Platform

## DM-092 AuditEvent
Append-only record.
- audit_event_id
- tenant_id nullable
- actor_id
- action
- object_type/id
- correlation_id
- result
- metadata_json
- occurred_at

## DM-093 AIProvider
- provider_id
- code
- name
- status
- config_ref

## DM-094 AIModel
- model_id
- provider_id
- code
- capabilities
- status
- cost_profile

## DM-095 PromptTemplate
- prompt_template_id
- code
- use_case_code
- status
- current_version_id

## DM-096 PromptVersion
- prompt_version_id
- prompt_template_id
- version_no
- content_ref
- policy_ref
- status

## DM-097 EvaluationDataset
- dataset_id
- use_case_code
- version
- status

## DM-098 EvaluationRun
- evaluation_run_id
- dataset_id
- model_id
- prompt_version_id
- metrics_json
- status

## DM-099 UsageRecord
- usage_record_id
- tenant_id
- ai_job_id
- provider_id/model_id
- input_units/output_units
- cost_proxy
- latency_ms

## DM-100 IntegrationAdapter
- adapter_id
- tenant_id nullable
- type
- code
- version
- status
- config_ref

## DM-101 IntegrationCredentialRef
Chỉ lưu reference tới secret manager.

## DM-102 Job
**Aggregate Root.**
- job_id
- tenant_id
- type
- correlation_id
- idempotency_key
- status
- progress
- attempt_count
- next_retry_at
- created_at/completed_at

## DM-103 JobAttempt
- attempt_id
- job_id
- attempt_no
- started_at/ended_at
- result
- error_code
- error_detail_ref

## DM-104 Notification
- notification_id
- tenant_id
- recipient_id
- type
- title/body_safe
- object_ref
- status
- created_at/read_at

## DM-105 RetentionPolicy
- retention_policy_id
- tenant_id
- object_type
- retain_days
- archive_rule
- delete_rule

## DM-106 TraceabilityLink
- link_id
- from_type/from_id
- to_type/to_id
- relation
- source

---

# 15. Aggregate Transaction Boundaries

Strong consistency trong cùng aggregate:
- Document + Version lock.
- Task + status + assignment.
- WorkflowInstance + transition + approval action.
- ReportingCycle + schema approval gate.
- Meeting + decision confirmation.
- Template + version publish.

Eventual consistency:
- Search index.
- Vector index.
- Executive Inbox materialized view.
- Notifications.
- Analytics/usage dashboard.
- AI evaluation aggregation.

---

# 16. Domain Event Catalog sơ bộ

| Event | Producer | Consumer điển hình |
|---|---|---|
| DocumentCreated | Document | Intelligence, Search, Audit |
| ExtractionCompleted | Intelligence | Incoming, UI, Search |
| IncomingConvertedToCase | Incoming | Work |
| TaskAssigned | Work | Notification, Inbox |
| TaskOverdue | Work | Signal, Notification |
| WorkflowStarted | Workflow | Inbox |
| ApprovalApproved | Workflow | Work/Document |
| TranscriptCompleted | Meeting | AI extraction |
| DecisionConfirmed | Meeting | Work |
| SchemaApproved | Reporting | Extraction |
| AggregationCompleted | Reporting | Draft AI |
| KnowledgePublished | Knowledge | Index/RAG |
| BriefGenerated | Executive | Notification |
| JobFailed | Platform | Ops/Alert |

---

# 17. Traceability

Mỗi aggregate phải map sang:
- FR tương ứng;
- API resource;
- DB table;
- Screen;
- Test.

Ví dụ:
Task → FR-052..060 → /tasks → task tables → WEB-WRK/MOB-WRK → TC-TASK-*.
