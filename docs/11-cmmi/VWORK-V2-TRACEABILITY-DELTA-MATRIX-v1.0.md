# VWork – V2 Traceability Delta Matrix v1.0

# 1. Purpose
Map Product/BRD v2 vào technical baseline v1 để xác định KEEP / RELABEL / ADD / INTEGRATE / OPTIONAL / DEPRECATE-UX.

# 2. Summary
| V2 Area | Existing baseline | Delta |
|---|---|---|
| AI Draft/Review | FR-029..041, DRF screens/APIs | KEEP + RELABEL as Core Tools |
| Incoming Intelligence | FR-042..049 | KEEP + INTEGRATE official registry |
| Meeting Intelligence | FR-071..079 | KEEP + INTEGRATE calendar |
| Reporting Intelligence | FR-080..091 | KEEP + INTEGRATE official submission |
| Knowledge/RAG | FR-092..100 | KEEP |
| Assistant/Executive | FR-101..108 | KEEP + elevate user-facing |
| Work/Task | FR-050..060 | KEEP platform + OPTIONAL/INTEGRATE |
| Workflow | FR-061..070 | KEEP platform + OPTIONAL/INTEGRATE |
| Document Repository | FR-010..020 | KEEP working context + official DMS INTEGRATE |
| Governance | FR-109..124 | KEEP ADMIN |
| Master Data | FR-125..134 | KEEP ADMIN/INTERNAL |
| Tool Catalog | none | ADD FR2-001..003 |
| Skill/Entitlement | partial tenant entitlement only | ADD FR2-004..008 |
| SoR Registry | implicit integration | ADD FR2-009..014 |
| Integration Profile | partial | ADD FR2-015..017 |
| Unified Work Inbox | Executive/Task inbox fragmented | ADD FR2-018..020 |
| Tool Continuation/Personal Workspace | partial | ADD FR2-021..023 |
| Connected data/health | partial | ADD FR2-024..025 |
| Tool compositions | scattered flows | ADD FR2-026..033 |
| Screen exposure | none | ADD FR2-034..036 |
| Guided onboarding | partial | ADD FR2-037 |
| External audit | partial | ADD FR2-038 |
| Backward compatibility | change control | ADD FR2-039..040 |

# 3. BRD v2 Trace
V2-BR-001..005 → FR2-001..008 → Tool/Skill/Entitlement model.  
V2-BR-006..010,027..029 → FR2-009..017,024..025,038 → SoR/Integration/External Action.  
V2-BR-011..013,036 → FR2-018..023 → Unified Work Inbox/Tool Continuation.  
V2-BR-014..024 → existing AI/Meeting/Reporting/KNO/EXE FR + FR2-026..033.  
V2-BR-025..026 → Integration Profile + N/I/O Matrix.  
V2-BR-030..031,038 → FR2-034..036 → R4 Screen Exposure/IA.  
V2-BR-032..035,039..040 → FR2-008/037/039/040 + BRULE-185..200.

# 4. Screen Delta
No Screen ID deleted in R3.

Disposition target for R4:
- USER_PRIMARY: AI/Draft/Incoming/Meeting Intelligence/Reporting Intelligence/KNO/Assistant/UWI new surface.
- USER_SECONDARY: source/detail/context screens.
- ADMIN: ADM/MD.
- PLATFORM_INTERNAL: technical ops/config not ordinary-user.
- OPTIONAL: task/workflow/basic management screens where external SoR exists.

# 5. API Delta
372 existing APIs: KEEP until explicit API delta.
R3 introduces contract needs but does not allocate canonical API IDs yet.
R4/R5 must allocate APIs for Tool/Skill/Integration/UWI only after domain placement review.

# 6. Data Delta
ADD candidate entities:
ToolDefinition, ToolEntitlement, SkillDefinition, SkillVersion, SkillAssignment, SkillBinding, IntegrationProfile, IntegrationBinding, SourceSystem, SourceObjectReference, SyncState, ExternalAction, UnifiedWorkItem, WorkItemSourceRef, UserToolPreference, ScreenExposurePolicy.

# 7. Business Rule Delta
ADD BRULE-177..200.
Existing BRULE-001..176 remain valid unless later explicitly superseded.

# 8. Test/UAT Delta
Existing 176 UAT remain regression baseline.
R4/R5 must add UAT for:
- multi-skill;
- entitlement vs permission;
- external SoR protection;
- connector failure/unknown result;
- stale/conflict;
- UWI projection;
- deep-link;
- optional capability hidden;
- Tool continuation provenance;
- screen exposure.

# 9. Change Classification
Current status:
- DELETE: 0
- API BREAK: 0
- STATE BREAK: 0
- PERMISSION BREAK: 0
- UX RELABEL/RECLASSIFY: required
- NEW SYSTEM REQUIREMENTS: 40
- NEW BUSINESS RULES: 24

# 10. Gate
R3 traceability PASS khi:
- FR2-001..040 exist;
- BRULE-177..200 reserved/documented;
- SoR/Integration/UWI/Tool-Skill contracts exist;
- no existing API/state removed;
- R4 receives clear screen reclassification inputs.