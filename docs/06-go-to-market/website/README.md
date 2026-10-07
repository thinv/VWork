# VWork Website Design & Implementation Baseline

**Version:** v1.0  
**Date:** 07/10/2026  
**Status:** Ready for implementation handoff  
**Target app:** `apps/web`

## 1. Scope

Một codebase Next.js triển khai hai website:

1. **VWork master website**
   - Định vị: VWork – Trợ lý công việc thông minh.
   - Đối tượng: cơ quan, tổ chức, doanh nghiệp.
   - Visual direction: navy / cyan / white.

2. **trolycongchuc.vn**
   - Định vị: Trợ lý Công chức thông minh.
   - Đối tượng: UBND xã/phường, cơ quan nhà nước, đơn vị sự nghiệp.
   - Visual direction: dùng logo trolycongchuc.vn, giữ cùng design language với VWork; xanh dương/xanh lá là màu chính, không biến thành theme đỏ hành chính.

## 2. Golden visual source of truth

Golden desktop đã chốt theo mẫu giao diện:
- `WEB-MKT-01-vwork-homepage-desktop.png`
- `WEB-GOV-01-trolycongchuc-homepage-desktop.png`

Logo source:
- `vwork-logo-primary.png`
- `trolycongchuc-logo-primary.png`

> Golden Image quyết định composition, hierarchy, spacing, visual language.  
> Screen Spec quyết định route, behavior, content, responsive states, accessibility và acceptance criteria.

## 3. Documents Claude/Codex must read first

1. `docs/00-product/VWORK-MASTER-PRODUCT-SPEC-v0.3.md`
2. `docs/06-go-to-market/VWORK-WEBSITE-PLAN-v1.0.md`
3. `docs/06-go-to-market/website/WEBSITE-SCREEN-CATALOG-v1.0.md`
4. `docs/06-go-to-market/website/WEBSITE-CODE-STRUCTURE-v1.0.md`
5. `docs/06-go-to-market/website/WEBSITE-CLAUDE-HANDOFF-v1.0.md`
6. `docs/04-design/golden-images/README.md`

## 4. Implementation rule

Không được tự thiết kế lại Golden Image.

Claude/Codex phải:
- tái tạo chính xác layout/hierarchy;
- dùng responsive CSS thay vì tạo desktop/mobile code trùng lặp;
- dùng content/config tách biệt cho hai brand;
- không hardcode hàng loạt section trong một file;
- không tự thêm claim, logo đối tác, số liệu hoặc chứng nhận chưa được phê duyệt;
- tách marketing website khỏi product application shell hiện tại;
- giữ product app hiện có không bị phá vỡ.

## 5. Priority

### P0
- WEB-MKT-01 VWork Homepage
- WEB-GOV-01 trolycongchuc.vn Homepage
- responsive mobile states của hai homepage
- Demo request form
- shared marketing design system

### P1
- Product overview
- 5 nghiệp vụ chính
- AI & Tri thức
- Dành cho lãnh đạo
- Triển khai
- An toàn dữ liệu

### P2
- Tài nguyên
- Về DCV
- Case study / câu chuyện triển khai
- SEO landing pages

## 6. Definition of Done

Một màn chỉ được coi là DONE khi:
- đúng Golden composition;
- desktop + tablet + mobile hoạt động;
- không overflow;
- Lighthouse-friendly;
- semantic HTML;
- keyboard accessible;
- metadata/OG cơ bản;
- CTA hoạt động;
- content lấy từ cấu trúc dữ liệu chung;
- không làm ảnh hưởng product app;
- `pnpm --filter @vwork/web typecheck` PASS;
- build PASS.
