# VWork – Engineering Foundation v1.0

## 1. Stack baseline
Web: Next.js + React + TypeScript.  
Mobile: Expo/React Native + TypeScript.  
Core API: NestJS + Fastify + TypeScript.  
AI Orchestrator: Python 3.12 + FastAPI.  
Monorepo: pnpm workspaces + Turborepo.  
DB: PostgreSQL.  
Queue/cache: Redis-compatible baseline, broker abstraction cho production.  
Object storage: S3-compatible.  
Contracts: OpenAPI 3.1 + versioned event schemas.

## 2. Repo target
```text
apps/
  web/
  mobile/
services/
  core-api/
  ai-orchestrator/
packages/
  contracts/
  ui-web/
  config/
infra/
  db/migrations/
  docker/
docs/
.github/workflows/
```

## 3. Toolchain
- Node.js 24 LTS baseline.
- pnpm pinned bằng packageManager.
- Python 3.12.
- TypeScript strict.
- ESLint/Prettier.
- Ruff/Pytest.
- Turbo task graph.
- OpenAPI lint.
- migration smoke.
- secret/dependency scan.

## 4. Branching
main phải được bảo vệ khi đội bắt đầu phát triển nhiều người.  
Feature branch → PR → CI bắt buộc → review → merge.

## 5. Commit convention
feat, fix, docs, refactor, test, chore, ci, build.

## 6. Definition of Ready
- UC/FR/acceptance rõ.
- API/Data/Screen có baseline.
- security impact được xác định.
- test notes tồn tại.
- dependency/risk chính đã biết.

## 7. Definition of Done
- code.
- unit/integration.
- docs.
- traceability.
- migration/contract nếu cần.
- CI pass.
- review pass.
- không còn blocker.

## 8. First Vertical Slices
VS-01 Platform health/toolchain.  
VS-02 Tenant/Auth context.  
VS-03 Document upload/repository.  
VS-04 Work Case/Task.  
VS-05 Executive Inbox projection.  
VS-06 AI Orchestrator health/provider abstraction.

## 9. Architecture enforcement
- Core domain không import client.
- API DTO khác DB entity.
- AI không tự authorize.
- tenant context lấy server-side.
- async command có idempotency.
- versioned objects phải pin version.
- client không truyền role như nguồn tin cậy.

## 10. Engineering Gates
Pull Request:
- lint.
- typecheck.
- unit.
- OpenAPI lint.
- migration validation.
- secret/dependency scan.

Main:
- integration.
- contract.
- tenant isolation smoke.
- build artifacts.

Release:
- P0 E2E.
- security.
- performance.
- AI qualification.
- UAT.

## 11. Exit Criteria
- clean install.
- skeleton Web/Mobile/Core/AI build được.
- CI green.
- migration 0001 apply được trên DB sạch.
- OpenAPI lint pass.
- health endpoints pass.
- test baseline có trace.
- Sprint 1 backlog đủ Ready.
