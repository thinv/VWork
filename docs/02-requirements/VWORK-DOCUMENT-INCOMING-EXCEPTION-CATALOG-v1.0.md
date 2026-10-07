# VWork – Document & Incoming Exception Catalog v1.0

## Document
EX-DOC-001 UNSUPPORTED_FILE  
File không thuộc định dạng cho phép. Action: chọn file khác.

EX-DOC-002 FILE_TOO_LARGE  
Vượt ngưỡng upload. Action: giảm dung lượng/chia file theo policy.

EX-DOC-003 MALWARE_DETECTED  
File bị quarantine. Không preview/process cho tới khi cleared.

EX-DOC-004 DUPLICATE_DOCUMENT  
Checksum/metadata gần trùng. Hiển thị bản nghi trùng và cho người dùng quyết định relation/version/new record.

EX-DOC-005 STALE_DOCUMENT_VERSION  
Version đã đổi từ lúc mở màn. Reload/compare trước khi tiếp tục.

EX-DOC-006 FINAL_DOCUMENT_IMMUTABLE  
Không sửa trực tiếp bản FINAL; tạo version mới.

EX-DOC-007 RELATION_CONFLICT  
Quan hệ trùng/không hợp lệ/circular theo rule.

EX-DOC-008 ARCHIVE_NOT_ALLOWED  
Document còn workflow active hoặc policy chặn archive.

EX-DOC-009 OCR_LOW_CONFIDENCE  
OCR dưới threshold. Yêu cầu review/correction.

EX-DOC-010 EXTRACTION_INSUFFICIENT  
Không đủ dữ liệu để xác nhận field; giữ MISSING/UNVERIFIED.

EX-DOC-011 EXPORT_NOT_ALLOWED  
Actor không có quyền export/download artifact.

EX-DOC-012 BULK_DOCUMENT_PARTIAL  
Một số document immutable/out of scope; trả partial result.

## Incoming
EX-INC-009 REGISTRATION_NUMBER_CONFLICT  
Số đến đã tồn tại trong cùng sổ/kỳ cấu hình.

EX-INC-010 SOURCE_DOCUMENT_REQUIRED  
Không thể hoàn tất đăng ký nếu policy yêu cầu file/source mà chưa có.

EX-INC-011 ROUTING_NOT_CONFIRMED  
AI suggestion chưa được người có quyền xác nhận.

EX-INC-012 PRIMARY_OWNER_MISSING  
Nhiều đơn vị nhưng chưa xác định chủ trì.

EX-INC-013 DEADLINE_AMBIGUOUS  
Nguồn có nhiều/không rõ hạn. Không tự chọn deadline chính thức.

EX-INC-014 ALREADY_CONVERTED_TO_CASE  
Record đã tạo Work Case chính; không tạo duplicate trừ policy cho.

EX-INC-015 RESPONSE_PACKAGE_CONTEXT_INCOMPLETE  
Thiếu nguồn/template/context bắt buộc để tạo package.

EX-INC-016 ARCHIVE_BLOCKED_ACTIVE_WORK  
Incoming record còn Work Case/Task active nên archive bị chặn hoặc yêu cầu override policy.

EX-INC-017 BULK_INCOMING_PARTIAL  
Bulk routing/archive gặp item ngoài scope/immutable.

## Recovery UX
Mỗi exception phải map:
- message tiếng Việt;
- severity;
- retryable;
- suggested action;
- link tới object/source liên quan khi an toàn;
- audit event nếu action thay đổi dữ liệu.
