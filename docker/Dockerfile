# use archlinux
FROM ghcr.io/archlinux/archlinux:latest

# 更新系統並安裝必要工具
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    nodejs npm fish git curl inetutils unzip sed \
    nvim sudo wget cmake python tmux tig python-pip neovim the_silver_searcher expect which \
    --needed && \
    rm -rf /var/cache/pacman/pkg/* && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen

# 設定工作目錄
WORKDIR /app

# git clone AstroNvim
RUN git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
RUN git clone https://github.com/pct/astronvim_config ~/.config/nvim/lua/user

# npm global 安裝 Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code \
    && ln -sf /usr/bin/claude /usr/bin/tifa \
    && ln -sf /usr/bin/claude /usr/bin/dcc \
    && ln -sf /usr/bin/claude /usr/bin/docker-claude-code \
    && ln -sf /usr/bin/claude /usr/local/bin/claude \
    && /usr/bin/claude --version \
    && /usr/bin/tifa --version

# 設定環境變數
ENV BUN_ENV=production

# 安裝 fish 與 Oh My Fish
COPY docker/install_fish.sh /app/install_fish.sh
RUN bash /app/install_fish.sh
