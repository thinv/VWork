# VWork – Reporting Exception Catalog v1.0

EX-RPT-008 CYCLE_NOT_EDITABLE — Cycle CLOSED/ARCHIVED hoặc actor không có quyền.
EX-RPT-009 PERIOD_INVALID — period_end < period_start hoặc kỳ trùng không hợp lệ.
EX-RPT-010 OBLIGATION_DUPLICATE — đơn vị đã có obligation tương đương trong cycle.
EX-RPT-011 OBLIGATION_RETIRE_BLOCKED — obligation đã có submission active; chỉ retire với policy phù hợp.
EX-RPT-012 SUBMISSION_WRONG_PERIOD — submission không khớp kỳ báo cáo.
EX-RPT-013 SUBMISSION_DUPLICATE — checksum/version trùng.
EX-RPT-014 SUBMISSION_REPLACE_INVALID — replace không đúng obligation/version chain.
EX-RPT-015 SCHEMA_NOT_APPROVED — không cho official extraction/aggregation.
EX-RPT-016 SCHEMA_VERSION_STALE — cycle đang pin version khác.
EX-RPT-017 METRIC_CODE_DUPLICATE — trùng code trong cùng schema version.
EX-RPT-018 METRIC_TYPE_AGGREGATION_INVALID — aggregation không tương thích datatype.
EX-RPT-019 UNIT_MISMATCH — unit không tương thích và không có conversion rule.
EX-RPT-020 EXTRACTION_LOW_CONFIDENCE — extracted value cần verify.
EX-RPT-021 EXTRACTION_SOURCE_MISSING — không drill-down được tới source location.
EX-RPT-022 QUALITY_BLOCKER_OPEN — còn BLOCKER chưa resolve/override.
EX-RPT-023 QUALITY_OVERRIDE_REASON_REQUIRED — override thiếu reason.
EX-RPT-024 RECONCILIATION_MISMATCH — total/detail/current/prior/source mismatch.
EX-RPT-025 RECONCILIATION_OVERRIDE_REASON_REQUIRED — override reconciliation thiếu reason.
EX-RPT-026 REQUIRED_SUBMISSION_MISSING — thiếu obligation required chưa waiver.
EX-RPT-027 AGGREGATION_NOT_READY — schema/submission/quality/reconciliation chưa đạt gate.
EX-RPT-028 AGGREGATION_NON_DETERMINISTIC_ATTEMPT — không cho LLM thực hiện phép tính official.
EX-RPT-029 REPORT_DRAFT_STALE — aggregation/source snapshot đổi sau draft.
EX-RPT-030 EXPORT_CONTEXT_INCOMPLETE — thiếu schema/aggregation/source snapshot.
EX-RPT-031 BULK_REPORTING_PARTIAL — bulk action có item ngoài scope/state.
EX-RPT-032 CYCLE_REOPEN_REASON_REQUIRED — reopen thiếu lý do.

Mỗi exception phải map code, message tiếng Việt, severity, retryable, suggested action và audit khi có mutation.
