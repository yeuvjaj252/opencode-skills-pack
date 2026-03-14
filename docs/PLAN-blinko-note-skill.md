## Analysis
Mục tiêu là thiết kế một custom skill cho Blinko để “capture knowledge” tương tự các skill như `note-taker`, `memory-notes`, và `notion-knowledge-capture`, nhưng phù hợp với kiến trúc của `opencode-skills-pack` và dùng Blinko API/tool có sẵn thay vì git-backed notes hoặc Notion MCP. Qua tham khảo, các skill nguồn đều có chung một workflow tốt: (1) xác định loại nội dung cần capture, (2) tìm tri thức đã tồn tại trước khi tạo mới để tránh trùng lặp, (3) chuẩn hoá nội dung theo template có cấu trúc, (4) tạo hoặc cập nhật bản ghi ở hệ thống đích, và (5) báo lại kết quả cùng bước tiếp theo. Với pack hiện tại, hướng phù hợp nhất là tạo một skill mới trong `.opencode/skills` đóng vai trò workflow/instruction layer cho agent `cook`, tận dụng trực tiếp các tool `blinko_searchBlinko`, `blinko_upsertBlinko`, `blinko_updateBlinko`, `blinko_createComment`, và có thể thêm tài liệu README/CHANGELOG nếu muốn public capability này.

## Implementation Steps
1. Xác định phạm vi và tên skill Blinko
   - Chọn tên rõ nghĩa theo catalog hiện tại, ví dụ `blinko-knowledge-capture`, `blinko-notes`, hoặc `blinko-second-brain`.
   - Chốt mục tiêu skill: lưu ý tưởng nhanh, ghi chú có cấu trúc, cập nhật note hiện có, và optionally tạo todo/comment trong Blinko.
   - Chỉ rõ đây là workflow skill, không phải business logic/runtime code mới.
2. Thiết kế workflow chuẩn cho skill
   - Bước 1: intake nội dung người dùng cung cấp (ý tưởng nhanh, meeting notes, how-to, decision, summary, todo).
   - Bước 2: phân loại đích lưu (`blinko`, `note`, `todo`) theo intent và độ dài/nature của nội dung.
   - Bước 3: tìm note liên quan bằng `blinko_searchBlinko` trước khi tạo mới để tránh duplicate.
   - Bước 4: quyết định create mới hay update note hiện có.
   - Bước 5: chuẩn hoá nội dung theo format nhất quán cho Blinko, ưu tiên title-like opening line, summary ngắn, bullets hành động, hashtags.
   - Bước 6: lưu bằng tool tương ứng và trả về kết quả ngắn gọn cho user.
3. Mô phỏng các ưu điểm từ skill tham chiếu nhưng map sang Blinko
   - Từ `note-taker`: giữ nguyên tinh thần user-invoked, intake → structure → store → report, nhưng bỏ yêu cầu git sync/commit/push vì không phù hợp Blinko.
   - Từ `memory-notes`: học cách chuẩn hoá tri thức thành các khối “context / observations / relations”, nhưng giản lược để phù hợp content text trong Blinko thay vì markdown knowledge graph đầy đủ.
   - Từ `notion-knowledge-capture`: giữ bước define capture type, locate existing context, create/update, link follow-up; thay Notion DB/schema bằng search + hashtag/category convention trong Blinko.
4. Soạn `SKILL.md` cho skill mới
   - Thêm frontmatter chuẩn `name`, `description`, `compatibility: opencode`.
   - Viết rõ “when to use”, “workflow”, “decision rules”, “best practices”, “anti-patterns”.
   - Ghi rõ nguyên tắc search trước khi tạo mới.
   - Ghi rõ mapping giữa user intent và Blinko record type (`blinko` / `note` / `todo`).
5. Thiết kế convention nội dung cho Blinko
   - Đề xuất format ngắn gọn, dễ search và phù hợp Blinko, ví dụ mở đầu bằng 1 dòng summary rồi đến bullets.
   - Dùng hashtag cho topic/project (`#project-x`, `#meeting`, `#decision`, `#todo`).
   - Nếu là update note cũ, append hoặc rewrite có kiểm soát thay vì tạo note mới trùng nội dung.
   - Nếu là follow-up task, cân nhắc tách riêng `todo` hoặc thêm comment vào note gốc.
6. Xác định điểm tích hợp trong repo
   - Thêm thư mục skill mới trong `.opencode/skills/<skill-name>/SKILL.md`.
   - Cân nhắc thêm docs/example hoặc reference nếu workflow đủ dài.
   - Nếu muốn người dùng discover dễ hơn, cập nhật `README.md` và `CHANGELOG.md`.
7. Định nghĩa tình huống sử dụng điển hình
   - Capture một ý tưởng nhanh thành `blinko`.
   - Chuyển transcript/cuộc hội thoại ngắn thành `note` có cấu trúc.
   - Tìm note về cùng chủ đề rồi update thay vì tạo mới.
   - Tách action items thành `todo` hoặc comment vào note hiện có.
8. Kiểm tra chất lượng nội dung skill
   - Soát tính nhất quán với phong cách repo: concise, Markdown-driven, workflow rõ ràng.
   - Đảm bảo instruction không hứa các capability mà tool hiện tại không hỗ trợ.
   - Đảm bảo skill chỉ dẫn agent dùng Serena/MCP/tool hiện có trước khi tạo mới hoặc sửa note.

## Candidate Files
- `.opencode/skills/blinko-knowledge-capture/SKILL.md`
- `.opencode/skills/blinko-notes/SKILL.md`
- `README.md`
- `CHANGELOG.md`
- `docs/PLAN-blinko-note-skill.md`

## Risks
- Nếu workflow quá giống Notion/Basic Memory thì sẽ over-structure, không hợp đặc tính nhanh-gọn của Blinko.
- Nếu không định nghĩa rõ search-before-create, knowledge trong Blinko sẽ bị trùng lặp và khó truy hồi.
- Blinko tool hiện có hỗ trợ search/create/update/comment nhưng không có schema mạnh như Notion, nên nếu format quá cứng sẽ khó duy trì.
- Nếu skill vừa muốn capture note vừa muốn quản lý task sâu, phạm vi sẽ phình to và khó dùng.
- Naming skill không rõ ràng có thể làm người dùng khó discover hoặc khó phân biệt với các skill note khác.

## Test Strategy
Kiểm tra theo 4 lớp:
1. Cấu trúc skill
   - File `SKILL.md` có frontmatter đúng chuẩn repo.
   - Nội dung có đủ sections: purpose/when to use/workflow/best practices.
2. Tính khả thi workflow
   - Mỗi bước trong workflow đều map được sang tool có thật của Blinko (`search`, `upsert`, `update`, `comment`).
   - Không phụ thuộc MCP/tool ngoài repo như Notion hoặc git-backed notes.
3. Manual scenario checks
   - Thử prompt capture ý tưởng ngắn → expected route sang `blinko`.
   - Thử prompt ghi chú dài/có cấu trúc → expected route sang `note`.
   - Thử prompt follow-up action items → expected route sang `todo` hoặc comment/update.
   - Thử case đã có note liên quan → expected route là search rồi update, không tạo duplicate.
4. Documentation review
   - Đọc lại skill để chắc instruction dễ dùng, không dài dòng, và bám phong cách `opencode-skills-pack`.

## Effort
Small / Medium