# VWork – Knowledge & RAG Governance Specification v1.0

**Phạm vi:** Template, knowledge source, taxonomy, ingestion, indexing, retrieval, RAG answer, citation, source authority, hiệu lực, revoke và audit.

# 1. Mục tiêu
Đảm bảo câu trả lời/AI draft dựa trên nguồn được phép, đúng hiệu lực, đúng version và truy được nguồn.

# 2. Đối tượng
- Template
- TemplateVersion
- KnowledgeSource
- KnowledgeVersion
- Taxonomy
- TaxonomyNode
- KnowledgeChunk
- SearchProjection
- VectorProjection
- RetrievalRun
- Citation
- KnowledgePolicy

# 3. Source Types
- văn bản nội bộ
- quy định/pháp lý
- hướng dẫn nghiệp vụ
- template
- quy trình
- FAQ
- báo cáo
- hồ sơ lịch sử
- tài liệu đào tạo
- external authoritative source nếu tích hợp

# 4. Source Authority
Mỗi Knowledge Source phải có:
- owner
- source type
- authority level
- effective_from
- effective_to optional
- status
- access scope
- classification
- version

Authority levels đề xuất:
A1 OFFICIAL
A2 APPROVED_INTERNAL
A3 REFERENCE
A4 USER_PROVIDED
A5 UNVERIFIED

Retrieval có thể dùng authority để rerank/filter theo use case.

# 5. Lifecycle
DRAFT → REVIEW → PUBLISHED → STALE → ARCHIVED.
Reindexing là processing state, không thay business lifecycle.

Chỉ PUBLISHED và còn hiệu lực được dùng mặc định cho official RAG.

# 6. Ingestion
Flow:
Upload/Register → Malware/Parse → Metadata → Taxonomy → Permission → Chunk → Index → Quality Check → Publish.

Không index raw file bị quarantine.

# 7. Versioning
Published version immutable.
Version mới:
- giữ version cũ cho lịch sử;
- mark projection old/stale;
- index version mới;
- citation cũ vẫn mở đúng source version.

# 8. Taxonomy
Taxonomy có:
- code
- name
- parent
- type
- status
- tenant scope

CRUD:
- Add/Edit/Retire
- Select All
- Bulk move/retire có validation chống circular hierarchy.

# 9. Chunk
Chunk phải giữ:
- source_id
- source_version
- page/section
- taxonomy
- access scope
- authority
- effective period
- classification
- checksum

Không cho chunk mất reference về source gốc.

# 10. Retrieval Policy
Thứ tự bắt buộc:
1. Auth context
2. Tenant scope
3. Data scope
4. Source lifecycle/effective date
5. Classification policy
6. Query/retrieval
7. Rerank
8. Evidence sufficiency

Không retrieve rồi mới filter quyền.

# 11. Hybrid Retrieval
Có thể dùng:
- lexical/BM25
- vector
- metadata filter
- rerank

Structured state/status phải query core DB, không dùng RAG thay transaction database.

# 12. Evidence Sufficiency
Trạng thái:
SUFFICIENT
PARTIAL
INSUFFICIENT
CONFLICTING

Nếu INSUFFICIENT:
- abstain/chưa đủ cơ sở.

Nếu CONFLICTING:
- nêu xung đột hoặc áp authority policy có giải thích.

# 13. Citation
Citation phải chứa:
- source name
- source version
- page/section/cell/timestamp
- excerpt hash/reference
- authority
- effective state

UI click mở đúng version.

# 14. Revocation
Khi source:
- archive;
- permission revoke;
- effective_to expired;
- classification tăng mức hạn chế;

thì retrieval phải ngừng trả source trong SLA cấu hình.

Cache/vector index phải invalidate/reindex.

# 15. Prompt Injection
Tài liệu là dữ liệu, không phải instruction.

Controls:
- source wrapping
- instruction detection
- tool allowlist
- no action execution from document text
- red-team corpus

# 16. RAG Answer
Mỗi answer quan trọng:
- FACT/INFERENCE/MISSING
- evidence sufficiency
- citations
- model/prompt trace
- retrieval run id

# 17. Knowledge CRUD/Bulk
Knowledge source:
- Add/Edit metadata/Create version/Archive
- Select/Select All
- Bulk taxonomy
- Bulk access scope
- Bulk publish only when all pass validation
- Bulk archive

Template:
- Add/Edit/Create version/Publish/Archive
- Select All
- Bulk taxonomy/scope

Taxonomy:
- full CRUD with retire semantics.

# 18. Permission
ACT-13 manages source/taxonomy.
ACT-12 manages AI policy but không mặc định đọc content.
ACT-10 manages scope/config.
User query chỉ thấy source có quyền.

# 19. Audit
Audit:
- ingest
- publish
- archive
- permission change
- taxonomy change
- reindex
- retrieval for sensitive use case
- citation access optional

# 20. Quality Metrics
- retrieval recall
- citation correctness
- groundedness
- conflict detection
- abstention accuracy
- stale source rate
- permission leakage = 0

# 21. Acceptance
1. Permission filter trước retrieval.
2. Source version/citation đúng.
3. Stale/archived/revoked source không trả.
4. Insufficient evidence không hallucinate.
5. Conflicting source xử lý rõ.
6. Prompt injection không điều khiển tool/action.
7. CRUD/Select All/Bulk đầy đủ.
