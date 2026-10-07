# 05 – Data

## Hoàn thành baseline
- [x] VWORK-DOMAIN-MODEL-v1.0.md
- [x] VWORK-DATA-DICTIONARY-v1.0.md
- [x] VWORK-ERD-v1.0.md
- [x] VWORK-DATABASE-DESIGN-v1.0.md
- [x] VWORK-SHARED-DATA-MASTER-DATA-v1.0.md
- [x] VWORK-CODE-LIST-CATALOG-v1.0.md
- [x] VWORK-SHARED-DATA-BOUNDARY-v1.0.md

## Tiếp theo
- [x] VWORK-MASTER-DATA-GOVERNANCE-v1.0.md
- [ ] VWORK-DATA-RETENTION-v1.0.md
- [ ] Physical migrations cho shared/master data

Nguyên tắc:
- Mọi bảng nghiệp vụ tenant-bound phải kiểm thử tenant isolation.
- Versioned entity không overwrite bản đã khóa.
- Không hard-code danh mục nghiệp vụ ở Web/Mobile.
- Shared/Master Data phải có source of truth, owner, version/effective-date khi cần và audit.
