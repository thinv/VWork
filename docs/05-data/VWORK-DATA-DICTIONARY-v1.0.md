# VWork – Data Dictionary v1.0

**Mục tiêu:** Chuẩn hóa tên dữ liệu, kiểu logic, bắt buộc, unique/index, tenant scope và mô tả để dùng cho ERD, migration, API schema và test data.

## 1. Quy ước kiểu
- UUID: định danh 128-bit.
- STRING(n): chuỗi giới hạn.
- TEXT: chuỗi dài.
- BOOL.
- INT/BIGINT.
- DECIMAL(p,s).
- DATE/TIMESTAMP_TZ.
- JSON.
- ENUM.
- HASH: checksum/hash.
- REF: UUID foreign key.

Mọi bảng tenant-bound mặc định có: tenant_id, created_at, created_by, updated_at, updated_by, row_version nếu cần optimistic locking.

---

# 2. Core Identity Tables

## tenant
| Field | Type | Req | Rule |
|---|---|---:|---|
| tenant_id | UUID | Y | PK |
| code | STRING(64) | Y | unique platform |
| name | STRING(255) | Y | |
| status | ENUM | Y | ACTIVE/SUSPENDED/DISABLED |
| deployment_profile | ENUM | Y | SAAS/PRIVATE/ON_PREMISE |
| timezone | STRING(64) | Y | default Asia/Bangkok/Vietnam profile configurable |
| locale | STRING(16) | Y | vi-VN default |
| subscription_plan | STRING(64) | N | |
| storage_quota_bytes | BIGINT | N | |
| ai_quota_json | JSON | N | |
| settings_json | JSON | N | |

## organization_unit
organization_unit_id UUID PK; tenant_id REF; parent_id REF nullable; code STRING(64); name STRING(255); type STRING(64); status ENUM; path STRING(1024); depth INT; effective_from/to TIMESTAMP_TZ.

Index: (tenant_id,parent_id), unique(tenant_id,code).

## position
position_id; tenant_id; code; name; level INT; approval_rank INT; status.

## user_account
user_id UUID PK; username STRING(128); email STRING(255); phone STRING(32); display_name STRING(255); status ENUM; last_login_at.

## membership
membership_id; tenant_id; user_id; organization_unit_id; position_id; is_primary BOOL; status.
Unique tùy policy: tenant_id + user_id + organization_unit_id.

## role
role_id; tenant_id nullable; code; name; scope_type; status.

## permission
permission_id; code unique; resource; action.

## role_assignment
assignment_id; tenant_id; membership_id; role_id; data_scope_id; effective_from; effective_to; status.

## data_scope
scope_id; tenant_id; type ENUM; expression_json JSON; description.

## delegation
delegation_id; tenant_id; delegator_membership_id; delegate_membership_id; scope_json; start_at; end_at; status; reason.

## document_profile
profile_id; tenant_id; organization_unit_id nullable; supervising_agency; issuing_agency; symbol_prefix; locality; default_recipients JSON; version_no; effective_from/to; status.

## signatory_profile
signatory_profile_id; tenant_id; membership_id; title_text; signing_scope JSON; effective_from/to; status.

---

# 3. Document Tables

## document
document_id UUID PK; tenant_id; document_type; title; source_type; status; current_version_id; owner_membership_id; access_scope_id; retention_policy_id; created_at.

Indexes: tenant_id+status, tenant_id+document_type, full-text title.

## document_version
document_version_id; document_id; version_no INT; file_asset_id; content_hash HASH; mime_type; size_bytes; lifecycle_state; created_by; created_at; locked_at; submitted_at; final_at.
Unique(document_id,version_no).

## file_asset
file_asset_id; tenant_id; storage_provider; storage_key; checksum; original_filename; mime_type; size_bytes; malware_status; encryption_key_ref; created_at.
Unique(tenant_id,storage_key); index checksum.

## document_metadata
metadata_id; document_version_id; field_code; value_json; source ENUM(USER/AI/OCR/IMPORT); confidence DECIMAL(5,4); verified BOOL.
Index document_version_id+field_code.

## document_relation
relation_id; tenant_id; from_document_id; to_document_id; relation_type; note.

## export_package
package_id; tenant_id; name; status; created_by; output_asset_id; created_at.

## export_package_item
package_item_id; package_id; document_version_id; sequence_no; output_format.

---

# 4. Intelligence Tables

## extraction_run
extraction_run_id; tenant_id; document_version_id; pipeline_version; status; started_at; completed_at; confidence_summary JSON; ai_job_id.

## classification
classification_id; extraction_run_id; taxonomy_type; value_code; confidence; verified_by.

## extracted_field
extracted_field_id; extraction_run_id; field_code; value_json; grounding_type ENUM(FACT/INFERENCE/MISSING); confidence; verification_status.

## provenance
provenance_id; tenant_id; source_type; document_version_id; page_no; section_ref; paragraph_ref; sheet_name; cell_ref; audio_asset_id; start_ms; end_ms; excerpt_hash; confidence.

## extracted_field_provenance
extracted_field_id; provenance_id; rank; PK composite.

## ocr_page
ocr_page_id; extraction_run_id; page_no; text TEXT; layout_json JSON; confidence; status.
Unique(extraction_run_id,page_no).

## verification_record
verification_id; tenant_id; subject_type; subject_id; decision; old_value JSON; new_value JSON; verified_by; verified_at.

---

# 5. Draft/Review Tables

## draft
draft_id; tenant_id; work_case_id; document_type; draft_mode; status; current_version_id; created_by.

## draft_version
draft_version_id; draft_id; version_no; content_json; rendered_asset_id; context_snapshot_id; template_version_id; created_by; created_at; locked_at.
Unique(draft_id,version_no).

## draft_context_snapshot
context_snapshot_id; tenant_id; instruction TEXT; source_refs_json; work_case_snapshot_ref; missing_items_json; policy_version.

## ai_job
ai_job_id; tenant_id; use_case_code; input_snapshot_ref; output_ref; status; platform_job_id.

## ai_output
ai_output_id; ai_job_id; output_type; content_json; grounding_summary JSON; usage_record_id.

## review_run
review_run_id; tenant_id; subject_type; subject_version_id; policy_version; status; quality_score DECIMAL(5,2); created_by.

## review_finding
finding_id; review_run_id; category; severity ENUM(INFO/WARNING/ERROR/BLOCKER); message TEXT; suggestion TEXT; status; provenance_id; rule_code.

## rewrite_operation
rewrite_id; tenant_id; draft_version_id; scope_type; selection_ref; instruction; source_text_hash; result_text; accepted BOOL.

## document_package
document_package_id; tenant_id; work_case_id; context_snapshot_id; status.

## document_package_item
item_id; package_id; draft_id; role_code; sequence_no.

---

# 6. Incoming/Work Tables

## incoming_record
incoming_record_id; tenant_id; document_id; registration_no; received_at; source_agency; urgency; confidentiality; status; work_case_id.
Unique(tenant_id,registration_no) theo policy.

## incoming_requirement
incoming_requirement_id; incoming_record_id; description; required_output; deadline; suggested_unit_id; suggested_owner_id; grounding_type; confidence; provenance_id; verification_status.

## handling_suggestion
suggestion_id; incoming_record_id; suggestion_type; content; confidence; status.

## assignment_suggestion
assignment_suggestion_id; incoming_requirement_id; target_type; target_id; score; rationale; status.

## work_case
work_case_id; tenant_id; code; title; description; domain_code; priority; status; owner_unit_id; owner_membership_id; start_at; due_at; completed_at; source_type; source_id; access_scope_id.
Unique(tenant_id,code).

## work_case_relation
relation_id; work_case_id; related_type; related_id; relation_type.

## task
task_id; tenant_id; work_case_id; parent_task_id; title; description; owner_unit_id; owner_membership_id; assigned_by; priority; required_output; due_at; status; progress_percent; blocker_text; blocking_flag; completed_at.
Indexes tenant+owner+status; tenant+due_at.

## task_assignment
assignment_id; task_id; from_owner; to_owner; assigned_by; reason; assigned_at.

## task_evidence
evidence_id; task_id; evidence_type; document_id; file_asset_id; external_url; note; submitted_by; submitted_at.

## task_comment
comment_id; task_id; author_id; body; visibility; created_at.

## task_status_history
history_id; task_id; from_status; to_status; reason; changed_by; changed_at.

## reminder
reminder_id; tenant_id; subject_type; subject_id; schedule_at; status; channel_policy JSON.

## escalation
escalation_id; tenant_id; subject_type; subject_id; policy_id; level; triggered_at; target_id; status.

---

# 7. Workflow Tables

## workflow_definition
workflow_definition_id; tenant_id; code; name; subject_type; status; current_version_id.
Unique(tenant_id,code).

## workflow_version
workflow_version_id; workflow_definition_id; version_no; definition_json; status; published_at.
Unique(definition,version_no).

## workflow_step
step_id; workflow_version_id; code; name; actor_rule JSON; condition_expr; sla_minutes; allowed_actions JSON.

## workflow_instance
workflow_instance_id; tenant_id; workflow_version_id; subject_type; subject_id; subject_version_id; current_step_code; status; started_by; started_at; completed_at.

## workflow_transition
transition_id; instance_id; from_step; to_step; action; actor_id; comment; occurred_at.

## approval_item
approval_item_id; instance_id; step_code; assignee_membership_id; status; due_at; submitted_version_id.

## approval_action
approval_action_id; approval_item_id; action; actor_id; comment; acted_at.

## sla_clock
sla_clock_id; approval_item_id; started_at; paused_duration_ms; due_at; breached_at.

---

# 8. Meeting Tables

meeting(meeting_id,tenant_id,title,work_case_id,scheduled_start,scheduled_end,location,chair_membership_id,secretary_membership_id,status)

participant(participant_id,meeting_id,membership_id,external_name,role,attendance_status)

agenda_item(agenda_item_id,meeting_id,sequence_no,title,description)

audio_asset(audio_asset_id,meeting_id,file_asset_id,duration_ms,status)

transcript(transcript_id,meeting_id,audio_asset_id,status,language,version_no)

transcript_segment(segment_id,transcript_id,sequence_no,start_ms,end_ms,speaker_ref,text,confidence,verified)

meeting_decision(decision_id,meeting_id,text,status,owner_ref,due_at,provenance_id)

meeting_task_candidate(candidate_id,decision_id,title,owner_ref,due_at,status,task_id)

minutes(minutes_id,meeting_id,document_id,draft_id,version_no,status)

---

# 9. Reporting Tables

reporting_cycle(reporting_cycle_id,tenant_id,code,name,period_start,period_end,due_at,status,current_schema_version_id)

reporting_obligation(obligation_id,reporting_cycle_id,organization_unit_id,external_unit,required,due_at,status)

report_submission(submission_id,reporting_cycle_id,obligation_id,submitter,document_id,version_no,status,submitted_at)

metric_schema(metric_schema_id,tenant_id,reporting_cycle_id,code,name,current_version_id)

metric_schema_version(metric_schema_version_id,metric_schema_id,version_no,status,approved_by,approved_at,locked_at)

metric_definition(metric_definition_id,schema_version_id,code,name,datatype,unit,aggregation_rule,required,sequence_no)

extracted_metric_value(extracted_value_id,submission_id,metric_definition_id,value_json,validation_status,provenance_id,confidence)

data_quality_finding(finding_id,reporting_cycle_id,submission_id,metric_definition_id,type,severity,message,status)

reconciliation_run(reconciliation_run_id,reporting_cycle_id,rule_version,status,result_summary JSON)

aggregation_result(aggregation_result_id,reporting_cycle_id,schema_version_id,metric_definition_id,group_key,value_json,computed_at)

report_draft(report_draft_id,reporting_cycle_id,draft_id,dataset_snapshot_ref,status)

---

# 10. Template/Knowledge Tables

template(template_id,tenant_id,scope,name,taxonomy_id,status,current_version_id)

template_version(template_version_id,template_id,version_no,source_document_version_id,structure_json,style_json,status,published_at)

template_field(template_field_id,template_version_id,code,label,datatype,required,binding_rule)

taxonomy(taxonomy_id,tenant_id,taxonomy_type,code,name,parent_id)

knowledge_source(knowledge_source_id,tenant_id,name,source_type,access_scope_id,status,current_version_id)

knowledge_version(knowledge_version_id,knowledge_source_id,version_no,document_version_id,checksum,status,indexed_at)

chunk(chunk_id,knowledge_version_id,sequence_no,text,metadata_json,access_scope_id)

index_record(index_record_id,chunk_id,index_type,provider,vector_ref,search_ref,status)

citation(citation_id,tenant_id,answer_ref,provenance_id,rank,relevance_score)

---

# 11. Executive/Assistant Tables

executive_brief(brief_id,tenant_id,target_membership_id,type,period_start,period_end,status,generated_at)

brief_item(brief_item_id,brief_id,category,priority,title,summary,source_type,source_id,citation_refs JSON)

signal(signal_id,tenant_id,type,severity,subject_type,subject_id,rationale,rule_code,status,generated_at)

assistant_conversation(conversation_id,tenant_id,owner_membership_id,context_type,context_id,title,status)

assistant_message(message_id,conversation_id,role,content,ai_job_id,created_at)

---

# 12. Governance/Platform Tables

audit_event(audit_event_id,tenant_id,actor_id,action,object_type,object_id,correlation_id,result,metadata_json,occurred_at)

ai_provider(provider_id,code,name,status,config_ref)

ai_model(model_id,provider_id,code,capabilities JSON,status,cost_profile JSON)

prompt_template(prompt_template_id,code,use_case_code,status,current_version_id)

prompt_version(prompt_version_id,prompt_template_id,version_no,content_ref,policy_ref,status)

evaluation_dataset(dataset_id,use_case_code,version,status)

evaluation_run(evaluation_run_id,dataset_id,model_id,prompt_version_id,metrics_json,status)

usage_record(usage_record_id,tenant_id,ai_job_id,provider_id,model_id,input_units,output_units,cost_proxy,latency_ms)

integration_adapter(adapter_id,tenant_id,type,code,version,status,config_ref)

integration_credential_ref(credential_ref_id,adapter_id,secret_ref,status)

job(job_id,tenant_id,type,correlation_id,idempotency_key,status,progress,attempt_count,next_retry_at,created_at,completed_at)

job_attempt(attempt_id,job_id,attempt_no,started_at,ended_at,result,error_code,error_detail_ref)

notification(notification_id,tenant_id,recipient_id,type,title,body_safe,object_ref,status,created_at,read_at)

retention_policy(retention_policy_id,tenant_id,object_type,retain_days,archive_rule,delete_rule)

traceability_link(link_id,from_type,from_id,to_type,to_id,relation,source)

---

# 13. Common Enumerations

DocumentStatus: DRAFT, PROCESSING, READY, REVIEW_REQUIRED, APPROVAL, FINAL, ARCHIVED, FAILED, QUARANTINED.

TaskStatus: DRAFT, ASSIGNED, ACCEPTED, IN_PROGRESS, WAITING, REVIEW, COMPLETED, CANCELLED.

WorkflowStatus: CREATED, RUNNING, WAITING, COMPLETED, REJECTED, CANCELLED, FAILED.

JobStatus: QUEUED, RUNNING, RETRYING, SUCCEEDED, FAILED, CANCELLED, DEAD_LETTER.

FindingSeverity: INFO, WARNING, ERROR, BLOCKER.

GroundingType: FACT, INFERENCE, MISSING.

LifecycleStatus: DRAFT, PUBLISHED, DEPRECATED, ARCHIVED.

Priority: LOW, NORMAL, HIGH, URGENT.

---

# 14. Indexing Guidelines

Bắt buộc index:
- mọi FK thường query.
- tenant_id + status.
- tenant_id + created_at.
- task(owner,status,due_at).
- approval(assignee,status,due_at).
- document(type,status).
- reporting obligation(cycle,status).
- audit(tenant,occurred_at), correlation_id.
- job(tenant,status,created_at).

Search engine dùng cho full-text/semantic; không ép DB quan hệ xử lý toàn bộ search.

---

# 15. Data Classification

- PUBLIC: metadata công khai được cấu hình.
- INTERNAL: tài liệu/công việc thông thường.
- CONFIDENTIAL: hồ sơ giới hạn.
- RESTRICTED: dữ liệu đặc biệt nhạy cảm/secret.

Mỗi object có thể kế thừa classification từ Work Case/Document hoặc override theo rule.

---

# 16. Delete/Retention

- Hard delete không phải default.
- Dữ liệu business dùng archive/soft delete nếu policy cho phép.
- Audit không xóa theo thao tác người dùng thông thường.
- File asset physical delete chỉ sau retention + reference check.
- Vector/search index phải purge đồng bộ khi source được purge hợp lệ.
