# VWork – Engineering Process Map v1.0

## Mục tiêu
Thiết lập quy trình phát triển có bằng chứng, tương thích định hướng CMMI-DEV ML3 nhưng tối ưu cho nhóm sản phẩm hiện đại.

## Lifecycle
Research → Product Boundary → Requirements → Architecture/Data/API/UI → Planning → Implementation → Verification → Validation/UAT → Release → Operation → Improvement.

## Process Areas
PROC-01 Requirements Management: baseline, traceability, change decision.
PROC-02 Technical Solution: architecture, ADR, data/API/UI design.
PROC-03 Project Planning: backlog, sprint, estimate, dependency, risk.
PROC-04 Configuration Management: Git, tags, migrations, API schema, prompt/model policy, release manifest.
PROC-05 Verification: unit/integration/contract/security/performance/AI evaluation.
PROC-06 Validation: UAT theo nghiệp vụ xã/phường.
PROC-07 Process & Product QA: audit quy trình và artifact.
PROC-08 Risk Management: risk register, owner, mitigation, trigger.
PROC-09 Measurement: lead time, defect escape, coverage, availability, AI quality, cost.
PROC-10 Decision Analysis: ADR/decision log cho lựa chọn có tác động lớn.

## Change Flow
1. Tạo Change Request.
2. Phân tích impact.
3. Product/Engineering/QA review.
4. Approve/Reject/Defer.
5. Cập nhật IDs và trace.
6. Implement.
7. Verify.
8. Baseline mới.

## Feature Flow
Ready:
- UC/FR.
- acceptance.
- API/data/screen.
- security impact.
- test notes.

Development:
- branch/PR.
- code.
- unit.
- docs/migration.

Review:
- code review.
- CI.
- security/contract.

Done:
- tests pass.
- trace updated.
- no blocker.
- demo evidence.

## Release Flow
Scope Freeze → RC Build → Migration/Contract Checks → Full P0 Regression → Security/AI/Performance Gates → UAT → Release Approval → Tag/Manifest → Deploy → Smoke → Monitoring → Review.

## Required Artifacts
Requirements baseline, Architecture baseline, Data/API/UI baseline, Sprint plan, Risk register, Test evidence, QA audit, Release manifest, Change log, Decision log.

## Roles
Product Owner: scope/value.
BA: process/rules/trace.
Architect: solution decisions.
Engineer: implementation.
QA: verification/evidence.
Security: security gates.
AI Lead: AI eval.
Release Manager: release baseline.

## Metrics
Requirement volatility, sprint predictability, cycle time, escaped defects, S0/S1 count, P0 trace coverage, flaky tests, deployment frequency, rollback rate, AI groundedness/citation accuracy.
