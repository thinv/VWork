# VWork – Native / Integrated / Optional Matrix v1.0

**Purpose:** Quy định mode triển khai mặc định của capability VWork cho xã/phường để tránh trùng hệ thống do tỉnh/thành phố đã cấp.

# 1. Quy ước

- **NATIVE:** VWork trực tiếp cung cấp và là hệ thống thực thi chính.
- **INTEGRATED:** hệ thống khác là System of Record; VWork đọc/ghi theo connector contract.
- **OPTIONAL:** VWork có implementation riêng nhưng chỉ bật khi tenant chưa có hệ thống tương đương hoặc chủ động chọn dùng.

Mỗi tenant có thể override mode theo Integration Profile, nhưng không được thay đổi ownership trái thực tế nguồn dữ liệu.

# 2. Matrix cấp sản phẩm

| Capability | Default Mode | System of Record | User-facing | Ghi chú |
|---|---|---|---|---|
| Tham mưu văn bản | NATIVE | VWork | Primary | AI + knowledge + source-grounded |
| Soạn thảo AI | NATIVE | VWork | Primary | Draft là VWork-native cho tới khi gửi hệ thống chính thức |
| Rà soát/hoàn thiện văn bản | NATIVE | VWork | Primary | Không sửa silent |
| Xử lý nội dung văn bản đến | NATIVE | Hybrid | Primary | Bản ghi chính thức có thể nằm ở eOffice |
| Sổ văn bản đến/đi chính thức | INTEGRATED | External | Secondary | Không xây thay eOffice mặc định |
| Phát hành/ký số | INTEGRATED | External | Secondary | Deep-link/API |
| OCR/PDF/scan conversion | NATIVE | VWork | Primary | Derivative artifact |
| Kho mẫu | NATIVE | VWork | Primary | Personal/Tenant/System |
| Kho tri thức/RAG | NATIVE | VWork | Primary | Citation + authority/version |
| Hỏi VWork | NATIVE | VWork | Primary | Re-authorize per message |
| Trợ lý cuộc họp | NATIVE | Hybrid | Primary | Calendar có thể external; transcript/minutes intelligence VWork |
| Lịch họp/lịch công tác chính thức | INTEGRATED | External | Secondary | VWork có optional calendar |
| Tổng hợp báo cáo | NATIVE | Hybrid | Primary | Submission chính thức có thể external |
| Hệ thống gửi/nhận báo cáo chính thức | INTEGRATED | External | Secondary | Không cạnh tranh SoR |
| Tổng hợp bảng số liệu | NATIVE | VWork | Primary | Deterministic aggregation |
| Việc của tôi / Unified Work Inbox | NATIVE | Hybrid | Primary | Gom item từ nhiều SoR |
| Giao việc chính thức | OPTIONAL/INTEGRATED | External hoặc VWork | Secondary | Tùy tenant |
| Work Case | OPTIONAL/NATIVE support | VWork | Secondary | Dùng làm context ngay cả khi task external |
| Workflow/Approval nội bộ | OPTIONAL/INTEGRATED | External hoặc VWork | Secondary | Exact version + audit |
| Một cửa/TTHC | INTEGRATED | External | Secondary | Không xây lại |
| Hồ sơ cán bộ/HR | INTEGRATED | External | Admin/secondary | Chỉ mirror identity/org cần thiết |
| SSO/Directory | INTEGRATED | External | Invisible | Có local fallback theo deployment |
| Organization basic directory | OPTIONAL | VWork/External | Admin | Chỉ bật nếu thiếu directory |
| CSDL chuyên ngành | INTEGRATED | External | Contextual | Read/query/write theo connector policy |
| Master Data VWork | NATIVE | VWork | Admin | Chỉ master phục vụ VWork |
| Audit VWork | NATIVE | VWork | Admin | Append-only |
| AI Provider/Prompt/Evaluation | NATIVE | VWork | Admin | Governance |
| Notification Hub | OPTIONAL/NATIVE | VWork | Primary | Có thể nhận event external |
| Executive Brief | NATIVE | Hybrid | Leader | Grounded aggregation từ nhiều nguồn |

# 3. Matrix theo 12 technical domains

## CAP-01 Identity & Organization
Default: **INTEGRATED + OPTIONAL fallback**
- SSO/identity: Integrated.
- Org directory: Integrated.
- VWork role/data scope: Native.
- Delegation VWork: Native cho quyền VWork.
- Signatory profile: Integrated/Optional.

## CAP-02 Document Management
Default: **HYBRID**
- Working documents/upload/context: Native.
- Official registry/issue/signature: Integrated.
- Basic repository: Optional.

## CAP-03 Document Intelligence
Default: **NATIVE**
- OCR/parse/classify/extract/provenance.

## CAP-04 AI Draft & Review
Default: **NATIVE**

## CAP-05 Incoming Document Processing
Default: **HYBRID**
- official incoming record: Integrated nếu có eOffice;
- extraction/advice/draft: Native.

## CAP-06 Work Case & Task
Default: **OPTIONAL/HYBRID**
- Work Context: Native.
- Official Task: Integrated nếu source exists.
- VWork Task: Optional.

## CAP-07 Workflow & Approval
Default: **OPTIONAL/HYBRID**
- VWork approval cho VWork-native artifact.
- external approval workflow: Integrated.

## CAP-08 Meeting Intelligence
Default: **HYBRID**
- Calendar/invitation may be external.
- Audio/transcript/decision/minutes intelligence: Native.

## CAP-09 Reporting
Default: **HYBRID**
- reporting intelligence: Native.
- official provincial reporting submission: Integrated.

## CAP-10 Templates & Knowledge
Default: **NATIVE**

## CAP-11 Assistant & Executive Intelligence
Default: **NATIVE/HYBRID**
- intelligence native;
- source data may come from external systems.

## CAP-12 Governance/Audit/Integration
Default: **NATIVE**

# 4. Deployment Resolution Rule

Mỗi capability được resolve theo thứ tự:
1. Có authoritative external system không?
2. Có connector được phép không?
3. Tenant có muốn VWork thay thế phần basic không?
4. Dữ liệu nào VWork được phép own?
5. Mode cuối = NATIVE / INTEGRATED / OPTIONAL.

# 5. UI Behavior by Mode

## NATIVE
- CRUD/action đầy đủ theo permission.
- VWork state authoritative.
- VWork URL là primary destination.

## INTEGRATED
- UI hiển thị nguồn hệ thống.
- field authoritative có thể read-only.
- action chính thức gọi connector hoặc mở deep-link.
- sync status/conflict phải rõ.
- không giả thành công nếu external action chưa xác nhận.

## OPTIONAL
- Nếu disabled: ẩn khỏi primary IA.
- Nếu enabled: dùng full native semantics.
- Switching mode cần migration/change-control.

# 6. Source-of-Truth Metadata

Mọi integrated/hybrid object phải hỗ trợ:
- sourceSystem;
- sourceObjectId;
- sourceVersion;
- sourceOfTruth;
- syncMode;
- lastSyncedAt;
- syncStatus;
- deepLink;
- correlationId;
- conflictState.

# 7. Conflict Rules

- External authoritative field thắng khi policy xác định rõ.
- VWork-native annotation/intelligence không được overwrite external source.
- Conflict phải hiển thị, không silent merge.
- Offline/cached copy phải có timestamp và stale state.

# 8. Acceptance

Matrix được coi là áp dụng đúng khi:
- không có module nào mặc định tuyên bố ownership của external SoR;
- cán bộ có thể dùng Core Tools mà không cần thay eOffice/TTHC/reporting system;
- Optional capability có thể bật/tắt theo tenant;
- backend và UI đều biết mode/source-of-truth;
- deep-link/connector action có audit và error state.
