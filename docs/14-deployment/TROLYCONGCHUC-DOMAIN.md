# trolycongchuc.vn – Domain & Web Entry

## Vai trò

- **VWork**: tên nền tảng/sản phẩm lõi.
- **Trợ lý Công chức**: vertical Government.
- **trolycongchuc.vn**: domain truyền thông và điểm vào thị trường cho khối cơ quan nhà nước, trước mắt ưu tiên UBND xã/phường.

## Domain topology

| Host | Vai trò |
| --- | --- |
| `trolycongchuc.vn` | Landing/giới thiệu giải pháp |
| `www.trolycongchuc.vn` | Redirect về apex |
| `app.trolycongchuc.vn` | Ứng dụng VWork |
| `demo.trolycongchuc.vn` | Môi trường demo/sales |
| `docs.trolycongchuc.vn` | Hướng dẫn sử dụng/tài liệu public |
| `admin.trolycongchuc.vn` | Quản trị (chỉ công bố khi có chính sách truy cập rõ ràng) |
| `api.trolycongchuc.vn` | API public/integration gateway khi cần |

## Branding

Tên hiển thị ưu tiên: **VWork – Trợ lý Công chức thông minh**.

Thông điệp:
- Mỗi cán bộ có một trợ lý hỗ trợ công việc.
- Mỗi đơn vị có một kho tri thức dùng chung.
- Mỗi lãnh đạo có một công cụ hỗ trợ nắm tình hình và ra quyết định.
- Từ thông tin → Tri thức → Tham mưu → Hành động.

## Deployment

Web hiện nằm tại `apps/web` và dùng Next.js. DNS thực tế phải được cấu hình tại nhà cung cấp domain/hosting sau khi có môi trường production.

### Production variables đề xuất

```bash
NEXT_PUBLIC_SITE_URL=https://trolycongchuc.vn
NEXT_PUBLIC_APP_URL=https://app.trolycongchuc.vn
NEXT_PUBLIC_DEMO_URL=https://demo.trolycongchuc.vn
```

## DNS checklist

1. Trỏ apex `trolycongchuc.vn` tới hosting production theo record mà nhà cung cấp hosting cấp.
2. `www` dùng CNAME và redirect 301 về apex.
3. `app`, `demo`, `docs` tách record theo từng deployment.
4. Bật TLS/HTTPS toàn bộ host.
5. Bật HSTS sau khi xác nhận toàn bộ subdomain đã chạy HTTPS ổn định.
6. SPF/DKIM/DMARC chỉ cấu hình nếu domain được dùng gửi email.
7. Không expose `admin` hoặc `api` ra Internet trước khi chốt authentication, rate limit và policy.

## Acceptance criteria

- Responsive desktop/mobile.
- Metadata/SEO dùng domain `trolycongchuc.vn`.
- Copy thể hiện đúng VWork là platform, Trợ lý Công chức là Government vertical.
- Không tuyên bố AI tự động ra quyết định; giữ human review.
- Không mô tả VWork là hệ thống thay thế toàn bộ nền tảng tỉnh.
- CTA hướng tới demo/thí điểm.
