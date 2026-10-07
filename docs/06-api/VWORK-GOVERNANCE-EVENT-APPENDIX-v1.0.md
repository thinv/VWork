# VWork – Governance Event Appendix v1.0

- EVT-GOV-001 organization.retired.v1
- EVT-GOV-002 user.deactivated.v1
- EVT-GOV-003 user.reactivated.v1
- EVT-GOV-004 role.assignment-changed.v1
- EVT-GOV-005 delegation.revoked.v1
- EVT-GOV-006 document-profile.published.v1
- EVT-GOV-007 ai-provider.disabled.v1
- EVT-GOV-008 ai-model.disabled.v1
- EVT-GOV-009 prompt.published.v1
- EVT-GOV-010 integration.disabled.v1
- EVT-GOV-011 integration.secret-rotated.v1
- EVT-GOV-012 retention.updated.v1
- EVT-GOV-013 session.revoked.v1
- EVT-GOV-014 preferences.updated.v1

Consumer rules:
- user.deactivated → session/access cache invalidation.
- delegation.revoked → authorization cache invalidation.
- provider/model disabled → scheduler/gateway excludes new runs.
- prompt published → no implicit migration of existing pinned runs.
- retention.updated → future retention jobs use new effective version; historical evidence retains old policy reference.
