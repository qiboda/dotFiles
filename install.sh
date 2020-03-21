###############################################
# base
###############################################

# pacman
sudo pacman -Syu feh ripgrep rsync fzf thefuck htop trash-cli cloc aria2 shellcheck \
    python-pip \
    alacritty \
    screenfetch \
    fcitx \
    mandb \
    cmake \
    clang \
    dhcpcd \

# yay
yay -Syu oh-my-zsh-git zsh-autosuggestions autojump

# python
sudo pip install cheat

###############################################
# gui
###############################################

yay -Syu i3-gnome polybar rofi networkmanager gdm

###############################################
# neovim
###############################################

# pacman
sudo pacman -Syu uncrustify ctags

# yay
yay -S global

# pip
sudo pip install neovim

