# OpenCode Kế Hoạch Cook Pack

Bộ pack mở rộng cho OpenCode với 2 chế độ hoạt động: `/kehoach` (lập kế hoạch) và `/cook` (thực thi).

## Tính năng

- **Agents**: `kehoach` (planning-only) và `cook` (implementation)
- **Commands**: `/kehoach` và `/cook`
- **Skills**: `plan-writing`, `coding-standard`, `test-strategy`

## Cài đặt

### Yêu cầu trước

- OpenCode đã được cài đặt
- Bash shell (Linux/macOS/WSL)

### Bước cài đặt

```bash
# Clone repo về máy
git clone https://github.com/yeuvjaj252/opencode-skills-pack.git
cd opencode-skills-pack

# Cài đặt vào project hiện tại
./bin/install.sh

# Hoặc cài đặt vào project cụ thể
./bin/install.sh -p /path/to/project
```

## Sử dụng

### Chế độ Kế Hoạch (Planning)

```bash
/kehoach Them chuc nang search cho trang home
```

Agent `kehoach` sẽ:
- Phân tích yêu cầu
- Khảo sát code hiện tại
- Đề xuất các bước thực hiện
- Xác định rủi ro
- Đề xuất test strategy

**Lưu ý**: Agent này chỉ phân tích, KHÔNG thay đổi file.

### Chế độ Cook (Implementation)

```bash
/cook Them chuc nang search cho trang home
```

Agent `cook` sẽ:
- Thực hiện thay đổi theo yêu cầu
- Follow coding standards
- Chạy lint/typecheck
- Verify bang test
- Báo cáo kết quả

### Chuyển đổi giữa chế độ

Trong OpenCode TUI:
- Sử dụng phím **Tab** để chuyển đổi giữa các agent
- Hoặc sử dụng lệnh `/kehoach` và `/cook` trực tiếp

## Cập nhật

```bash
# Cập nhật pack
./bin/update.sh

# Cập nhật cưỡng bức
./bin/update.sh -p /path/to/project
```

## Gỡ cài đặt

```bash
# Gỡ cài đặt
./bin/uninstall.sh

# Gỡ cài đặt khỏi project cụ thể
./bin/uninstall.sh -p /path/to/project
```

## Cấu trúc

```
opencode-skills-pack/
├── .opencode/
│   ├── skills/
│   │   ├── plan-writing/
│   │   ├── coding-standard/
│   │   └── test-strategy/
│   ├── agents/
│   │   ├── kehoach.md
│   │   └── cook.md
│   └── commands/
│       ├── kehoach.md
│       └── cook.md
├── bin/
│   ├── install.sh
│   ├── uninstall.sh
│   └── update.sh
├── README.md
└── CHANGELOG.md
```

## Thêm mới Skill

Để thêm skill mới:

1. Tạo thư mục `.opencode/skills/<ten-skill>/`
2. Tạo file `SKILL.md` bên trong với frontmatter:

```yaml
---
name: ten-skill
description: Mô tả skill
compatibility: opencode
---
```

3. Cập nhật lại pack:

```bash
./bin/update.sh -f
```

## Cấu hình thêm (Optional)

Tạo file `opencode.json` trong project nếu cần thay đổi quyền:

```json
{
  "agent": {
    "kehoach": {
      "permission": {
        "edit": "deny",
        "bash": "ask"
      }
    }
  }
}
```

## Khắc phục sự cố

### Không thấy lệnh /kehoach hoặc /cook

Đảm bảo pack đã được cài đúng:
```bash
ls -la .opencode/commands/
```

### Agent không hiển thị

Kiểm tra agent đã được link:
```bash
ls -la .opencode/agents/
```

### Symlink lỗi

Xóa và cài lại:
```bash
./bin/install.sh -f
```

## Đóng góp

Mọi contribution đều được welcome! Vui lòng tạo PR với mô tả chi tiết.

## License

MIT License
