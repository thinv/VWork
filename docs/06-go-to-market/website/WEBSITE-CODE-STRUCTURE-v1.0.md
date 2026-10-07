# VWork Website — Code Structure v1.0

## 1. Architecture decision

Giữ **một Next.js app** tại `apps/web`.

Hai website dùng chung:
- tokens;
- typography;
- layout primitives;
- buttons;
- navigation;
- cards;
- icon system;
- CTA;
- form;
- SEO utilities;
- analytics hooks.

Nhưng tách:
- brand config;
- logo;
- copy;
- hero;
- navigation labels;
- sections đặc thù;
- route tree.

## 2. Proposed repository structure

```text
apps/web/
├─ public/
│  ├─ brand/
│  │  ├─ vwork/
│  │  │  ├─ logo-primary.png
│  │  │  ├─ logo-mark.png
│  │  │  └─ favicon.png
│  │  └─ trolycongchuc/
│  │     ├─ logo-primary.png
│  │     ├─ app-icon.png
│  │     └─ favicon.png
│  ├─ golden/
│  │  └─ marketing/
│  │     ├─ WEB-MKT-01-vwork-homepage-desktop.png
│  │     └─ WEB-GOV-01-trolycongchuc-homepage-desktop.png
│  ├─ screenshots/
│  │  └─ product/
│  │     ├─ home/
│  │     ├─ work-inbox/
│  │     ├─ advisory/
│  │     ├─ document-review/
│  │     ├─ incoming-document/
│  │     ├─ meeting/
│  │     ├─ reporting/
│  │     ├─ ask-vwork/
│  │     ├─ knowledge/
│  │     └─ executive/
│  └─ images/
│     ├─ vwork/
│     └─ government/
│
├─ src/
│  ├─ app/
│  │  ├─ (marketing)/
│  │  │  ├─ layout.tsx
│  │  │  ├─ page.tsx
│  │  │  ├─ san-pham/page.tsx
│  │  │  ├─ nghiep-vu/
│  │  │  │  ├─ van-ban/page.tsx
│  │  │  │  ├─ tham-muu/page.tsx
│  │  │  │  ├─ hoan-thien-van-ban/page.tsx
│  │  │  │  ├─ hop/page.tsx
│  │  │  │  └─ bao-cao/page.tsx
│  │  │  ├─ ai-tri-thuc/page.tsx
│  │  │  ├─ lanh-dao/page.tsx
│  │  │  ├─ trien-khai/page.tsx
│  │  │  ├─ an-toan-du-lieu/page.tsx
│  │  │  ├─ tai-nguyen/page.tsx
│  │  │  ├─ ve-dcv/page.tsx
│  │  │  └─ dang-ky-demo/page.tsx
│  │  │
│  │  ├─ tro-ly-cong-chuc/
│  │  │  ├─ layout.tsx
│  │  │  ├─ page.tsx
│  │  │  ├─ van-ban-tham-muu/page.tsx
│  │  │  ├─ cong-viec-hop/page.tsx
│  │  │  ├─ bao-cao-dieu-hanh/page.tsx
│  │  │  ├─ ai-tri-thuc/page.tsx
│  │  │  ├─ trien-khai/page.tsx
│  │  │  ├─ tai-nguyen/page.tsx
│  │  │  └─ dang-ky-demo/page.tsx
│  │  │
│  │  ├─ api/
│  │  │  └─ demo-request/route.ts
│  │  └─ globals.css
│  │
│  ├─ components/
│  │  └─ marketing/
│  │     ├─ shared/
│  │     │  ├─ SiteHeader.tsx
│  │     │  ├─ SiteFooter.tsx
│  │     │  ├─ Container.tsx
│  │     │  ├─ SectionHeading.tsx
│  │     │  ├─ HeroActions.tsx
│  │     │  ├─ MetricStrip.tsx
│  │     │  ├─ WorkflowCard.tsx
│  │     │  ├─ ProductScreenshot.tsx
│  │     │  ├─ DeploymentCard.tsx
│  │     │  ├─ SecurityItem.tsx
│  │     │  ├─ DemoForm.tsx
│  │     │  └─ ResponsiveNav.tsx
│  │     ├─ vwork/
│  │     │  ├─ VWorkHero.tsx
│  │     │  ├─ VWorkWorkflowSection.tsx
│  │     │  ├─ VWorkProductScreens.tsx
│  │     │  └─ VWorkTrustSection.tsx
│  │     └─ government/
│  │        ├─ GovernmentHero.tsx
│  │        ├─ GovernmentWorkflowSection.tsx
│  │        ├─ GovernmentUseCases.tsx
│  │        ├─ GovernmentDeployment.tsx
│  │        └─ GovernmentTrustSection.tsx
│  │
│  ├─ content/
│  │  └─ marketing/
│  │     ├─ vwork.ts
│  │     ├─ government.ts
│  │     ├─ workflows.ts
│  │     └─ navigation.ts
│  │
│  ├─ config/
│  │  └─ marketing/
│  │     ├─ brands.ts
│  │     ├─ routes.ts
│  │     └─ seo.ts
│  │
│  ├─ lib/
│  │  └─ marketing/
│  │     ├─ analytics.ts
│  │     ├─ metadata.ts
│  │     └─ host-routing.ts
│  │
│  └─ styles/
│     └─ marketing/
│        ├─ tokens.css
│        ├─ typography.css
│        └─ utilities.css
│
└─ middleware.ts
```

## 3. Domain routing

Recommended:

```text
vwork master domain /
→ /(marketing)/page.tsx

trolycongchuc.vn /
→ internal rewrite /tro-ly-cong-chuc
```

Use `middleware.ts` host-based rewrite. Do **not** duplicate source tree into another Next app unless deployment constraints later require it.

## 4. Brand configuration

```ts
type MarketingBrand = {
  id: "vwork" | "trolycongchuc";
  name: string;
  logo: string;
  theme: "vwork" | "government";
  primaryCta: string;
  homePath: string;
};
```

All shared components receive brand/theme through props or context.

## 5. Design tokens

Token groups:
- color.brand.primary
- color.brand.secondary
- color.text.primary
- color.text.secondary
- color.surface
- color.surface.soft
- radius.sm/md/lg/xl
- shadow.soft
- spacing section/container/grid
- typography display/h1/h2/h3/body/caption

Do not scatter raw values across components.

## 6. Existing product app protection

Current `apps/web/src/app/page.tsx` is an engineering skeleton.

Before implementation:
1. preserve it in git history;
2. replace root page only when marketing route baseline is ready;
3. product application screens should eventually live behind authenticated route group, e.g. `/(app)`;
4. do not mix marketing Header/Footer with authenticated AppShell.
