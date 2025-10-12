#  ~/.bashrc

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar/:$PATH"

# if not running, do not do anything
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h\W]\$'
