# VWork – Sprint 01 v1.0

## Sprint Goal
Tạo nền chạy được của VWork: monorepo, CI, database foundation, Core API/AI/Web/Mobile skeleton và vertical slice đầu tiên Tenant → Document → Task.

## Scope P0

### S1-01 Monorepo bootstrap
Acceptance:
- pnpm install.
- turbo build/lint/test commands.
- shared TypeScript config.
- workspace package boundaries rõ.

### S1-02 CI Foundation
- install/cache.
- lint/typecheck.
- unit.
- OpenAPI lint.
- migration smoke.
- Python lint/test.
- secret/dependency scan.

### S1-03 DB Migration 0001
- tenant/org/user/role/scope.
- document/version/file.
- work case/task.
- workflow approval.
- audit/job/outbox.
- test tenant seed riêng, không nằm production migration.

### S1-04 Core API Skeleton
- GET /health/live
- GET /health/ready
- request correlation id.
- tenant context guard/middleware baseline.
- modules: identity, documents, work, workflow, governance.

### S1-05 AI Orchestrator Skeleton
- GET /health/live
- GET /health/ready
- canonical request envelope.
- provider interface.
- no provider key committed.

### S1-06 Web Skeleton
- App Shell.
- Home.
- Documents route.
- Tasks route.
- shared API/contracts package.

### S1-07 Mobile Skeleton
- Home.
- Inbox.
- Work.
- AI.
- Profile navigation.

### S1-08 Document Vertical Slice
- upload-init contract.
- complete-upload metadata skeleton.
- list/read document.
- tenant isolation tests.

### S1-09 Task Vertical Slice
- create Work Case.
- create Task.
- assign/update basic.
- audit/state tests.

### S1-10 Traceability/Test
- map Sprint FR/API/Screen/Test.
- tenant isolation P0.
- migration test.
- API contract test.

## Out of Sprint 1
- full OCR.
- real LLM generation.
- workflow designer.
- reporting engine.
- STT.
- full document rich-text editor.
- production digital signature.

## Demo Scenario
1. Start local stack.
2. Health all green.
3. Use test tenant context.
4. Create document metadata/upload ticket.
5. List/open document.
6. Create Work Case.
7. Create/assign Task.
8. Web displays Document + Task.
9. Audit event visible.
10. CI and traceability status green.

## Exit Gate
- CI green.
- migration empty DB PASS.
- Web/Core/AI build.
- Mobile typecheck/config PASS.
- API health PASS.
- zero cross-tenant failure trong APIs đã implement.
- no secret scan finding.
- Sprint Review demo accepted.
