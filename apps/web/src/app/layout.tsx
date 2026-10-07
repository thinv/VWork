import type { Metadata } from "next";
import type { ReactNode } from "react";
import "./globals.css";

export const metadata: Metadata = {
  metadataBase: new URL("https://trolycongchuc.vn"),
  title: {
    default: "VWork – Trợ lý Công chức thông minh",
    template: "%s | VWork"
  },
  description:
    "VWork – Trợ lý AI cho công tác văn phòng, điều hành và tham mưu của cán bộ, công chức.",
  keywords: [
    "trợ lý công chức",
    "VWork",
    "AI công chức",
    "AI chính quyền",
    "tham mưu văn bản",
    "xử lý văn bản",
    "văn phòng thông minh"
  ],
  openGraph: {
    title: "VWork – Trợ lý Công chức thông minh",
    description: "Mỗi cán bộ một trợ lý AI. Mỗi đơn vị một kho tri thức.",
    url: "https://trolycongchuc.vn",
    siteName: "Trợ lý Công chức",
    locale: "vi_VN",
    type: "website"
  },
  robots: {
    index: true,
    follow: true
  }
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="vi">
      <body>{children}</body>
    </html>
  );
}
