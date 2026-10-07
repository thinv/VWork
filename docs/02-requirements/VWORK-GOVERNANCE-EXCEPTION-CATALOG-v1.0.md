# VWork – Governance Exception Catalog v1.0

EX-GOV-001 PRIVILEGE_ESCALATION_DENIED — actor cố cấp quyền/scope vượt thẩm quyền.
EX-GOV-002 ORG_RETIRE_BLOCKED — unit còn child/active reference cần xử lý.
EX-GOV-003 USER_ALREADY_INACTIVE — deactivate lặp/idempotent.
EX-GOV-004 USER_REACTIVATION_REVIEW_REQUIRED — policy yêu cầu review trước khôi phục access.
EX-GOV-005 ROLE_IN_USE — role đang được assignment/reference.
EX-GOV-006 ROLE_SCOPE_INVALID — data scope không hợp lệ.
EX-GOV-007 DELEGATION_OVERLAP — delegation conflict/overlap trái policy.
EX-GOV-008 DELEGATION_EXPIRED — action sau effectiveTo.
EX-GOV-009 DELEGATION_CHAIN_NOT_ALLOWED — chain delegation bị chặn.
EX-GOV-010 PROFILE_VERSION_STALE — document profile version đổi đồng thời.
EX-GOV-011 PROVIDER_SECRET_INVALID — secret/token không hợp lệ.
EX-GOV-012 PROVIDER_DISABLED — provider/model disabled cho run mới.
EX-GOV-013 MODEL_NOT_ALLOWED — model ngoài allowlist/use-case policy.
EX-GOV-014 PROMPT_NOT_PUBLISHED — production run dùng prompt chưa publish.
EX-GOV-015 EVALUATION_NOT_REPRODUCIBLE — thiếu dataset/model/prompt/config pin.
EX-GOV-016 INTEGRATION_TEST_FAILED — connectivity/auth/contract test fail.
EX-GOV-017 SECRET_ROTATION_FAILED — rotate thất bại, old secret retention theo policy.
EX-GOV-018 AUDIT_EXPORT_DENIED — actor/scope không đủ.
EX-GOV-019 LEGAL_HOLD_BLOCKS_RETENTION — retention/delete bị legal hold chặn.
EX-GOV-020 JOB_STATE_INVALID — retry/cancel/bulk không hợp state.
EX-GOV-021 SESSION_NOT_OWNED — user cố revoke session người khác.
EX-GOV-022 PREFERENCE_SECURITY_FIELD_DENIED — preference payload cố đổi security setting.
EX-GOV-023 GOVERNANCE_BULK_PARTIAL — bulk action có item ngoài scope/state.
EX-GOV-024 NOTIFICATION_PREFERENCE_INVALID — config channel/digest/quiet-hours không hợp lệ.
