# VWork – Mobile Navigation v2.0

# 1. Bottom Navigation
5 tabs:
1. **Trang chủ**
2. **Việc**
3. **Hỏi VWork**
4. **Công cụ**
5. **Tôi**

Notification is top-bar/inbox entry, not mandatory bottom tab.

# 2. Home
- Ask quick input
- favorite Tools
- top work items
- recent
- leader cards if applicable

# 3. Việc
Unified Work Inbox:
- Today
- Overdue
- Upcoming
- Approval
- Meeting
- Report

# 4. Hỏi VWork
Full-screen assistant.
Supports:
- voice/text
- attach file/photo
- current context
- citations
- action cards

# 5. Công cụ
Service launcher.
Mobile-first Tool flows:
- Tham mưu
- Hoàn thiện
- Văn bản đến
- Cuộc họp
- Báo cáo
- Chuyển tài liệu
- Tra cứu
- Soạn nhanh

Heavy admin/data schema screens remain Web-only.

# 6. Tôi
- profile
- context/tenant
- delegation
- sessions
- app preferences
- notification preferences
- connected account status (read-only)

# 7. Leader Mobile
Leader sees additional cards/routes:
- Daily Brief
- Cần duyệt
- Cảnh báo
- Kết luận họp

No separate leader app.

# 8. Deep Links
Push/deep link:
- always fetch + reauthorize;
- route to VWork context or external deep-link after confirmation;
- no sensitive payload beyond minimal identifier.

# 9. Offline
- safe cached summaries only by policy;
- pending action clearly unsent;
- external action never shown success offline.

# 10. Migration Mapping
MOB-HOME-001 → Home v2.
MOB-WRK-001 → Unified Work Inbox.
MOB-AI-001 → Ask VWork.
MOB-MTG-* → Tool/context routes.
MOB-DOC-* → contextual viewer/intelligence.
MOB-PRO-* → Tôi.

# 11. Acceptance
- primary task reachable within 1–2 taps;
- bottom nav ≤5;
- no admin parity requirement;
- external/native action distinction remains clear.