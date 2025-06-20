# Claude Code Arch Docker

將 Claude Code 完整封裝於 Docker 容器，並以 Arch Linux 為基礎，為未來 Claude Code 環境做準備。

---

## 🐟 特色 Features
- Fish shell 為預設 shell
- Oh My Fish + fox 主題，外觀現代美觀
- 預裝 Neovim、tmux、tig、the_silver_searcher、expect、which 等工具
- nodejs、npm、python、wget、curl、git 等常用 CLI

---

## 🔄 自動檢查 Claude Code 版本

- 每次啟動時，系統會自動查詢 claude code 是否有新版，並自動更新。

---

## 🚀 快速開始 Quick Start

### 直接執行 tifa 腳本

```sh
./tifa
```

如遇權限問題，請先執行:
```sh
chmod +x ./tifa
```

---

## 🚀 安裝 tifa

### 在任意目錄都可以執行 tifa
執行目錄都被鎖在 docker 的 /root，所以不用擔心您的本機任一目錄資料不小心傳出去

```sh
./install_tifa.sh
```

然後在任意目錄執行 `tifa`

---

## 如果您需要手動修改 docker 環境

1. 建置映像 Build Image
```sh
docker-compose build
```

2. 啟動服務 Run Service
```sh
docker-compose up
```

3. 進入容器（如需互動式 shell）
```sh
docker-compose exec tifa-code-cli fish
```

> 預設掛載本機目錄到容器 `/app/workspace`，可直接存取原始碼與資料。

---

## 🛠️ 常用指令 Useful Commands
- `vi` 或 `vim` → 啟動 `nvim`
- `omf` → Oh My Fish 套件管理
- 其他：`tmux`、`tig`、`ag`、`python`、`pip`、`node`、`npm` ...

---

## 📂 設定與自訂 Configuration
- Fish shell 設定與主題已配置於 `/root/.config/fish/config.fish`
- 可自訂 alias、主題與環境變數
- 支援多語系顯示 (UTF-8)

---

## 🤝 貢獻與聯絡 Contribution & Contact
歡迎 PR/Issue 或來信交流

---

## License
MIT
