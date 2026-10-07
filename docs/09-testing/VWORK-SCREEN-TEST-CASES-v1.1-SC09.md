# VWork – Screen Test Case Catalog v1.1 – SC-09 Shared / Master Data

## WEB-MD-001
TC-SCR-WEB-MD-001-01 overview scope; -02 ownership display; -03 active/retired counts; -04 stale-cache indicator; -05 cross-tenant deny.

## WEB-MD-002
TC-SCR-WEB-MD-002-01 list; -02 create tenant list; -03 system semantic readonly; -04 update; -05 retire; -06 select all; -07 bulk partial; -08 version/history link.

## WEB-MD-003
TC-SCR-WEB-MD-003-01 exact version; -02 update metadata; -03 create version; -04 retire; -05 effective period; -06 system readonly.

## WEB-MD-004
TC-SCR-WEB-MD-004-01 create; -02 duplicate code; -03 edit draft; -04 semantic change version; -05 stale version; -06 ownership policy.

## WEB-MD-005
TC-SCR-WEB-MD-005-01 list items; -02 add; -03 edit; -04 activate/deactivate; -05 referenced retire; -06 select all; -07 bulk state change; -08 partial result; -09 stable code; -10 historical resolution.

## WEB-MD-006
TC-SCR-WEB-MD-006-01 create item; -02 duplicate code; -03 effective overlap; -04 edit label; -05 code immutable after reference; -06 retire; -07 readonly retired.

## WEB-MD-007
TC-SCR-WEB-MD-007-01 current tree; -02 as-of tree; -03 create staging; -04 edit staging; -05 validate; -06 publish; -07 tenant official-edit deny; -08 retire/successor; -09 select all bulk; -10 no hard-coded count.

## WEB-MD-008
TC-SCR-WEB-MD-008-01 current detail; -02 historical versions; -03 effective date; -04 staging update; -05 retire; -06 successor mapping; -07 invalid successor.

## WEB-MD-009
TC-SCR-WEB-MD-009-01 create agency; -02 update; -03 source/external id; -04 referenced retire; -05 select all; -06 bulk retire; -07 duplicate code; -08 cross-scope deny.

## WEB-MD-010
TC-SCR-WEB-MD-010-01 create UoM; -02 update label; -03 incompatible conversion; -04 semantic version; -05 retire; -06 select all; -07 bulk action; -08 historical metric unit; -09 reporting compatibility.

## WEB-MD-011
TC-SCR-WEB-MD-011-01 list document types; -02 tenant extension; -03 system collision deny; -04 edit; -05 retire referenced; -06 select all; -07 issued-document snapshot.

## WEB-MD-012
TC-SCR-WEB-MD-012-01 domain CRUD; -02 duplicate; -03 retire referenced; -04 select all; -05 bulk partial; -06 tenant isolation.

## WEB-MD-013
TC-SCR-WEB-MD-013-01 recipient CRUD; -02 duplicate; -03 retire referenced; -04 select all; -05 bulk; -06 historical resolution.

## WEB-MD-014
TC-SCR-WEB-MD-014-01 work-case type CRUD; -02 retire referenced; -03 snapshot stable; -04 select all; -05 bulk; -06 tenant scope.

## WEB-MD-015
TC-SCR-WEB-MD-015-01 meeting type CRUD; -02 retire referenced; -03 snapshot stable; -04 select all; -05 bulk; -06 tenant scope.

## WEB-MD-016
TC-SCR-WEB-MD-016-01 report type CRUD; -02 retire referenced; -03 reporting-cycle historical type; -04 select all; -05 bulk; -06 tenant scope.

## WEB-MD-017
TC-SCR-WEB-MD-017-01 add root/child; -02 duplicate sibling; -03 move; -04 circular move deny; -05 retired parent deny; -06 retire; -07 branch select; -08 bulk move; -09 historical node resolution.

## WEB-MD-018
TC-SCR-WEB-MD-018-01 upload; -02 format validation; -03 column mapping; -04 duplicate detection; -05 parent/effective validation; -06 cannot skip diff; -07 cancel; -08 checksum idempotency; -09 audit.

## WEB-MD-019
TC-SCR-WEB-MD-019-01 diff statuses; -02 invalid blocks apply; -03 conflict blocks apply; -04 select all NEW; -05 bulk include/exclude; -06 confirm; -07 apply; -08 retry idempotent; -09 partial result explicit.

## WEB-MD-020
TC-SCR-WEB-MD-020-01 history filter; -02 exact before/after; -03 effective version; -04 no edit/delete; -05 select all export; -06 export audit/scope.

# Exit
P0: semantic protection, tenant isolation, referenced-delete protection, administrative version/effective-date, UoM compatibility, taxonomy anti-cycle, import diff/idempotency, cache invalidation, historical snapshot preservation.
