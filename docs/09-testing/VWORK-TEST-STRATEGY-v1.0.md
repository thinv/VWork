# VWork – Test Strategy v1.0

**Phạm vi:** VWork Core v1  
**Mục tiêu:** Định nghĩa chiến lược kiểm thử từ requirement đến release theo risk-based testing và traceability.

---

# 1. Quality Objectives

1. Không cross-tenant leakage.
2. Không phê duyệt sai version/thẩm quyền.
3. Không mất/ghi đè tài liệu chính thức.
4. Task/workflow state nhất quán.
5. Báo cáo deterministic và truy nguồn.
6. AI không bịa fact khi thiếu nguồn trong P0 grounded use case.
7. Hệ thống phục hồi được từ lỗi provider/job.
8. Web/Mobile P0 usable.
9. Release có evidence.

---

# 2. Test Levels

## Unit
Domain invariant, utility, policy.

## Component/Application
Command/query handler.

## Integration
DB, storage, queue, search, AI adapter, external adapter.

## Contract
OpenAPI, event schema, integration contracts.

## System/E2E
P0 business flow.

## UAT
Nghiệp vụ xã/phường.

---

# 3. Test Pyramid

Ưu tiên:
- nhiều unit/domain.
- đủ integration.
- chọn lọc E2E stable.
- không dựa toàn bộ vào UI E2E.

AI evaluation là lớp riêng song song.

---

# 4. Test Categories

- Functional
- Authorization/Security
- Tenant isolation
- Data integrity
- API contract
- Migration
- Async/recovery
- Performance
- Reliability
- AI quality
- Accessibility
- Compatibility
- Mobile
- Backup/restore
- Deployment
- UAT

---

# 5. P0 End-to-End Journeys

E2E-01 Văn bản đến:
upload → OCR/extract → requirements → verify → Work Case → Task → draft → review → approval.

E2E-02 Soạn thảo:
instruction + sources + template → generate → review → version → submit → approve.

E2E-03 Công việc:
create case → task → assign → accept → progress → evidence → complete.

E2E-04 Họp:
meeting → audio → transcript → decision → confirm → task → minutes.

E2E-05 Báo cáo:
cycle → submissions → suggest schema → approve → extract → quality → reconcile → aggregate → draft → export.

E2E-06 Knowledge:
publish source → index → ask → citations → permission revoke → query no longer returns source.

E2E-07 Executive:
task/approval overdue → inbox → brief → open → action → state refresh.

---

# 6. Requirement-Based Testing

Mỗi FR P0 có ít nhất:
- positive.
- negative/validation.
- authorization.
- audit nếu state change.

NFR có test/evidence type:
- benchmark.
- scan.
- configuration review.
- recovery drill.

---

# 7. Business Rule Testing

BRULE categories:
- invariant tests.
- state transition.
- versioning.
- provenance.
- approval.
- reporting gates.
- AI guards.

BLOCKER rule phải có explicit fail test.

---

# 8. Tenant Isolation Suite

Tạo Tenant A/B.

Kiểm:
- GET by guessed ID.
- list.
- search.
- RAG.
- file download.
- export.
- task.
- approval.
- job.
- notification.
- deep link.
- websocket/SSE future.

Expected: zero leakage.

---

# 9. Authorization Matrix Tests

Actor:
ACT-01..14.

Resource/action matrix generated từ role policy.

Test:
- allowed role.
- denied role.
- wrong unit scope.
- delegation valid.
- delegation expired.
- object restriction.

---

# 10. Version/Stale Tests

- Document final immutable.
- Approval submitted version changes → 409.
- Metric schema approved immutable.
- Workflow definition instance pinned.
- Template version pinned.
- Prompt version trace.

---

# 11. Async/Job Tests

- idempotent duplicate command.
- transient retry.
- non-retry validation.
- provider timeout.
- dead-letter.
- manual retry.
- process crash mid-job.
- result reconciliation.
- progress reporting.

---

# 12. Reporting Tests

Datasets:
- complete.
- missing unit.
- duplicate submission.
- malformed type.
- outlier.
- total mismatch.
- schema version changed.

Aggregation expected values generated deterministically.

LLM không được là oracle cho arithmetic.

---

# 13. AI Evaluation

## Extraction
golden labels.

## RAG
question → expected sources/facts.

## Draft
rubric + required sections + factual checks.

## Review
known defect corpus.

## Prompt Injection
malicious documents and user prompts.

## Cross-scope
retrieval forbidden documents.

Threshold freeze trước release.

---

# 14. OCR/STT Tests

OCR:
- native PDF.
- scan clean.
- skewed.
- table.
- Vietnamese accents.
- low-resolution.

STT:
- one speaker.
- multi-speaker.
- noisy.
- long audio.
- Vietnamese proper nouns.

Metrics: CER/WER and field accuracy.

---

# 15. Security Testing

- SAST.
- dependency.
- secret.
- DAST.
- authz/IDOR.
- upload.
- XSS rich text.
- CSRF if cookie.
- SSRF integration URL.
- webhook replay.
- prompt injection.
- mobile storage.
- API rate limit.

---

# 16. Performance Tests

Scenarios:
- document list/search.
- executive inbox.
- task list.
- approval queue.
- upload.
- concurrent AI job submission.
- reporting aggregation.
- RAG query.

Measure p50/p95/p99, throughput, error, saturation.

---

# 17. Load Model

Pilot baseline define:
- concurrent users.
- documents/tenant.
- tasks.
- daily AI calls.
- report size.
- audio hours.

Sau pilot cập nhật workload model.

---

# 18. Resilience Tests

- kill worker.
- provider outage.
- DB failover if HA.
- search down.
- queue restart.
- object storage temporary failure.
- duplicate event delivery.

Expected graceful recovery.

---

# 19. Backup/Restore Test

Quarterly/each major release per policy:
- restore DB.
- verify files.
- login.
- open document.
- task/workflow state.
- rebuild search.
- RAG citation.
- audit availability.

---

# 20. Web Tests

- component.
- route auth.
- form.
- editor.
- citation.
- async job.
- accessibility automated baseline.
- browser matrix.

---

# 21. Mobile Tests

- auth/session.
- secure storage.
- deep link.
- push.
- offline/poor network.
- duplicate tap.
- approval stale.
- upload evidence.
- OS matrix.

---

# 22. Test Data

- synthetic default.
- anonymized approved datasets for AI.
- deterministic seeds.
- tenant A/B.
- no real secret.

Golden AI dataset versioned separately with access controls if sensitive.

---

# 23. Defect Severity

S0 Critical:
security leak/data loss/wrong official approval.

S1 High:
P0 flow unusable.

S2 Medium:
workaround exists.

S3 Low:
cosmetic/minor.

Release:
0 open S0.
0 open S1 unless formal exceptional approval.

---

# 24. Entry/Exit Gates

Feature entry:
- FR/UC.
- acceptance.
- API/data design.
- test notes.

Feature done:
- code review.
- unit/integration.
- trace link.
- docs.
- no blocker.

Release exit:
- P0 coverage.
- security.
- performance.
- AI eval.
- migration.
- backup/restore evidence as applicable.
- UAT.

---

# 25. Test Evidence

Store:
- test run ID.
- commit.
- environment.
- dataset version.
- result.
- logs/artifact.
- approver.

Link to Traceability Matrix.

---

# 26. Automation Priority

Automate first:
- API.
- domain.
- tenant isolation.
- workflow.
- reporting deterministic.
- smoke E2E.

Manual/expert:
- AI qualitative review.
- complex usability.
- exploratory.
