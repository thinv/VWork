# VWork – Thuyết minh kỹ thuật v1.0

## 1. Tổng quan giải pháp
VWork được thiết kế theo kiến trúc nền tảng nhiều lớp, tách client, nghiệp vụ, AI, dữ liệu và tích hợp. Kiến trúc cho phép cùng một core codebase phục vụ SaaS, Private và On-Premise.

## 2. Kiến trúc logic
```text
Web App          Mobile App
   \               /
        API Gateway
             |
      Identity & IAM
             |
   Core Business Services
             |
   +---------+----------+
   |                    |
Workflow/Task       Document Service
   |                    |
   +---------+----------+
             |
      AI Orchestrator
   +----+----+----+----+
  LLM  OCR  STT  RAG  Rules
             |
       Knowledge Layer
             |
Operational DB / Object Storage / Search / Vector Index / Audit Log
```

## 3. Nguyên tắc kiến trúc
- API-first.
- Multi-tenant-by-design.
- Zero trust giữa các lớp nhạy cảm.
- Idempotency cho các tác vụ dài.
- Async job cho OCR/STT/LLM/report generation.
- Audit bất biến cho hành động quan trọng.
- Model/provider abstraction để tránh khóa nhà cung cấp AI.
- Có degradation mode khi AI provider lỗi.

## 4. Web
Web phục vụ nghiệp vụ đầy đủ: văn bản, tham mưu, editor, kiểm tra, công việc, họp, báo cáo, tri thức, quản trị.

## 5. Mobile
Mobile ưu tiên lãnh đạo và xử lý nhanh: inbox, tóm tắt, duyệt, giao việc, theo dõi, thông báo, họp, hỏi đáp trên hồ sơ.

## 6. Tầng AI
AI Gateway quản lý provider/model; Orchestrator quản lý workflow; RAG truy xuất tri thức theo tenant; Prompt Registry quản lý phiên bản; Evaluation đo groundedness/accuracy; Guardrails kiểm soát PII, prompt injection, dữ liệu ngoài phạm vi.

## 7. Dữ liệu
Các miền chính: Tenant, Organization, Identity, Document, Draft, Template, Knowledge, Task, Meeting, Report, AI Run, Audit, Notification, Integration.

## 8. An toàn
RBAC kết hợp data scope; tenant isolation; mã hóa truyền/lưu trữ; secrets management; audit; backup; retention; kiểm thử phân quyền; chống tải file độc hại; rate limit.

## 9. Khả năng tích hợp
REST/OpenAPI; webhook/event; SSO khi khách hàng yêu cầu; ký số/văn bản điện tử/hệ thống nghiệp vụ bên ngoài được tích hợp qua adapter, không hard-code vào core.

## 10. Chất lượng phần mềm
Mỗi release phải qua: lint/static analysis → unit → integration → API contract → security → performance → UAT. Các yêu cầu được truy vết tới test và release.

## 11. Phi chức năng sơ bộ
- Sẵn sàng mở rộng ngang ở API/job worker.
- Tác vụ AI dài không khóa giao diện.
- Có retry/backoff/dead-letter.
- Có observability cho log, metric, trace.
- Backup/restore có kiểm thử.
- Thiết kế HA tùy tier triển khai.

## 12. Chuẩn hồ sơ
Hồ sơ dự án được tổ chức để hỗ trợ quy trình phát triển phần mềm có bằng chứng, quản lý cấu hình, QA, rủi ro, đo lường và truy vết theo định hướng CMMI Development ML3.
