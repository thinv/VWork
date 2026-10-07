-- VWork Migration 0001: foundation
-- Target: PostgreSQL 16+
BEGIN;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE SCHEMA IF NOT EXISTS iam;
CREATE SCHEMA IF NOT EXISTS org;
CREATE SCHEMA IF NOT EXISTS doc;
CREATE SCHEMA IF NOT EXISTS intel;
CREATE SCHEMA IF NOT EXISTS work;
CREATE SCHEMA IF NOT EXISTS workflow;
CREATE SCHEMA IF NOT EXISTS reporting;
CREATE SCHEMA IF NOT EXISTS knowledge;
CREATE SCHEMA IF NOT EXISTS platform;

CREATE TABLE iam.tenant (
  tenant_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  code varchar(64) NOT NULL UNIQUE,
  name varchar(255) NOT NULL,
  status varchar(32) NOT NULL DEFAULT 'ACTIVE',
  deployment_profile varchar(32) NOT NULL DEFAULT 'SAAS',
  timezone varchar(64) NOT NULL DEFAULT 'Asia/Ho_Chi_Minh',
  locale varchar(16) NOT NULL DEFAULT 'vi-VN',
  settings_json jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  row_version bigint NOT NULL DEFAULT 1
);

CREATE TABLE iam.user_account (
  user_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  username varchar(128),
  email varchar(255),
  phone varchar(32),
  display_name varchar(255) NOT NULL,
  status varchar(32) NOT NULL DEFAULT 'ACTIVE',
  last_login_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX ux_user_username ON iam.user_account(lower(username)) WHERE username IS NOT NULL;
CREATE UNIQUE INDEX ux_user_email ON iam.user_account(lower(email)) WHERE email IS NOT NULL;

CREATE TABLE org.organization_unit (
  organization_unit_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  parent_id uuid REFERENCES org.organization_unit(organization_unit_id),
  code varchar(64) NOT NULL,
  name varchar(255) NOT NULL,
  type varchar(64),
  status varchar(32) NOT NULL DEFAULT 'ACTIVE',
  path varchar(1024),
  depth integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(tenant_id, code)
);

CREATE TABLE org.position (
  position_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  code varchar(64) NOT NULL,
  name varchar(255) NOT NULL,
  level integer,
  approval_rank integer,
  status varchar(32) NOT NULL DEFAULT 'ACTIVE',
  UNIQUE(tenant_id, code)
);

CREATE TABLE iam.membership (
  membership_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  user_id uuid NOT NULL REFERENCES iam.user_account(user_id),
  organization_unit_id uuid REFERENCES org.organization_unit(organization_unit_id),
  position_id uuid REFERENCES org.position(position_id),
  is_primary boolean NOT NULL DEFAULT false,
  status varchar(32) NOT NULL DEFAULT 'ACTIVE',
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_membership_tenant_user ON iam.membership(tenant_id, user_id);

CREATE TABLE iam.role (
  role_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid REFERENCES iam.tenant(tenant_id),
  code varchar(64) NOT NULL,
  name varchar(255) NOT NULL,
  scope_type varchar(32),
  status varchar(32) NOT NULL DEFAULT 'ACTIVE'
);
CREATE UNIQUE INDEX ux_role_tenant_code
ON iam.role(COALESCE(tenant_id, '00000000-0000-0000-0000-000000000000'::uuid), code);

CREATE TABLE iam.permission (
  permission_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  code varchar(128) NOT NULL UNIQUE,
  resource varchar(64) NOT NULL,
  action varchar(64) NOT NULL
);

CREATE TABLE iam.data_scope (
  scope_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  type varchar(32) NOT NULL,
  expression_json jsonb NOT NULL DEFAULT '{}'::jsonb,
  description text
);

CREATE TABLE iam.role_assignment (
  assignment_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  membership_id uuid NOT NULL REFERENCES iam.membership(membership_id),
  role_id uuid NOT NULL REFERENCES iam.role(role_id),
  data_scope_id uuid REFERENCES iam.data_scope(scope_id),
  effective_from timestamptz NOT NULL DEFAULT now(),
  effective_to timestamptz,
  status varchar(32) NOT NULL DEFAULT 'ACTIVE'
);

CREATE TABLE iam.delegation (
  delegation_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  delegator_membership_id uuid NOT NULL REFERENCES iam.membership(membership_id),
  delegate_membership_id uuid NOT NULL REFERENCES iam.membership(membership_id),
  scope_json jsonb NOT NULL,
  start_at timestamptz NOT NULL,
  end_at timestamptz NOT NULL,
  status varchar(32) NOT NULL DEFAULT 'ACTIVE',
  reason text,
  CHECK (end_at > start_at),
  CHECK (delegator_membership_id <> delegate_membership_id)
);

CREATE TABLE doc.file_asset (
  file_asset_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  storage_provider varchar(32) NOT NULL,
  storage_key varchar(1024) NOT NULL,
  checksum varchar(128),
  original_filename varchar(512) NOT NULL,
  mime_type varchar(255) NOT NULL,
  size_bytes bigint NOT NULL CHECK(size_bytes >= 0),
  malware_status varchar(32) NOT NULL DEFAULT 'PENDING',
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(tenant_id, storage_key)
);

CREATE TABLE doc.document (
  document_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  document_type varchar(64),
  title varchar(500) NOT NULL,
  source_type varchar(64),
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  current_version_id uuid,
  owner_membership_id uuid REFERENCES iam.membership(membership_id),
  access_scope_id uuid REFERENCES iam.data_scope(scope_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  row_version bigint NOT NULL DEFAULT 1
);
CREATE INDEX ix_document_tenant_status ON doc.document(tenant_id, status);
CREATE INDEX ix_document_tenant_created ON doc.document(tenant_id, created_at DESC);

CREATE TABLE doc.document_version (
  document_version_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  document_id uuid NOT NULL REFERENCES doc.document(document_id) ON DELETE CASCADE,
  version_no integer NOT NULL CHECK(version_no > 0),
  file_asset_id uuid REFERENCES doc.file_asset(file_asset_id),
  content_hash varchar(128),
  mime_type varchar(255),
  size_bytes bigint,
  lifecycle_state varchar(32) NOT NULL DEFAULT 'DRAFT',
  created_by uuid REFERENCES iam.membership(membership_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  locked_at timestamptz,
  submitted_at timestamptz,
  final_at timestamptz,
  UNIQUE(document_id, version_no)
);
ALTER TABLE doc.document
  ADD CONSTRAINT fk_document_current_version
  FOREIGN KEY (current_version_id)
  REFERENCES doc.document_version(document_version_id)
  DEFERRABLE INITIALLY DEFERRED;

CREATE TABLE intel.provenance (
  provenance_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  source_type varchar(32) NOT NULL,
  document_version_id uuid REFERENCES doc.document_version(document_version_id),
  page_no integer,
  section_ref varchar(255),
  paragraph_ref varchar(255),
  sheet_name varchar(255),
  cell_ref varchar(64),
  start_ms bigint,
  end_ms bigint,
  excerpt_hash varchar(128),
  confidence numeric(5,4)
);

CREATE TABLE intel.extraction_run (
  extraction_run_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  document_version_id uuid NOT NULL REFERENCES doc.document_version(document_version_id),
  pipeline_version varchar(64) NOT NULL,
  status varchar(32) NOT NULL,
  started_at timestamptz,
  completed_at timestamptz,
  confidence_summary jsonb NOT NULL DEFAULT '{}'::jsonb
);

CREATE TABLE intel.extracted_field (
  extracted_field_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  extraction_run_id uuid NOT NULL REFERENCES intel.extraction_run(extraction_run_id) ON DELETE CASCADE,
  field_code varchar(128) NOT NULL,
  value_json jsonb,
  grounding_type varchar(16) NOT NULL CHECK(grounding_type IN ('FACT','INFERENCE','MISSING')),
  confidence numeric(5,4),
  verification_status varchar(32) NOT NULL DEFAULT 'UNVERIFIED'
);

CREATE TABLE work.work_case (
  work_case_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  code varchar(64) NOT NULL,
  title varchar(500) NOT NULL,
  description text,
  domain_code varchar(64),
  priority varchar(16) NOT NULL DEFAULT 'NORMAL',
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  owner_unit_id uuid REFERENCES org.organization_unit(organization_unit_id),
  owner_membership_id uuid REFERENCES iam.membership(membership_id),
  due_at timestamptz,
  completed_at timestamptz,
  access_scope_id uuid REFERENCES iam.data_scope(scope_id),
  created_at timestamptz NOT NULL DEFAULT now(),
  row_version bigint NOT NULL DEFAULT 1,
  UNIQUE(tenant_id, code)
);

CREATE TABLE work.task (
  task_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  work_case_id uuid NOT NULL REFERENCES work.work_case(work_case_id),
  parent_task_id uuid REFERENCES work.task(task_id),
  title varchar(500) NOT NULL,
  description text,
  owner_unit_id uuid REFERENCES org.organization_unit(organization_unit_id),
  owner_membership_id uuid REFERENCES iam.membership(membership_id),
  assigned_by uuid REFERENCES iam.membership(membership_id),
  priority varchar(16) NOT NULL DEFAULT 'NORMAL',
  required_output text,
  due_at timestamptz,
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  progress_percent integer NOT NULL DEFAULT 0 CHECK(progress_percent BETWEEN 0 AND 100),
  blocker_text text,
  blocking_flag boolean NOT NULL DEFAULT false,
  completed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  row_version bigint NOT NULL DEFAULT 1
);
CREATE INDEX ix_task_owner_status_due ON work.task(tenant_id, owner_membership_id, status, due_at);
CREATE INDEX ix_task_case_status ON work.task(work_case_id, status);

CREATE TABLE work.task_status_history (
  history_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  task_id uuid NOT NULL REFERENCES work.task(task_id) ON DELETE CASCADE,
  from_status varchar(32),
  to_status varchar(32) NOT NULL,
  reason text,
  changed_by uuid REFERENCES iam.membership(membership_id),
  changed_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE workflow.workflow_definition (
  workflow_definition_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  code varchar(64) NOT NULL,
  name varchar(255) NOT NULL,
  subject_type varchar(64) NOT NULL,
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  current_version_id uuid,
  UNIQUE(tenant_id, code)
);

CREATE TABLE workflow.workflow_version (
  workflow_version_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  workflow_definition_id uuid NOT NULL REFERENCES workflow.workflow_definition(workflow_definition_id),
  version_no integer NOT NULL,
  definition_json jsonb NOT NULL,
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  published_at timestamptz,
  UNIQUE(workflow_definition_id, version_no)
);

CREATE TABLE workflow.workflow_instance (
  workflow_instance_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  workflow_version_id uuid NOT NULL REFERENCES workflow.workflow_version(workflow_version_id),
  subject_type varchar(64) NOT NULL,
  subject_id uuid NOT NULL,
  subject_version_id uuid,
  current_step_code varchar(64),
  status varchar(32) NOT NULL DEFAULT 'CREATED',
  started_by uuid REFERENCES iam.membership(membership_id),
  started_at timestamptz,
  completed_at timestamptz
);

CREATE TABLE workflow.approval_item (
  approval_item_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  instance_id uuid NOT NULL REFERENCES workflow.workflow_instance(workflow_instance_id),
  step_code varchar(64) NOT NULL,
  assignee_membership_id uuid NOT NULL REFERENCES iam.membership(membership_id),
  status varchar(32) NOT NULL DEFAULT 'PENDING',
  due_at timestamptz,
  submitted_version_id uuid,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_approval_assignee_status_due
ON workflow.approval_item(assignee_membership_id, status, due_at);

CREATE TABLE reporting.reporting_cycle (
  reporting_cycle_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  code varchar(64) NOT NULL,
  name varchar(500) NOT NULL,
  period_start date NOT NULL,
  period_end date NOT NULL,
  due_at timestamptz,
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  current_schema_version_id uuid,
  row_version bigint NOT NULL DEFAULT 1,
  UNIQUE(tenant_id, code),
  CHECK(period_end >= period_start)
);

CREATE TABLE knowledge.knowledge_source (
  knowledge_source_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid NOT NULL REFERENCES iam.tenant(tenant_id),
  name varchar(500) NOT NULL,
  source_type varchar(64) NOT NULL,
  access_scope_id uuid REFERENCES iam.data_scope(scope_id),
  status varchar(32) NOT NULL DEFAULT 'DRAFT',
  current_version_id uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  row_version bigint NOT NULL DEFAULT 1
);

CREATE TABLE platform.audit_event (
  audit_event_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid REFERENCES iam.tenant(tenant_id),
  actor_id uuid,
  action varchar(128) NOT NULL,
  object_type varchar(64) NOT NULL,
  object_id uuid,
  correlation_id varchar(128) NOT NULL,
  result varchar(32) NOT NULL,
  metadata_json jsonb NOT NULL DEFAULT '{}'::jsonb,
  occurred_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX ix_audit_tenant_time ON platform.audit_event(tenant_id, occurred_at DESC);
CREATE INDEX ix_audit_object ON platform.audit_event(object_type, object_id);
CREATE INDEX ix_audit_correlation ON platform.audit_event(correlation_id);

CREATE TABLE platform.job (
  job_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid REFERENCES iam.tenant(tenant_id),
  type varchar(64) NOT NULL,
  correlation_id varchar(128) NOT NULL,
  idempotency_key varchar(255),
  status varchar(32) NOT NULL DEFAULT 'QUEUED',
  progress numeric(5,2) NOT NULL DEFAULT 0,
  attempt_count integer NOT NULL DEFAULT 0,
  next_retry_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz
);
CREATE UNIQUE INDEX ux_job_idempotency
ON platform.job(tenant_id, idempotency_key)
WHERE idempotency_key IS NOT NULL;
CREATE INDEX ix_job_status_retry ON platform.job(status, next_retry_at);

CREATE TABLE platform.outbox_event (
  outbox_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id uuid REFERENCES iam.tenant(tenant_id),
  event_type varchar(128) NOT NULL,
  aggregate_type varchar(64) NOT NULL,
  aggregate_id uuid NOT NULL,
  event_version integer NOT NULL DEFAULT 1,
  payload_json jsonb NOT NULL,
  occurred_at timestamptz NOT NULL DEFAULT now(),
  published_at timestamptz,
  publish_attempts integer NOT NULL DEFAULT 0
);
CREATE INDEX ix_outbox_unpublished
ON platform.outbox_event(occurred_at)
WHERE published_at IS NULL;

CREATE TABLE platform.consumer_message (
  consumer_name varchar(128) NOT NULL,
  message_id uuid NOT NULL,
  processed_at timestamptz NOT NULL DEFAULT now(),
  result_hash varchar(128),
  PRIMARY KEY(consumer_name, message_id)
);

CREATE TABLE platform.schema_migration (
  version varchar(64) PRIMARY KEY,
  description text NOT NULL,
  applied_at timestamptz NOT NULL DEFAULT now()
);
INSERT INTO platform.schema_migration(version, description)
VALUES ('0001', 'VWork foundation schemas and core tables');

COMMIT;
