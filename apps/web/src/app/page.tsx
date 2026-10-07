const capabilities = [
  { title: "Việc của tôi", desc: "Một nơi tập trung văn bản, nhiệm vụ, lịch họp và việc cần xử lý.", tag: "Unified Work Inbox" },
  { title: "Tham mưu văn bản", desc: "AI đọc hồ sơ, trích căn cứ, gợi ý nội dung tham mưu và luôn để cán bộ kiểm soát.", tag: "AI Draft & Review" },
  { title: "Xử lý văn bản đến", desc: "Tóm tắt, phân loại, nhận diện thời hạn và đề xuất hướng xử lý theo ngữ cảnh đơn vị.", tag: "Document Intelligence" },
  { title: "Họp & kết luận", desc: "Chuẩn bị nội dung, ghi nhận kết luận, chuyển thành đầu việc và theo dõi đến khi hoàn thành.", tag: "Meeting Intelligence" },
  { title: "Báo cáo", desc: "Tổng hợp số liệu, tiến độ và tình hình thực hiện để giảm thời gian làm báo cáo thủ công.", tag: "Reporting" },
  { title: "Kho tri thức", desc: "Tìm lại quy định, hồ sơ, biểu mẫu và tri thức nội bộ bằng ngôn ngữ tự nhiên.", tag: "Knowledge" }
];

const steps = [
  ["01", "Tiếp nhận", "Văn bản, hồ sơ, nhiệm vụ, cuộc họp và dữ liệu công việc."],
  ["02", "AI đọc hiểu", "Tóm tắt, phân loại, nhận diện yêu cầu và truy xuất căn cứ."],
  ["03", "Tham mưu", "Gợi ý phương án xử lý, nội dung dự thảo và thông tin cần lưu ý."],
  ["04", "Con người duyệt", "Cán bộ, chuyên viên và lãnh đạo kiểm tra trước khi ban hành hoặc giao việc."],
  ["05", "Theo dõi", "Bám tiến độ, thời hạn, kết luận và kết quả thực hiện."]
];

const outcomes = [
  ["Nhanh hơn", "Giảm thời gian tìm tài liệu, tổng hợp thông tin và chuẩn bị dự thảo."],
  ["Rõ việc hơn", "Mỗi người nhìn thấy đúng việc cần xử lý, thời hạn và trạng thái."],
  ["Có căn cứ hơn", "Kết quả AI gắn với nguồn tài liệu và ngữ cảnh của đơn vị."],
  ["Dễ điều hành hơn", "Lãnh đạo nắm tình hình từ một bức tranh tổng hợp thay vì hỏi thủ công."]
];

function Mark() {
  return (
    <span className="brand-mark" aria-hidden="true">
      <span className="brand-wing brand-wing-left" />
      <span className="brand-wing brand-wing-right" />
    </span>
  );
}

export default function HomePage() {
  return (
    <main>
      <header className="site-header">
        <a className="brand" href="#top" aria-label="VWork - Trợ lý Công chức">
          <Mark />
          <span className="brand-copy">
            <strong><span>V</span>Work</strong>
            <small>TRỢ LÝ CÔNG CHỨC</small>
          </span>
        </a>
        <nav aria-label="Điều hướng chính">
          <a href="#giai-phap">Giải pháp</a>
          <a href="#cach-hoat-dong">Cách hoạt động</a>
          <a href="#trien-khai">Triển khai</a>
        </nav>
        <a className="button button-small button-outline" href="#lien-he">Đăng ký demo</a>
      </header>

      <section className="hero" id="top">
        <div className="hero-orb hero-orb-one" />
        <div className="hero-orb hero-orb-two" />
        <div className="hero-content">
          <p className="eyebrow">VWORK · GOVERNMENT SOLUTION</p>
          <h1>
            Trợ lý AI cho công việc hằng ngày của
            <span> cán bộ, công chức</span>
          </h1>
          <p className="hero-lead">
            Hỗ trợ văn phòng, điều hành và tham mưu từ một không gian làm việc thống nhất:
            đọc hiểu văn bản, chuẩn bị dự thảo, theo dõi nhiệm vụ, họp, báo cáo và tra cứu tri thức.
          </p>
          <div className="hero-actions">
            <a className="button button-primary" href="#lien-he">Đăng ký trải nghiệm</a>
            <a className="button button-ghost" href="#giai-phap">Xem giải pháp</a>
          </div>
          <div className="trust-row">
            <span>Human-in-the-loop</span>
            <span>Grounded AI</span>
            <span>Multi-tenant</span>
            <span>Private Cloud / On-Premise</span>
          </div>
        </div>

        <div className="hero-product" aria-label="Minh họa giao diện VWork">
          <div className="window-bar">
            <i /><i /><i />
            <span>app.trolycongchuc.vn</span>
          </div>
          <div className="product-shell">
            <aside>
              <div className="mini-brand"><Mark /><b>VWork</b></div>
              {["Trang chủ", "Việc của tôi", "Văn bản", "Họp", "Báo cáo", "Kho tri thức"].map((item, index) => (
                <div className={index === 1 ? "side-item active" : "side-item"} key={item}>{item}</div>
              ))}
            </aside>
            <div className="product-main">
              <div className="product-heading">
                <div>
                  <span>Thứ Tư, 07/10</span>
                  <h3>Việc của tôi</h3>
                </div>
                <div className="avatar">NT</div>
              </div>
              <div className="metric-grid">
                <div><small>Cần xử lý</small><strong>12</strong></div>
                <div><small>Cần duyệt</small><strong>04</strong></div>
                <div><small>Sắp đến hạn</small><strong>03</strong></div>
              </div>
              <div className="work-card">
                <div className="work-title"><strong>Ưu tiên hôm nay</strong><span>AI gợi ý</span></div>
                <div className="work-line"><b>Văn bản đến</b><span>Xin ý kiến về kế hoạch chuyển đổi số</span><em>10:30</em></div>
                <div className="work-line"><b>Tham mưu</b><span>Hoàn thiện dự thảo báo cáo tuần</span><em>14:00</em></div>
                <div className="work-line"><b>Cuộc họp</b><span>Chuẩn bị nội dung giao ban UBND</span><em>15:30</em></div>
              </div>
              <div className="assistant-box">
                <span>✦</span>
                <div><b>Hỏi VWork</b><p>Tóm tắt các việc cần lãnh đạo cho ý kiến trong hôm nay.</p></div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="statement">
        <p>Mỗi cán bộ có một trợ lý hỗ trợ công việc.</p>
        <p>Mỗi đơn vị có một kho tri thức dùng chung.</p>
        <p>Mỗi lãnh đạo có một công cụ hỗ trợ nắm tình hình và ra quyết định.</p>
      </section>

      <section className="section" id="giai-phap">
        <div className="section-heading">
          <p className="eyebrow">MỘT KHÔNG GIAN LÀM VIỆC</p>
          <h2>Không thêm một hệ thống để cán bộ phải học lại cách làm việc</h2>
          <p>VWork đứng bên cạnh các hệ thống hiện có, tập trung vào lớp trợ lý AI và trải nghiệm công việc hằng ngày.</p>
        </div>
        <div className="capability-grid">
          {capabilities.map((item) => (
            <article className="capability-card" key={item.title}>
              <span className="card-icon">✦</span>
              <small>{item.tag}</small>
              <h3>{item.title}</h3>
              <p>{item.desc}</p>
              <a href="#lien-he">Tìm hiểu thêm →</a>
            </article>
          ))}
        </div>
      </section>

      <section className="section process-section" id="cach-hoat-dong">
        <div className="section-heading light">
          <p className="eyebrow">TỪ THÔNG TIN ĐẾN HÀNH ĐỘNG</p>
          <h2>AI hỗ trợ xuyên suốt nhưng quyết định vẫn thuộc về con người</h2>
        </div>
        <div className="process-grid">
          {steps.map(([n, title, desc]) => (
            <div className="process-step" key={n}>
              <span>{n}</span>
              <h3>{title}</h3>
              <p>{desc}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="section outcome-section">
        <div className="section-heading">
          <p className="eyebrow">GIÁ TRỊ THỰC TẾ</p>
          <h2>Giảm việc lặp lại, tăng thời gian cho xử lý nghiệp vụ</h2>
        </div>
        <div className="outcome-grid">
          {outcomes.map(([title, desc]) => (
            <article key={title}><h3>{title}</h3><p>{desc}</p></article>
          ))}
        </div>
      </section>

      <section className="section deployment" id="trien-khai">
        <div>
          <p className="eyebrow">TRIỂN KHAI LINH HOẠT</p>
          <h2>SaaS, Private Cloud hoặc On-Premise từ cùng một nền tảng lõi</h2>
          <p>Phù hợp triển khai thí điểm ở xã/phường, mở rộng theo đơn vị và tích hợp dần với hệ thống hiện có qua API.</p>
        </div>
        <div className="deployment-cards">
          <div><strong>SaaS</strong><span>Khởi động nhanh</span></div>
          <div><strong>Private Cloud</strong><span>Kiểm soát hạ tầng</span></div>
          <div><strong>On-Premise</strong><span>Triển khai tại đơn vị</span></div>
        </div>
      </section>

      <section className="cta" id="lien-he">
        <div>
          <p className="eyebrow">TROLYCONGCHUC.VN</p>
          <h2>Bắt đầu từ một nhóm công việc cụ thể, đo hiệu quả rồi mở rộng.</h2>
          <p>Đăng ký buổi giới thiệu VWork – Trợ lý Công chức cho cơ quan, đơn vị hoặc xã/phường.</p>
        </div>
        <a className="button button-light" href="mailto:contact@dcv.vn?subject=Đăng ký demo VWork - Trợ lý Công chức">Đăng ký demo</a>
      </section>

      <footer>
        <div className="footer-brand">
          <div className="brand">
            <Mark />
            <span className="brand-copy"><strong><span>V</span>Work</strong><small>TRỢ LÝ CÔNG CHỨC</small></span>
          </div>
          <p>Nền tảng trợ lý AI phục vụ công tác văn phòng, điều hành và tham mưu.</p>
        </div>
        <div>
          <strong>Sản phẩm</strong>
          <a href="#giai-phap">Giải pháp</a>
          <a href="#cach-hoat-dong">Cách hoạt động</a>
          <a href="#trien-khai">Triển khai</a>
        </div>
        <div>
          <strong>Liên hệ</strong>
          <span>Công ty Cổ phần Truyền Số Liệu Việt Nam (DCV)</span>
          <a href="https://dcv.vn">dcv.vn</a>
          <a href="mailto:contact@dcv.vn">contact@dcv.vn</a>
        </div>
        <div className="footer-domain"><strong>trolycongchuc.vn</strong><span>VWork Government Solution</span></div>
      </footer>
    </main>
  );
}
