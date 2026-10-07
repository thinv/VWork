# VWork – Test Plan v1.0

## Phạm vi
Áp dụng Engineering Foundation và Core v1, dựa trên 124 FR, 94 NFR, 110 Business Rules, 96 Use Cases.

## Mục tiêu
- P0 flow hoạt động end-to-end.
- 0 cross-tenant leakage.
- 0 sai thẩm quyền phê duyệt.
- versioning/audit/provenance đúng.
- AI grounded use case đạt gate.
- migration/backup/recovery kiểm chứng được.

## Môi trường
CI: unit/lint/contract/static security.
TEST: integration/API.
STAGING: E2E/performance/security/AI qualification/UAT.
PROD: smoke/readiness.

## Test Suites
TS-01 Domain Unit
TS-02 API Functional
TS-03 DB/Migration
TS-04 Tenant Isolation
TS-05 Authorization
TS-06 Workflow/Approval
TS-07 Document/OCR
TS-08 Draft/Review AI
TS-09 Work/Task
TS-10 Reporting
TS-11 RAG/Knowledge
TS-12 Meeting/STT
TS-13 Mobile
TS-14 Performance
TS-15 Security
TS-16 Recovery/DR
TS-17 Deployment/Upgrade
TS-18 UAT

## Entry
Requirement ID, acceptance, API/data design, build deployable, test data, known limitations.

## Exit
- 100% P0 planned tests executed.
- 100% P0 requirement có evidence.
- 0 S0/S1 open.
- security/tenant/migration gates PASS.
- AI P0 evaluation PASS.
- UAT critical journeys PASS.

## Regression
PR: unit + affected integration + contract + tenant/authz smoke.
Main: full unit/integration + OpenAPI lint + migration + static security + key E2E.
Release: P0 E2E + AI eval + performance + DAST + UAT.

## Test Data
Synthetic mặc định; Tenant A/B bắt buộc; golden Vietnamese docs; reporting data complete/missing/duplicate/outlier; adversarial prompt-injection files; không dùng production secret.

## Defect
S0: leak/data loss/wrong approval.
S1: P0 unusable.
S2: significant có workaround.
S3: minor.

## Sprint 1 Focus
Toolchain, health endpoints, tenant context, Migration 0001, document/task skeleton, OpenAPI contract và CI gates.
