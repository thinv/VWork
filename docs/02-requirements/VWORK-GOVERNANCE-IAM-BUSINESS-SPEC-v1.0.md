# VWork – Governance / IAM Business Spec v1.0

## 1. Phạm vi
Organization, User/Membership, Role/Permission/Data Scope, Delegation, Document Profile, AI Provider/Model, Prompt Registry, Evaluation, AI Usage, Integration, Audit, Retention, Job Operations, Notification Preferences, Session & App Preferences.

## 2. Authorization Model
Effective authorization = Tenant + Membership + Role + Permission + Data Scope + Delegation + Object State.
Title/position không tự cấp quyền.
Mọi action nhạy cảm re-authorize ở server.

## 3. Organization
- Unit có code/name/parent/effective dates/status.
- Retire thay vì hard delete nếu đã referenced.
- Hỗ trợ successor/predecessor khi tái cơ cấu.
- Bulk action phải re-authorize từng unit.

## 4. User/Membership
- User identity tách khỏi tenant membership.
- Deactivate user/membership không xóa audit/ownership history.
- Deactivate phải revoke effective access/session theo SLA.
- Reactivate không tự phục hồi role cũ nếu policy yêu cầu review.

## 5. Role/Permission/Data Scope
- Role chỉ là tập permission.
- Assignment luôn gắn membership + scope.
- Admin không được cấp quyền vượt phạm vi được phép quản trị.
- Bulk assignment có preview và partial result.

## 6. Delegation
- Có delegator/delegatee/effective window/scope/actions.
- Default không chain delegation.
- Revoke/expire có hiệu lực ngay cho action mới.
- Approval/action đang mở phải re-authorize trước submit.

## 7. Document Profile
- Versioned configuration.
- Published/active version immutable.
- Thay đổi tạo version mới.
- Historical document giữ profile/version đã dùng.

## 8. AI Provider/Model
- Secret tách khỏi config metadata.
- Raw secret không trả lại sau khi lưu.
- Provider/model disabled không nhận run mới.
- Fallback chỉ theo allowlist/policy.
- Config change audit before/after.

## 9. Prompt Registry
- Prompt có version/lifecycle.
- Production use case pin exact promptVersionId.
- Draft prompt không dùng production nếu policy yêu cầu published.
- Archive không phá historical evaluation/run trace.

## 10. Evaluation
- Run pin dataset/version, provider/model, prompt version, config, metric version.
- Result immutable sau completion.
- Cancel chỉ state cho phép.

## 11. Integration
- Secret masked.
- Test connection không persist secret ra log.
- Disable/rotate secret có audit.
- Integration event contract versioned.

## 12. Audit
- Append-only.
- Không edit/delete từ UI.
- Export cần permission, scope, filter snapshot và audit export event.

## 13. Retention
- Policy theo object type/classification.
- Không bypass legal hold.
- Change policy phải audit/version.
- Bulk update trả partial result.

## 14. Job Operations
- Retry/cancel/bulk theo state.
- Idempotent.
- Không retry SUCCEEDED trừ explicit rerun.
- Dead-letter có operator action riêng theo policy.

## 15. Session / Preferences
- User xem/revoke session của chính mình.
- Revoke-all không revoke current session nếu policy quy định giữ phiên hiện tại, hoặc phải explicit.
- Preference chỉ presentation/notification, không authorization/security policy.

## 16. Acceptance
- Cross-tenant admin leak = 0.
- Privilege escalation = 0.
- Secret leak = 0.
- Audit mutation = 0.
- Legal hold deletion = 0.
- Disabled user/provider/model không tiếp tục action mới ngoài grace policy explicit.
