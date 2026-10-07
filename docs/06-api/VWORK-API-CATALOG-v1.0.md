# VWork – API Catalog v1.0

**Base path:** `/api/v1`  
**Style:** REST + async job resources + event/webhook cho tích hợp  
**Auth:** OIDC/session/token tùy deployment; backend luôn tự xác lập tenant context từ identity đã xác thực.

## 1. Chuẩn API

Header chuẩn:
- Authorization
- X-Correlation-Id
- Idempotency-Key cho command cần chống lặp
- If-Match/ETag cho optimistic update khi áp dụng

Response lỗi chuẩn:

```json
{
  "code": "STALE_VERSION",
  "message": "Phiên bản đã thay đổi",
  "correlationId": "uuid",
  "details": []
}
```

Nguyên tắc:
- GET chỉ đọc.
- POST dùng cho create/command.
- PATCH dùng cho partial update.
- DELETE chỉ dùng với revoke/delete hợp lệ; business object ưu tiên archive command.
- 409 cho conflict/stale version.
- 422 cho business validation.
- 403 cho permission.
- 404 có thể dùng để tránh leak object existence theo policy.
- Mọi write quan trọng phải audit.

---

## 2. Identity & Organization

| API ID | Method | Path | FR |
|---|---|---|---|
| API-IAM-001 | POST | /auth/login | FR-001 |
| API-IAM-002 | POST | /auth/logout | FR-002 |
| API-IAM-003 | GET | /me | FR-001 |
| API-IAM-004 | GET | /me/sessions | FR-002 |
| API-IAM-005 | DELETE | /me/sessions/{id} | FR-002 |
| API-IAM-006 | GET | /tenants/{tenantId} | FR-003 |
| API-IAM-007 | PATCH | /tenants/{tenantId} | FR-003 |
| API-IAM-008 | GET | /organization-units | FR-004 |
| API-IAM-009 | POST | /organization-units | FR-004 |
| API-IAM-010 | PATCH | /organization-units/{id} | FR-004 |
| API-IAM-011 | GET | /users | FR-005 |
| API-IAM-012 | POST | /users | FR-005 |
| API-IAM-013 | PATCH | /users/{id} | FR-005 |
| API-IAM-014 | GET | /roles | FR-006 |
| API-IAM-015 | POST | /role-assignments | FR-006..007 |
| API-IAM-016 | DELETE | /role-assignments/{id} | FR-006 |
| API-IAM-017 | POST | /delegations | FR-008 |
| API-IAM-018 | GET | /delegations | FR-008 |
| API-IAM-019 | POST | /document-profiles | FR-009 |
| API-IAM-020 | GET | /document-profiles | FR-009 |
| API-IAM-021 | POST | /auth/reauth | FR-002 |

---

## 3. Document

| API ID | Method | Path | FR |
|---|---|---|---|
| API-DOC-001 | POST | /documents/upload-init | FR-010 |
| API-DOC-002 | POST | /documents/complete-upload | FR-010 |
| API-DOC-003 | POST | /documents/batch | FR-011 |
| API-DOC-004 | GET | /documents | FR-015..016 |
| API-DOC-005 | GET | /documents/{id} | FR-015 |
| API-DOC-006 | PATCH | /documents/{id}/metadata | FR-016 |
| API-DOC-007 | GET | /documents/{id}/versions | FR-017 |
| API-DOC-008 | POST | /documents/{id}/versions | FR-017 |
| API-DOC-009 | GET | /document-versions/{versionId}/preview | FR-015 |
| API-DOC-010 | GET | /documents/{id}/compare | FR-018 |
| API-DOC-011 | POST | /documents/{id}/archive | FR-017 |
| API-DOC-012 | POST | /exports | FR-019 |
| API-DOC-013 | GET | /exports/{id} | FR-019 |
| API-DOC-014 | GET | /files/{assetId}/download-url | FR-019 |
| API-DOC-015 | GET | /documents/{id}/relations | FR-020 |
| API-DOC-016 | POST | /documents/{id}/relations | FR-020 |

---

## 4. Document Intelligence

API-INT-001 POST /document-versions/{id}/extract  
API-INT-002 GET /extraction-runs/{id}  
API-INT-003 GET /document-versions/{id}/extracted-fields  
API-INT-004 PATCH /extracted-fields/{id}/verify  
API-INT-005 GET /provenance/{id}  
API-INT-006 GET /ocr-pages/{id}  
API-INT-007 PATCH /ocr-pages/{id}  
API-INT-008 POST /document-versions/{id}/classify  
API-INT-009 GET /document-versions/{id}/classifications  
API-INT-010 POST /document-versions/{id}/summarize  
API-INT-011 GET /document-versions/{id}/summary

Trace: FR-021..028.

---

## 5. Draft & Review

API-DRF-001 POST /drafts  
API-DRF-002 GET /drafts  
API-DRF-003 GET /drafts/{id}  
API-DRF-004 POST /drafts/{id}/generate  
API-DRF-005 POST /drafts/{id}/versions  
API-DRF-006 GET /drafts/{id}/versions  
API-DRF-007 POST /draft-versions/{id}/review  
API-DRF-008 GET /review-runs/{id}  
API-DRF-009 PATCH /review-findings/{id}  
API-DRF-010 POST /draft-versions/{id}/rewrite  
API-DRF-011 POST /document-packages  
API-DRF-012 GET /document-packages/{id}  
API-DRF-013 POST /drafts/bulk-action  
API-DRF-014 POST /drafts/{id}/archive  
API-DRF-015 DELETE /drafts/{id}  

Trace: FR-029..041.

---

## 6. Incoming

API-INC-001 POST /incoming-records  
API-INC-002 GET /incoming-records  
API-INC-003 GET /incoming-records/{id}  
API-INC-004 POST /incoming-records/{id}/analyze  
API-INC-005 GET /incoming-records/{id}/requirements  
API-INC-006 PATCH /incoming-requirements/{id}/verify  
API-INC-007 GET /incoming-records/{id}/suggestions  
API-INC-008 POST /incoming-records/{id}/convert-to-work-case  
API-INC-009 POST /incoming-requirements/{id}/convert-to-task  
API-INC-010 POST /incoming-records/{id}/generate-response-package  
API-INC-011 POST /incoming-records/bulk-action  
API-INC-012 POST /incoming-records/{id}/archive  
API-INC-013 PATCH /incoming-records/{id}

Trace: FR-042..049.

---

## 7. Work Case & Task

API-WRK-001 POST /work-cases  
API-WRK-002 GET /work-cases  
API-WRK-003 GET /work-cases/{id}  
API-WRK-004 PATCH /work-cases/{id}  
API-WRK-005 GET /work-cases/{id}/timeline  
API-WRK-006 POST /work-cases/{id}/tasks  
API-WRK-007 GET /tasks  
API-WRK-008 GET /tasks/{id}  
API-WRK-009 POST /tasks/{id}/assign  
API-WRK-010 POST /tasks/{id}/accept  
API-WRK-011 PATCH /tasks/{id}/progress  
API-WRK-012 POST /tasks/{id}/evidence  
API-WRK-013 POST /tasks/{id}/complete  
API-WRK-014 POST /tasks/{id}/handover  
API-WRK-015 POST /tasks/{id}/comments  
API-WRK-016 GET /tasks/{id}/history

Trace: FR-050..060.

---

## 8. Workflow & Approval

API-WFL-001 GET /workflow-definitions  
API-WFL-002 POST /workflow-definitions  
API-WFL-003 POST /workflow-definitions/{id}/versions  
API-WFL-004 POST /workflow-definitions/{id}/publish  
API-WFL-005 POST /workflow-instances  
API-WFL-006 GET /workflow-instances/{id}  
API-WFL-007 GET /approvals  
API-WFL-008 GET /approvals/{id}  
API-WFL-009 POST /approvals/{id}/approve  
API-WFL-010 POST /approvals/{id}/return  
API-WFL-011 POST /approvals/{id}/reject  
API-WFL-012 POST /approvals/{id}/request-clarification  
API-WFL-013 POST /approvals/{id}/delegate  
API-WFL-014 POST /approvals/bulk-action  
API-WFL-015 PATCH /workflow-definitions/{id}  
API-WFL-016 POST /workflow-definitions/{id}/archive  
API-WFL-017 POST /workflow-definitions/bulk-action

Trace: FR-061..070.

---

## 9. Meeting

API-MTG-001 POST /meetings  
API-MTG-002 GET /meetings  
API-MTG-003 GET /meetings/{id}  
API-MTG-004 PATCH /meetings/{id}  
API-MTG-005 POST /meetings/{id}/parse-invitation  
API-MTG-006 POST /meetings/{id}/audio  
API-MTG-007 POST /meetings/{id}/transcribe  
API-MTG-008 GET /transcripts/{id}  
API-MTG-009 PATCH /transcript-segments/{id}  
API-MTG-010 POST /meetings/{id}/extract-decisions  
API-MTG-011 PATCH /meeting-decisions/{id}/confirm  
API-MTG-012 POST /meeting-decisions/{id}/create-task  
API-MTG-013 POST /meetings/{id}/generate-minutes

Trace: FR-071..079.

---

## 10. Reporting

API-RPT-001 POST /reporting-cycles  
API-RPT-002 GET /reporting-cycles  
API-RPT-003 GET /reporting-cycles/{id}  
API-RPT-004 POST /reporting-cycles/{id}/obligations  
API-RPT-005 GET /reporting-cycles/{id}/obligations  
API-RPT-006 POST /reporting-cycles/{id}/submissions  
API-RPT-007 POST /reporting-cycles/{id}/suggest-schema  
API-RPT-008 GET /metric-schemas/{id}  
API-RPT-009 POST /metric-schemas/{id}/versions  
API-RPT-010 POST /metric-schema-versions/{id}/approve  
API-RPT-011 POST /reporting-cycles/{id}/extract  
API-RPT-012 POST /reporting-cycles/{id}/quality-check  
API-RPT-013 GET /reporting-cycles/{id}/quality-findings  
API-RPT-014 POST /reporting-cycles/{id}/reconcile  
API-RPT-015 POST /reporting-cycles/{id}/aggregate  
API-RPT-016 GET /reporting-cycles/{id}/aggregations  
API-RPT-017 POST /reporting-cycles/{id}/generate-report  
API-RPT-018 POST /reporting-cycles/{id}/export

Trace: FR-080..091.

---

## 11. Template & Knowledge

API-KNO-001 POST /templates  
API-KNO-002 GET /templates  
API-KNO-003 GET /templates/{id}  
API-KNO-004 POST /templates/{id}/versions  
API-KNO-005 POST /template-versions/{id}/publish  
API-KNO-006 POST /knowledge-sources  
API-KNO-007 GET /knowledge-sources  
API-KNO-008 GET /knowledge-sources/{id}  
API-KNO-009 POST /knowledge-sources/{id}/versions  
API-KNO-010 POST /knowledge-versions/{id}/publish  
API-KNO-011 POST /knowledge-versions/{id}/reindex  
API-KNO-012 GET /knowledge/search  
API-KNO-013 POST /knowledge/query

Trace: FR-092..100.

---

## 12. Executive & Assistant

API-EXE-001 GET /executive/inbox  
API-EXE-002 GET /executive/signals  
API-EXE-003 POST /executive/briefs/generate  
API-EXE-004 GET /executive/briefs  
API-EXE-005 GET /executive/briefs/{id}  
API-EXE-006 GET /executive/inbox/{itemId}  
API-EXE-007 POST /executive/inbox/bulk-action  
API-EXE-008 POST /executive/signals/bulk-action  
API-AST-001 POST /assistant/conversations  
API-AST-002 GET /assistant/conversations/{id}  
API-AST-003 POST /assistant/conversations/{id}/messages  
API-AST-004 GET /assistant/conversations/{id}/messages  
API-AST-005 GET /assistant/conversations  
API-AST-006 PATCH /assistant/conversations/{id}  
API-AST-007 POST /assistant/conversations/{id}/archive  
API-AST-008 POST /assistant/conversations/bulk-action

Trace: FR-101..108.

---

## 13. Governance / Platform

API-GOV-001 GET /audit-events  
API-GOV-002 GET /ai/providers  
API-GOV-003 POST /ai/providers  
API-GOV-004 GET /ai/models  
API-GOV-005 POST /ai/models  
API-GOV-006 GET /prompts  
API-GOV-007 POST /prompts/{id}/versions  
API-GOV-008 POST /evaluations/run  
API-GOV-009 GET /ai/usage  
API-GOV-010 GET /integrations  
API-GOV-011 POST /integrations  
API-GOV-012 PATCH /integrations/{id}  
API-GOV-013 GET /jobs  
API-GOV-014 GET /jobs/{id}  
API-GOV-015 POST /jobs/{id}/retry  
API-GOV-016 GET /notifications  
API-GOV-017 POST /notifications/{id}/read  
API-GOV-018 GET /retention-policies  
API-GOV-019 PUT /retention-policies/{objectType}  
API-GOV-020 GET /health/ready  
API-GOV-021 GET /health/live  
API-GOV-022 POST /notifications/bulk-action  
API-GOV-023 POST /jobs/{id}/cancel

Trace: FR-109..124.

---

## 14. Shared & Master Data

API-MD-001 GET /code-lists  
API-MD-002 POST /code-lists  
API-MD-003 GET /code-lists/{code}  
API-MD-004 PATCH /code-lists/{code}  
API-MD-005 POST /code-lists/{code}/versions  
API-MD-006 GET /code-lists/{code}/items  
API-MD-007 POST /code-lists/{code}/items  
API-MD-008 PATCH /code-list-items/{id}  
API-MD-009 POST /code-list-items/{id}/activate  
API-MD-010 POST /code-list-items/{id}/deactivate  
API-MD-011 POST /code-list-items/{id}/retire  
API-MD-012 POST /code-list-items/bulk-action  
API-MD-013 GET /administrative-units  
API-MD-014 GET /administrative-units/{code}  
API-MD-015 POST /administrative-units/import  
API-MD-016 GET /master-data-imports/{id}  
API-MD-017 POST /master-data-imports/{id}/apply  
API-MD-018 GET /external-agencies  
API-MD-019 POST /external-agencies  
API-MD-020 PATCH /external-agencies/{id}  
API-MD-021 GET /units-of-measure  
API-MD-022 POST /units-of-measure  
API-MD-023 PATCH /units-of-measure/{code}  
API-MD-024 POST /units-of-measure/{code}/retire  
API-MD-025 GET /taxonomy  
API-MD-026 POST /taxonomy/nodes  
API-MD-027 PATCH /taxonomy/nodes/{id}  
API-MD-028 POST /taxonomy/nodes/{id}/move  
API-MD-029 POST /taxonomy/nodes/{id}/retire  
API-MD-030 GET /master-data/history

Trace: Shared/Master Data Governance; cross-cutting CRUD and administration.

---

## 15. Async Pattern

Các tác vụ dài trả về HTTP 202 và Job resource:

```json
{
  "jobId": "uuid",
  "status": "QUEUED",
  "statusUrl": "/api/v1/jobs/uuid"
}
```

Áp dụng cho:
- OCR/extraction lớn.
- Draft generation.
- AI Review.
- STT.
- Report extraction/aggregation lớn.
- Export/package.
- Reindex.

---

## 16. Authorization

- Client không truyền role như nguồn tin cậy.
- Tenant lấy từ authenticated context.
- Resolve resource rồi kiểm tenant/data scope.
- Export/download re-check quyền.
- Admin endpoint cần permission riêng.
- Assistant/RAG áp authorization như resource trực tiếp.
- Platform Admin không mặc định có content access.

---

## 17. API Traceability

OpenAPI phải dùng vendor extension:
- x-api-id
- x-fr
- x-use-cases
- x-audit-event
- x-async

Catalog này là nguồn danh mục; OpenAPI là hợp đồng máy đọc được.
