# VWork – Risk Register v1.0

## Thang điểm
P: xác suất 1–5. I: tác động 1–5. Score=P×I.
15–25 Critical; 8–14 High; 4–7 Medium; 1–3 Low.

| ID | Rủi ro | P | I | Score | Owner | Mitigation |
|---|---|---:|---:|---:|---|---|
| RSK-001 | AI hallucination trong văn bản chính thức | 4 | 5 | 20 | AI Lead | grounding, FACT/INFERENCE/MISSING, human review |
| RSK-002 | Cross-tenant leakage | 2 | 5 | 10 | Security | tenant predicate, defense-in-depth, negative tests |
| RSK-003 | Scope creep theo từng xã/phường | 4 | 4 | 16 | Product | Product Boundary, extension/config |
| RSK-004 | Fork codebase khách hàng | 3 | 5 | 15 | Architect | One Core, feature flags/config |
| RSK-005 | Sai version khi phê duyệt | 3 | 5 | 15 | Workflow Lead | version pin, optimistic lock, stale check |
| RSK-006 | OCR tiếng Việt chất lượng thấp | 3 | 3 | 9 | AI Lead | confidence, review queue, provider benchmark |
| RSK-007 | Báo cáo nguồn không đồng nhất | 4 | 4 | 16 | Data Lead | schema approval, quality, reconciliation |
| RSK-008 | Chi phí AI vượt kế hoạch | 4 | 3 | 12 | AI/Product | routing, quota, usage metering |
| RSK-009 | Phụ thuộc AI provider | 3 | 4 | 12 | Architect | provider abstraction/fallback |
| RSK-010 | Migration gây downtime | 3 | 4 | 12 | Backend | expand/contract, staging rehearsal |
| RSK-011 | Mobile phê duyệt thiếu ngữ cảnh | 3 | 4 | 12 | UX | summary+source+stale guard |
| RSK-012 | File độc hại/parser exploit | 2 | 5 | 10 | Security | malware scan, sandbox preview |
| RSK-013 | RAG trả dữ liệu đã thu hồi quyền | 2 | 5 | 10 | Knowledge | scope filter + revoke/reindex test |
| RSK-014 | Event duplicate gây side effect lặp | 3 | 4 | 12 | Platform | idempotency/dedup |
| RSK-015 | Đội quá tải vì scope/tài liệu lớn | 4 | 3 | 12 | PM | vertical slice, P0 first |
| RSK-016 | Quy định thay đổi | 3 | 4 | 12 | Product | rule/config versioning |
| RSK-017 | On-Premise môi trường phân mảnh | 4 | 3 | 12 | DevOps | supported matrix/container package |
| RSK-018 | Test AI không ổn định | 4 | 3 | 12 | QA/AI | golden dataset, deterministic rubric |
| RSK-019 | Thiếu traceability khi code nhanh | 3 | 4 | 12 | QA | machine-readable trace CI |
| RSK-020 | Backup có nhưng restore không được | 2 | 5 | 10 | DevOps | periodic restore test |

## Trạng thái
OPEN / MITIGATING / ACCEPTED / CLOSED / MATERIALIZED.

## Cadence
Sprint Planning: Critical/High.
Sprint Review: cập nhật trigger/status.
Release: bắt buộc review.
Incident/change lớn: ad-hoc.

Mọi risk Critical phải có owner, mitigation và target milestone.
