# VWork – Screen Test Case Catalog v1.1 – SC-06 Reporting

## WEB-RPT-001
TC-SCR-WEB-RPT-001-01 List scope; -02 Create; -03 Edit; -04 Close; -05 Reopen reason; -06 Archive; -07 Select All; -08 Bulk partial; -09 Cross-tenant deny.

## WEB-RPT-002
TC-SCR-WEB-RPT-002-01 Valid cycle; -02 Invalid period; -03 Duplicate obligation policy; -04 Owner scope; -05 Schema policy; -06 Draft cancel; -07 Audit.

## WEB-RPT-003
TC-SCR-WEB-RPT-003-01 KPI authoritative; -02 Missing submissions; -03 Blocker count; -04 aggregation status; -05 stale draft signal; -06 drilldown scope; -07 cross-tenant deny.

## WEB-RPT-004
TC-SCR-WEB-RPT-004-01 Add obligation; -02 Edit; -03 Retire; -04 retire with submission; -05 Select All; -06 bulk reminder; -07 deadline bulk; -08 partial result; -09 reporting-unit scope.

## WEB-RPT-005
TC-SCR-WEB-RPT-005-01 Submit; -02 wrong period; -03 checksum duplicate; -04 replace version; -05 archive non-active; -06 Select All; -07 bulk validate; -08 version lineage; -09 unit scope.

## WEB-RPT-006
TC-SCR-WEB-RPT-006-01 AI suggest; -02 candidate marker; -03 accept candidate; -04 reject; -05 duplicate metric blocked; -06 incompatible aggregation; -07 no auto-approve.

## WEB-RPT-007
TC-SCR-WEB-RPT-007-01 Add metric; -02 edit; -03 retire; -04 Select All; -05 bulk required/unit; -06 approve; -07 approved immutable; -08 create new version; -09 cycle pin; -10 duplicate code block.

## WEB-RPT-008
TC-SCR-WEB-RPT-008-01 extraction run; -02 raw/normalized values; -03 provenance drilldown; -04 low confidence; -05 verify/correct; -06 unit mismatch; -07 Select All; -08 bulk verify; -09 stale schema/source handling.

## WEB-RPT-009
TC-SCR-WEB-RPT-009-01 quality run; -02 severity; -03 resolve; -04 override permission; -05 override reason; -06 blocker gate; -07 Select All; -08 bulk resolve; -09 source drilldown.

## WEB-RPT-010
TC-SCR-WEB-RPT-010-01 reconciliation run; -02 total/detail mismatch; -03 prior-period mismatch; -04 authoritative-source mismatch; -05 override reason; -06 original retained; -07 bulk same-rule override; -08 audit.

## WEB-RPT-011
TC-SCR-WEB-RPT-011-01 not-ready gate; -02 deterministic aggregation; -03 no LLM arithmetic; -04 unit compatibility; -05 required submission gate; -06 blocker gate; -07 historical runs; -08 drilldown inputs.

## WEB-RPT-012
TC-SCR-WEB-RPT-012-01 generate; -02 narrative citations; -03 numbers immutable from aggregation; -04 edit narrative; -05 source change stale; -06 submit exact version; -07 submitted immutable; -08 insufficient evidence.

## WEB-RPT-013
TC-SCR-WEB-RPT-013-01 export job; -02 DOCX; -03 XLSX; -04 PDF; -05 provenance metadata; -06 Select All history; -07 download authorization.

# Exit
P0: tenant isolation, schema approval gate, unit conversion, field-level lineage, blocker gate, deterministic arithmetic, reconciliation history, export provenance.
