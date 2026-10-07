# VWork – Master Data Exception Catalog v1.0

EX-MD-001 SYSTEM_SEMANTIC_READONLY — tenant cố sửa code/semantic system-owned.
EX-MD-002 CODE_DUPLICATE — code trùng trong cùng dataset/scope/version.
EX-MD-003 REFERENCED_ITEM_DELETE_DENIED — item đã referenced, chỉ deactivate/retire.
EX-MD-004 VERSION_STALE — concurrent version changed.
EX-MD-005 EFFECTIVE_PERIOD_OVERLAP — valid_from/to chồng lấn trái policy.
EX-MD-006 PARENT_NOT_FOUND — parent code/node không tồn tại hoặc không effective.
EX-MD-007 CIRCULAR_HIERARCHY — hierarchy/taxonomy tạo vòng lặp.
EX-MD-008 INVALID_SUCCESSOR_MAPPING — successor/predecessor mapping không hợp lệ.
EX-MD-009 OFFICIAL_DATA_EDIT_DENIED — tenant sửa external/platform-authoritative administrative data.
EX-MD-010 UOM_CONVERSION_INVALID — conversion group/rule không tương thích.
EX-MD-011 UOM_VERSION_REQUIRED — thay conversion semantic phải tạo version mới.
EX-MD-012 TAXONOMY_SIBLING_DUPLICATE — duplicate sibling code.
EX-MD-013 TAXONOMY_TARGET_RETIRED — move/assign vào parent retired.
EX-MD-014 IMPORT_FILE_INVALID — file/format/schema không hợp lệ.
EX-MD-015 IMPORT_MAPPING_INVALID — column mapping thiếu/sai.
EX-MD-016 IMPORT_VALIDATION_FAILED — batch có INVALID/CONFLICT blocking.
EX-MD-017 IMPORT_DIFF_REQUIRED — apply trước khi diff/confirm.
EX-MD-018 IMPORT_ALREADY_APPLIED — retry batch applied phải idempotent.
EX-MD-019 IMPORT_APPLY_PARTIAL — apply có partial failure theo configured boundary.
EX-MD-020 CACHE_INVALIDATION_FAILED — publish thành công nhưng invalidation chưa hoàn tất; phải cảnh báo/queue retry.
EX-MD-021 HISTORY_IMMUTABLE — history/audit/import result không sửa/xóa.
EX-MD-022 MASTER_BULK_PARTIAL — bulk action có item system-owned/out-of-scope/state-ineligible.
EX-MD-023 SNAPSHOT_REWRITE_DENIED — master rename/version không được rewrite historical snapshot.
EX-MD-024 EFFECTIVE_QUERY_INVALID — historical query thiếu/as-of date không hợp lệ.
