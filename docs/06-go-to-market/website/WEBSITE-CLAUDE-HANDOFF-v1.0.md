# VWork Website — Claude Implementation Handoff v1.0

## Mission

Implement the VWork public website and trolycongchuc.vn in `apps/web` from the approved Golden Images and canonical specifications.

Do not redesign the UI. Reproduce it faithfully, then make it responsive.

## Read before coding

Required:
1. `docs/00-product/VWORK-MASTER-PRODUCT-SPEC-v0.3.md`
2. `docs/06-go-to-market/VWORK-WEBSITE-PLAN-v1.0.md`
3. `docs/06-go-to-market/website/README.md`
4. `docs/06-go-to-market/website/WEBSITE-SCREEN-CATALOG-v1.0.md`
5. `docs/06-go-to-market/website/WEBSITE-CODE-STRUCTURE-v1.0.md`
6. Golden images under `apps/web/public/golden/marketing/`
7. Product Golden Image Pack under `docs/04-design/golden-images/`

## Approved source graphics

### VWork
Use the supplied official VWork logo:
- V gradient mark.
- Wordmark “VWork”.
- Tagline “Trợ lý công việc thông minh”.

Do not recreate the logo in CSS/SVG from memory.

### trolycongchuc.vn
Use the supplied official logo:
- human/document/leaf symbol;
- wordmark `trolycongchuc.vn`;
- tagline “Trợ lý công chức”.

Do not replace it with a red government-style VWork wordmark.

## Visual rules

1. Both sites belong to the same product family.
2. VWork: navy + electric blue + cyan, clean enterprise/AI look.
3. trolycongchuc.vn: keep blue/green identity from official logo.
4. Government context may use official/public-service imagery, but the website must still look like a modern software product.
5. White/light backgrounds dominate.
6. Use generous spacing.
7. Minimal soft shadow.
8. Avoid nested cards.
9. Use real product screenshots from Golden Screen Pack wherever available.
10. Avoid generic AI brain/robot artwork.

## Homepage implementation order

### Sprint W0 — Foundation
- marketing tokens;
- responsive container/grid;
- typography;
- header/footer;
- Button;
- SectionHeading;
- MetricStrip;
- WorkflowCard;
- image/screenshot wrapper;
- content/config model.

### Sprint W1 — WEB-MKT-01
Implement VWork homepage section-by-section:
1. Header.
2. Hero.
3. Outcome strip.
4. Workflow cards.
5. Product interface gallery.
6. Trust/audience.
7. AI/Knowledge.
8. Executive intelligence.
9. Deployment.
10. Security.
11. Final CTA.
12. Footer.

### Sprint W2 — WEB-GOV-01
Reuse common primitives and implement:
1. Government header.
2. Government hero.
3. Outcome strip.
4. Public-sector workflows.
5. Work-context/testimonial section.
6. Organization-level deployment.
7. AI/knowledge.
8. Security.
9. Pilot CTA.
10. Footer.

### Sprint W3 — Responsive
- 1280–1440 desktop;
- 768–1024 tablet;
- 390–430 mobile;
- mobile navigation;
- no horizontal scroll;
- image recomposition/cropping;
- section spacing reduction;
- cards collapse 5→2→1 columns as appropriate.

### Sprint W4 — Conversion
- demo form;
- validation;
- API route;
- success state;
- analytics events;
- privacy consent text.

### Sprint W5 — P1 pages
Proceed in Screen Catalog order.

## Content rules

Do not invent:
- customer names;
- testimonials;
- percentages;
- government certifications;
- compliance badges;
- deployment claims.

Where Golden Image contains illustrative percentages/testimonials not yet verified:
- move values into content config;
- annotate as placeholder;
- do not present as factual production proof until approved.

## Engineering rules

- TypeScript strict.
- Server Components by default.
- Client Components only when interaction requires them.
- No UI library unless already approved.
- Prefer CSS variables + CSS modules/global tokens or project-standard styling.
- Avoid inline styles for final implementation.
- No duplicate markup per breakpoint.
- Images use Next/Image unless there is a technical reason not to.
- Keep copy in content files, not scattered across JSX.
- Each section should be independently testable.
- Preserve source attribution for product screenshots where required.

## Host routing

Expected behavior:
- VWork primary host root renders VWork homepage.
- `trolycongchuc.vn` root renders Government homepage using internal host rewrite.
- direct internal route `/tro-ly-cong-chuc` should remain testable in development.

## Required validation

Before PR:
```bash
pnpm --filter @vwork/web typecheck
pnpm --filter @vwork/web build
```

Visual QA:
- 1440px screenshot vs WEB-MKT-01.
- 1440px screenshot vs WEB-GOV-01.
- 390px mobile screenshots.
- check header, hero, first 3 sections at minimum against visual baseline.

## PR format

PR must include:
- implemented Screen IDs;
- routes;
- screenshots desktop/mobile;
- deviations from Golden Images;
- build/typecheck results;
- known gaps;
- no unrelated product-app changes.

## Exit gate

P0 website is ready when:
- WEB-MKT-01/02 pass visual QA;
- WEB-GOV-01/02 pass visual QA;
- demo form works;
- desktop/mobile responsive;
- correct official logos;
- no invented factual claims;
- build/typecheck pass.
