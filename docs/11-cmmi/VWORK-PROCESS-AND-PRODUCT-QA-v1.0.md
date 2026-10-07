# VWork – Process & Product Quality Assurance v1.0

## Mục tiêu
Đảm bảo đội VWork tuân thủ quy trình đã thống nhất và sản phẩm có đủ evidence trước khi merge/release.

## Vai trò QA
QA có quyền:
- ghi nhận non-compliance;
- yêu cầu corrective action;
- block release gate;
- kiểm tra artifact độc lập tương đối với người tạo artifact.

## Sprint Audit Checklist
- Requirement có ID.
- Có trace tới UC/FR.
- API/Data/Screen cập nhật nếu ảnh hưởng.
- Test case có trace.
- PR review đủ.
- CI pass.
- Migration reviewed.
- Security impact reviewed.
- Documentation updated.

## Artifact Review
Requirements: không orphan P0.
Architecture: ADR cho quyết định lớn.
API: OpenAPI lint + contract test.
Data: migration forward-safe + tenant isolation.
UI: Screen ID + states + accessibility.
AI: prompt/model version + evaluation.
Release: tag/commit + migration + contracts + evidence.

## Non-compliance
NC-1 Critical: security/data/release integrity.
NC-2 Major: process gap ảnh hưởng quality.
NC-3 Minor.

Flow: Open → Assign Owner → Corrective Action → Verify → Close.

## Release QA Gate
Block nếu:
- S0/S1 open.
- P0 trace gap.
- Critical/High security finding chưa xử lý hoặc chưa có formal acceptance.
- migration fail.
- OpenAPI breaking change không version.
- AI P0 evaluation fail.
- UAT critical fail.

## Mandatory 100% Review
- authorization/security.
- schema migration.
- workflow approval.
- reporting schema/aggregation.
- production AI prompt/model/provider change.
- release configuration.

## Evidence
Evidence lưu tại Git/CI/issues/releases và phải gắn commit SHA, environment, result và reviewer khi phù hợp.

## Metrics
- non-compliance count;
- recurrent non-compliance;
- escaped defects;
- failed release gates;
- evidence completeness;
- trace coverage;
- corrective action aging.
