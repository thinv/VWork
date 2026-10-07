# VWork – Business Rule v2 Additions v1.0

**IDs reserved:** BRULE-177..200  
**Base:** VWORK-BUSINESS-RULE-CATALOG-v1.0 (BRULE-001..176)

## BRULE-177 – External SoR Ownership
Integrated object authoritative state thuộc Source-of-Record Registry; VWork projection không tự trở thành authoritative.

## BRULE-178 – Capability Mode Resolution
NATIVE/INTEGRATED/OPTIONAL phải resolve server-side theo tenant Integration Profile.

## BRULE-179 – External Mutation Through Contract
External authoritative mutation chỉ qua connector/deep-link action contract được phép.

## BRULE-180 – No False External Success
VWork không hiển thị success cuối cùng nếu external outcome chưa confirmed; dùng ACCEPTED/UNKNOWN khi phù hợp.

## BRULE-181 – Source Reference Required
Mọi integrated/hybrid projection phải lưu sourceSystem/sourceObjectId và source version/freshness khi có.

## BRULE-182 – Stale External Data
Dữ liệu vượt freshness SLA phải được đánh dấu stale; action nhạy cảm re-fetch/revalidate.

## BRULE-183 – Sync Conflict Is Explicit
Conflict giữa local context và source không silent merge.

## BRULE-184 – Deep Link Allowlist
Deep link external chỉ từ connector/provider template allowlisted.

## BRULE-185 – Skill Cannot Grant Authorization
Skill/SkillAssignment không cấp Permission, Role hoặc Data Scope.

## BRULE-186 – Entitlement Is Not Permission
Commercial entitlement không được dùng như authorization.

## BRULE-187 – Multi-Skill Composition
Một user có thể có nhiều Skill; conflict giữa Skill content phải resolve theo policy, không theo thứ tự ngẫu nhiên.

## BRULE-188 – Published Skill Immutable
SkillVersion published không sửa in-place.

## BRULE-189 – Tool Availability Deterministic
Effective Tool availability phải được tính deterministically từ entitlement, authz, skill, connector, mode và policy.

## BRULE-190 – Tool Continuation Preserves Provenance
Context chuyển Tool phải giữ source/version/correlation, không copy dữ liệu mất nguồn.

## BRULE-191 – Unified Work Item Is Projection
Unified Work Item không phải mặc định official Task.

## BRULE-192 – Inbox Visibility Does Not Grant Source Access
Thấy item trong Inbox không đồng nghĩa được quyền mở source object.

## BRULE-193 – Official Work Mutation Reauthorization
Complete/assign/change deadline trên external/native official work phải re-authorize tại thời điểm action.

## BRULE-194 – Personal Prioritization Is Non-Authoritative
Pin/snooze/tag cá nhân không đổi official priority/state trừ khi user gọi official action.

## BRULE-195 – Connector Action Idempotency
External write/action phải có idempotency key và correlation.

## BRULE-196 – External Unknown Outcome
Timeout/unknown external result phải vào reconciliation state, không retry mù gây duplicate.

## BRULE-197 – Connector Secret Isolation
Connector secret tenant-scoped, masked và không xuất log/audit/export.

## BRULE-198 – Optional Capability Hidden When Disabled
Optional capability disabled không xuất primary IA hoặc nhận new object/action.

## BRULE-199 – Screen Exposure Is Not Authorization
Exposure metadata chỉ điều khiển UX; backend authz vẫn bắt buộc.

## BRULE-200 – V2 Backward Compatibility
UX/product refactor không được thay state/API/data semantics v1 mà không qua Delta Change Control.