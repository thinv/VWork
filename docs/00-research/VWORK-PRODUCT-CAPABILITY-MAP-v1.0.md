# VWork – Product Capability Map v1.0

## 1. Product Definition

**VWork – Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh cho chính quyền cơ sở.**

### Product Backbone

DOCUMENT → UNDERSTAND → ADVISE → DRAFT/REVIEW → WORK CASE → ASSIGN/APPROVE → TRACK → REPORT → KNOWLEDGE → EXECUTIVE INTELLIGENCE

## 2. Capability Map cấp 0

VWork Core gồm 12 domain:

1. Identity & Organization
2. Document Management
3. Document Intelligence
4. AI Draft & Review
5. Incoming Document Processing
6. Work Case & Task
7. Workflow & Approval
8. Meeting Intelligence
9. Reporting & Data Consolidation
10. Templates & Knowledge
11. AI Assistant & Executive Intelligence
12. Governance, Audit & Integration

## 3. Capability Map cấp 1–2

### CAP-01 Identity & Organization

#### CAP-01.01 Tenant Management
- Tạo tenant.
- Tenant settings.
- Subscription/entitlement.
- Storage/AI quota.
- Branding.

#### CAP-01.02 Organization Structure
- Cơ quan.
- Đơn vị/phòng ban.
- Chức danh.
- Người dùng.
- Nhóm.

#### CAP-01.03 IAM
- Login.
- MFA/SSO extension.
- Session.
- Device.
- Password policy.

#### CAP-01.04 Authorization
- RBAC.
- Data scope.
- Tenant isolation.
- Object-level permission.
- Delegation.

#### CAP-01.05 Signatory/Profile
- Cơ quan chủ quản.
- Ký hiệu.
- Địa danh.
- Người ký.
- Nơi nhận.
- Default document profile.

### CAP-02 Document Management

#### CAP-02.01 Document Intake
- Upload.
- Multi-file.
- Drag/drop.
- File validation.
- Malware scan.
- Metadata.

#### CAP-02.02 Document Repository
- Folder/workspace.
- Version.
- Status.
- Link to Work Case.
- Attachment.
- Retention.

#### CAP-02.03 Document Viewer
- DOCX/PDF/image preview.
- Search.
- Page/section navigation.
- Compare.

#### CAP-02.04 Export/Package
- DOCX.
- PDF future.
- XLSX/CSV.
- Multi-document package.

### CAP-03 Document Intelligence

#### CAP-03.01 Parsing
- DOCX.
- PDF text.
- XLSX/CSV.
- Tables.
- Images.

#### CAP-03.02 OCR
- PDF scan.
- Multi-image.
- OCR confidence.
- Review/correction.

#### CAP-03.03 Classification
- Hệ văn bản.
- Loại văn bản.
- Lĩnh vực.
- Mức độ ưu tiên.

#### CAP-03.04 Extraction
- Cơ quan.
- Số/ký hiệu.
- Ngày.
- Người ký.
- Căn cứ.
- Nhiệm vụ.
- Deadline.
- Số liệu.
- Thực thể.

#### CAP-03.05 Provenance
- Source document.
- Page/paragraph.
- Table/cell.
- Confidence.

### CAP-04 AI Draft & Review

#### CAP-04.01 Draft
- Ý chỉ đạo → dự thảo.
- Document type suggestion.
- Draft mode: trình ký / chi tiết / package.
- Grounded generation.

#### CAP-04.02 Template-aware Generation
- Style-only.
- Structure-based.
- Structured template fields.
- Required sections.

#### CAP-04.03 Review
- Chính tả.
- Diễn đạt.
- Logic.
- Thiếu ý.
- Số liệu.
- Căn cứ.
- Thể thức.
- Policy/rule checks.

#### CAP-04.04 Editor Copilot
- Rewrite.
- Shorten.
- Clarify.
- Reorder.
- User instruction.
- Accept/reject change.

#### CAP-04.05 Quality Score
- Content.
- Structure.
- Evidence.
- Consistency.
- Compliance.

### CAP-05 Incoming Document Processing

#### CAP-05.01 Intake & Register
- Upload/import.
- Metadata.
- Priority.
- Source.

#### CAP-05.02 Requirement Extraction
- What.
- Who.
- Deadline.
- Required output.
- Reporting destination.

#### CAP-05.03 Advice
- Suggested handling.
- Missing information.
- Related policy/document.
- Candidate assignee.

#### CAP-05.04 Response Package
- Công văn.
- Báo cáo.
- Kế hoạch.
- Checklist.
- Data table.

#### CAP-05.05 Convert to Work
- Create Work Case.
- Create Tasks.
- Attach source.
- Start workflow.

### CAP-06 Work Case & Task

#### CAP-06.01 Work Case
- Case metadata.
- Sources.
- Related documents.
- Meetings.
- Tasks.
- Outputs.
- Timeline.

#### CAP-06.02 Task
- Title/detail.
- Owner/unit.
- Deadline.
- Priority.
- Required output.
- Evidence.
- Status.

#### CAP-06.03 Tracking
- Progress.
- Due/overdue.
- Blocking reason.
- Reminder.
- Escalation.

#### CAP-06.04 Collaboration
- Comment.
- Mention.
- Attachment.
- Handover.
- Delegation.

### CAP-07 Workflow & Approval

#### CAP-07.01 Workflow Definition
- Step.
- Role.
- Condition.
- SLA.
- Action.

#### CAP-07.02 Runtime
- Start.
- Transition.
- Approve.
- Reject.
- Return.
- Delegate.

#### CAP-07.03 Approval
- Comment.
- Approval record.
- Document version.
- Audit.

#### CAP-07.04 Notification/Escalation
- In-app.
- Push.
- Email extension.
- Reminder.
- Escalation.

### CAP-08 Meeting Intelligence

#### CAP-08.01 Meeting Setup
- Agenda/invitation.
- Time/location.
- Chair.
- Participants.
- Related Work Case.

#### CAP-08.02 Audio/STT
- Upload/record.
- Transcript.
- Timestamp.
- Speaker.

#### CAP-08.03 Meeting Extraction
- Decision.
- Task.
- Deadline.
- Owner.
- Issue.

#### CAP-08.04 Minutes
- Draft minutes.
- Citation to timestamp.
- Approval.
- Export.

#### CAP-08.05 Follow-up
- Convert decisions to tasks.
- Monitor.
- Report status.

### CAP-09 Reporting & Data Consolidation

#### CAP-09.01 Report Collection
- Source reports.
- Required units.
- Reporting period.
- Submission status.

#### CAP-09.02 Schema Suggestion
- AI metric proposal.
- Field definition.
- Unit.
- Aggregation method.

#### CAP-09.03 Schema Approval
- Human approve/edit.
- Lock schema.
- Version.

#### CAP-09.04 Extraction
- Values.
- Narrative.
- Difficulties.
- Recommendations.
- Provenance.

#### CAP-09.05 Data Quality
- Missing.
- Duplicate.
- Type.
- Outlier.
- Reconciliation.

#### CAP-09.06 Aggregation
- Sum.
- Average.
- Ratio.
- Grouping.
- Comparison.

#### CAP-09.07 Report Draft
- Findings.
- Narrative.
- Tables.
- Source notes.
- DOCX/XLSX.

### CAP-10 Templates & Knowledge

#### CAP-10.01 Template Library
- Personal.
- Tenant.
- System.
- Version.

#### CAP-10.02 Template Metadata
- System/type.
- Role.
- Agency.
- Domain.
- Year.
- Usage note.

#### CAP-10.03 Structured Template
- Sections.
- Fields.
- Rules.
- Style.
- Renderer.

#### CAP-10.04 Knowledge Base
- Documents.
- Policies.
- Approved outputs.
- Taxonomy.
- Access scope.

#### CAP-10.05 RAG
- Ingestion.
- Chunking.
- Embedding.
- Search.
- Rerank.
- Citation.

#### CAP-10.06 Knowledge Graph
- Document.
- Case.
- Task.
- Person.
- Organization.
- Decision.
- Report.

### CAP-11 AI Assistant & Executive Intelligence

#### CAP-11.01 Contextual Assistant
- Ask on document.
- Ask on case.
- Ask on task.
- Ask on meeting.
- Ask on report.

#### CAP-11.02 Executive Inbox
- Need approval.
- Urgent.
- Overdue.
- Upcoming.
- New incoming.

#### CAP-11.03 Executive Brief
- Daily.
- Weekly.
- By domain/unit.
- With citations.

#### CAP-11.04 Proactive Signals
- Overdue risk.
- Missing report.
- Contradictory data.
- Unresolved decision.

### CAP-12 Governance, Audit & Integration

#### CAP-12.01 Audit
- User action.
- Data change.
- AI run.
- Approval.
- Export.

#### CAP-12.02 AI Governance
- Model/provider.
- Prompt version.
- Evaluation.
- Guardrail.
- Usage.

#### CAP-12.03 Integration
- REST/OpenAPI.
- Webhook.
- Event.
- Adapter.

#### CAP-12.04 Operations
- Monitoring.
- Trace.
- Retry.
- Queue.
- Backup.
- DR.

#### CAP-12.05 Compliance Evidence
- Requirement traceability.
- Configuration baseline.
- Test evidence.
- Release evidence.
- Acceptance evidence.

## 4. Mapping benchmark → VWork capability

| Benchmark capability | VWork destination |
|---|---|
| Tham mưu văn bản | CAP-04 |
| Hoàn thiện văn bản | CAP-04 |
| Văn bản đến | CAP-05 + CAP-06 + CAP-07 |
| Cuộc họp | CAP-08 + CAP-06 |
| Tổng hợp báo cáo | CAP-09 |
| Gộp bảng | CAP-09.05/09.06 |
| PDF/scan | CAP-03.02 |
| Kho mẫu | CAP-10 |
| Cấu hình văn bản | CAP-01.05 |
| Lịch sử xử lý | CAP-12.01 |
| Hồ sơ pháp lý | Extension, dùng nền CAP-06/10/12 |
| Tố tụng | Extension, dùng nền CAP-06/10/12 |

## 5. Web Information Architecture đề xuất

Top-level navigation:
1. Tổng quan
2. Văn bản
3. Hồ sơ công việc
4. Công việc
5. Soạn thảo AI
6. Họp
7. Báo cáo
8. Kho tri thức
9. Quản trị

AI không là một module tách biệt hoàn toàn; AI action nằm trong từng workspace.

## 6. Mobile Information Architecture đề xuất

Bottom navigation:
1. Home
2. Inbox
3. Work
4. AI
5. Meeting
6. Profile

Mobile tập trung:
- đọc nhanh,
- tóm tắt,
- cho ý kiến,
- duyệt,
- giao việc,
- theo dõi,
- thông báo.

## 7. Capability dependency

CAP-01 Identity/Org → CAP-02 Document → CAP-03 Document Intelligence.

Từ CAP-03 phân nhánh sang CAP-04 Draft/Review, CAP-05 Incoming, CAP-08 Meeting và CAP-09 Reporting; tất cả cùng hội tụ vào CAP-06 Work Case/Task và CAP-07 Workflow.

CAP-10 Knowledge cung cấp dữ liệu cho AI xuyên suốt; CAP-11 Executive Intelligence tiêu thụ dữ liệu từ các domain; CAP-12 Governance/Audit/Integration phủ ngang toàn bộ hệ thống.

## 8. Capability ownership

Mỗi capability khi vào BRD/SRS phải có:
- Capability ID.
- Product owner.
- Actor.
- Business outcome.
- Use case IDs.
- Requirement IDs.
- Screen IDs.
- API IDs.
- Data entities.
- Test IDs.
- Release target.

Đây là điểm nối trực tiếp giữa Product Capability Map và traceability theo quy trình phát triển phần mềm.
