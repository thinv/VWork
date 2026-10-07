# VWork – Reporting, Meeting, Knowledge/RAG & Master Data Handoff Matrix v1.0

**Mục tiêu:** Ma trận bàn giao kỹ thuật cho 4 domain đã làm sâu, dùng làm đầu vào bắt buộc cho Claude/Codex.

| Domain | Business Spec | Data/AI Governance | API | Web Screens | UAT |
|---|---|---|---|---|---|
| Reporting | VWORK-REPORTING-DETAILED-BUSINESS-SPEC-v1.0 | Domain Model/Data Dictionary | API-RPT-001..018 | WEB-RPT-001..013 | UAT-15..17, 26..29 |
| Meeting | VWORK-MEETING-DETAILED-BUSINESS-SPEC-v1.0 | State/Exception Catalog | API-MTG-001..013 | WEB-MTG-001..007, MOB-MTG-001..005 | UAT-14, 30..32 |
| Knowledge/RAG | BP-10 + Knowledge/RAG Governance | VWORK-KNOWLEDGE-RAG-GOVERNANCE-v1.0 | API-KNO-001..013 | WEB-KNO-001..008, MOB-AI-001..003 | UAT-18..19, 33..35 |
| Shared/Master Data | Shared/Master Data Spec + Master Data Governance | Code List Catalog + Boundary Matrix | API-MD-001..030 | WEB-MD-001..020 | UAT-24..25, 36..40 |

# 1. Reporting Engineering Ready Gate

Claude/Codex phải chứng minh:
- cycle state machine đúng;
- submission versioning;
- schema approval gate;
- UnitOfMeasure canonical;
- provenance field-level;
- quality/reconciliation;
- deterministic aggregation;
- AI narrative không sửa số;
- CRUD/Select All/Bulk;
- ACT-08/09 scope;
- UAT-26..29.

Không được code aggregation trước khi schema approval và unit rules rõ.

# 2. Meeting Engineering Ready Gate

Phải chứng minh:
- participant/attendance model;
- audio source preservation;
- timestamp transcript;
- low-confidence speaker handling;
- DecisionCandidate khác MeetingDecision;
- human confirm trước create Task;
- decision-to-task reconciliation;
- minutes versioning;
- CRUD/Select All/Bulk;
- UAT-30..32.

# 3. Knowledge/RAG Engineering Ready Gate

Phải chứng minh:
- source authority;
- effective date;
- version;
- access scope filter trước retrieval;
- lifecycle PUBLISHED/STALE/ARCHIVED;
- citation đúng source version;
- evidence sufficiency;
- conflicting source handling;
- revoke/cache invalidation;
- prompt injection guard;
- UAT-33..35.

# 4. Shared/Master Data Engineering Ready Gate

Phải chứng minh:
- SYSTEM/TENANT/HYBRID/EXTERNAL ownership;
- code khác label;
- version/effective date;
- snapshot lịch sử;
- referenced delete protection;
- import preview/diff;
- administrative hierarchy validation;
- taxonomy cycle protection;
- CRUD/Select All/Bulk;
- API-MD-001..030;
- WEB-MD-001..020;
- UAT-36..40.

# 5. Không được tự suy diễn

- Reporting: không dùng LLM tính số.
- Meeting: không auto-confirm decision.
- RAG: không retrieve trước rồi mới filter permission.
- Master Data: không hard-code code list ở client.
- Mọi domain: không hard-delete record lịch sử/đã tham chiếu.

# 6. PR Evidence

Mỗi PR thuộc 4 domain phải ghi:
- Domain
- UC/FR/BRULE
- State transitions
- Exception cases
- API IDs
- Screen IDs
- Master data dependencies
- Audit events
- Test IDs
- UAT IDs
- Migration impact
- OpenAPI impact
