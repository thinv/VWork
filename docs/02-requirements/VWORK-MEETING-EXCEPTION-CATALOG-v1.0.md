# VWork – Meeting Exception Catalog v1.0

## Meeting
EX-MTG-006 MEETING_NOT_EDITABLE  
Cuộc họp đã ARCHIVED/CANCELLED hoặc actor không có quyền sửa.

EX-MTG-007 INVALID_TIME_RANGE  
endAt <= startAt hoặc ngoài policy.

EX-MTG-008 PARTICIPANT_DUPLICATE  
Cùng person/membership bị thêm trùng.

EX-MTG-009 PARTICIPANT_SCOPE_DENIED  
Actor cố thêm/xem participant ngoài scope.

EX-MTG-010 AGENDA_ORDER_CONFLICT  
Thứ tự agenda trùng/không hợp lệ.

EX-MTG-011 AUDIO_FORMAT_INVALID  
File audio không hỗ trợ hoặc vượt size/duration policy.

EX-MTG-012 AUDIO_MISSING  
Không thể transcribe khi chưa có audio hợp lệ.

EX-MTG-013 TRANSCRIPT_LOW_CONFIDENCE  
Segment dưới threshold; cần review/correction.

EX-MTG-014 SPEAKER_UNRESOLVED  
Không xác định được speaker; phải giữ UNKNOWN thay vì gán chắc chắn.

EX-MTG-015 TRANSCRIPT_STALE  
Audio/source đổi sau transcript; transcript cũ thành stale.

EX-MTG-016 DECISION_CANDIDATE_NOT_CONFIRMED  
Không được create Task từ candidate chưa xác nhận.

EX-MTG-017 DECISION_OWNER_MISSING  
Decision tạo Task nhưng chưa có official owner.

EX-MTG-018 DECISION_DEADLINE_AMBIGUOUS  
Deadline mơ hồ/candidate; không tạo official deadline.

EX-MTG-019 DECISION_ALREADY_LINKED_TASK  
Decision đã có Task chính thức; duplicate guard.

EX-MTG-020 DECISION_CHANGED_AFTER_TASK  
Decision sửa sau khi đã tạo Task; cần reconciliation, không silent update.

EX-MTG-021 MINUTES_CONTEXT_INCOMPLETE  
Thiếu attendance/transcript/decision context bắt buộc.

EX-MTG-022 MINUTES_STALE  
Minutes sinh từ transcript/decision version cũ.

EX-MTG-023 MINUTES_NOT_EDITABLE  
Minutes đã submitted/approved/final; phải tạo version mới.

EX-MTG-024 BULK_MEETING_PARTIAL  
Bulk archive/participant/agenda/attendance có item ngoài scope/state.

EX-MTG-025 MEETING_ARCHIVE_BLOCKED  
Còn transcript/minutes/task reconciliation hoặc policy chưa cho archive.

## Recovery UX
Mỗi exception phải có:
- code;
- message tiếng Việt;
- severity;
- retryable;
- suggested action;
- audit requirement.
