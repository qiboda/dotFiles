cd ~

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

# install my dot files
if [ -d ~/.git ]; then
    printf "You already have a git repo in home.\\n"
    printf "You'll need to remove .git if you want to re-install.\\n"
    exit
fi

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    printf "remove ~/.zshrc from oh-my-zsh.\\n";
    rm .zshrc
fi

git init
git pull https://github.com/qiboda/dotFiles.git
