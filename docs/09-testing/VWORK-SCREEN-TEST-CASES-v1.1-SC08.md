# VWork – Screen Test Case Catalog v1.1 – SC-08 Governance

## WEB-ADM-001
TC-SCR-WEB-ADM-001-01 org list scope; -02 create; -03 update; -04 retire referenced unit; -05 parent/child validation; -06 select all; -07 bulk partial; -08 cross-tenant deny.

## WEB-ADM-002
TC-SCR-WEB-ADM-002-01 user list scope; -02 create; -03 update; -04 deactivate; -05 reactivate policy; -06 session revoke effect; -07 select all; -08 bulk deactivate; -09 cross-tenant deny.

## WEB-ADM-003
TC-SCR-WEB-ADM-003-01 role create; -02 role update; -03 archive; -04 explicit data scope; -05 assignment; -06 privilege escalation deny; -07 select all; -08 bulk assignment partial; -09 permission catalog read; -10 cross-tenant deny.

## WEB-ADM-004
TC-SCR-WEB-ADM-004-01 create delegation; -02 update; -03 revoke; -04 expired deny; -05 overlap conflict; -06 no chain; -07 select all; -08 bulk revoke.

## WEB-ADM-005
TC-SCR-WEB-ADM-005-01 create profile; -02 update draft; -03 create version; -04 publish; -05 published immutable; -06 archive; -07 historical pin.

## WEB-ADM-006
TC-SCR-WEB-ADM-006-01 create provider; -02 masked secret; -03 update provider; -04 disable provider; -05 create/update model; -06 disable model; -07 fallback allowlist; -08 select all; -09 bulk disable partial.

## WEB-ADM-007
TC-SCR-WEB-ADM-007-01 prompt create; -02 create version; -03 publish; -04 draft blocked in production; -05 archive; -06 select all; -07 bulk archive.

## WEB-ADM-008
TC-SCR-WEB-ADM-008-01 run evaluation; -02 reproducibility pins; -03 list/detail; -04 cancel running; -05 completed immutable; -06 select/export; -07 cross-scope deny.

## WEB-ADM-009
TC-SCR-WEB-ADM-009-01 usage scope; -02 filter snapshot; -03 export; -04 no secret leakage; -05 cross-tenant deny.

## WEB-ADM-010
TC-SCR-WEB-ADM-010-01 create integration; -02 update; -03 test; -04 rotate secret; -05 rotation failure; -06 disable; -07 secret masked; -08 select all; -09 bulk partial.

## WEB-ADM-011
TC-SCR-WEB-ADM-011-01 audit scope; -02 append-only; -03 no edit; -04 no delete; -05 select all filtered; -06 audited export.

## WEB-ADM-012
TC-SCR-WEB-ADM-012-01 read policy; -02 update; -03 legal hold blocks deletion; -04 select all; -05 bulk update partial; -06 version/audit; -07 cross-tenant deny.

## WEB-ADM-013
TC-SCR-WEB-ADM-013-01 list jobs; -02 retry failed; -03 cancel queued/running; -04 succeeded retry denied; -05 dead-letter visibility; -06 select all; -07 bulk partial; -08 idempotency.

## MOB-NOT-001
TC-SCR-MOB-NOT-001-01 own notifications; -02 mark read; -03 select all; -04 bulk clear; -05 notification prefs; -06 invalid preference.

## MOB-PRO-001
TC-SCR-MOB-PRO-001-01 read self; -02 edit allowed fields; -03 admin fields blocked; -04 stale profile update; -05 audit.

## MOB-PRO-002
TC-SCR-MOB-PRO-002-01 own delegations; -02 create; -03 update; -04 revoke; -05 expired state; -06 bulk revoke.

## MOB-PRO-003
TC-SCR-MOB-PRO-003-01 own sessions; -02 revoke one; -03 other-user session denied; -04 revoke all; -05 current-session policy; -06 audit.

## MOB-PRO-004
TC-SCR-MOB-PRO-004-01 read prefs; -02 theme/language update; -03 notification update; -04 security-field injection denied; -05 validation; -06 audit.

# Exit
P0: privilege escalation, tenant isolation, secret masking, user/session deactivation, delegation revocation, legal hold, audit immutability, state-aware jobs.
