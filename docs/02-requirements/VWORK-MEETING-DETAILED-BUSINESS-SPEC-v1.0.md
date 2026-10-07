# VWork – Meeting Detailed Business Specification v1.0

**Phạm vi:** Chuẩn bị họp, giấy mời, thành phần, agenda, audio, transcript, kết luận, quyết định, biên bản và nhiệm vụ sau họp.

# 1. Mục tiêu
Biến cuộc họp thành nguồn thông tin có cấu trúc và nhiệm vụ có thể theo dõi, không dừng ở transcript.

# 2. Actor
- ACT-06 Thư ký cuộc họp
- ACT-07 Người chủ trì
- ACT-01 Lãnh đạo
- ACT-03 Tham mưu
- ACT-04 Chuyên môn
- ACT-05 Người duyệt biên bản nếu cấu hình

# 3. Đối tượng
- Meeting
- MeetingInvitation
- MeetingParticipant
- AgendaItem
- AudioAsset
- Transcript
- TranscriptSegment
- SpeakerIdentity
- DecisionCandidate
- MeetingDecision
- MeetingTaskLink
- MeetingMinutes
- MeetingMinutesVersion

# 4. Tạo cuộc họp
Nguồn:
- nhập thủ công;
- parse giấy mời;
- từ Work Case;
- integration/calendar future.

Bắt buộc:
- title
- meeting type
- start/end
- location/online link
- chair
- secretary
- participants
- agenda optional
- related Work Case optional

# 5. Giấy mời
AI/parser có thể trích:
- thời gian
- địa điểm
- chủ trì
- thành phần
- nội dung
- tài liệu kèm

Extraction chỉ là candidate đến khi secretary xác nhận.

# 6. Thành phần tham dự
Participant fields:
- person/membership/external
- organization
- role
- required/optional
- attendance status
- proxy/delegated participant optional

Attendance:
INVITED, CONFIRMED, ATTENDED, ABSENT, REPRESENTED.

# 7. Agenda
Một cuộc họp có 0..N agenda item:
- order
- title
- presenter
- expected decision
- related documents
- time allocation

# 8. Audio
Nguồn:
- upload file
- recording future

Audio phải:
- checksum
- duration
- format
- source
- access scope

Không tự xóa audio khi transcript được tạo.

# 9. Transcript
STT sinh transcript theo segment:
- start/end
- speaker
- text
- confidence
- verification state

Low confidence:
- highlight;
- cho phép edit;
- audit correction.

# 10. Speaker Resolution
AI có thể gợi ý speaker.
Human xác nhận khi cần.

Không chắc:
- UNKNOWN SPEAKER.
Không gán bừa vào người gần nhất trong participant list.

# 11. Decision Candidate
AI có thể trích:
- conclusion
- decision
- task
- owner
- deadline
- required output
- source timestamp

Candidate chưa official.

# 12. Human Confirmation
Secretary/chair có thể:
- confirm
- edit
- reject
- merge/split candidate

Khi confirm:
- tạo MeetingDecision.
- lưu provenance timestamp.

# 13. Decision Types
- INFORMATION
- CONCLUSION
- DIRECTIVE
- TASK
- FOLLOW_UP
- REQUEST_FOR_OPINION

# 14. Meeting to Task
Chỉ MeetingDecision đã confirmed mới tạo Task.

Task phải:
- link decision;
- preserve meeting provenance;
- owner/deadline confirmed;
- không tự gán owner nếu candidate thiếu.

# 15. Minutes
Biên bản có thể sinh từ:
- meeting metadata;
- attendance;
- agenda;
- verified transcript;
- confirmed decisions.

AI sinh draft; human review.

# 16. Minutes Versioning
Submitted/Approved minutes immutable.
Sửa sau submit:
- new version;
- approval flow lại theo policy.

# 17. Approval
Nếu cấu hình:
Draft Minutes → Review → Submit → Approve/Return → Final.

Chair có thể là approver.
Không suy quyền chỉ từ chair role nếu workflow không cấu hình.

# 18. CRUD/Bulk
Meeting list:
- Add/Edit/Archive
- Select/Select All
- Bulk invite/export/archive eligible

Participants:
- Add/Edit/Remove
- Select All
- Bulk attendance/notification

Agenda:
- Add/Edit/Delete/Reorder
- Select All/Bulk remove draft

Transcript:
- edit segment
- select segments
- bulk mark verified chỉ khi policy cho
- không hard delete verified source; dùng redact/correct theo policy

Decision candidates:
- Select All
- bulk reject/confirm chỉ khi owner/deadline rules thỏa

# 19. Exception Cases
- đổi lịch
- hủy họp
- họp kéo dài quá dự kiến
- audio thiếu đoạn
- audio nhiều file
- participant ngoài hệ thống
- speaker không xác định
- quyết định không có owner
- nhiều owner candidate
- deadline mơ hồ
- biên bản sửa sau submit
- task tạo rồi decision bị chỉnh

# 20. Rule khi Decision thay đổi sau Task
Nếu confirmed decision đã tạo task rồi bị chỉnh:
- không silent update task.
- tạo reconciliation warning.
- người có quyền xác nhận update task hoặc giữ task cũ.
- audit.

# 21. Security
Audio/transcript có thể chứa dữ liệu nhạy cảm:
- access scope riêng;
- push notification không chứa transcript raw;
- export permission.

# 22. Acceptance
1. Transcript có timestamp.
2. Low confidence visible.
3. Candidate chưa official.
4. Decision confirmed mới tạo Task.
5. Task giữ provenance.
6. Minutes versioned.
7. CRUD/Select All/Bulk đầy đủ theo scope.
