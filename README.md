# VWork

**VWork – Nền tảng Văn phòng và Tham mưu thông minh**

VWork là nền tảng phần mềm phục vụ cơ quan, đơn vị và trước mắt ưu tiên UBND xã/phường, hỗ trợ toàn bộ chu trình: tiếp nhận tài liệu → AI đọc hiểu → tham mưu → soạn thảo → kiểm tra → trình/duyệt → giao việc → theo dõi → họp → tổng hợp báo cáo → kho tri thức.

## Mục tiêu
- Đóng gói thành sản phẩm có thể cung cấp theo SaaS, Private Cloud hoặc On-Premise.
- Thiết kế multi-tenant ngay từ đầu.
- Có Web và Mobile là hai client chính thức.
- Phát triển theo quy trình có truy vết yêu cầu–thiết kế–mã nguồn–kiểm thử–nghiệm thu.
- Hướng tới tương thích thực hành CMMI Development ML3; không tuyên bố mức trưởng thành nếu chưa appraisal chính thức.
- Hồ sơ kỹ thuật được tổ chức để có thể phục vụ chào bán, thuê dịch vụ CNTT, triển khai và nghiệm thu trong khu vực công.

## Core Scope
1. Tiếp nhận tài liệu
2. AI đọc hiểu văn bản
3. AI tham mưu
4. AI soạn thảo
5. AI kiểm tra văn bản
6. Kho mẫu & kho tri thức
7. Giao việc & theo dõi
8. Họp & biên bản
9. Tổng hợp báo cáo
10. Quản trị nền tảng

## Cấu trúc repository
- `docs/`: hồ sơ đề án, yêu cầu, kiến trúc, thiết kế, dữ liệu, API, AI, an toàn, kiểm thử, DevOps, CMMI, triển khai/nghiệm thu.
- `apps/web/`: ứng dụng Web.
- `apps/mobile/`: ứng dụng Mobile.
- `services/core-api/`: dịch vụ nghiệp vụ lõi.
- `services/ai-orchestrator/`: AI Gateway/Orchestrator, RAG, prompt/model governance.
- `packages/contracts/`: schema/API/event contracts dùng chung.
- `infra/`: hạ tầng, môi trường, IaC, CI/CD, quan sát hệ thống.

## Nguyên tắc
Mọi thay đổi chức năng phải có truy vết tối thiểu:

`Business Need → Use Case → Requirement → Screen/API/Data → Code → Test Case → UAT → Release`

## Baseline
Baseline khởi tạo: **v0.1 – Product & Documentation Foundation**.
