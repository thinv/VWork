# VWork – Database Design v1.0

**Phạm vi:** Physical database design cho VWork Core v1  
**Nguồn:** Domain Model, Data Dictionary, ERD, SRS  
**CSDL tham chiếu:** PostgreSQL 16+; các engine tương đương được phép nếu giữ nguyên invariant.

---

# 1. Mục tiêu thiết kế

- Bảo đảm tenant isolation ở cấp dữ liệu.
- Bảo toàn version/audit/provenance.
- Hỗ trợ transaction mạnh cho Document, Task, Workflow, Reporting.
- Hỗ trợ scale theo số tenant, số tài liệu, audit và job.
- Cho phép SaaS, Private, On-Premise từ cùng logical schema.
- Không khóa logic nghiệp vụ vào JSON nếu dữ liệu cần query/đối soát.

---

# 2. Naming Convention

- Table: snake_case, số ít hoặc danh từ tập thể nhất quán; baseline dùng snake_case số ít.
- PK: <entity>_id.
- FK: giữ đúng tên PK tham chiếu.
- Timestamp: *_at, kiểu timestamptz.
- Boolean: is_*, has_* hoặc tên trạng thái rõ.
- Enum DB: ưu tiên lookup/check constraint hoặc text + check; tránh enum DB khó migration nếu domain thay đổi nhiều.
- Version: version_no integer bắt đầu từ 1.
- Optimistic locking: row_version bigint tăng dần.

---

# 3. ID Strategy

Đề xuất UUIDv7 hoặc ULID cho entity tạo mới nhằm:
- phân tán tốt hơn UUIDv4 nhưng vẫn có locality theo thời gian;
- tránh lộ sequence;
- phù hợp multi-node.

Không dùng serial/bigserial làm business identifier.

Business code như work_case.code hoặc reporting_cycle.code được sinh riêng, có unique theo tenant.

---

# 4. Tenant Isolation

Mọi bảng tenant-bound có tenant_id NOT NULL.

Defense-in-depth:
1. Service authorization.
2. Repository bắt buộc tenant predicate.
3. Composite FK có tenant_id ở các relation nhạy cảm khi khả thi.
4. PostgreSQL RLS có thể bật cho SaaS shared DB.
5. Test cross-tenant bắt buộc.

Ví dụ policy logic:
- current_setting('app.tenant_id') = tenant_id.
- Worker phải set tenant context trước query.

Không xem RLS là thay thế cho application authorization.

---

# 5. Schema Layout

Khuyến nghị một database, nhiều schema logic:

- iam
- org
- doc
- intel
- draft
- work
- workflow
- meeting
- reporting
- knowledge
- executive
- platform

Nếu ORM/tooling gây phức tạp, có thể dùng public schema với prefix table; boundary ứng dụng vẫn giữ nguyên.

---

# 6. Core Table DDL Guidance

## 6.1 document

Các cột:
- document_id uuid PK
- tenant_id uuid NOT NULL
- document_type varchar(64)
- title varchar(500) NOT NULL
- source_type varchar(64)
- status varchar(32) NOT NULL
- current_version_id uuid NULL
- owner_membership_id uuid NULL
- access_scope_id uuid NULL
- retention_policy_id uuid NULL
- created_at timestamptz NOT NULL
- created_by uuid NULL
- updated_at timestamptz NOT NULL
- updated_by uuid NULL
- row_version bigint NOT NULL default 1

Index:
- idx_document_tenant_status(tenant_id,status)
- idx_document_tenant_type(tenant_id,document_type)
- idx_document_tenant_created(tenant_id,created_at desc)
- search title qua search engine; DB trigram optional.

Constraint:
- current_version_id phải thuộc cùng document; enforce application + deferred trigger nếu cần.

## 6.2 document_version

- unique(document_id,version_no)
- immutable khi lifecycle_state ∈ SUBMITTED/FINAL
- content_hash not null khi upload complete
- file_asset_id not null với version có binary source.

Không update nội dung version đã lock; tạo version mới.

## 6.3 task

Index chính:
- (tenant_id, owner_membership_id, status, due_at)
- (tenant_id, owner_unit_id, status)
- (work_case_id,status)
- partial index overdue candidates WHERE status NOT IN ('COMPLETED','CANCELLED').

Check:
- progress_percent between 0 and 100.
- completed_at chỉ có khi COMPLETED.
- owner membership/unit ít nhất một nếu status từ ASSIGNED trở đi.

## 6.4 workflow_instance

- unique hoặc index subject_type,subject_id,status.
- workflow_version_id immutable sau start.
- subject_version_id pin version trình.

## 6.5 approval_item

Index:
- assignee_membership_id,status,due_at.
- instance_id,step_code.

Submitted version không đổi.

## 6.6 reporting

metric_schema_version:
- unique(metric_schema_id,version_no)
- approved version immutable.

metric_definition:
- unique(schema_version_id,code)

extracted_metric_value:
- unique(submission_id,metric_definition_id) nếu một metric chỉ có một value; nếu multi-dimensional thì thêm dimension_key_hash.

aggregation_result:
- unique(reporting_cycle_id,schema_version_id,metric_definition_id,group_key).

## 6.7 audit_event

Volume lớn, append-only.

Partition theo tháng hoặc quý:
- audit_event_YYYY_MM.

Index:
- tenant_id,occurred_at desc
- actor_id,occurred_at desc
- object_type,object_id
- correlation_id

Không FK chặt tới mọi object để tránh xóa/partition phức tạp; lưu object_type/object_id.

## 6.8 job/job_attempt

job:
- unique(tenant_id,idempotency_key) khi idempotency_key not null.
- index status,next_retry_at.
- index correlation_id.

job_attempt:
- unique(job_id,attempt_no).

---

# 7. Foreign Key Strategy

Strong FK trong cùng bounded context.

Cross-context FK:
- dùng FK khi cùng database và lifecycle ổn định.
- dùng soft reference nếu entity có lifecycle độc lập hoặc integration boundary.

Ví dụ:
- task.work_case_id: FK cứng.
- audit_event.object_id: soft reference.
- assistant_conversation.context_id: polymorphic soft reference.
- work_case_relation.related_id: polymorphic soft reference.

Mọi soft reference phải có application validation.

---

# 8. JSONB Usage

Cho phép:
- settings_json
- scope expression
- workflow definition snapshot
- AI metrics
- metadata không ổn định
- provider capabilities

Không dùng JSONB cho:
- task status/deadline
- approval assignee
- metric value cần aggregate
- tenant ownership
- audit timestamp
- version identifiers

Nguyên tắc: nếu field dùng trong filter/sort/join/report thường xuyên thì typed column.

---

# 9. Optimistic Locking

Áp row_version cho:
- document
- draft
- work_case
- task
- workflow_definition
- reporting_cycle
- template
- knowledge_source

API write gửi If-Match/rowVersion.

Conflict trả STALE_VERSION.

---

# 10. Transaction Patterns

## 10.1 Document upload complete
Transaction:
- create file_asset
- create document/document_version
- set current_version
- create outbox event

Binary upload hoàn tất trước DB commit hoặc dùng staged asset + reconcile.

## 10.2 Task assign
Transaction:
- validate current state
- update task
- insert task_assignment
- insert status history nếu cần
- outbox TaskAssigned
- audit event

## 10.3 Approval
Transaction:
- lock approval_item
- validate submitted version
- insert approval_action
- update workflow transition/state
- update approval item
- outbox event
- audit

## 10.4 Schema approval
Transaction:
- validate metric definitions
- lock schema version
- update current version
- emit SchemaApproved.

---

# 11. Outbox Pattern

Table platform.outbox_event:
- outbox_id
- tenant_id
- event_type
- aggregate_type
- aggregate_id
- event_version
- payload_json
- occurred_at
- published_at
- publish_attempts

Insert cùng transaction business.

Publisher:
- poll/CDC.
- at-least-once.
- consumer idempotent.

---

# 12. Inbox / Consumer Dedup

Table platform.consumer_message:
- consumer_name
- message_id
- processed_at
- result_hash

PK(consumer_name,message_id).

Dùng cho integration/event consumers cần idempotency.

---

# 13. Search & Vector Projection

Search không phải source of truth.

Projection record phải có:
- tenant_id
- source_type
- source_id
- source_version_id
- access_scope tokens
- classification
- indexed_at

Nếu source version đổi:
- mark old projection stale/deleted.
- tạo projection version mới.

---

# 14. Encryption & Sensitive Columns

At-rest encryption: storage/database volume.

Application-level encryption cân nhắc cho:
- integration credential references không lưu secret thật.
- dữ liệu đặc biệt nhạy cảm nếu policy yêu cầu.

Không mã hóa field cần search/aggregate bằng app-level nếu không có chiến lược phù hợp.

---

# 15. Backup/Restore

Backup:
- full + WAL/PITR nếu SaaS tier hỗ trợ.
- object storage versioning/lifecycle.
- search/vector có thể rebuild nhưng phải backup config/index metadata khi RTO yêu cầu.

Restore test:
- DB.
- object reference consistency.
- sample document retrieval.
- task/workflow state.
- knowledge index rebuild.

---

# 16. Migration Strategy

Tool tùy stack nhưng phải:
- versioned migration.
- forward-only preferred.
- backward-compatible deploy theo expand/contract.

Ví dụ đổi column:
1. add new nullable.
2. dual write.
3. backfill.
4. switch read.
5. remove old ở release sau.

Migration phải chạy test trên snapshot schema staging.

---

# 17. Partitioning Strategy

Ứng viên:
- audit_event: time partition.
- usage_record: time partition.
- job/job_attempt: time partition nếu volume cao.
- notification: time partition future.

Không partition sớm các bảng business nhỏ.

---

# 18. Archival & Retention

Archive logical:
- status ARCHIVED.
- hidden mặc định khỏi active query.

Physical delete:
- chỉ sau retention.
- kiểm relation.
- delete binary.
- purge search/vector.
- audit purge event nếu policy yêu cầu.

---

# 19. Performance Baseline

Mục tiêu:
- list queries P95 ≤2s.
- approval/task inbox có covering indexes.
- tránh N+1.
- query plan kiểm tra bằng EXPLAIN ANALYZE ở test dataset.
- batch insert/extraction dùng bulk operation.

---

# 20. Database Quality Gates

PASS trước production:
1. migration clean DB.
2. migration upgrade from previous.
3. rollback strategy documented.
4. cross-tenant negative tests.
5. FK/invariant tests.
6. optimistic-lock tests.
7. representative query benchmark.
8. backup/restore verification.
9. no orphan file references sample check.
10. outbox replay/idempotency test.
