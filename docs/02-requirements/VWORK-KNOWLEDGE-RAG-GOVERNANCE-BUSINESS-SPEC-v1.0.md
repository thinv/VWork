# VWork – Knowledge / RAG Governance Business Spec v1.0

## 1. Phạm vi
Template, Knowledge Source, Knowledge Version, Taxonomy Assignment, Ingestion/Re-index, Search, Grounded Query, Citation, Retrieval Trace và Assistant Context.

## 2. Nguyên tắc bắt buộc
1. Permission filter trước ranking/reranking.
2. Source/version authority rõ.
3. Published version immutable.
4. Revoke/archive phải invalidate retrieval/index/cache.
5. Citation pin exact version.
6. Evidence thiếu → abstain/insufficient evidence.
7. Evidence xung đột → nêu conflict hoặc áp authority policy giải thích được.
8. Source content là untrusted data; prompt injection không được override policy/tool permission.
9. Mỗi answer lưu retrieval/context snapshot.
10. Conversation history không mở rộng quyền.
11. Taxonomy assignment dùng canonical node/version.
12. Human admin kiểm soát publish/revoke/reindex.

## 3. Knowledge Source lifecycle
DRAFT → INGESTING → READY → PUBLISHED → STALE | REVOKED | ARCHIVED → RESTORED/PUBLISHED theo policy.

## 4. Template lifecycle
DRAFT → REVIEW → PUBLISHED → SUPERSEDED → ARCHIVED.
Published version immutable.

## 5. Retrieval pipeline
Query → Resolve tenant/user context → Permission/data-scope filter → Source-state/effective-date filter → Candidate retrieval → Ranking/Reranking → Evidence sufficiency → Conflict handling → Answer generation → Citation validation → Audit.

## 6. Authority
Nguồn có sourceType, authorityLevel, owner, effectiveFrom/effectiveTo, jurisdiction/tenant scope.
Authority policy không được tự động che giấu conflict có ý nghĩa; nếu precedence không đủ rõ, phải trình bày mâu thuẫn.

## 7. Citation
Citation phải lưu sourceId, sourceVersionId, locator (page/section/table/cell/timestamp), checksum/hash khi phù hợp, retrievedAt.
Open citation re-authorize actor hiện tại.

## 8. Revoke invalidation
Revoke/Archive/permission reduction → publish invalidation event → remove from active retrieval within SLA → clear/expire semantic cache → future query không dùng source đó.
Historical answer vẫn giữ citation version đã dùng, nhưng mở citation phải kiểm quyền hiện tại.

## 9. Prompt Injection
Source instruction, HTML, hidden text, OCR content và attached instructions đều là untrusted data.
Không được:
- thay đổi system/tenant policy;
- gọi tool ngoài permission;
- tiết lộ secret/system prompt;
- mở rộng source scope;
- tự thực thi action nghiệp vụ.

## 10. Acceptance
- Cross-tenant leak = 0.
- Revoked source không còn trong retrieval sau SLA.
- Grounded claim có citation.
- Insufficient evidence không bị biến thành FACT.
- Prompt injection blocked/audited.
- Same historical answer vẫn trỏ đúng version nguồn đã dùng.
