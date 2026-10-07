# VWork – Integration Profile Specification v1.0

# 1. Purpose
Mỗi tenant có Integration Profile để quyết định capability nào NATIVE/INTEGRATED/OPTIONAL.

# 2. Profile Sections
- Identity/SSO
- Organization Directory
- Document/eOffice
- Digital Signature
- Task/Directive
- Calendar/Meeting
- Reporting
- One-stop/TTHC
- Email/File/Drive
- Specialist Systems

# 3. Binding Fields
bindingId, capabilityCode, mode, providerCode, connectorId, sourceSystemCode, authProfileRef, syncMode, readEnabled, writeEnabled, webhookEnabled, pollingInterval, deepLinkTemplate, freshnessSLA, conflictPolicy, enabled, effectiveFrom/To.

# 4. Capability Modes
NATIVE: VWork authoritative.
INTEGRATED: external authoritative.
OPTIONAL: VWork implementation available but enable flag controls exposure.

# 5. Resolution
Effective mode = tenant profile + capability rule + provider health + entitlement.
Mode không được resolve chỉ ở frontend.

# 6. Health States
CONNECTED / DEGRADED / DISCONNECTED / AUTH_EXPIRED / CONFIG_ERROR / RATE_LIMITED.

# 7. Degraded Behavior
Tool phải biết:
- read-only fallback;
- cached data allowed/not allowed;
- deep-link fallback;
- queue/retry;
- block action.

# 8. Profile Change
Draft → Validate → Test → Activate.
Active profile immutable snapshot; edit tạo version.
Rollback tới prior valid version.

# 9. Security
Secrets lưu secret store; UI masked.
Least privilege per connector.
Credential rotation audited.
No cross-tenant credential reuse.

# 10. Acceptance
Không bật INTEGRATED capability nếu provider/binding/SoR unresolved hoặc validation fail.