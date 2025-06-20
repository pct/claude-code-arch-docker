#!/bin/bash
set -e

# 建立 fish config 目錄
mkdir -p /root/.config/fish

# 設定 fish config（PATH、locale、顏色、alias）
cat <<EOF >> /root/.config/fish/config.fish
set -gx PATH /usr/local/bin $HOME/.local/bin $PATH
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LSCOLORS "dxfxcxdxbxegedabagacad"
set -x LS_COLORS "di=01;33"
set -x fish_color_command green

# alias
alias tmux="tmux -2"
alias h=history
alias ll='ls -l'
alias la='ls -a'
alias sl=ls
alias rm='rm -i'
alias vi='nvim'
alias vim='nvim'
alias x=exit

# 進入互動 shell 時自動切到 /root
if status is-interactive
    cd /root
end
EOF

# 安裝 Oh My Fish 與 fox 主題（非互動）
curl -fsSL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install -o /tmp/omf_install
expect -c 'spawn fish /tmp/omf_install; expect eof'
fish -c "omf install fox; omf theme fox"
echo 'set -gx PATH $HOME/.local/share/omf/bin $PATH' >> /root/.config/fish/config.fish
