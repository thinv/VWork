# VWork — Master Product Specification v0.3

**Status:** Product Baseline  
**Date:** 07/10/2026  
**Repository:** `thinv/VWork`

## 1. Product identity

**Official product name:** VWork  
**Positioning:** Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh.  
**Short positioning:** Trợ lý công việc thông minh.

VWork là nền tảng AI hỗ trợ cơ quan, tổ chức và doanh nghiệp xử lý toàn bộ vòng đời công việc văn phòng: tiếp nhận thông tin, đọc hiểu, tham mưu, soạn thảo, kiểm tra, phê duyệt, giao việc, họp, báo cáo, quản lý tri thức và hỗ trợ lãnh đạo điều hành.

### Government vertical
- `trolycongchuc.vn` là mặt tiền truyền thông/triển khai cho vertical Government.
- VWork vẫn là thương hiệu nền tảng lõi.
- Thông điệp Government: **VWork – Trợ lý Công chức thông minh**.

## 2. Product vision

VWork hướng tới mô hình:
- Mỗi cán bộ có một trợ lý hỗ trợ công việc.
- Mỗi đơn vị có một kho tri thức dùng chung.
- Mỗi lãnh đạo có một công cụ hỗ trợ nắm tình hình và ra quyết định.
- Luồng giá trị: **Thông tin → Tri thức → Tham mưu → Hành động**.

## 3. Target users

### Government
- Cán bộ/công chức/chuyên viên.
- Văn thư.
- Chuyên viên tham mưu.
- Lãnh đạo phòng/ban.
- Lãnh đạo UBND xã/phường.
- Quản trị hệ thống.

### Enterprise / Organization
- Nhân viên nghiệp vụ.
- Văn phòng điều hành.
- Quản lý cấp trung.
- Ban lãnh đạo.
- Quản trị CNTT.

## 4. Core business journey

```text
Tiếp nhận thông tin/tài liệu
→ AI đọc hiểu & phân loại
→ Tóm tắt / bóc tách yêu cầu
→ Tra cứu tri thức liên quan
→ Tham mưu phương án xử lý
→ Soạn thảo / hoàn thiện văn bản
→ Con người kiểm tra & duyệt
→ Giao việc / phối hợp thực hiện
→ Theo dõi tiến độ / cảnh báo
→ Họp / kết luận / giao nhiệm vụ
→ Tổng hợp báo cáo
→ Cập nhật kho tri thức
→ Lãnh đạo nắm tình hình & điều hành
```

## 5. Core capability map

1. Identity & Organization
2. Home / Service Launcher
3. Unified Work Inbox
4. Document Management
5. Document Intelligence
6. AI Advisory / Tham mưu
7. AI Draft & Review
8. Incoming Document Processing
9. Work Case & Task
10. Workflow & Approval
11. Meeting Intelligence
12. Reporting & Data Consolidation
13. Ask VWork
14. Templates & Knowledge
15. Executive Intelligence
16. Notifications & Reminders
17. Search
18. Integration Hub
19. Governance, Audit & Security
20. System Administration

## 6. Functional specification by module

### 6.1 Home / Service Launcher
- Hiển thị các dịch vụ chính theo vai trò.
- Việc cần xử lý hôm nay.
- Văn bản mới / việc quá hạn / cuộc họp sắp tới.
- Shortcut đến các tác vụ AI.
- Daily Brief theo vai trò.
- Không tạo theme riêng cho từng module; dùng AppShell thống nhất.

### 6.2 Unified Work Inbox — Việc của tôi
- Hợp nhất văn bản, công việc, phê duyệt, yêu cầu phối hợp, thông báo.
- Lọc theo nguồn, mức độ ưu tiên, hạn xử lý, trạng thái.
- AI gợi ý thứ tự ưu tiên.
- Batch action với các thao tác hợp lệ theo quyền.
- Luôn bảo toàn nguồn sở hữu của bản ghi tích hợp bên ngoài.

### 6.3 Document Management
- Quản lý văn bản đến/đi/nội bộ.
- Metadata, số ký hiệu, cơ quan ban hành, độ khẩn, độ mật, hạn xử lý.
- Phiên bản, file đính kèm, liên kết hồ sơ.
- Tìm kiếm nội dung và metadata.
- Lịch sử thay đổi, audit trail.

### 6.4 Document Intelligence
- OCR/parse tài liệu.
- Tóm tắt.
- Trích xuất chủ thể, thời hạn, nhiệm vụ, căn cứ, đơn vị liên quan.
- Phân loại tài liệu.
- Phát hiện điểm cần xử lý.
- Gắn provenance cho mọi kết quả AI.
- Cho phép người dùng mở nguồn dẫn.

### 6.5 Tham mưu văn bản
- AI đọc hồ sơ/văn bản nguồn.
- Tìm căn cứ từ kho tri thức.
- Gợi ý mục tiêu xử lý.
- Đề xuất phương án và ưu/nhược điểm.
- Dự thảo ý kiến tham mưu.
- Người dùng chỉnh sửa trước khi trình.
- Lưu nguồn, prompt context, version và lịch sử review.

### 6.6 Hoàn thiện / rà soát văn bản
- Kiểm tra cấu trúc, thể thức, logic, tính nhất quán.
- Kiểm tra căn cứ và trích dẫn.
- So sánh phiên bản.
- Suggestion mode / accept-reject.
- Kiểm tra lỗi diễn đạt và nội dung mâu thuẫn.
- Human review là bước bắt buộc với đầu ra dùng để ban hành.

### 6.7 Xử lý văn bản đến
- Tiếp nhận từ hệ thống nội bộ hoặc tích hợp.
- AI đọc hiểu và tóm tắt.
- Gợi ý đơn vị/chuyên viên xử lý.
- Gợi ý hạn xử lý.
- Tham mưu bước tiếp theo.
- Trình lãnh đạo phân công.
- Theo dõi hoàn thành và liên kết nhiệm vụ.

### 6.8 Work Case & Task
- Hồ sơ công việc/case.
- Task/subtask.
- Assignee/owner/collaborator.
- Deadline, priority, dependency.
- SLA, cảnh báo chậm.
- Timeline hoạt động.
- Đính kèm văn bản, cuộc họp, báo cáo.
- AI tổng hợp trạng thái.

### 6.9 Workflow & Approval
- Quy trình configurable.
- Step theo vai trò/đơn vị.
- Approve/reject/request changes.
- Delegate khi được phép.
- SLA theo bước.
- Nhật ký phê duyệt.
- Hỗ trợ quy trình nội bộ và quy trình liên thông.

### 6.10 Trợ lý cuộc họp
- Chuẩn bị agenda và hồ sơ cuộc họp.
- Tóm tắt tài liệu trước họp.
- Ghi nhận nội dung/transcript khi có nguồn dữ liệu.
- Tóm tắt cuộc họp.
- Trích xuất kết luận và nhiệm vụ.
- Giao việc từ biên bản/kết luận.
- Theo dõi hậu họp.

### 6.11 Tổng hợp báo cáo
- Thu thập số liệu/nội dung từ đơn vị.
- Theo dõi tình trạng nộp báo cáo.
- Chuẩn hóa biểu mẫu.
- AI tổng hợp nội dung.
- Phát hiện thiếu/mâu thuẫn.
- Sinh bản nháp báo cáo.
- Drill-down đến nguồn.

### 6.12 Hỏi VWork
- Hỏi đáp trên dữ liệu được cấp quyền.
- RAG / retrieval có nguồn.
- Hỗ trợ hỏi theo tài liệu, hồ sơ, công việc, cuộc họp, báo cáo.
- Không trả lời vượt quyền dữ liệu.
- Hiển thị citation/provenance.
- Có guardrails và policy kiểm soát.

### 6.13 Kho mẫu & Tri thức
- Kho mẫu văn bản, biểu mẫu, quy trình.
- Kho quy định/quy chế/tài liệu tham chiếu.
- Versioning.
- Phân quyền truy cập.
- Metadata, taxonomy, tag.
- Ingestion pipeline.
- Chunking / embedding / indexing.
- Phê duyệt nội dung tri thức.
- Knowledge lifecycle.

### 6.14 Executive Intelligence / Daily Brief
- Tổng hợp việc nổi bật.
- Văn bản cần duyệt.
- Công việc quá hạn/rủi ro.
- Cuộc họp và quyết định cần theo dõi.
- Báo cáo theo đơn vị/chủ đề.
- AI briefing có nguồn.
- Drill-down từ chỉ số về bản ghi gốc.

### 6.15 Admin / Integration / Governance
- Quản lý tenant, đơn vị, người dùng, vai trò.
- RBAC/ABAC theo baseline kỹ thuật.
- Integration connector.
- Model/provider configuration.
- Audit log.
- AI policy/guardrail.
- Template/configuration.
- Data retention.
- System health và vận hành.

## 7. AI architecture requirements

### Principles
- Provider-neutral.
- Grounded AI.
- Provenance / citations.
- Human-in-the-loop.
- Guardrails.
- Observability.
- Prompt/version governance.
- Evaluation before release.

### AI flows
1. Intake → parse → classify → extract.
2. Retrieve → rank → ground.
3. Generate → cite → guardrail.
4. Human review → approve/use.
5. Feedback → evaluation → optimization.

### AI service baseline
- AI Orchestrator: FastAPI + Python 3.12.
- LLM gateway/provider abstraction.
- RAG service.
- Embedding/vector retrieval.
- Evaluation.
- Safety/guardrail.
- Prompt registry.
- Model registry/config.
- Audit/usage metrics.

## 8. Knowledge architecture

```text
Source
→ Ingestion
→ Parse/OCR
→ Metadata
→ Chunking
→ Validation
→ Approval
→ Embedding/Indexing
→ Knowledge Store
→ Retrieval
→ Rerank
→ Context Pack
→ Ask/Advisory/Drafting
```

Knowledge must respect tenant, organization, classification and user permissions.

## 9. Technical baseline

- Web: Next.js + React + TypeScript.
- Mobile: Expo / React Native + TypeScript.
- Core API: NestJS + Fastify + TypeScript.
- AI Orchestrator: FastAPI + Python 3.12.
- Monorepo: pnpm workspaces + Turborepo.
- Database: PostgreSQL.
- Object Storage: S3-compatible.
- Contracts: OpenAPI 3.1 + versioned events.
- Deployment: SaaS / Private Cloud / On-Premise.
- Multi-tenant by design.

## 10. Security & governance

- Tenant isolation.
- Role/permission enforcement.
- Data classification.
- Authentication/SSO integration readiness.
- Encryption in transit/at rest according to deployment baseline.
- Audit all material actions.
- AI access never bypasses application authorization.
- Source ownership must be visible for integrated data.
- Human approval for high-impact generated output.
- Traceability Requirement → Design → Code → Test → UAT → Release.

## 11. Golden Image Pack — visual baseline

### Batch 01
- GS-WEB-01 — Home / Service Launcher (**style anchor**)
- GS-WEB-02 — Unified Work Inbox
- GS-WEB-04 — Tham mưu văn bản
- GS-WEB-05 — Hoàn thiện văn bản
- GS-WEB-06 — Xử lý văn bản đến

### Batch 02
- GS-WEB-07 — Trợ lý cuộc họp
- GS-WEB-08 — Tổng hợp báo cáo
- GS-WEB-09 — Hỏi VWork
- GS-WEB-10 — Kho mẫu & Tri thức
- GS-WEB-11 — Điều hành / Daily Brief
- GS-WEB-12 — Quản trị tích hợp & chế độ

### UI implementation rules
- GS-WEB-01 là shell/style anchor.
- Dùng chung AppShell, typography, spacing, cards, buttons, source badges, AI patterns và navigation.
- Không tạo theme riêng cho từng phân hệ.
- Mockup quyết định composition/style; Screen Spec quyết định behavior/state/permission/API.
- Business/security requirement luôn ưu tiên hơn text sinh tự động trong mockup.

## 12. Canonical web information architecture

### Product app
- Home
- Việc của tôi
- Văn bản
- Tham mưu
- Soạn thảo & hoàn thiện
- Công việc
- Họp
- Báo cáo
- Hỏi VWork
- Kho mẫu & Tri thức
- Điều hành
- Thông báo
- Quản trị

### External product website
- Trang chủ
- Sản phẩm
- Giải pháp
- Nghiệp vụ
- AI & Kho tri thức
- Dành cho lãnh đạo
- Triển khai
- An toàn & quản trị
- Tài nguyên
- Về DCV
- Liên hệ / Đăng ký demo

## 13. Government deployment positioning

`trolycongchuc.vn` phải diễn giải VWork bằng ngôn ngữ nghiệp vụ dễ hiểu cho lãnh đạo xã/phường, không trình bày như một catalog chức năng kỹ thuật.

Five primary scenarios:
1. Xử lý văn bản đến.
2. Tham mưu và soạn thảo văn bản.
3. Giao việc và theo dõi.
4. Họp và kết luận.
5. Tổng hợp báo cáo và lãnh đạo nắm tình hình.

Landing flow:
```text
Nỗi đau công việc
→ VWork giải quyết gì
→ 5 tình huống thực tế
→ Demo giao diện
→ AI hoạt động ra sao
→ Triển khai thế nào
→ An toàn dữ liệu
→ CTA đăng ký demo
```

## 14. Non-functional requirements

- Responsive web.
- Accessibility baseline.
- Fast navigation and perceived performance.
- Graceful empty/loading/error states.
- Observability.
- Backup/recovery appropriate to deployment.
- Horizontal scalability for core services.
- Configurable tenant-level features.
- Localization-ready.
- Mobile client supported as an official client.

## 15. Definition of Done for product features

A feature is not complete unless it has:
- requirement ID;
- screen/flow definition;
- permission rule;
- API/data contract;
- empty/loading/error states;
- audit requirement where relevant;
- AI provenance/guardrail where relevant;
- tests;
- UAT acceptance criteria;
- traceability entry.

## 16. Baseline precedence

When documents conflict, use this precedence:
1. Security and canonical business requirements.
2. This Master Product Specification v0.3.
3. Screen Specs / API / Data / Architecture specs.
4. Golden Image Pack for visual composition.
5. Generated mockup copy.

## 17. Immediate next product work

1. Complete full Screen Catalog with missing GS-WEB-03 and all non-golden operational screens.
2. Normalize requirement IDs and traceability.
3. Complete role/permission matrix.
4. Complete integration catalog.
5. Complete AI evaluation & guardrail spec.
6. Complete mobile Golden Screens.
7. Align `apps/web` implementation with Golden Image Pack.
8. Publish the product website baseline described in `VWORK-WEBSITE-PLAN-v1.0.md`.
