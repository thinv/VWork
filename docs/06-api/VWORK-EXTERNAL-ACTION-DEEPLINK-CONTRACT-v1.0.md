# VWork – External Action / Deep-Link Contract v1.0

# 1. Purpose
Chuẩn hóa cách VWork tương tác với System of Record bên ngoài.

# 2. Action Types
- READ_SYNC
- WRITE_SYNC
- COMMAND_ASYNC
- DEEP_LINK_VIEW
- DEEP_LINK_ACTION

# 3. ExternalAction Request
Required:
actionId, tenantId, connectorId, sourceSystem, sourceObjectId, actionCode, actorContext, expectedSourceVersion, idempotencyKey, correlationId, payloadRef, requestedAt.

Không ghi secret vào payload/audit.

# 4. Result
Status:
REQUESTED / ACCEPTED / SUCCEEDED / FAILED / UNKNOWN / TIMED_OUT / RECONCILIATION_REQUIRED.

Fields:
externalRequestId, sourceVersionAfter, externalStatus, resultRef, errorCode, retryable, completedAt.

# 5. Idempotency
Same connector + actionCode + sourceObjectId + idempotencyKey phải không tạo duplicate action.
Retry dùng cùng key trừ khi explicit rerun.

# 6. Optimistic Safety
Nếu connector hỗ trợ version/etag:
expectedSourceVersion bắt buộc cho mutation nhạy cảm.
Mismatch → STALE_VERSION / reconciliation.

# 7. Deep Link
Deep link phải được tạo từ allowlisted template/provider.
Không nhận arbitrary URL từ source content để render action button.

Required:
providerCode, objectType, sourceObjectId, actionIntent, returnUrl token optional.

# 8. Deep-Link Security
- không embed secret/token dài hạn;
- không leak tenant metadata;
- local access re-authorized trước khi hiển thị;
- external system tự auth người dùng;
- return callback signed/state-bound nếu dùng.

# 9. UI
Phân biệt:
- “Thực hiện trong VWork”
- “Gửi sang hệ thống nguồn”
- “Mở trong hệ thống nguồn”

Không dùng cùng một CTA label gây hiểu nhầm ownership.

# 10. Failure Handling
Connector fail:
- giữ local source state cũ;
- hiển thị failed/unknown;
- không optimistic success vĩnh viễn;
- enqueue reconciliation nếu external outcome unknown.

# 11. Audit Events
EXTERNAL_ACTION_REQUESTED
EXTERNAL_ACTION_ACCEPTED
EXTERNAL_ACTION_SUCCEEDED
EXTERNAL_ACTION_FAILED
DEEPLINK_OPENED
EXTERNAL_RECONCILIATION_REQUIRED

# 12. Connector Adapter Interface
resolveObject
fetchObject
listChanges
executeAction
buildDeepLink
healthCheck
mapStatus
mapError

# 13. Acceptance
- connector action server-authorized;
- idempotent;
- correlated;
- no secret leak;
- stale version protected;
- unknown external outcome handled explicitly;
- deep-link allowlisted.