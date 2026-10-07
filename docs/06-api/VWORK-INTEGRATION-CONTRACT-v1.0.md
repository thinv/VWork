# VWork – Integration Contract v1.0

**Mục tiêu:** Chuẩn hóa mọi kết nối giữa VWork và hệ thống bên ngoài để không hard-code provider/vendor vào Core.

---

# 1. Nguyên tắc

1. Adapter pattern.
2. Contract versioned.
3. Input không tin cậy, luôn validate/normalize.
4. Tenant-specific configuration.
5. Credential chỉ lưu secret reference.
6. Timeout/retry/circuit breaker.
7. Idempotency.
8. Audit inbound/outbound quan trọng.
9. Không để tích hợp ngoài bypass authorization/business rule.
10. Có degraded mode.

---

# 2. Integration Types

| Code | Loại |
|---|---|
| INTG-SSO | SSO/OIDC/SAML |
| INTG-SIGN | Ký số |
| INTG-DMS | Quản lý văn bản |
| INTG-SECTOR | Hệ thống chuyên ngành |
| INTG-AI | AI provider |
| INTG-OCR | OCR |
| INTG-STT | Speech-to-text |
| INTG-NOTIFY | Email/SMS/Push |
| INTG-STORAGE | Object storage |
| INTG-WEBHOOK | Webhook generic |

---

# 3. Canonical Adapter Interface

Mỗi adapter expose tối thiểu:
- adapter code/version
- capabilities
- health()
- validateConfig()
- execute(operation,input,context)
- normalizeError()
- redactForAudit()

IntegrationContext:
- tenantId
- actorId hoặc system actor
- correlationId
- idempotencyKey
- dataClassification
- timeoutBudget
- policyVersion

---

# 4. SSO Contract

Baseline OIDC:
- issuer
- client_id
- redirect_uri
- scopes
- claim mapping
- logout endpoint

Canonical claims:
- external_subject
- email
- phone optional
- display_name
- organization_hint optional

Quy tắc:
- external identity không tự tạo quyền.
- map vào User/Membership đã provision hoặc JIT theo policy.
- role từ IdP chỉ được dùng nếu mapping explicitly configured.

---

# 5. Digital Signature Contract

Operations:
- createSigningRequest
- getSigningStatus
- cancelSigningRequest
- downloadSignedDocument

Canonical request:
- tenantId
- documentVersionId
- fileHash
- signers
- signaturePosition optional
- callbackUrl
- correlationId

Canonical status:
- PENDING
- SIGNED
- REJECTED
- EXPIRED
- CANCELLED
- FAILED

Rules:
- chỉ version đã khóa.
- signed artifact tạo DocumentVersion mới hoặc signed derivative theo policy.
- verify hash trước/after.
- provider callback phải authenticate.

---

# 6. External DMS Contract

Use cases:
- import incoming document.
- export outgoing document metadata/file.
- sync status/reference number.

Canonical IncomingDocument:
- externalId
- sourceSystem
- registrationNo
- sender
- subject
- issuedAt
- receivedAt
- urgency
- confidentiality
- attachments[]
- metadata{}

Idempotency:
sourceSystem + externalId.

Không overwrite document đã xử lý; tạo relation/version/event theo policy.

---

# 7. Sector System Contract

Generic read:
- queryCase
- queryEntity
- fetchReferenceData

Generic write chỉ khi được phép:
- pushTaskResult
- pushDocumentReference

Mỗi sector adapter phải document:
- authoritative fields.
- sync direction.
- conflict rule.
- retention.
- PII classification.

---

# 8. AI Provider Contract

Canonical:
- chat/generate
- embeddings
- structured output
- tool/function support optional
- moderation/safety optional

Request:
- model capability
- messages/context
- max output
- temperature policy
- response schema optional
- tenant cost tag
- correlation id

Provider adapter trả:
- normalized text/JSON
- usage
- finish reason
- latency
- provider request id
- safety metadata

Không để business service phụ thuộc field vendor-specific.

---

# 9. OCR Contract

Input:
- file/image refs
- language hint
- page range
- layout/table flags

Output:
- pages
- blocks
- text
- coordinates optional
- confidence
- tables optional

Provider-specific coordinates phải normalize về canonical coordinate system.

---

# 10. STT Contract

Input:
- audio ref
- language
- diarization flag
- timestamp granularity

Output:
- segments
- start/end
- text
- speaker label
- confidence

Audio source vẫn nằm ở VWork storage hoặc policy-approved storage.

---

# 11. Notification Contract

Canonical Notification:
- recipient
- channel
- template code
- safe variables
- object deep link
- priority

Không gửi raw confidential content qua push/SMS theo default.

Delivery states:
QUEUED, SENT, DELIVERED, FAILED, SUPPRESSED.

---

# 12. Webhook Contract

Outbound envelope:
```json
{
  "id": "event-uuid",
  "type": "task.completed.v1",
  "occurredAt": "2026-10-07T10:00:00+07:00",
  "tenantId": "uuid",
  "subject": {"type":"Task","id":"uuid"},
  "data": {}
}
```

Security:
- HTTPS.
- HMAC signature hoặc mTLS.
- timestamp/nonce.
- retry with backoff.
- dead-letter.
- secret rotation.

---

# 13. Error Taxonomy

- INTEGRATION_AUTH_FAILED
- INTEGRATION_TIMEOUT
- INTEGRATION_RATE_LIMITED
- INTEGRATION_UNAVAILABLE
- INTEGRATION_INVALID_RESPONSE
- INTEGRATION_CONFLICT
- INTEGRATION_REJECTED
- INTEGRATION_CONFIG_INVALID

Adapter normalize vendor errors về taxonomy này.

---

# 14. Retry Policy

Retry:
- timeout.
- 429.
- 5xx transient.
- connection reset.

Không auto retry:
- 4xx validation.
- authorization.
- business rejection.
- malformed response không transient.

Write retry cần idempotency.

---

# 15. Circuit Breaker

Theo adapter/provider:
- open khi error threshold vượt ngưỡng.
- half-open probe.
- metrics/alert.
- fallback provider nếu policy cho.

---

# 16. Integration Audit

Log tối thiểu:
- adapter/version.
- operation.
- tenant.
- correlation.
- direction.
- result.
- latency.
- external request id.
- redacted metadata.

Không log secret/raw sensitive payload tùy tiện.

---

# 17. Contract Versioning

- semantic version cho adapter contract.
- breaking change tạo major mới.
- VWork hỗ trợ song song version trong migration window.
- capability negotiation khi provider không hỗ trợ đủ feature.

---

# 18. Integration Qualification

Mỗi adapter trước production:
1. config validation.
2. happy path.
3. auth fail.
4. timeout.
5. retry/idempotency.
6. malformed response.
7. rate limit.
8. provider outage.
9. security callback/webhook.
10. audit/redaction.
