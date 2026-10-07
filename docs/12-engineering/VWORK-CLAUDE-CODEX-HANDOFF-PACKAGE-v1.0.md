# VWork – Claude/Codex Handoff Package v1.0

## 1. Handoff Status
Business/Screen/Traceability baseline đã qua:
- Final 151-Screen Audit: PASS
- Cross-Domain Traceability Audit: PASS
- Final Gap Closure: PASS

Engineering may start implementation theo feature/domain package, nhưng không được coi đây là release approval.

## 2. Canonical Baseline
- Business Processes: 12
- Business Requirements: 80
- Actors: 14
- Use Cases: 104
- Business Rules: 176
- Functional Requirements: 134
- Non-Functional Requirements: 94
- Screens: 151 = 117 Web + 34 Mobile
- API/OpenAPI operations: 372
- Core UAT scenarios: 176

## 3. Mandatory Documents Before Coding
Global:
1. VWORK-PRODUCT-BOUNDARY-v1.0.md
2. VWORK-BUSINESS-PROCESS-SPEC-v1.0.md
3. VWORK-BRD-v1.0.md
4. VWORK-ACTOR-CATALOG-v1.0.md
5. VWORK-AUTHORITY-RESPONSIBILITY-MATRIX-v1.0.md
6. VWORK-USE-CASE-CATALOG-v1.0.md
7. VWORK-BUSINESS-RULE-CATALOG-v1.0.md
8. VWORK-STATE-MACHINE-CATALOG-v1.0.md
9. VWORK-FUNCTIONAL-REQUIREMENTS-v1.0.md
10. VWORK-NON-FUNCTIONAL-REQUIREMENTS-v1.0.md
11. VWORK-SRS-v1.0.md
12. VWORK-DOMAIN-MODEL-v1.0.md / Data Dictionary / DB Design
13. VWORK-API-CATALOG-v1.0.md + openapi/vwork-openapi.yaml
14. VWORK-CRUD-BULK-INTERACTION-STANDARD-v1.0.md
15. Screen Spec SC-01..SC-09 tương ứng
16. Permission/Audit Catalog
17. Exception Catalog theo domain
18. Screen Test Catalog + Core UAT

Final gates:
- VWORK-FINAL-151-SCREEN-AUDIT-v2.0.md
- VWORK-CROSS-DOMAIN-TRACEABILITY-AUDIT-v1.0.md
- VWORK-FINAL-GAP-CLOSURE-v1.0.md

## 4. Recommended Implementation Order
### Wave E1 – Identity / Governance Foundation
IAM, tenant isolation, membership, role, permission, data scope, delegation, session, audit envelope.

### Wave E2 – Shared / Master Data
Code lists, administrative reference, UoM, taxonomy, import/diff/effective-date/cache invalidation.

### Wave E3 – Document Foundation
Document/version/storage/metadata/relations/upload/OCR intake and provenance.

### Wave E4 – Incoming / Work / Task
Incoming registration → requirement confirmation → Work Case → Task → evidence → closure.

### Wave E5 – Workflow / Approval
Workflow definition/version, approval queue/actions, delegation, exact subject version, post-action orchestration.

### Wave E6 – Draft / Review
Draft/context snapshot, AI generation, review findings, blocker/stale behavior, package/versioning.

### Wave E7 – Meeting
Meeting/participant/agenda/audio/transcript/decision/minutes → confirmed decision to Task.

### Wave E8 – Reporting
Cycle/obligation/submission/schema/extraction/DQ/reconciliation/deterministic aggregation/report/export.

### Wave E9 – Knowledge / RAG / Assistant
Knowledge lifecycle, permission-before-ranking, citation, invalidation, prompt-injection protection, Ask VWork.

### Wave E10 – Executive Intelligence
Inbox, risk views, brief, actions and contextual assistant.

Mobile slices may ship alongside domain backend once authoritative APIs/state/permissions are stable.

## 5. Non-Negotiable Engineering Rules
Claude/Codex MUST NOT:
- infer permission from title/position;
- bypass tenant/data scope;
- add or rename business states without change control;
- hard delete referenced/final/issued/history data;
- convert AI candidate to official data without required human gate;
- invent deadline/owner/source fact;
- allow related object link to grant access;
- change API behavior without OpenAPI/catalog update;
- create duplicate enums/master data in client/service;
- perform official reporting arithmetic in LLM;
- retrieve RAG source before permission filtering;
- silently rewrite downstream object when source changes;
- expose raw provider/integration secrets;
- mutate append-only audit/history;
- skip CRUD/Select All/Bulk semantics on applicable management screens.

## 6. Feature Handoff Contract
Every implementation ticket/PR must include:
- Feature/Screen IDs
- BP/BR/UC/BRULE/FR/NFR IDs
- Actors and permission codes
- Data scope
- Preconditions
- State transitions
- Main/alternate flows
- Exception codes
- Data entities/master data
- API IDs/endpoints
- Events
- Audit events
- Idempotency/concurrency rule
- CRUD/Bulk behavior
- Acceptance Criteria
- Screen Test IDs
- UAT IDs
- Migration impact
- Backward compatibility

## 7. Backend Enforcement
UI visibility is not authorization.
Server must enforce:
- tenant
- membership
- permission
- data scope
- delegation
- object state/version
- optimistic concurrency where applicable
- immutable/reference protection
- idempotency for write/run/bulk/event consumers.

## 8. Cross-Domain Rules
### Incoming → Work
Owner/deadline from AI remain candidate until confirmed.
Conversion retains source/provenance/correlation/idempotency.

### Draft → Approval
Approval pins exact subject version.
Return/reject/approve must synchronize only that version.

### Task → Work Case
Task completion never auto-closes Work Case; closure gate is separate.

### Meeting → Task
Only confirmed decision creates Task.
Decision edits after Task create reconciliation, not silent mutation.

### Reporting
Approved schema + quality/reconciliation gates precede official deterministic aggregation.
AI narrative cannot change aggregate numbers.

### Knowledge/RAG
Authorization/effective-source filtering precedes retrieval ranking.
Revoked source invalidates active retrieval/cache.
Citation opens exact version and re-authorizes current actor.

### Master Data
Historical business snapshot must not be rewritten by current master label/version change.

## 9. API Contract Rule
Canonical API identity is x-api-id in OpenAPI.
Current parity:
- API Catalog: 372
- OpenAPI: 372
Any API addition/change:
1. impact requirements;
2. update catalog/OpenAPI;
3. update screen mapping;
4. update test/UAT;
5. run lint/contract tests.

## 10. Definition of Ready
A feature is ready only when:
- business flow unambiguous;
- permission/data scope explicit;
- state/exception explicit;
- API/data/master mapping explicit;
- acceptance/test/UAT explicit.

If unclear, coder raises GAP; coder does not invent behavior.

## 11. Definition of Done
Required:
- implementation matches exact API/state semantics;
- tenant/security negative tests;
- state/exception tests;
- audit evidence;
- CRUD/Bulk tests where applicable;
- OpenAPI parity;
- migration and rollback/compatibility plan if schema changes;
- unit/integration/contract/E2E tests;
- relevant UAT automated or evidence-ready;
- no P0/P1 unresolved defect.

## 12. PR Template Minimum
Scope  
Trace IDs  
State transitions  
Permissions/Data Scope  
API/Data/Migration  
Events/Audit  
UI/CRUD/Bulk  
Tests/UAT  
Security cases  
Known limitations  
Evidence

## 13. Change Control
Spec deviation requires explicit change:
Requirement/BRULE/Screen/API/Data/Test impact → review → update canonical docs → then code.
Do not “fix the spec in code”.

## 14. Engineering Handoff Result
BUSINESS READY: PASS  
SCREEN READY: PASS  
TRACEABILITY READY: PASS  
TEST DESIGN READY: PASS  
ENGINEERING HANDOFF: APPROVED FOR IMPLEMENTATION

Release/UAT approval remains separate.
