# VWork – Master Data Event Appendix v1.0

- EVT-MD-001 code-list.version-published.v1
- EVT-MD-002 code-item.changed.v1
- EVT-MD-003 administrative-data.published.v1
- EVT-MD-004 administrative-unit.retired.v1
- EVT-MD-005 administrative-successor.mapped.v1
- EVT-MD-006 external-agency.changed.v1
- EVT-MD-007 uom.version-published.v1
- EVT-MD-008 taxonomy.changed.v1
- EVT-MD-009 master-import.applied.v1
- EVT-MD-010 master-cache.invalidation-requested.v1
- EVT-MD-011 master-cache.invalidated.v1

Rules:
- publish/semantic/effective-date changes phải phát invalidation.
- consumer deduplicate theo eventId.
- business records đã final không được rewrite snapshot chỉ vì master event.
- reporting/query historical resolve theo effective/version, không latest-only.
