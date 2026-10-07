# VWork – Reporting API Extension v1.0

Bổ sung cho API-RPT-001..018 hiện có.

- API-RPT-019 PATCH /reporting-cycles/{id}
- API-RPT-020 POST /reporting-cycles/{id}/close
- API-RPT-021 POST /reporting-cycles/{id}/reopen
- API-RPT-022 POST /reporting-cycles/{id}/archive
- API-RPT-023 POST /reporting-cycles/bulk-action
- API-RPT-024 PATCH /reporting-obligations/{id}
- API-RPT-025 POST /reporting-obligations/{id}/retire
- API-RPT-026 POST /reporting-obligations/bulk-action
- API-RPT-027 POST /reporting-obligations/{id}/remind
- API-RPT-028 GET /reporting-cycles/{id}/submissions
- API-RPT-029 POST /report-submissions/{id}/replace
- API-RPT-030 POST /report-submissions/{id}/archive
- API-RPT-031 POST /report-submissions/bulk-action
- API-RPT-032 POST /metric-schema-versions/{id}/metrics
- API-RPT-033 PATCH /metric-definitions/{id}
- API-RPT-034 POST /metric-definitions/{id}/retire
- API-RPT-035 POST /metric-definitions/bulk-action
- API-RPT-036 GET /reporting-cycles/{id}/extracted-values
- API-RPT-037 PATCH /extracted-metric-values/{id}/verify
- API-RPT-038 POST /extracted-metric-values/bulk-action
- API-RPT-039 POST /data-quality-findings/{id}/resolve
- API-RPT-040 POST /data-quality-findings/{id}/override
- API-RPT-041 POST /data-quality-findings/bulk-action
- API-RPT-042 GET /reporting-cycles/{id}/reconciliation-results
- API-RPT-043 POST /reconciliation-results/{id}/override
- API-RPT-044 GET /report-drafts/{id}
- API-RPT-045 PATCH /report-drafts/{id}
- API-RPT-046 POST /report-drafts/{id}/submit
- API-RPT-047 GET /reporting-cycles/{id}/exports

## Common contract
Mọi write API phải có authentication, authorization, tenant scope, object-state validation, optimistic locking/expected version khi áp dụng, audit, correlationId, idempotency cho create/run/override/bulk và error code cụ thể.
