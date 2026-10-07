# VWork

**VWork – Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh**

VWork phục vụ cơ quan, đơn vị và trước mắt ưu tiên UBND xã/phường, hỗ trợ chu trình: tiếp nhận tài liệu → AI đọc hiểu → tham mưu → soạn thảo → kiểm tra → trình/duyệt → giao việc → theo dõi → họp → tổng hợp báo cáo → kho tri thức → hỗ trợ lãnh đạo điều hành.

## Product Goals
- SaaS, Private Cloud hoặc On-Premise từ một core codebase.
- Multi-tenant by design.
- Web và Mobile là client chính thức.
- AI có grounding, provenance, guardrails và human review.
- Phát triển có truy vết Requirement → Design → Code → Test → UAT → Release.
- Hướng tới thực hành tương thích CMMI Development ML3; không tuyên bố maturity level nếu chưa appraisal chính thức.

## Engineering Baseline

### Stack
- Web: Next.js + React + TypeScript.
- Mobile: Expo / React Native + TypeScript.
- Core API: NestJS + Fastify + TypeScript.
- AI Orchestrator: FastAPI + Python 3.12.
- Monorepo: pnpm workspaces + Turborepo.
- Database: PostgreSQL.
- Object Storage: S3-compatible.
- Contracts: OpenAPI 3.1 + versioned events.

### Repository
- `apps/web/` – Web client.
- `apps/mobile/` – Mobile client.
- `services/core-api/` – Core business API.
- `services/ai-orchestrator/` – AI provider-neutral orchestration.
- `packages/contracts/` – shared contracts.
- `infra/db/migrations/` – physical database migrations.
- `docs/` – product, requirements, architecture, API, data, design, testing, CMMI.
- `.github/workflows/ci.yml` – CI qualification baseline.

## Local Foundation

Node.js 24+ và pnpm 9.15.4:

```bash
pnpm install
pnpm --filter @vwork/core-api dev
pnpm --filter @vwork/web dev
pnpm --filter @vwork/mobile dev
```

AI Orchestrator:

```bash
python -m pip install -e "./services/ai-orchestrator[dev]"
uvicorn app.main:app --app-dir services/ai-orchestrator --reload
```

Local infrastructure:

```bash
cd infra
POSTGRES_PASSWORD=local MINIO_ROOT_USER=vwork MINIO_ROOT_PASSWORD=localdev123 docker compose up -d
```

Không sử dụng các giá trị ví dụ trên cho môi trường thật.

## Core Scope
1. Identity & Organization
2. Document Management
3. Document Intelligence
4. AI Draft & Review
5. Incoming Document Processing
6. Work Case & Task
7. Workflow & Approval
8. Meeting Intelligence
9. Reporting & Data Consolidation
10. Templates & Knowledge
11. Executive Intelligence
12. Governance, Audit & Integration

## Engineering Process

```text
Research
→ Capability
→ Business Process
→ BRD
→ Use Case / Business Rule
→ FR/NFR / SRS
→ Data / API / Architecture / Screen
→ Code
→ Test
→ UAT
→ Release
```

## Current Milestone

**Engineering Foundation / Sprint 01**

Sprint 01 tập trung:
- monorepo/toolchain;
- CI;
- Migration 0001;
- Core API/AI/Web/Mobile skeleton;
- Tenant context;
- Document vertical slice;
- Work Case/Task vertical slice;
- traceability và P0 tests.

Theo dõi tại GitHub Issue #1.

## Baseline History
- v0.1 – Product & Documentation Foundation.
- v0.2 – Engineering Foundation (current).
