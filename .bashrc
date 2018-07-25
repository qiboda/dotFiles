# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source common runtime definitions
if [ -f ~/.commonrc ]; then
	. ~/.commonrc
fi

export PS1='${0} \w>'
