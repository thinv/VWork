# VWork Website — Screen Catalog v1.0

## 1. Screen conventions

- `WEB-MKT-*`: VWork master marketing site.
- `WEB-GOV-*`: trolycongchuc.vn.
- `WEB-SHARED-*`: reusable/shared journeys.
- Desktop/mobile are responsive states of the same route, not separate code pages.
- Golden IDs define visual acceptance references.

## 2. P0 — must implement first

| ID | Screen | Route | Brand | Golden | Priority |
|---|---|---|---|---|---|
| WEB-MKT-01 | VWork Homepage | `/` | VWork | Desktop approved | P0 |
| WEB-MKT-02 | VWork Homepage Mobile | responsive `/` | VWork | To generate | P0 |
| WEB-GOV-01 | Trợ lý Công chức Homepage | host root → `/tro-ly-cong-chuc` | Government | Desktop approved | P0 |
| WEB-GOV-02 | Trợ lý Công chức Homepage Mobile | responsive | Government | To generate | P0 |
| WEB-SHARED-01 | Đăng ký demo | `/dang-ky-demo` + government variant | Shared | To generate | P0 |
| WEB-SHARED-02 | Demo Success / Thank You | after submit | Shared | Spec only | P0 |
| WEB-SHARED-03 | Mobile Navigation Drawer | component state | Shared | To generate | P0 |

### WEB-MKT-01 sections
1. Header.
2. Hero.
3. Value proof / benefit strip.
4. 5 core workflows.
5. Product interface gallery.
6. Trust/audience strip.
7. Expanded cycle: Information → Knowledge → Advisory → Action.
8. AI & Knowledge.
9. Executive Intelligence.
10. Deployment.
11. Security/governance.
12. Final CTA.
13. Footer.

### WEB-GOV-01 sections
1. Header using trolycongchuc.vn logo.
2. Hero: Trợ lý Công chức thông minh.
3. Key outcome strip.
4. Government-oriented workflow section.
5. 5 administrative scenarios.
6. Real product UI / work context.
7. Leader/public-sector value.
8. Deployment by organization level.
9. AI + shared knowledge.
10. Data/security.
11. Pilot/demo.
12. Footer.

## 3. P1 — product explanation

| ID | Screen | Route | Purpose |
|---|---|---|---|
| WEB-MKT-03 | Product Overview | `/san-pham` | Explain full VWork platform |
| WEB-MKT-04 | Xử lý văn bản đến | `/nghiep-vu/van-ban` | Incoming document flow |
| WEB-MKT-05 | Tham mưu văn bản | `/nghiep-vu/tham-muu` | AI-supported advisory |
| WEB-MKT-06 | Hoàn thiện văn bản | `/nghiep-vu/hoan-thien-van-ban` | Review / finalization |
| WEB-MKT-07 | Trợ lý cuộc họp | `/nghiep-vu/hop` | Meeting lifecycle |
| WEB-MKT-08 | Tổng hợp báo cáo | `/nghiep-vu/bao-cao` | Reporting lifecycle |
| WEB-MKT-09 | AI & Kho tri thức | `/ai-tri-thuc` | RAG, citations, governance |
| WEB-MKT-10 | Dành cho lãnh đạo | `/lanh-dao` | Daily Brief / executive view |
| WEB-MKT-11 | Triển khai | `/trien-khai` | SaaS / Private Cloud / On-Prem |
| WEB-MKT-12 | An toàn dữ liệu | `/an-toan-du-lieu` | permission/audit/AI control |

## 4. P1 — Government vertical

| ID | Screen | Route | Purpose |
|---|---|---|---|
| WEB-GOV-03 | Văn bản & Tham mưu | `/tro-ly-cong-chuc/van-ban-tham-muu` | Public-sector document handling |
| WEB-GOV-04 | Công việc & Họp | `/tro-ly-cong-chuc/cong-viec-hop` | Assignment + meeting |
| WEB-GOV-05 | Báo cáo & Điều hành | `/tro-ly-cong-chuc/bao-cao-dieu-hanh` | Reporting + leadership |
| WEB-GOV-06 | AI & Kho tri thức | `/tro-ly-cong-chuc/ai-tri-thuc` | Permission-aware AI |
| WEB-GOV-07 | Triển khai | `/tro-ly-cong-chuc/trien-khai` | Pilot → UAT → Go-live |
| WEB-GOV-08 | Đăng ký demo/pilot | `/tro-ly-cong-chuc/dang-ky-demo` | Lead conversion |

## 5. P2 — supporting content

| ID | Screen | Route | Purpose |
|---|---|---|---|
| WEB-MKT-13 | Tài nguyên | `/tai-nguyen` | Documents/articles/videos |
| WEB-MKT-14 | Resource Detail | `/tai-nguyen/[slug]` | SEO/detail |
| WEB-MKT-15 | Về DCV | `/ve-dcv` | Developer/company info |
| WEB-MKT-16 | Contact | `/lien-he` | General contact |
| WEB-GOV-09 | Tài nguyên Government | `/tro-ly-cong-chuc/tai-nguyen` | Guides/briefs |
| WEB-GOV-10 | Câu chuyện triển khai | `/tro-ly-cong-chuc/cau-chuyen/[slug]` | Case study |
| WEB-SHARED-04 | 404 | route fallback | Friendly fallback |
| WEB-SHARED-05 | Legal / Privacy | `/privacy` | Public form policy |

## 6. P0 component states

Must implement and QA:
- sticky header / scrolled header;
- desktop navigation;
- mobile drawer open/closed;
- primary/secondary CTA hover/focus/disabled;
- demo form default/focus/error/submitting/success;
- image loading/fallback;
- accordion opened/closed;
- carousel/gallery controls if used;
- external link state;
- reduced-motion state.

## 7. Screen acceptance template

Each screen PR must document:
- Screen ID.
- Route.
- Golden reference.
- Components used.
- Content source.
- SEO title/description.
- Responsive behavior.
- Loading/error states where relevant.
- Analytics events.
- Accessibility check.
- Screenshot at 1440px and 390px.
