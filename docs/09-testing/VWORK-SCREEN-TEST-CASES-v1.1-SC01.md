# VWork – Screen Test Case Catalog v1.1 – SC-01 Identity / Shell / Executive

**Phạm vi:** 19 màn SC-01.  
**Quy ước:** Mỗi test phải kiểm tra response/UI state + authorization + audit khi action thay đổi trạng thái.

## WEB-AUTH-001
- TC-SCR-WEB-AUTH-001-01 Login hợp lệ → session/context flow đúng.
- TC-SCR-WEB-AUTH-001-02 Sai credential → generic error, không leak account existence.
- TC-SCR-WEB-AUTH-001-03 Disabled user → denied, AUD-IAM-002.
- TC-SCR-WEB-AUTH-001-04 User nhiều membership → chuyển context selection.
- TC-SCR-WEB-AUTH-001-05 Tenant spoof/client-supplied context → ignored/denied.

## WEB-AUTH-002
- TC-SCR-WEB-AUTH-002-01 Liệt kê đúng membership ACTIVE.
- TC-SCR-WEB-AUTH-002-02 Chọn context hợp lệ → AUD-IAM-004.
- TC-SCR-WEB-AUTH-002-03 Membership revoked trước submit → denied + AUD-IAM-005.
- TC-SCR-WEB-AUTH-002-04 User không thể chọn context của user khác.

## WEB-SHELL-001
- TC-SCR-WEB-SHELL-001-01 Shell hiển thị effective context đúng.
- TC-SCR-WEB-SHELL-001-02 Context revoked khi đang dùng → khóa route nghiệp vụ.
- TC-SCR-WEB-SHELL-001-03 Deep link không bypass authorization.
- TC-SCR-WEB-SHELL-001-04 Logout invalidates session theo policy.

## WEB-SHELL-002
- TC-SCR-WEB-SHELL-002-01 Danh sách chỉ notification của SELF.
- TC-SCR-WEB-SHELL-002-02 Mark read một item.
- TC-SCR-WEB-SHELL-002-03 Select All page.
- TC-SCR-WEB-SHELL-002-04 Select All filtered result có confirm.
- TC-SCR-WEB-SHELL-002-05 Bulk mark read re-authorize.
- TC-SCR-WEB-SHELL-002-06 Bulk clear không xóa source resource.
- TC-SCR-WEB-SHELL-002-07 Partial result khi notification state đổi giữa selection/action.

## WEB-SHELL-003
- TC-SCR-WEB-SHELL-003-01 Job list scope đúng.
- TC-SCR-WEB-SHELL-003-02 Retry FAILED job hợp lệ.
- TC-SCR-WEB-SHELL-003-03 Retry RUNNING job bị chặn.
- TC-SCR-WEB-SHELL-003-04 Cancel QUEUED/RUNNING job nếu supported.
- TC-SCR-WEB-SHELL-003-05 Select All + bulk retry.
- TC-SCR-WEB-SHELL-003-06 Cross-scope job denied.
- TC-SCR-WEB-SHELL-003-07 Job history không hard delete.

## WEB-EXE-001
- TC-SCR-WEB-EXE-001-01 KPI chỉ tính object trong scope.
- TC-SCR-WEB-EXE-001-02 Drilldown re-authorize.
- TC-SCR-WEB-EXE-001-03 Projection stale reload.
- TC-SCR-WEB-EXE-001-04 Cross-tenant dashboard leak = 0.

## WEB-EXE-002
- TC-SCR-WEB-EXE-002-01 Inbox authority filtering.
- TC-SCR-WEB-EXE-002-02 Open item reload source.
- TC-SCR-WEB-EXE-002-03 STALE item disable quick action.
- TC-SCR-WEB-EXE-002-04 Select All page.
- TC-SCR-WEB-EXE-002-05 Select All filtered.
- TC-SCR-WEB-EXE-002-06 Bulk acknowledge/clear projection.
- TC-SCR-WEB-EXE-002-07 Bulk không approve/complete source object.
- TC-SCR-WEB-EXE-002-08 Permission revoked after projection → deny source.

## WEB-EXE-003
- TC-SCR-WEB-EXE-003-01 Overdue calculation theo backend timezone.
- TC-SCR-WEB-EXE-003-02 Signal expired không actionable.
- TC-SCR-WEB-EXE-003-03 Source action re-authorize.
- TC-SCR-WEB-EXE-003-04 Select All/bulk acknowledge.
- TC-SCR-WEB-EXE-003-05 Partial bulk result.
- TC-SCR-WEB-EXE-003-06 Cross-scope signal denied.

## WEB-EXE-004
- TC-SCR-WEB-EXE-004-01 Generate Daily Brief async.
- TC-SCR-WEB-EXE-004-02 Brief pin source/version.
- TC-SCR-WEB-EXE-004-03 Source change → STALE/HISTORICAL.
- TC-SCR-WEB-EXE-004-04 Insufficient evidence visible.
- TC-SCR-WEB-EXE-004-05 Generate idempotency.
- TC-SCR-WEB-EXE-004-06 Brief read respects scope.

## WEB-EXE-005
- TC-SCR-WEB-EXE-005-01 Generate Weekly Brief.
- TC-SCR-WEB-EXE-005-02 Correct tenant timezone week boundary.
- TC-SCR-WEB-EXE-005-03 Source/version pin.
- TC-SCR-WEB-EXE-005-04 Source change → stale.
- TC-SCR-WEB-EXE-005-05 Insufficient evidence.
- TC-SCR-WEB-EXE-005-06 Scope enforcement.

## WEB-EXE-006
- TC-SCR-WEB-EXE-006-01 Create conversation.
- TC-SCR-WEB-EXE-006-02 List/read own conversation only.
- TC-SCR-WEB-EXE-006-03 Rename/update own conversation.
- TC-SCR-WEB-EXE-006-04 Archive conversation; history retained.
- TC-SCR-WEB-EXE-006-05 Select All + bulk archive.
- TC-SCR-WEB-EXE-006-06 Retrieval permission evaluated each message.
- TC-SCR-WEB-EXE-006-07 Revoked source excluded.
- TC-SCR-WEB-EXE-006-08 Citation opens exact source version.
- TC-SCR-WEB-EXE-006-09 Insufficient/conflicting evidence behavior.

## MOB-AUTH-001
- TC-SCR-MOB-AUTH-001-01 Login success.
- TC-SCR-MOB-AUTH-001-02 Invalid credential no leak.
- TC-SCR-MOB-AUTH-001-03 Disabled user denied.
- TC-SCR-MOB-AUTH-001-04 Secure token storage.
- TC-SCR-MOB-AUTH-001-05 Tenant spoof denied.

## MOB-AUTH-002
- TC-SCR-MOB-AUTH-002-01 Active context list.
- TC-SCR-MOB-AUTH-002-02 Switch context.
- TC-SCR-MOB-AUTH-002-03 Revoked membership invalidates cached context.
- TC-SCR-MOB-AUTH-002-04 Other-user context denied.

## MOB-AUTH-003
- TC-SCR-MOB-AUTH-003-01 Sensitive action triggers reauth.
- TC-SCR-MOB-AUTH-003-02 Reauth success resumes safe return route.
- TC-SCR-MOB-AUTH-003-03 Reauth fail blocks action.
- TC-SCR-MOB-AUTH-003-04 Threshold policy may revoke session.
- TC-SCR-MOB-AUTH-003-05 Secret never appears in log/analytics.

## MOB-HOME-001
- TC-SCR-MOB-HOME-001-01 KPI scope.
- TC-SCR-MOB-HOME-001-02 Deep-link reauthz.
- TC-SCR-MOB-HOME-001-03 Projection TTL/stale refresh.
- TC-SCR-MOB-HOME-001-04 Cross-tenant leak = 0.

## MOB-HOME-002
- TC-SCR-MOB-HOME-002-01 Load current Daily Brief.
- TC-SCR-MOB-HOME-002-02 Generate permission.
- TC-SCR-MOB-HOME-002-03 Stale badge.
- TC-SCR-MOB-HOME-002-04 Insufficient evidence.
- TC-SCR-MOB-HOME-002-05 Historical brief does not silently mutate.

## MOB-HOME-003
- TC-SCR-MOB-HOME-003-01 Signal scope.
- TC-SCR-MOB-HOME-003-02 Selection mode + Select All.
- TC-SCR-MOB-HOME-003-03 Bulk acknowledge/dismiss.
- TC-SCR-MOB-HOME-003-04 Expired signal not actionable.
- TC-SCR-MOB-HOME-003-05 Source action reauthz.
- TC-SCR-MOB-HOME-003-06 Partial bulk result.

## MOB-INB-001
- TC-SCR-MOB-INB-001-01 Inbox authority filtering.
- TC-SCR-MOB-INB-001-02 Selection mode.
- TC-SCR-MOB-INB-001-03 Select All filtered.
- TC-SCR-MOB-INB-001-04 Bulk acknowledge.
- TC-SCR-MOB-INB-001-05 Bulk clear projection.
- TC-SCR-MOB-INB-001-06 No bulk source approve.
- TC-SCR-MOB-INB-001-07 Stale/permission revoke handling.

## MOB-INB-002
- TC-SCR-MOB-INB-002-01 Item detail via API-EXE-006.
- TC-SCR-MOB-INB-002-02 Typed resource locator.
- TC-SCR-MOB-INB-002-03 Source resource re-authorize.
- TC-SCR-MOB-INB-002-04 Stale item quick action disabled.
- TC-SCR-MOB-INB-002-05 Permission revoke returns safe deny/not-found.

# Exit
- Mọi test ID trên phải được tự động hóa hoặc ghi evidence manual/UAT trước release theo test strategy.
- Cross-tenant, authorization, stale state và bulk semantics là P0.
