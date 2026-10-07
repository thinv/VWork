import type { ReactNode } from "react";

export const metadata = {
  title: "VWork",
  description: "Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh"
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="vi">
      <body style={{ margin: 0, fontFamily: "system-ui, sans-serif" }}>{children}</body>
    </html>
  );
}
