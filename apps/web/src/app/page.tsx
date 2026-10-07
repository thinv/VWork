const cards = [
  ["Cần duyệt", "0"],
  ["Khẩn", "0"],
  ["Quá hạn", "0"],
  ["Sắp đến hạn", "0"]
];

export default function HomePage() {
  return (
    <main style={{ padding: 24 }}>
      <h1>VWork</h1>
      <p>Nền tảng Văn phòng, Tham mưu và Điều hành công việc thông minh.</p>
      <section style={{ display: "grid", gridTemplateColumns: "repeat(4, minmax(0, 1fr))", gap: 16 }}>
        {cards.map(([label, value]) => (
          <article key={label} style={{ border: "1px solid #ddd", borderRadius: 8, padding: 16 }}>
            <strong>{label}</strong>
            <div style={{ fontSize: 28, marginTop: 8 }}>{value}</div>
          </article>
        ))}
      </section>
      <section style={{ marginTop: 24 }}>
        <h2>Engineering Foundation</h2>
        <p>Web skeleton đã sẵn sàng cho Sprint 1: Documents, Work Cases, Tasks và Executive Inbox.</p>
      </section>
    </main>
  );
}
