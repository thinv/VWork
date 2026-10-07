# VWork – Shared Data & Master Data Specification v1.0

**Mục tiêu:** Xác định lớp dữ liệu dùng chung của toàn VWork để các module không tự định nghĩa trùng lặp hoặc mâu thuẫn.

---

# 1. Phạm vi dữ liệu dùng chung

VWork phân dữ liệu thành 4 lớp:

## SD-01 System Reference Data
Dùng chung toàn nền tảng, do VWork quản trị.
Ví dụ:
- trạng thái chuẩn;
- mức ưu tiên;
- loại đối tượng;
- loại sự kiện;
- loại quyền;
- loại workflow action;
- loại AI grounding.

## SD-02 Tenant Master Data
Dùng chung trong một cơ quan/đơn vị.
Ví dụ:
- cơ cấu tổ chức;
- chức danh;
- cán bộ/người dùng;
- người ký;
- nơi nhận;
- lĩnh vực;
- loại văn bản;
- sổ văn bản;
- mẫu văn bản;
- taxonomy nội bộ.

## SD-03 Administrative Reference Data
Dùng chung cho nghiệp vụ hành chính.
Ví dụ:
- tỉnh/thành;
- xã/phường;
- cơ quan hành chính;
- cấp hành chính;
- mã địa bàn;
- đơn vị cấp trên/cấp dưới.

## SD-04 Shared Business Reference Data
Dùng xuyên nhiều module:
- priority;
- urgency;
- confidentiality;
- task status;
- document status;
- workflow status;
- reporting period type;
- source type;
- evidence type;
- output type;
- notification type.

---

# 2. Nguyên tắc quản trị

## SD-R01 – Một nguồn chuẩn
Một danh mục chỉ có một source of truth.

## SD-R02 – Không hard-code ở client
Web/Mobile không tự định nghĩa enum nghiệp vụ nếu enum thuộc danh mục cấu hình.

## SD-R03 – Phân biệt Code và Label
Code ổn định cho máy; label có thể đổi theo giao diện/ngôn ngữ.

Ví dụ:
code = URGENT
label = Khẩn

## SD-R04 – Versioning
Danh mục ảnh hưởng hồ sơ cũ phải hỗ trợ version/effective date.

## SD-R05 – Không xóa vật lý khi đã được tham chiếu
Chuyển INACTIVE/RETIRED.

## SD-R06 – Tenant override có kiểm soát
Tenant có thể cấu hình label/thứ tự/enable nếu policy cho, nhưng không được phá semantic chuẩn của Core.

## SD-R07 – Audit
Thay đổi Master Data phải có actor, time, before/after.

---

# 3. Shared Data Domains

## 3.1 Organization Master
- OrganizationUnit
- Position
- Membership
- SignatoryProfile
- ReportingUnit
- ExternalAgency

Dùng bởi:
Document, Work, Workflow, Meeting, Reporting, Executive.

## 3.2 Geographic/Administrative Master
- ProvinceCity
- CommuneWard
- AdministrativeLevel
- AdministrativeCode
- ParentAdministrativeUnit

Dùng bởi:
Tenant setup, document profile, reporting, jurisdiction filtering.

## 3.3 Document Reference Master
- DocumentType
- DocumentRegister
- DocumentUrgency
- DocumentConfidentiality
- IssuingAgency
- RecipientGroup
- SignatoryTitle
- DocumentField/Domain

## 3.4 Work Reference Master
- TaskPriority
- TaskStatus
- WorkCaseStatus
- EvidenceType
- RequiredOutputType
- EscalationReason
- HandoverReason

## 3.5 Workflow Reference Master
- WorkflowSubjectType
- WorkflowActionType
- ApprovalStatus
- DelegationType
- SLAUnit
- TransitionReason

## 3.6 Meeting Reference Master
- MeetingType
- ParticipantRole
- DecisionType
- MinutesType

## 3.7 Reporting Reference Master
- ReportingPeriodType
- MetricDataType
- AggregationType
- UnitOfMeasure
- DataQualityRuleType
- SubmissionStatus
- ReconciliationStatus

## 3.8 Knowledge/AI Reference Master
- KnowledgeSourceType
- TaxonomyNodeType
- GroundingType
- ConfidenceBand
- AIUseCaseCode
- AIProviderCapability
- EvaluationMetricType

---

# 4. Master Data Ownership

| Domain | Owner nghiệp vụ | Owner kỹ thuật |
|---|---|---|
| Organization | Tenant Admin / Văn phòng | Identity/Org module |
| Administrative geography | Platform Admin | Shared Data service/module |
| Document reference | Văn thư/Văn phòng | Document module |
| Work reference | Văn phòng | Work module |
| Workflow reference | Tenant Admin | Workflow module |
| Reporting | Cán bộ tổng hợp | Reporting module |
| Knowledge taxonomy | Knowledge Admin | Knowledge module |
| AI reference | AI Admin | AI Governance |

---

# 5. Shared Data Access Pattern

Các module không đọc trực tiếp bảng của nhau nếu có thể tránh.

Pattern:
SharedDataQueryPort
- getCodeList(code)
- getOrganizationUnit(id)
- getUserMembership(id)
- getAdministrativeUnit(code)
- getDocumentType(code)
- getUnitOfMeasure(code)

Có cache nhưng DB/source of truth vẫn authoritative.

---

# 6. Core Shared Tables đề xuất

shared.code_list
- code_list_id
- tenant_id nullable
- code
- name
- scope_type
- version
- status

shared.code_list_item
- item_id
- code_list_id
- code
- label
- description
- sort_order
- effective_from
- effective_to
- status
- metadata_json

shared.administrative_unit
- administrative_unit_id
- code
- name
- level
- parent_code
- valid_from
- valid_to
- status

shared.external_agency
- agency_id
- tenant_id nullable
- code
- name
- agency_type
- administrative_unit_code
- status

shared.unit_of_measure
- code
- name
- symbol
- data_type_compatibility
- status

---

# 7. Cấu hình 34 tỉnh/thành

VWork phải dùng danh mục hành chính hiện hành theo baseline triển khai.

Yêu cầu:
- không hard-code số lượng tỉnh/thành trong logic;
- địa giới hành chính là master data versioned;
- mọi báo cáo theo địa bàn phải dùng administrative_code;
- khi địa giới thay đổi, hồ sơ lịch sử giữ mã/version tại thời điểm phát sinh.

---

# 8. Tenant vs Platform Shared Data

## Platform-owned
- mã hành chính;
- semantic status chuẩn;
- AI capability code;
- system permission code;
- unit of measure chuẩn.

## Tenant-owned
- đơn vị nội bộ;
- chức danh;
- người ký;
- nhóm nơi nhận;
- lĩnh vực nội bộ;
- loại hồ sơ riêng;
- taxonomy riêng.

## Hybrid
- document type;
- workflow type;
- report metric catalog.

Core cung cấp chuẩn; tenant có thể mở rộng.

---

# 9. Sync & Import

Master Data có thể nạp từ:
- file Excel/CSV;
- API;
- system integration;
- cấu hình thủ công.

Mọi import cần:
- validate code;
- duplicate check;
- parent reference;
- preview diff;
- audit;
- rollback batch nếu lỗi.

---

# 10. Shared Data API cần có

GET /code-lists
GET /code-lists/{code}
GET /code-lists/{code}/items
POST /code-lists
POST /code-lists/{code}/versions
GET /administrative-units
GET /administrative-units/{code}
GET /external-agencies
GET /units-of-measure

Các API write phải giới hạn theo role.

---

# 11. Business Rules

SD-BR-001 Code phải unique trong phạm vi danh mục.
SD-BR-002 Item đã được tham chiếu không được hard delete.
SD-BR-003 Label thay đổi không làm đổi code.
SD-BR-004 Tenant extension không được trùng system code nếu semantic khác.
SD-BR-005 Administrative unit phải versioned theo hiệu lực.
SD-BR-006 Report aggregation phải dùng cùng UnitOfMeasure hoặc có rule conversion.
SD-BR-007 Workflow status/action là system-governed, không tenant tự đổi semantic.
SD-BR-008 Data import phải idempotent theo code/version.
SD-BR-009 Master data change phải audit.
SD-BR-010 Cache invalidation xảy ra khi publish version mới.

---

# 12. Acceptance Criteria

- Không có enum nghiệp vụ P0 bị định nghĩa lặp ở nhiều module.
- Web/Mobile lấy label từ shared data khi configurable.
- 100% master data change có audit.
- Administrative data hỗ trợ version/effective date.
- Tenant không sửa semantic system code.
- Report/Task/Document dùng cùng canonical priority/status/reference.
