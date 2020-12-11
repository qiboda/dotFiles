###############################################
# base
###############################################

# pacman
pacman -Syu feh ripgrep rsync fzf htop trash-cli cloc aria2 shellcheck \
    python \
    python-pip \
    alacritty \
    screenfetch \
    fcitx \
    mandb \
    make \
    cmake \
    clang \
    dhcpcd \
    uncrustify \
    ctags \
    rustup \
    lua \
    fd

# python
pip install cheat thefuck neovim

###############################################
# yay
###############################################

echo "[archlinuxcn]\nServer = https://repo.archlinuxcn.org/$arch" >> /etc/pacman.conf

pacman -Syu archlinuxcn-keyring

pacman -Syu archlinuxcn-mirrorlist-git yay

# yay
yay -Syu oh-my-zsh-git zsh-autosuggestions autojump global

###############################################
# gui
###############################################

yay -Syu i3-gnome polybar rofi networkmanager gdm

###############################################
# rust
###############################################
rustup install stable
