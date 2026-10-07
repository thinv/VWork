# VWork Website Plan v1.0

**Date:** 07/10/2026  
**Purpose:** Website giới thiệu sản phẩm/dịch vụ VWork và Government vertical `trolycongchuc.vn`.

## 1. Website strategy

Website không được biến thành danh sách module. Mục tiêu chính là giúp một lãnh đạo hoặc người phụ trách chuyển đổi số hiểu trong 2–3 phút:
- VWork giải quyết vấn đề gì.
- VWork hỗ trợ quy trình công việc nào.
- AI hỗ trợ ở đâu và con người kiểm soát ở đâu.
- Có thể triển khai trong môi trường nào.
- Dữ liệu và quyền truy cập được kiểm soát ra sao.
- Làm thế nào để đăng ký demo/pilot.

## 2. Brand architecture

### Master brand
**VWork — Trợ lý công việc thông minh**

### Government entry
**trolycongchuc.vn — VWork, Trợ lý Công chức thông minh**

Government site dùng ngôn ngữ hành chính/nghiệp vụ; VWork master site dùng ngôn ngữ rộng hơn cho cơ quan và doanh nghiệp.

## 3. Primary audiences

1. Chủ tịch/Phó Chủ tịch UBND xã/phường.
2. Chánh/Phó văn phòng.
3. Cán bộ, công chức, chuyên viên.
4. Đơn vị CNTT/chuyển đổi số.
5. Cơ quan cấp trên/đơn vị triển khai.
6. Doanh nghiệp và tổ chức có nhu cầu văn phòng AI.

## 4. Website information architecture

### Level 1 navigation
- Trang chủ
- VWork là gì
- Nghiệp vụ
- Giải pháp
- AI & Tri thức
- Dành cho lãnh đạo
- Triển khai
- An toàn dữ liệu
- Tài nguyên
- Liên hệ

Primary CTA: **Đăng ký demo**  
Secondary CTA: **Xem VWork hoạt động**

## 5. Homepage structure

### Section 01 — Hero
Headline:
**VWork — Trợ lý công việc thông minh cho Văn phòng – Điều hành – Tham mưu**

Supporting message:
Mỗi cán bộ có một trợ lý hỗ trợ công việc. Mỗi đơn vị có một kho tri thức dùng chung. Mỗi lãnh đạo có công cụ hỗ trợ nắm tình hình và ra quyết định.

Visual: use Golden Image Pack, ưu tiên GS-WEB-01 + các crop có chủ đích từ GS-WEB-02/04/11.

CTA:
- Đăng ký demo.
- Xem quy trình thực tế.

### Section 02 — Why VWork
Pain points:
- Quá nhiều văn bản và đầu việc.
- Mất thời gian đọc, tìm tài liệu và tổng hợp.
- Tham mưu phụ thuộc kinh nghiệm cá nhân.
- Khó theo dõi kết luận và công việc liên phòng ban.
- Báo cáo mất nhiều vòng tổng hợp.
- Lãnh đạo thiếu một bức tranh cập nhật theo thời gian thực.

### Section 03 — One work cycle
Interactive/scroll story:
```text
Tiếp nhận
→ AI đọc hiểu
→ Tham mưu
→ Con người duyệt
→ Giao việc
→ Theo dõi
→ Họp
→ Báo cáo
→ Tri thức
→ Điều hành
```

### Section 04 — Five key scenarios
1. Xử lý văn bản đến.
2. Tham mưu văn bản.
3. Hoàn thiện văn bản.
4. Trợ lý cuộc họp.
5. Tổng hợp báo cáo.

Each scenario:
- Vấn đề.
- VWork hỗ trợ.
- Người dùng kiểm soát.
- Kết quả đầu ra.
- Screenshot Golden Screen.

### Section 05 — Ask VWork + Knowledge
Message:
“Không chỉ tìm kiếm tài liệu — hỏi trực tiếp kho tri thức được cấp quyền.”

Show:
- Ask VWork.
- Citation/source.
- Knowledge governance.
- Permission-aware retrieval.

### Section 06 — For leaders
Use GS-WEB-11.
Show:
- Daily Brief.
- Việc quá hạn.
- Văn bản chờ duyệt.
- Nhiệm vụ rủi ro.
- Cuộc họp/kết luận.
- Drill-down đến nguồn.

### Section 07 — AI with human control
Diagram:
```text
Dữ liệu được cấp quyền
→ Retrieval
→ AI xử lý
→ Nguồn/citation
→ Guardrail
→ Người dùng kiểm tra
→ Sử dụng/phê duyệt
```

Core statement: AI hỗ trợ, con người quyết định.

### Section 08 — Deployment
Cards:
- SaaS.
- Private Cloud.
- On-Premise.

Show one core codebase, tenant isolation and integration readiness.

### Section 09 — Security & governance
Avoid vague “an toàn tuyệt đối”.
Show concrete mechanisms:
- phân quyền;
- tenant isolation;
- audit;
- provenance;
- data ownership;
- AI không vượt quyền;
- human approval.

### Section 10 — Integrations
Explain categories, not unsupported logos:
- quản lý văn bản;
- SSO/identity;
- email/calendar;
- storage;
- reporting/data;
- AI providers;
- API/webhook.

### Section 11 — Pilot / onboarding
Proposed delivery flow:
1. Khảo sát.
2. Chuẩn hóa quy trình.
3. Kết nối dữ liệu.
4. Cấu hình VWork.
5. Pilot.
6. UAT.
7. Go-live.
8. Tối ưu.

### Section 12 — Final CTA
**Đăng ký một buổi demo theo quy trình thực tế của đơn vị.**

## 6. Product detail pages

### /san-pham
Overview of VWork platform and capability map.

### /nghiep-vu/van-ban
Incoming/outgoing documents, intelligence, advisory, drafting/review.

### /nghiep-vu/cong-viec
Unified Work Inbox, work case, task, workflow.

### /nghiep-vu/hop
Meeting preparation, summary, conclusions, tasks.

### /nghiep-vu/bao-cao
Collection, consolidation, AI drafting, source drill-down.

### /ai-tri-thuc
Ask VWork, RAG, source citation, knowledge lifecycle.

### /lanh-dao
Executive Intelligence / Daily Brief.

### /trien-khai
SaaS / Private Cloud / On-Premise and implementation process.

### /an-toan-du-lieu
Permissions, tenant isolation, audit, AI governance.

### /tro-ly-cong-chuc
Government-specific page and bridge to `trolycongchuc.vn`.

## 7. trolycongchuc.vn structure

For Government visitors, keep the top-level navigation shorter:
- Tổng quan
- Văn bản & Tham mưu
- Công việc & Họp
- Báo cáo & Điều hành
- AI & Kho tri thức
- Triển khai
- Đăng ký demo

Homepage priority:
1. Concrete problems of xã/phường.
2. Five real workflows.
3. Screenshots.
4. Clear explanation for non-technical leaders.
5. Deployment and security.
6. Demo/pilot CTA.

## 8. Visual direction

Use VWork Golden Image Pack as the visual source of truth.

Principles:
- Clean public-sector/enterprise aesthetic.
- White/light neutral background as primary.
- Navy/blue/teal family aligned with VWork identity.
- Strong hierarchy and generous whitespace.
- Real product UI screenshots, not generic AI illustrations.
- Diagram-first explanation for complex flows.
- No decorative 3D robots / generic “AI brain” imagery.
- Use GS-WEB-01 as the visual anchor.
- Screenshots should retain actual AppShell consistency.

## 9. Content tone

- Clear Vietnamese.
- Avoid technical jargon on primary landing pages.
- Explain benefits through actual tasks.
- Avoid claims not yet validated.
- Use “AI hỗ trợ / gợi ý / tổng hợp”, not “AI tự quyết định”.
- Always explain human review and source traceability.

## 10. Conversion model

Primary conversion:
**Demo request**

Secondary conversions:
- Download profile/sale kit.
- Request pilot.
- Contact implementation team.
- View product walkthrough.

Demo form minimum fields:
- Họ tên.
- Cơ quan/đơn vị.
- Chức vụ.
- Điện thoại/email.
- Nhu cầu chính.
- Preferred deployment if known.

## 11. SEO baseline

Primary topic clusters:
- trợ lý công việc AI;
- trợ lý công chức;
- AI văn phòng;
- AI tham mưu;
- xử lý văn bản bằng AI;
- tổng hợp báo cáo bằng AI;
- trợ lý lãnh đạo;
- kho tri thức AI;
- văn phòng số thông minh.

Government site should prioritize Vietnamese intent rather than generic “AI platform” terms.

## 12. Analytics / funnel

Track:
- hero CTA click;
- scenario interaction;
- product screenshot open;
- deployment section view;
- demo form start;
- demo form completion;
- resource download;
- outbound contact.

## 13. Implementation plan

### Phase 01 — Content & UX baseline
- Lock sitemap.
- Lock homepage narrative.
- Build copy deck.
- Select/crop Golden Screens.
- Define conversion events.

### Phase 02 — Visual design
- Desktop homepage.
- Mobile homepage.
- Product detail template.
- Scenario detail template.
- Government homepage.
- Demo form.
- Design tokens/components.

### Phase 03 — Build
Target repository: `apps/web`.
- Reusable website shell.
- SEO metadata/OpenGraph.
- Responsive components.
- CMS/content model or structured local content baseline.
- Analytics hooks.
- Form submission integration.
- Accessibility baseline.

### Phase 04 — Content population
- Product pages.
- Five scenarios.
- Government copy.
- Security/deployment pages.
- DCV company information and contact.

### Phase 05 — QA
- Responsive QA.
- Browser QA.
- Performance.
- Accessibility.
- SEO.
- Conversion tracking.
- Content/legal review.
- Security review for public forms.

### Phase 06 — Launch
Recommended domain topology:
- Product/master site: VWork master domain when finalized.
- Government landing: `trolycongchuc.vn`.
- App: `app.<domain>`.
- Demo: `demo.<domain>`.
- Docs: `docs.<domain>`.
- Admin: `admin.<domain>`.
- API: `api.<domain>`.

## 14. Design deliverables

1. Website sitemap.
2. Homepage wireframe.
3. Homepage Golden Mockup desktop.
4. Homepage Golden Mockup mobile.
5. Product detail template.
6. Scenario detail template.
7. Government landing Golden Mockup.
8. Component library.
9. Content/copy deck.
10. SEO metadata matrix.
11. Analytics event matrix.
12. Developer handoff.

## 15. Suggested website Golden Screens

- WEB-MKT-01 — VWork Homepage Desktop.
- WEB-MKT-02 — VWork Homepage Mobile.
- WEB-MKT-03 — Product Overview.
- WEB-MKT-04 — Scenario: Xử lý văn bản đến.
- WEB-MKT-05 — AI & Knowledge.
- WEB-MKT-06 — Executive Intelligence.
- WEB-GOV-01 — trolycongchuc.vn Homepage Desktop.
- WEB-GOV-02 — trolycongchuc.vn Homepage Mobile.
- WEB-GOV-03 — Government Scenario Detail.
- WEB-CTA-01 — Demo Request.

## 16. Acceptance criteria for website v1

The website is acceptable when:
- A non-technical leader can understand VWork's value without opening a technical deck.
- Five primary workflows are demonstrated with real UI.
- Brand relationship VWork ↔ trolycongchuc.vn is unambiguous.
- AI transparency/human control is clearly explained.
- Deployment options are clear.
- Demo CTA works on desktop/mobile.
- Public content contains no unsupported security/compliance claims.
- Pages meet responsive, SEO, accessibility and performance baseline.
