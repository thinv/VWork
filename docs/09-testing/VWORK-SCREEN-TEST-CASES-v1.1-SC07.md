# VWork – Screen Test Case Catalog v1.1 – SC-07 Knowledge / AI

## WEB-KNO-001
- TC-SCR-WEB-KNO-001-01 list scope
- 02 create template
- 03 edit draft
- 04 published immutable
- 05 archive
- 06 select all
- 07 bulk partial
- 08 cross-tenant deny

## WEB-KNO-002
- 01 read exact template/version
- 02 edit permission
- 03 archive rule
- 04 related usage visibility
- 05 source/version pin

## WEB-KNO-003
- 01 create version
- 02 publish
- 03 stale conflict
- 04 immutable published
- 05 taxonomy/master-data validation
- 06 audit

## WEB-KNO-004
- 01 source list scope
- 02 create
- 03 update
- 04 archive/restore
- 05 select all
- 06 bulk reindex/archive
- 07 revoked excluded
- 08 cross-tenant deny

## WEB-KNO-005
- 01 add source
- 02 duplicate detection
- 03 source authority required
- 04 effective period validation
- 05 taxonomy assignment
- 06 ingestion job

## WEB-KNO-006
- 01 exact source/version
- 02 create version
- 03 publish
- 04 reindex
- 05 revoke
- 06 restore
- 07 taxonomy update
- 08 invalidation audit

## WEB-KNO-007
- 01 permission-before-ranking
- 02 effective-date filter
- 03 authority ranking
- 04 conflicting source behavior
- 05 revoked source excluded
- 06 select results/bulk action
- 07 retrieval trace permission
- 08 cross-tenant deny

## WEB-KNO-008
- 01 grounded answer citations
- 02 insufficient evidence
- 03 conflicting evidence
- 04 exact-version citation
- 05 revoked source after prior answer
- 06 prompt injection blocked
- 07 current permission re-evaluation
- 08 retrieval snapshot audit
- 09 cross-tenant deny

## MOB-AI-001
- 01 create conversation
- 02 message grounded
- 03 insufficient evidence
- 04 archive
- 05 revoked source excluded
- 06 prompt injection blocked
- 07 stale answer marker

## MOB-AI-002
- 01 contextual chat object scope
- 02 context reauthorization every message
- 03 source revoke
- 04 exact citations
- 05 object inaccessible mid-conversation

## MOB-AI-003
- 01 open exact citation
- 02 source/version pin
- 03 permission revoked
- 04 locator works
- 05 no metadata leak

# Exit
P0: permission-before-ranking, tenant isolation, revoke invalidation, exact citations, evidence sufficiency, conflict handling, prompt injection isolation.
