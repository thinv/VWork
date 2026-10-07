# VWork – Screen CRUD & Bulk Matrix v1.0

**Mục tiêu:** Kiểm tra toàn bộ nhóm màn hình VWork theo yêu cầu Thêm – Sửa – Xóa/Lưu trữ – Chọn – Chọn tất cả – Bulk Action.

Ký hiệu:
Y = bắt buộc
C = có điều kiện/quyền
N = không áp dụng
A = archive/deactivate/revoke thay hard delete

| Nhóm màn | Thêm | Sửa | Xóa/A | Chọn | Chọn all | Bulk | Ghi chú |
|---|---:|---:|---:|---:|---:|---:|---|
| Văn bản | Y | Y | A/C | Y | Y | Y | Final không hard delete |
| Văn bản đến | Y | Y | A | Y | Y | Y | Bulk routing/priority |
| Dự thảo | Y | Y | C/A | Y | Y | Y | Submitted giữ version |
| Hồ sơ công việc | Y | Y | A | Y | Y | Y | Completed archive |
| Công việc | Y | Y | C/A | Y | Y | Y | Bulk assign/priority/status |
| Hàng đợi duyệt | N | C | N | Y | Y | C | Không bulk approve mặc định |
| Workflow definition | Y | Y/version | A | Y | Y | Y | Published tạo version mới |
| Cuộc họp | Y | Y | A | Y | Y | Y | Approved minutes giữ history |
| Kỳ báo cáo | Y | Y | A | Y | Y | Y | Closed không hard delete |
| Submission | Y | Y/version | A | Y | Y | Y | Replace version |
| Metric schema | Y | Y/version | A | Y | Y | C | Approved schema immutable |
| Template | Y | Y/version | A | Y | Y | Y | Published giữ version |
| Knowledge source | Y | Y/version | A | Y | Y | Y | Published scope-aware |
| User | Y | Y | A | Y | Y | Y | Disable thay delete nếu referenced |
| Organization Unit | Y | Y | A | Y | Y | Y | Mapping successor khi retire |
| Role | Y | Y | A | Y | Y | Y | Không xóa role đang dùng |
| Delegation | Y | C | revoke | Y | Y | Y | Active revoke, không hard delete |
| Document Profile | Y | Y | A | Y | Y | Y | Version nếu ảnh hưởng official docs |
| AI Provider | Y | Y | A | Y | Y | Y | Secret ngoài source |
| AI Model | Y | Y | A | Y | Y | Y | Disable thay delete |
| Prompt | Y | version | A | Y | Y | Y | Published immutable |
| Integration | Y | Y | A | Y | Y | Y | Credential ref |
| Retention Policy | Y | version | A | Y | Y | C | Policy used phải version |
| Audit | N | N | N | Y | Y | Export | Immutable |
| Job Operations | N | retry/cancel | N | Y | Y | Retry/Cancel | Không CRUD nghiệp vụ |
| Notification | N | read/unread | clear | Y | Y | Mark read | Không source of truth |
| Code List | Y | Y/version | A | Y | Y | Y | System code hạn chế |
| Administrative Unit | Import/version | version | retire | Y | Y | Import/export | Platform managed |

# Quy tắc triển khai

1. Mọi màn list trong Screen Catalog phải map vào bảng trên.
2. Nếu N, phải ghi rõ lý do trong screen spec.
3. Nếu C, acceptance criteria phải mô tả permission/state condition.
4. Không được dùng Delete chung cho object immutable.
5. Bulk action phải có partial-result contract.
6. Mobile selection mode tương đương Web checkbox/bulk bar.
