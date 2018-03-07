# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my runtime definitions
if [ -f ~/.myrc ]; then
	. ~/.myrc
fi

export PS1='${0} \w>'
