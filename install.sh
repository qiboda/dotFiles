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

# yay
yay -Syu oh-my-zsh-git zsh-autosuggestions autojump

# python
sudo pip install cheat

###############################################
# neovim
###############################################

# pacman
sudo pacman -Syu uncrustify

# yay
yay -S global

# pip
sudo pip install neovim

