# VWork – Repository & Documentation Standard v1.0

## 1. Mục đích
Quy định cấu trúc repository, quy tắc đặt tên, quản lý phiên bản, truy vết và phê duyệt tài liệu của VWork.

## 2. Cấu trúc tài liệu
- 00-governance: quản trị baseline, change control, traceability.
- 01-proposal: đề án, thuyết minh kỹ thuật, phạm vi, mô hình thương mại.
- 02-requirements: BRD, quy trình nghiệp vụ, actor, use case, business rule, FR/NFR, SRS.
- 03-architecture: kiến trúc hệ thống, ứng dụng, dữ liệu, AI, bảo mật, tích hợp, triển khai.
- 04-design: screen catalog, wireframe, UI spec, design system.
- 05-data: domain model, data dictionary, ERD, database design.
- 06-api: API catalog, OpenAPI, integration contract.
- 07-ai: AI use case, RAG, prompt/model governance, evaluation, guardrails.
- 08-security: IAM, RBAC, bảo vệ dữ liệu, audit, security test.
- 09-testing: test strategy, plan, cases, performance, security, UAT.
- 10-devops: CI/CD, environments, release, backup/DR, monitoring.
- 11-cmmi: process map, traceability, configuration management, QA, risk, measurement.
- 12-deployment-acceptance: cài đặt, hướng dẫn, đào tạo, nghiệm thu, SLA.

## 3. Đặt tên
Tài liệu chuẩn: `VWORK-<TEN-TAI-LIEU>-v<major.minor>.md`.
ID yêu cầu: `REQ-xxx`; Use case: `UC-xxx`; màn hình Web: `WEB-xxx`; Mobile: `MOB-xxx`; API: `API-xxx`; quy tắc: `BR-xxx`; test: `TC-xxx`.

## 4. Truy vết bắt buộc
Mỗi yêu cầu phải liên kết được tới use case, màn hình/API, dữ liệu, test case và tiêu chí nghiệm thu.

## 5. Change control
Mọi thay đổi baseline phải ghi rõ: lý do, ảnh hưởng, tài liệu liên quan, backward compatibility và người phê duyệt.

## 6. Definition of Done
Một hạng mục chỉ Done khi: yêu cầu được duyệt; code review hoàn tất; test PASS; security/quality gate PASS; tài liệu cập nhật; traceability đầy đủ; release note có thay đổi.
