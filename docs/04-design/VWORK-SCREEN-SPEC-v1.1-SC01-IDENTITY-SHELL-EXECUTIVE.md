# VWork – Screen Specification v1.1 – Batch SC-01 Identity / Shell / Executive

**Phạm vi:** 19 Screen ID  
**Mục tiêu:** Đóng đủ gap theo format cố định: Screen ID → CRUD → Bulk → Permission Code → Data Scope → Allowed States → BRULE → API → Master Data → Exception → Audit Event → Test ID → UAT → Acceptance Criteria.

## Quy ước
- CRUD = semantics của đối tượng trên màn; N/A phải có lý do.
- Bulk chỉ áp dụng collection/projection có selection.
- Actor không thay thế Permission Code.
- Executive Inbox/Signal/Notification là projection; action không thay đổi source object nếu không gọi command của source object.
- Mọi deep link phải re-authorize resource gốc.

---

## WEB-AUTH-001 – Đăng nhập
**CRUD:** N/A – màn xác thực, không quản lý collection.  
**Bulk:** N/A.  
**Permission Code:** IAM.SESSION.LOGIN.  
**Data Scope:** ANONYMOUS → identity scope sau xác thực.  
**Allowed States:** ANONYMOUS; AUTHENTICATING; MFA_REQUIRED nếu bật; AUTHENTICATED_NO_CONTEXT; ACTIVE_SESSION; FAILED.  
**BRULE:** BRULE-001, 002, 004, 005, 009, 010, 095, 097, 098.  
**API:** API-IAM-001 POST /auth/login.  
**Master Data:** Tenant; Membership; User Status; Authentication Policy.  
**Exception:** EX-AUTH-001, 002, 003, 007.  
**Audit Event:** AUD-IAM-001, AUD-IAM-002.  
**Test ID:** TC-SCR-WEB-AUTH-001-01..05.  
**UAT:** UAT-41, UAT-23.  
**Acceptance Criteria:**
1. Không tiết lộ username tồn tại khi sai credential.
2. Disabled user không tạo session.
3. User có một membership active có thể vào context theo policy.
4. User nhiều membership chuyển WEB-AUTH-002.
5. Tenant context không nhận từ client như nguồn tin cậy.

## WEB-AUTH-002 – Chọn tenant/ngữ cảnh
**CRUD:** Read membership; Update = chọn/switch context của chính mình; Add/Delete N/A.  
**Bulk:** N/A.  
**Permission Code:** IAM.CONTEXT.READ_OWN, IAM.CONTEXT.SWITCH_OWN.  
**Data Scope:** SELF – chỉ membership của user hiện tại.  
**Allowed States:** ACTIVE_SESSION; membership ACTIVE; membership DISABLED/EXPIRED chỉ hiển thị nếu policy cho nhưng không selectable.  
**BRULE:** BRULE-001..007, 009, 095, 109.  
**API:** API-IAM-003 GET /me.  
**Master Data:** Tenant; OrganizationUnit; Position; Role.  
**Exception:** EX-AUTH-003, EX-AUTH-006.  
**Audit Event:** AUD-IAM-004, AUD-IAM-005.  
**Test ID:** TC-SCR-WEB-AUTH-002-01..04.  
**UAT:** UAT-42, UAT-23.  
**Acceptance Criteria:**
1. Chỉ membership ACTIVE được chọn.
2. Context switch tạo effective tenant/membership server-side.
3. Membership bị revoke trong lúc chọn phải bị từ chối.
4. Không cho nhập tenantId tùy ý để vượt scope.

## WEB-SHELL-001 – App Shell
**CRUD:** N/A – shell điều hướng; chỉ expose action Logout/Switch Context.  
**Bulk:** N/A.  
**Permission Code:** IAM.CONTEXT.READ_OWN, IAM.CONTEXT.SWITCH_OWN, IAM.SESSION.LOGOUT.  
**Data Scope:** current effective membership.  
**Allowed States:** ACTIVE_SESSION; SESSION_EXPIRED; CONTEXT_REVOKED; DEGRADED_NETWORK.  
**BRULE:** BRULE-001..005, 009, 095, 104, 109.  
**API:** API-IAM-003, API-IAM-002, API-GOV-016.  
**Master Data:** Tenant; OrganizationUnit; Position; Role; NotificationType.  
**Exception:** EX-AUTH-004, EX-AUTH-006.  
**Audit Event:** AUD-IAM-003, AUD-IAM-004.  
**Test ID:** TC-SCR-WEB-SHELL-001-01..04.  
**UAT:** UAT-42, UAT-43, UAT-23.  
**Acceptance Criteria:**
1. Header luôn hiển thị context hiệu lực.
2. Context bị revoke phải khóa navigation nghiệp vụ và yêu cầu chọn lại context.
3. Deep-link module không được bỏ qua backend authorization.
4. Logout làm invalid session theo policy.

## WEB-SHELL-002 – Thông báo
**CRUD:** Read; Update = mark read/unread nếu policy; Delete = clear personal projection, không xóa source object; Create N/A.  
**Bulk:** Select row; Select All page; Select All filtered; Bulk mark read; Bulk clear.  
**Permission Code:** GOV.NOTIFICATION.READ_OWN, GOV.NOTIFICATION.MARK_READ_OWN, GOV.NOTIFICATION.MARK_ALL_READ_OWN, GOV.NOTIFICATION.CLEAR_OWN.  
**Data Scope:** SELF.  
**Allowed States:** UNREAD; READ; CLEARED; RESOURCE_GONE.  
**BRULE:** BRULE-104, 112, 113, 114, 116, 117, 120, 095.  
**API:** API-GOV-016, API-GOV-017, API-GOV-022.  
**Master Data:** NotificationType.  
**Exception:** EX-SHELL-001, EX-SHELL-004, EX-CRUD-001..003.  
**Audit Event:** AUD-GOV-001, AUD-GOV-002, AUD-GOV-003.  
**Test ID:** TC-SCR-WEB-SHELL-002-01..07.  
**UAT:** UAT-44, UAT-21, UAT-22, UAT-23.  
**Acceptance Criteria:**
1. Select All mặc định chọn page hiện tại.
2. Chọn toàn bộ filtered result phải confirm scope.
3. Bulk action chỉ tác động notification của actor.
4. Clear notification không làm thay đổi trạng thái object nguồn.
5. Deep-link luôn re-authorize object nguồn.

## WEB-SHELL-003 – Tác vụ nền
**CRUD:** Read job; Update semantics = Retry/Cancel command; Add/Delete N/A.  
**Bulk:** Select row; Select All; Bulk Retry/Cancel chỉ với item đủ điều kiện và cùng action policy.  
**Permission Code:** GOV.JOB.READ_OWN, GOV.JOB.READ_SCOPE, GOV.JOB.RETRY, GOV.JOB.CANCEL.  
**Data Scope:** SELF hoặc authorized operational scope.  
**Allowed States:** QUEUED, RUNNING, RETRYING, SUCCEEDED, FAILED, CANCELLED, DEAD_LETTER. Retry: FAILED/DEAD_LETTER nếu policy; Cancel: QUEUED/RUNNING nếu supported.  
**BRULE:** BRULE-101, 102, 103, 112, 113, 116, 117, 120.  
**API:** API-GOV-013, 014, 015, 023.  
**Master Data:** JOB_STATUS; job type registry.  
**Exception:** EX-SHELL-002, EX-SHELL-003, EX-CRUD-003, EX-CRUD-005.  
**Audit Event:** AUD-GOV-004, 005, 006.  
**Test ID:** TC-SCR-WEB-SHELL-003-01..07.  
**UAT:** UAT-45, UAT-22, UAT-23.  
**Acceptance Criteria:**
1. User không thấy job ngoài scope.
2. Retry/Cancel chỉ enable ở state hợp lệ.
3. Bulk trả partial result theo từng job.
4. Không hard delete job history.
5. Progress không được giả định hoàn thành trước authoritative status.

## WEB-EXE-001 – Tổng quan cá nhân
**CRUD:** N/A – dashboard projection.  
**Bulk:** N/A.  
**Permission Code:** EXE.DASHBOARD.READ.  
**Data Scope:** SELF + ASSIGNED + delegated scope.  
**Allowed States:** projection theo authoritative Task/Approval states; dashboard không tự tạo state.  
**BRULE:** BRULE-093, 095, 096, 104, 109.  
**API:** API-WRK-007, API-WFL-007.  
**Master Data:** PRIORITY; TASK_STATUS; APPROVAL_STATUS.  
**Exception:** EX-EXE-001, EX-EXE-002.  
**Audit Event:** Không bắt buộc cho dashboard read thường; sensitive drilldown dùng event domain tương ứng.  
**Test ID:** TC-SCR-WEB-EXE-001-01..04.  
**UAT:** UAT-46, UAT-23.  
**Acceptance Criteria:**
1. KPI tính từ authoritative API.
2. Không hiển thị object ngoài scope.
3. Drilldown re-authorize.
4. Dashboard stale phải refresh, không cho hành động dựa projection cũ.

## WEB-EXE-002 – Executive Inbox
**CRUD:** Read projection; Update = acknowledge/personal handling metadata nếu policy; Delete = clear/dismiss projection, không xóa source; Add N/A.  
**Bulk:** Select; Select All page/filtered; bulk acknowledge/clear projection.  
**Permission Code:** EXE.INBOX.READ, EXE.INBOX.READ_ITEM, EXE.INBOX.BULK_SELECT.  
**Data Scope:** ASSIGNED + delegated + authority-resolved scope.  
**Allowed States:** ACTIVE; STALE; RESOLVED; DISMISSED projection; source state lấy từ resource gốc.  
**BRULE:** BRULE-093, 095, 104, 112, 113, 116, 117, 120.  
**API:** API-EXE-001, API-EXE-006, API-EXE-007.  
**Master Data:** PRIORITY; source object type; action-required type.  
**Exception:** EX-EXE-001, EX-EXE-002, EX-CRUD-001..003.  
**Audit Event:** AUD-EXE-001, 002, 003.  
**Test ID:** TC-SCR-WEB-EXE-002-01..08.  
**UAT:** UAT-46, UAT-21, UAT-22, UAT-23.  
**Acceptance Criteria:**
1. Inbox chỉ chứa item actor có thẩm quyền tại thời điểm query.
2. Open item phải reload source và re-authorize.
3. Bulk action không approve/complete source object.
4. STALE item không cho quick action.
5. Select All tuân filter snapshot.

## WEB-EXE-003 – Việc khẩn/quá hạn
**CRUD:** Read projection; Update/Delete chỉ ở personal projection nếu policy; source task không sửa trực tiếp tại đây.  
**Bulk:** Select/Select All; bulk acknowledge/dismiss projection; bulk action nguồn chỉ qua source command đã authorize.  
**Permission Code:** EXE.SIGNAL.READ, EXE.INBOX.BULK_SELECT.  
**Data Scope:** ASSIGNED/ORG scope theo quyền lãnh đạo.  
**Allowed States:** ACTIVE; ACKNOWLEDGED; RESOLVED; EXPIRED.  
**BRULE:** BRULE-055, 056, 093, 095, 096, 104, 112, 113, 116, 117.  
**API:** API-EXE-001, API-EXE-002, API-EXE-008.  
**Master Data:** PRIORITY; TASK_STATUS; signal type.  
**Exception:** EX-EXE-006, EX-EXE-002, EX-CRUD-001..003.  
**Audit Event:** AUD-EXE-008, AUD-EXE-003.  
**Test ID:** TC-SCR-WEB-EXE-003-01..06.  
**UAT:** UAT-46, UAT-23.  
**Acceptance Criteria:**
1. Overdue dùng backend timezone/policy.
2. Signal resolved/expired không còn actionable.
3. Source action luôn re-authorize.
4. Bulk không silently bỏ item ngoài scope.

## WEB-EXE-004 – Daily Brief
**CRUD:** Create = Generate brief; Read; Update/Delete in-place N/A; old brief giữ lịch sử/archival policy.  
**Bulk:** N/A ở màn detail; history/list tương lai áp select all.  
**Permission Code:** EXE.BRIEF.READ, EXE.BRIEF.GENERATE.  
**Data Scope:** authority-resolved executive scope.  
**Allowed States:** NOT_GENERATED; GENERATING; READY; STALE; FAILED; HISTORICAL.  
**BRULE:** BRULE-094, 095, 099, 101, 102, 109.  
**API:** API-EXE-003, API-EXE-004, API-EXE-005.  
**Master Data:** brief period = DAILY; source types.  
**Exception:** EX-EXE-003, EX-EXE-004.  
**Audit Event:** AUD-EXE-004, AUD-EXE-005.  
**Test ID:** TC-SCR-WEB-EXE-004-01..06.  
**UAT:** UAT-47, UAT-23.  
**Acceptance Criteria:**
1. Brief pin source references/version.
2. Source change làm brief historical/stale, không rewrite lịch sử.
3. Không đủ nguồn phải thể hiện thiếu cơ sở.
4. Generate là async/idempotent theo correlation/idempotency policy.

## WEB-EXE-005 – Weekly Brief
**CRUD:** Create = Generate; Read; immutable historical output; archive theo retention.  
**Bulk:** N/A ở detail.  
**Permission Code:** EXE.BRIEF.READ, EXE.BRIEF.GENERATE.  
**Data Scope:** authority-resolved executive scope.  
**Allowed States:** NOT_GENERATED; GENERATING; READY; STALE; FAILED; HISTORICAL.  
**BRULE:** BRULE-094, 095, 099, 101, 102, 109.  
**API:** API-EXE-003, API-EXE-004, API-EXE-005.  
**Master Data:** brief period = WEEKLY; source types.  
**Exception:** EX-EXE-003, EX-EXE-004.  
**Audit Event:** AUD-EXE-004, AUD-EXE-005.  
**Test ID:** TC-SCR-WEB-EXE-005-01..06.  
**UAT:** UAT-47, UAT-23.  
**Acceptance Criteria:** như Daily Brief, nhưng period snapshot phải là tuần nghiệp vụ đúng timezone tenant.

## WEB-EXE-006 – Ask VWork
**CRUD:** Create conversation; Read/list own conversations; Update title/metadata; Archive conversation thay hard delete.  
**Bulk:** Select/Select All conversation list; Bulk archive.  
**Permission Code:** EXE.ASSISTANT.USE, EXE.ASSISTANT.READ_OWN.  
**Data Scope:** conversation owner + current authorized source scope; source scope phải re-evaluate mỗi message.  
**Allowed States:** ACTIVE; ARCHIVED; source context may be PARTIAL/REVOKED.  
**BRULE:** BRULE-088, 089, 090, 091, 095, 099, 109, 111..120.  
**API:** API-AST-001..008.  
**Master Data:** KnowledgeSourceType; Taxonomy; Source Authority; AI Use Case Code.  
**Exception:** EX-EXE-004, EX-EXE-005, EX-KNO-001..004, EX-CRUD-001..003.  
**Audit Event:** AUD-EXE-006, AUD-EXE-007.  
**Test ID:** TC-SCR-WEB-EXE-006-01..09.  
**UAT:** UAT-18, UAT-19, UAT-48, UAT-23.  
**Acceptance Criteria:**
1. New conversation tạo được.
2. Rename/update metadata chỉ own conversation.
3. Archive không xóa audit/history theo retention.
4. Select All/Bulk archive dùng filter snapshot.
5. Mỗi message retrieval theo quyền hiện tại, không dùng cache quyền cũ.
6. Citation phải mở đúng source/version.

---

## MOB-AUTH-001 – Đăng nhập
**CRUD:** N/A.  
**Bulk:** N/A.  
**Permission Code:** IAM.SESSION.LOGIN.  
**Data Scope:** ANONYMOUS → identity scope.  
**Allowed States:** ANONYMOUS; AUTHENTICATING; MFA_REQUIRED; ACTIVE_SESSION; FAILED.  
**BRULE:** BRULE-001, 002, 004, 009, 095, 097, 098.  
**API:** API-IAM-001.  
**Master Data:** Tenant/Membership policy.  
**Exception:** EX-AUTH-001, 002, 003, 007.  
**Audit Event:** AUD-IAM-001, 002.  
**Test ID:** TC-SCR-MOB-AUTH-001-01..05.  
**UAT:** UAT-41, UAT-23.  
**Acceptance Criteria:** tương đương WEB-AUTH-001; token phải lưu secure storage theo mobile security policy.

## MOB-AUTH-002 – Chọn ngữ cảnh
**CRUD:** Read/switch own context; Add/Delete N/A.  
**Bulk:** N/A.  
**Permission Code:** IAM.CONTEXT.READ_OWN, IAM.CONTEXT.SWITCH_OWN.  
**Data Scope:** SELF.  
**Allowed States:** ACTIVE_SESSION + ACTIVE membership.  
**BRULE:** BRULE-001..007, 009, 095.  
**API:** API-IAM-003.  
**Master Data:** Tenant; OrgUnit; Position; Role.  
**Exception:** EX-AUTH-003, 006.  
**Audit Event:** AUD-IAM-004, 005.  
**Test ID:** TC-SCR-MOB-AUTH-002-01..04.  
**UAT:** UAT-42, UAT-23.  
**Acceptance Criteria:** giống Web; cached context phải bị invalid khi membership revoke.

## MOB-AUTH-003 – Khóa/đăng nhập lại
**CRUD:** N/A; command reauthenticate.  
**Bulk:** N/A.  
**Permission Code:** IAM.SESSION.REAUTH.  
**Data Scope:** current session SELF.  
**Allowed States:** SESSION_ACTIVE; REAUTH_REQUIRED; REAUTHENTICATING; REAUTH_OK; REAUTH_FAILED; SESSION_REVOKED.  
**BRULE:** BRULE-009, 095, 097, 098.  
**API:** API-IAM-021 POST /auth/reauth.  
**Master Data:** Authentication/MFA Policy.  
**Exception:** EX-AUTH-004, 005, 007.  
**Audit Event:** AUD-IAM-006, 007, 008.  
**Test ID:** TC-SCR-MOB-AUTH-003-01..05.  
**UAT:** UAT-43.  
**Acceptance Criteria:**
1. Reauth thành công mới tiếp tục action nhạy cảm.
2. Không gửi plaintext secret vào log.
3. Reauth fail theo threshold có thể revoke session.
4. Return route phải re-authorize resource.

## MOB-HOME-001 – Home lãnh đạo
**CRUD:** N/A dashboard projection.  
**Bulk:** N/A.  
**Permission Code:** EXE.DASHBOARD.READ.  
**Data Scope:** SELF + ASSIGNED + delegated executive scope.  
**Allowed States:** projection only.  
**BRULE:** BRULE-093, 095, 096, 104.  
**API:** API-EXE-001.  
**Master Data:** PRIORITY, source type, status.  
**Exception:** EX-EXE-001, 002.  
**Audit Event:** read audit only for sensitive drilldown.  
**Test ID:** TC-SCR-MOB-HOME-001-01..04.  
**UAT:** UAT-46, UAT-23.  
**Acceptance Criteria:** KPI cùng logic backend Web; deep link re-authorize; không cache sensitive projection quá TTL.

## MOB-HOME-002 – Daily Brief card view
**CRUD:** Generate/Read; historical immutable.  
**Bulk:** N/A.  
**Permission Code:** EXE.BRIEF.READ, EXE.BRIEF.GENERATE.  
**Data Scope:** executive scope.  
**Allowed States:** GENERATING; READY; STALE; FAILED; HISTORICAL.  
**BRULE:** BRULE-094, 095, 099, 101, 102.  
**API:** API-EXE-004, API-EXE-005, API-EXE-003 nếu generate.  
**Master Data:** DAILY period; source types.  
**Exception:** EX-EXE-003, 004.  
**Audit Event:** AUD-EXE-004, 005.  
**Test ID:** TC-SCR-MOB-HOME-002-01..05.  
**UAT:** UAT-47.  
**Acceptance Criteria:** source-bound, stale visible, insufficient evidence visible, card không tự refresh thành claim mới không version.

## MOB-HOME-003 – Cảnh báo
**CRUD:** Read; acknowledge/dismiss personal projection; source object không sửa trực tiếp.  
**Bulk:** Multi-select; Select All; bulk acknowledge/dismiss.  
**Permission Code:** EXE.SIGNAL.READ, EXE.INBOX.BULK_SELECT.  
**Data Scope:** assigned/executive scope.  
**Allowed States:** ACTIVE; ACKNOWLEDGED; RESOLVED; EXPIRED.  
**BRULE:** BRULE-055, 056, 095, 096, 104, 112, 113, 116, 117.  
**API:** API-EXE-002, API-EXE-008.  
**Master Data:** PRIORITY; signal type.  
**Exception:** EX-EXE-006, EX-EXE-002, EX-CRUD-001..003.  
**Audit Event:** AUD-EXE-008, AUD-EXE-003.  
**Test ID:** TC-SCR-MOB-HOME-003-01..06.  
**UAT:** UAT-46, UAT-22, UAT-23.  
**Acceptance Criteria:** selection mode mobile hỗ trợ all filtered; expired signal không actionable; source action re-authorize.

## MOB-INB-001 – Executive Inbox
**CRUD:** Read; acknowledge/dismiss projection; Add N/A.  
**Bulk:** Multi-select; Select All; bulk acknowledge/clear.  
**Permission Code:** EXE.INBOX.READ, EXE.INBOX.BULK_SELECT.  
**Data Scope:** assigned/delegated/authority-resolved.  
**Allowed States:** ACTIVE; STALE; RESOLVED; DISMISSED.  
**BRULE:** BRULE-093, 095, 104, 112, 113, 116, 117, 120.  
**API:** API-EXE-001, API-EXE-007.  
**Master Data:** PRIORITY; source object/action type.  
**Exception:** EX-EXE-001, 002, EX-CRUD-001..003.  
**Audit Event:** AUD-EXE-001, AUD-EXE-003.  
**Test ID:** TC-SCR-MOB-INB-001-01..07.  
**UAT:** UAT-46, UAT-21, UAT-22, UAT-23.  
**Acceptance Criteria:** mobile selection mode; partial result; no bulk approve; projection stale guard.

## MOB-INB-002 – Chi tiết Inbox item
**CRUD:** Read projection; source action theo resource screen; projection acknowledge/dismiss nếu policy.  
**Bulk:** N/A detail.  
**Permission Code:** EXE.INBOX.READ_ITEM.  
**Data Scope:** assigned/delegated/authority-resolved + resource scope.  
**Allowed States:** ACTIVE; STALE; RESOLVED; SOURCE_DENIED.  
**BRULE:** BRULE-093, 095, 104.  
**API:** API-EXE-006 + resource API returned by item type.  
**Master Data:** source object/action type; PRIORITY.  
**Exception:** EX-EXE-001, EX-EXE-002.  
**Audit Event:** AUD-EXE-002.  
**Test ID:** TC-SCR-MOB-INB-002-01..05.  
**UAT:** UAT-46, UAT-23.  
**Acceptance Criteria:**
1. API-EXE-006 trả item projection + resource locator typed, không trả generic URL không kiểm soát.
2. Trước source action phải fetch authoritative resource.
3. Permission revoke → SOURCE_DENIED/404 theo policy.
4. STALE item không quick approve/complete.

---

# Batch Exit Criteria
SC-01 chỉ đạt ENGINEERING READY khi:
- 19/19 màn có đủ 13 trường cố định.
- API không còn generic đối với screen action chính.
- Permission/Audit/Exception/Test IDs tồn tại.
- Select All/Bulk explicit ở mọi collection screen.
- CI OpenAPI lint PASS.
