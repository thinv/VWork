# VWork – Product Requirement Refactor – Wave R3 Closure v1.0

## 1. Scope Completed
R3 – System Requirement Refactor đã hoàn thành 9 hạng mục:
1. Functional Requirements v2 / Delta
2. SRS v2 / Delta
3. System-of-Record Registry
4. Integration Profile Specification
5. Tool / Skill / Entitlement Model
6. Unified Work Inbox Business + System Spec
7. External Action / Deep-Link Contract
8. Business Rule v2 additions
9. V2 Traceability Delta Matrix

## 2. New Baseline
- FR v1 canonical: 134
- FR2 delta: 40
- BRULE canonical: 200 = 176 v1 + 24 v2
- Existing Screen IDs: 151 unchanged
- Existing API IDs/OpenAPI: 372 unchanged
- Existing Core UAT: 176 unchanged

## 3. Architecture Decisions Locked
- System of Record explicit for integrated/hybrid objects.
- Capability mode resolved server-side: NATIVE/INTEGRATED/OPTIONAL.
- Tool is orchestration/experience layer, not duplicate domain database.
- Skill does not grant authorization.
- Commercial entitlement is separate from permission.
- Unified Work Inbox is projection, not official Task system.
- External mutation goes through connector/deep-link contract.
- Unknown external result enters reconciliation state.
- Screen exposure controls UX only; backend authorization remains authoritative.

## 4. No-Break Guarantee
R3 introduces:
- 0 Screen deletion
- 0 API deletion
- 0 state breaking change
- 0 permission breaking change
- 0 canonical API ID allocation for new v2 services yet

R3 intentionally defers API ID allocation and screen reclassification to R4/R5 after UX/domain placement review.

## 5. R4 Inputs Ready
R4 must now produce:
- 151-Screen Exposure Matrix
- User-facing IA v2
- Service Launcher/Home specification
- Golden Screen Catalog
- Web Navigation v2
- Mobile Navigation v2
- Visual Design Reference Pack
- UI delta handoff for Claude/Codex

## 6. Engineering Gate
Allowed before R4:
- backend foundation independent of user-facing packaging;
- connector framework abstractions;
- source reference foundations;
- security/audit foundations that do not preempt API allocation.

Not allowed before R4 approval:
- new ordinary-user navigation based on 12 domains;
- exposing all management screens;
- designing official document/task/reporting UX as VWork-owned when SoR may be external;
- allocating ad-hoc APIs for Tool/Skill/UWI without architecture/change-control.

## 7. Exit Status
R3 SYSTEM REQUIREMENT REFACTOR: PASS  
R4 UX RECLASSIFICATION: READY TO START  
ENGINEERING UI HANDOFF v2: PENDING R4
