# VWork – Application Architecture v1.0

**Mục tiêu:** Ánh xạ Domain Model và FR sang module ứng dụng, package boundary, command/query, event và dependency rule.

## 1. Application Structure

```text
apps/
  web/
  mobile/

services/
  core-api/
    modules/
      identity/
      organization/
      documents/
      intelligence/
      drafts/
      incoming/
      work/
      workflow/
      meetings/
      reporting/
      knowledge/
      executive/
      governance/
  worker/
  ai-orchestrator/

packages/
  contracts/
  authz/
  observability/
  shared-kernel/
  ui-web/
  ui-mobile/

infra/
```

## 2. Dependency Rule

- Domain không import web/mobile/infrastructure.
- Application use case gọi Domain + Ports.
- Infrastructure implement Ports.
- Module không đọc trực tiếp bảng module khác ngoài repository/service contract được định nghĩa.
- Shared Kernel chỉ chứa primitive/value type thật sự dùng chung; không biến thành “common” tùy tiện.

## 3. Layer per Module

```text
module/
  domain/
    entities
    value-objects
    policies
    events
  application/
    commands
    queries
    handlers
    dto
    ports
  infrastructure/
    repositories
    adapters
    persistence
  api/
    controllers
    mappers
```

## 4. Module Catalog

### APP-01 Identity
Owns:
User, Session, Membership, Role, Permission, DataScope, Delegation.

Provides:
- CurrentUserContext
- AuthorizationContext
- Membership lookup
- Delegation validation

Không owns Organization tree lifecycle nếu tách APP-02.

### APP-02 Organization
Owns OrganizationUnit, Position, DocumentProfile, SignatoryProfile.

### APP-03 Documents
Owns Document, Version, FileAsset reference, relation, export metadata.

Ports:
- ObjectStoragePort
- MalwareScanPort
- PreviewPort

### APP-04 Intelligence
Owns ExtractionRun, ExtractedField, Provenance, OCRPage, Verification.

Ports:
- OCRPort
- ClassificationPort
- ExtractionPort

### APP-05 Drafts
Owns Draft, DraftVersion, ContextSnapshot, ReviewRun, Finding, Rewrite, Package.

Ports:
- AIGenerationPort
- RendererPort
- TemplateQueryPort

### APP-06 Incoming
Owns IncomingRecord, Requirement, Suggestion.
Uses Document Query, Intelligence Query, Work commands.

### APP-07 Work
Owns WorkCase, Task, assignment/evidence/comment/history, reminder/escalation policy state.

### APP-08 Workflow
Owns definitions, versions, instances, approval, SLA.

Exposes generic SubjectRef; không hard-code chỉ Document.

### APP-09 Meeting
Owns Meeting, Transcript, Decision, Minutes.
Uses AI/STT and Work commands.

### APP-10 Reporting
Owns cycle, obligation, submission, metric schema/value, quality/reconciliation/aggregation.

### APP-11 Knowledge
Owns Template, Taxonomy, KnowledgeSource.
Coordinates index via event, không ghi trực tiếp search internals trong transaction chính.

### APP-12 Executive
Read-model oriented.
Consumes Work/Workflow/Incoming/Meeting/Reporting projections.
Owns Brief, Signal, Assistant conversation.

### APP-13 Governance
Owns Audit query facade, AI registries/config metadata, Integration config, Job view, Retention, Traceability.

## 5. Command Examples

Identity:
- CreateTenant
- CreateUser
- AssignRole
- CreateDelegation

Document:
- InitUpload
- CompleteUpload
- CreateDocumentVersion
- ArchiveDocument

Intelligence:
- StartExtraction
- VerifyExtractedField

Draft:
- CreateDraft
- GenerateDraft
- ReviewDraft
- ApplyReviewFinding
- RewriteDraftSection

Incoming:
- RegisterIncoming
- AnalyzeIncoming
- ConvertIncomingToCase

Work:
- CreateWorkCase
- CreateTask
- AssignTask
- AcceptTask
- UpdateTaskProgress
- CompleteTask

Workflow:
- PublishWorkflow
- StartWorkflow
- Approve
- Return
- Reject
- DelegateApproval

Meeting:
- CreateMeeting
- TranscribeMeeting
- ConfirmDecision
- CreateTaskFromDecision

Reporting:
- CreateCycle
- SubmitReport
- SuggestSchema
- ApproveSchema
- ExtractMetrics
- RunQuality
- Aggregate
- GenerateReport

Knowledge:
- PublishTemplate
- PublishKnowledge
- ReindexKnowledge

## 6. Query Examples

- GetDocument
- SearchDocuments
- GetWorkCaseTimeline
- ListMyTasks
- ListApprovals
- GetMeetingTranscript
- GetReportingDashboard
- SearchKnowledge
- GetExecutiveInbox
- GetAuditEvents

Query có thể dùng optimized read model nhưng phải enforce authz.

## 7. Application Events

In-process/domain event:
- TaskAssigned
- ApprovalApproved

Integration event/outbox:
- DocumentCreated
- DocumentVersionFinalized
- KnowledgePublished
- TaskOverdue
- SchemaApproved
- JobFailed

Event payload chỉ chứa ID/metadata cần thiết, không nhét toàn nội dung nhạy cảm.

## 8. Authorization Package

Interface:
```text
authorize(subject, action, resource, context) -> Decision
```

Decision:
- allowed
- reason_code
- matched_role
- scope
- policy_version

Mọi controller/use-case P0 phải gọi authz hoặc dùng guard middleware + domain state validation.

## 9. Persistence

Repository per aggregate:
- DocumentRepository
- WorkCaseRepository
- TaskRepository
- WorkflowRepository
- ReportingRepository...

Transaction boundary bám aggregate/application command.

Không expose ORM entity trực tiếp ra API.

## 10. API DTO Mapping

API DTO != Domain Entity != DB Row.

Mapper phải:
- bỏ internal/secret field.
- convert enum/version.
- attach links/permissions nếu cần.
- không cho client set tenant_id.

## 11. Web Application Architecture

### Shell
- authentication bootstrap.
- tenant context.
- navigation.
- permission-aware routes.
- notification.
- global job progress.

### Feature packages
- dashboard
- inbox
- documents
- incoming
- drafts
- work-cases
- tasks
- approvals
- meetings
- reporting
- templates
- knowledge
- admin

State:
- Server state dùng query cache.
- Form/editor state cục bộ.
- Không duplicate authoritative workflow state trong global client store.

## 12. Document Editor

Editor phải hỗ trợ:
- structured rich text.
- track local unsaved state.
- version save.
- selection-based AI action.
- side panel findings/source.
- diff/compare.
- lock/read-only khi submitted version.

Autosave phải phân biệt working draft và explicit version checkpoint.

## 13. Mobile Architecture

Feature modules:
- home
- inbox
- documents
- work
- approvals
- ai
- meetings
- notifications
- profile

Mobile không triển khai admin phức tạp trong Core v1.

Secure storage:
- token only.
- hạn chế cache document.
- notification deep link re-authz.

## 14. Async Job Client Pattern

Client:
1. POST command.
2. nhận jobId.
3. subscribe polling/WebSocket/SSE future.
4. show progress.
5. on success invalidate query/load result.
6. on failed show retry guidance.

Backend:
- job state authoritative.
- polling là baseline; realtime là optional.

## 15. Search/RAG Application Flow

1. Application tạo AuthorizedSearchContext.
2. Query Knowledge module.
3. Knowledge build tenant/access filters.
4. Search retrieves candidates.
5. Rerank.
6. AI generates.
7. Citation mapped to Provenance.
8. Audit AI run.

## 16. Error Model

Domain error code không phụ thuộc HTTP:
- InvalidStateTransition
- PermissionDenied
- StaleVersion
- MissingEvidence
- SchemaNotApproved
- BlockingFindingExists
- QuotaExceeded

API layer map sang HTTP/error contract.

## 17. Testing by Layer

Domain:
- invariant/state transition.

Application:
- command/query handler với fake port.

Infrastructure:
- DB repository integration.
- object/search/provider adapters.

API:
- contract + authz negative.

Web/Mobile:
- component + feature + e2e P0.

## 18. Package Ownership / CODEOWNERS đề xuất

- identity/organization: platform team.
- document/draft/intelligence: document AI team.
- work/workflow: workflow team.
- reporting: data team.
- web/mobile: client team.
- ai-orchestrator: AI platform team.

Một nhóm nhỏ có thể kiêm nhiệm nhưng boundary vẫn giữ.

## 19. Application Architecture Exit Criteria

- mọi FR có module.
- không có circular dependency giữa domain modules.
- API DTO tách persistence.
- async jobs có owner.
- Web/Mobile feature map về APIs.
- authz enforcement point rõ.
