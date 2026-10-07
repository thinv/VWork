# VWork – Requirements Traceability Matrix v1.0

**Mục tiêu:** Định nghĩa ma trận truy vết chính thức từ nhu cầu sản phẩm đến thiết kế, mã nguồn, kiểm thử, UAT và release.

---

# 1. Trace Chain

Research
→ Capability
→ Business Process
→ BR
→ Actor
→ UC
→ BRULE
→ FR/NFR
→ SRS
→ Domain Entity
→ API/Event
→ Screen
→ Code Module
→ Test Case
→ UAT
→ Release.

---

# 2. Traceability Record

Mỗi link chứa:
- from_type
- from_id
- to_type
- to_id
- relation
- status
- source file
- owner
- updated_at

Relation:
- derives_from
- implements
- enforces
- exposes
- displays
- verifies
- validates
- released_in

---

# 3. Coverage Rules

P0:
- 100% FR → Design/API/Data/Test.
- 100% security NFR → test/evidence.
- 100% UC P0 → screen/API hoặc explicit non-UI implementation.
- 100% blocking BRULE → enforcement + test.

P1:
- không được orphan trước v1 final.

P2:
- có thể planned/deferred rõ.

---

# 4. Baseline Trace Examples

## TRACE-001 AI Draft

Capability:
CAP-04 AI Draft & Review

Process:
BP-04

BR:
BR-013,014,015

UC:
UC-025,026,027,028

Rules:
BRULE-029..034

FR:
FR-029..035

SRS:
5.4

Entities:
DM-027 Draft
DM-028 DraftVersion
DM-029 DraftContextSnapshot
DM-030 AIJob

API:
API-DRF-001
API-DRF-004
API-DRF-005

Web:
WEB-DRF-002
WEB-DRF-003
WEB-DRF-004

Mobile:
không full editor P0.

Tests:
TC-DRF-001 generation grounded
TC-DRF-002 missing evidence
TC-DRF-003 template old data not fact
TC-DRF-004 tenant isolation
TC-DRF-005 async retry

---

## TRACE-002 Approval

Capability:
CAP-07

BP:
BP-07

BR:
BR-027..029

UC:
UC-049..056

Rules:
BRULE-058..066

FR:
FR-061..070

Entities:
DM-050..057

API:
API-WFL-005..013

Web:
WEB-APR-001..003

Mobile:
MOB-APR-001..003

Tests:
TC-WFL-001 authorized approve
TC-WFL-002 unauthorized deny
TC-WFL-003 stale version
TC-WFL-004 return requires comment
TC-WFL-005 delegation expiry
TC-WFL-006 audit

---

## TRACE-003 Reporting

Capability:
CAP-09

BP:
BP-09

BR:
BR-035..044

UC:
UC-065..072

Rules:
BRULE-073..084

FR:
FR-080..091

Entities:
DM-067..077

API:
API-RPT-001..018

Web:
WEB-RPT-001..013

Tests:
TC-RPT-001 schema gate
TC-RPT-002 deterministic aggregation
TC-RPT-003 missing unit
TC-RPT-004 provenance drilldown
TC-RPT-005 blocker prevents final
TC-RPT-006 schema immutability

---

## TRACE-004 RAG

Capability:
CAP-10.05

BR:
BR-048..050

UC:
UC-079/080

Rules:
BRULE-088..092

FR:
FR-096..100

Entities:
DM-082..086

API:
API-KNO-006..013

Screens:
WEB-KNO-004..008
MOB-AI-001..003

Tests:
TC-RAG-001 correct source
TC-RAG-002 no evidence abstain
TC-RAG-003 cross-tenant deny
TC-RAG-004 revoked scope disappears
TC-RAG-005 prompt injection source

---

# 5. Matrix Summary by Domain

| Domain | FR | API group | Web group | Mobile group | Entity group |
|---|---|---|---|---|---|
| Identity | FR-001..009 | IAM | AUTH/ADM | AUTH/PRO | DM-001..012 |
| Document | FR-010..020 | DOC | DOC | DOC | DM-013..019 |
| Intelligence | FR-021..028 | INT | DOC extraction | DOC facts | DM-020..026 |
| Draft | FR-029..041 | DRF | DRF | AI limited | DM-027..036 |
| Incoming | FR-042..049 | INC | INC | via DOC/Work | DM-037..040 |
| Work | FR-050..060 | WRK | WC/TSK | WRK | DM-041..049 |
| Workflow | FR-061..070 | WFL | APR | APR | DM-050..057 |
| Meeting | FR-071..079 | MTG | MTG | MTG | DM-058..066 |
| Reporting | FR-080..091 | RPT | RPT | limited | DM-067..077 |
| Knowledge | FR-092..100 | KNO | KNO | AI | DM-078..086 |
| Executive | FR-101..108 | EXE/AST | EXE | HOME/INB/AI | DM-087..091 |
| Governance | FR-109..124 | GOV | ADM | minimal | DM-092..106 |

---

# 6. NFR Trace Matrix

Security NFR-001..015:
→ Security Architecture
→ SEC test suite.

Performance NFR-016..023:
→ Deployment/DB/API design
→ PERF test.

Scalability NFR-024..029:
→ System/Deployment architecture
→ load/capacity evidence.

Availability NFR-030..037:
→ Deployment/job architecture
→ resilience tests.

Backup NFR-038..042:
→ Database/Deployment
→ restore evidence.

Data NFR-043..048:
→ Database Design
→ integrity/migration tests.

AI NFR-049..057:
→ AI Architecture
→ AI evaluation/safety.

UX NFR-058..065:
→ UI/Wireframe
→ accessibility/usability.

Compatibility NFR-066..069:
→ UI/API
→ browser/OS/contract.

Maintainability NFR-070..078:
→ Application Architecture/CI
→ static/test/config evidence.

Deployment NFR-079..084:
→ Deployment Architecture
→ installation/upgrade tests.

Mobile NFR-085..089:
→ Mobile UI/Security
→ mobile security tests.

Compliance NFR-090..094:
→ CMMI/Release evidence.

---

# 7. Orphan Detection

CI/document review phải phát hiện:
- FR không có design/API/test.
- Screen không có FR.
- API không có FR/use case.
- Test không có requirement.
- Entity không có owner/use.
- Event không có producer.
- Event không có consumer và không external.
- P0 NFR không có evidence plan.

---

# 8. Traceability Status

Status:
- PLANNED
- DESIGNED
- IMPLEMENTED
- VERIFIED
- VALIDATED
- RELEASED
- DEFERRED
- REMOVED

Không xóa lịch sử link khi requirement removed.

---

# 9. Automation

Có thể quản lý source-of-truth bằng YAML/CSV sau:
traceability/links.yaml

CI script:
- parse IDs trong docs.
- validate references.
- generate matrix.
- fail nếu P0 orphan.

Giai đoạn v1.0 tài liệu Markdown là baseline; automation là đầu việc Engineering Foundation.

---

# 10. Release Gate

Release không APPROVED nếu:
- P0 FR orphan.
- P0 BRULE blocking chưa test.
- Security NFR thiếu evidence.
- UAT P0 chưa pass.
- release commit/tag không map traceability.

---

# 11. Ownership

Product:
BR/UC.

BA:
BP/BRULE.

Engineering:
FR/API/Data/Code.

QA:
Test/evidence.

Security:
Security NFR.

AI:
AI eval.

Release Manager:
release mapping.

---

# 12. Next Detailed Matrix

Khi source code bắt đầu, sinh file machine-readable gồm từng FR-001..124 và NFR-001..094 với:
- owner
- module
- API
- screen
- tests
- implementation status
- release target.
