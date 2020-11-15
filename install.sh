###############################################
# base
###############################################

# pacman
sudo pacman -Syu feh ripgrep rsync fzf htop trash-cli cloc aria2 shellcheck \
    python \
    python-pip \
    alacritty \
    screenfetch \
    fcitx \
    mandb \
    cmake \
    clang \
    dhcpcd \
    uncrustify \
    ctags \
    make \

# python
sudo pip install cheat thefuck neovim

###############################################
# yay
###############################################

sudo echo "[archlinuxcn]\nServer = https://repo.archlinuxcn.org/$arch" >> /etc/pacman.conf

sudo pacman -Syu archlinuxcn-keyring

sudo pacman -Syu archlinuxcn-mirrorlist-git yay

# yay
yay -Syu oh-my-zsh-git zsh-autosuggestions autojump global

###############################################
# gui
###############################################

yay -Syu i3-gnome polybar rofi networkmanager gdm
