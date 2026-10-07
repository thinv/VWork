# VWork – Screen Test Case Catalog v1.1 – SC-04 Work Case / Task

## Work Case screens
### WEB-WC-001
TC-SCR-WEB-WC-001-01 List scope; -02 Create; -03 Edit; -04 Delete draft; -05 Archive terminal; -06 Select All; -07 Bulk partial; -08 Export permission; -09 Cross-tenant deny.

### WEB-WC-002
TC-SCR-WEB-WC-002-01 Create valid case; -02 Source provenance; -03 Owner required; -04 Owner scope; -05 Duplicate source case policy; -06 Cancel draft.

### WEB-WC-003
TC-SCR-WEB-WC-003-01 Read overview; -02 Update allowed field; -03 Complete gate; -04 Blocking task prevents closure; -05 Missing output prevents closure; -06 Pending approval prevents closure; -07 Reopen reason; -08 Archive terminal only; -09 Related-object permission recheck.

### WEB-WC-004
TC-SCR-WEB-WC-004-01 Timeline order; -02 Immutable events; -03 Related object redaction; -04 Select All/export; -05 Cross-scope safety.

### WEB-WC-005
TC-SCR-WEB-WC-005-01 Link document; -02 Document scope; -03 Unlink without delete; -04 Select All; -05 Bulk unlink partial; -06 Audit relation change.

### WEB-WC-006
TC-SCR-WEB-WC-006-01 Task list in case; -02 Create task; -03 One primary owner; -04 Select All; -05 Bulk assign; -06 Bulk priority; -07 Bulk remind; -08 Bulk complete blocked.

### WEB-WC-007
TC-SCR-WEB-WC-007-01 Meeting list; -02 Meeting scope; -03 Link; -04 Unlink; -05 No permission inheritance leak.

### WEB-WC-008
TC-SCR-WEB-WC-008-01 Add output; -02 Read output; -03 Final output immutable; -04 Remove unreferenced output; -05 Select All; -06 Bulk export; -07 Closure sees required outputs.

## Task screens
### WEB-TSK-001
TC-SCR-WEB-TSK-001-01 Assigned scope; -02 Accept; -03 Stale item; -04 Select All; -05 Bulk accept if policy; -06 Bulk remind; -07 Bulk complete blocked; -08 Cross-tenant deny.

### WEB-TSK-002
TC-SCR-WEB-TSK-002-01 Manager scope; -02 Assign; -03 Reassign; -04 Cancel; -05 Reopen; -06 Deadline change history; -07 Select All; -08 Bulk assign partial; -09 Bulk remind; -10 Cross-tenant deny.

### WEB-TSK-003
TC-SCR-WEB-TSK-003-01 Detail; -02 Action/state matrix; -03 Source provenance; -04 Source scope revoke; -05 Accept; -06 Progress; -07 Evidence; -08 Review accept; -09 Review return; -10 Handover; -11 Cancel/reopen; -12 Optimistic lock.

### WEB-TSK-004
TC-SCR-WEB-TSK-004-01 Create draft; -02 Exactly one owner; -03 Inactive owner blocked; -04 Coordinators allowed; -05 Deadline provenance; -06 Assign audit; -07 Cancel draft.

### WEB-TSK-005
TC-SCR-WEB-TSK-005-01 Progress update; -02 Percent does not alter state; -03 Add blocker; -04 Resolve blocker; -05 Terminal state denied; -06 Stale conflict.

### WEB-TSK-006
TC-SCR-WEB-TSK-006-01 Add evidence; -02 Required evidence gate; -03 Remove unreferenced evidence; -04 Referenced evidence delete denied; -05 Submit review; -06 Complete direct policy; -07 Audit evidence/review.

### WEB-TSK-007
TC-SCR-WEB-TSK-007-01 History order; -02 Handover reason; -03 Old/new owner retained; -04 Inactive target blocked; -05 Select/export history; -06 No history mutation.

### WEB-TSK-008
TC-SCR-WEB-TSK-008-01 Overdue derived flag; -02 Status unchanged by overdue; -03 Blocker drilldown; -04 Select All; -05 Bulk remind; -06 Bulk reassign partial; -07 Rate-limit/reminder policy.

## Mobile
### MOB-WRK-001
TC-SCR-MOB-WRK-001-01 Own work scope; -02 Selection mode; -03 Select All; -04 Accept; -05 Bulk remind; -06 Bulk complete blocked; -07 Stale refresh.

### MOB-WRK-002
TC-SCR-MOB-WRK-002-01 Detail; -02 Refresh before action; -03 Source permission; -04 Progress; -05 Evidence; -06 Review; -07 Handover; -08 Cancel/reopen; -09 Offline stale conflict.

### MOB-WRK-003
TC-SCR-MOB-WRK-003-01 Progress; -02 Blocker; -03 Percent/state independence; -04 Terminal deny; -05 Offline conflict.

### MOB-WRK-004
TC-SCR-MOB-WRK-004-01 Add evidence; -02 Required evidence; -03 Remove eligible; -04 Referenced delete denied; -05 Submit review; -06 Idempotent upload/retry.

### MOB-WRK-005
TC-SCR-MOB-WRK-005-01 Case overview; -02 Closure gate; -03 Reopen permission; -04 Related source scope; -05 Timeline; -06 Outputs; -07 Stale case action conflict.

### MOB-WRK-006
TC-SCR-MOB-WRK-006-01 Create task; -02 One primary owner; -03 Target scope; -04 Deadline provenance; -05 Assign audit; -06 Stale owner/case refresh.

# Exit
P0: tenant isolation, one primary owner, deadline provenance, evidence gate, blocking closure, handover history, stale state, bulk partial-result semantics.
