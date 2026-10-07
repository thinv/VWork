# VWork – CI/CD Baseline v1.0

## 1. Mục tiêu
Chuẩn hóa kiểm tra tự động và đường phát hành VWork từ Pull Request tới Production.

## 2. CI hiện thực
File: .github/workflows/ci.yml

Gate hiện có:
- pnpm install.
- Contracts typecheck.
- Core API typecheck.
- Web typecheck.
- Mobile typecheck.
- OpenAPI lint.
- Python 3.12 setup.
- AI Orchestrator install.
- Ruff.
- Pytest.

## 3. Gate bổ sung trong Sprint 1
- Migration 0001 trên PostgreSQL sạch.
- Core API unit/integration.
- Tenant isolation smoke.
- secret scan.
- dependency scan.
- build Web/Core.
- release manifest generation.

## 4. CD Stages
Build → Qualification → Package → Staging → UAT → Approval → Production → Smoke → Observe.

## 5. Release Artifact
Mỗi release phải xác định:
- Git SHA/tag.
- Web artifact/image.
- Core API image.
- Worker image khi có.
- AI Orchestrator image.
- Mobile build/version.
- Migration baseline.
- OpenAPI version.
- prompt/policy baseline.
- SBOM.
- test evidence.
- known issues.

## 6. Promotion
Không rebuild source giữa Staging và Production; promote cùng immutable artifact.

## 7. Deployment Strategy
- stateless: rolling baseline.
- high-risk: blue/green có thể bật.
- DB: expand/contract.
- rollback chỉ khi schema backward-compatible hoặc có recovery plan.

## 8. Environment Protection
Staging/Production dùng GitHub Environment hoặc cơ chế tương đương:
- required reviewer.
- secret scope riêng.
- deploy permissions.
- audit.

## 9. Production Deploy Workflow
Chưa bật tự động trong Foundation vì chưa có:
- container registry chính thức.
- staging/production target.
- environment credentials.
- approval policy cụ thể.

Khi ba thành phần trên được cung cấp, workflow CD chỉ được gọi từ qualified release artifact, không deploy trực tiếp từ source branch.

## 10. Release Gate
0 S0/S1, P0 regression PASS, security PASS, migration PASS, AI qualification PASS với feature có AI, UAT approved và traceability complete.
