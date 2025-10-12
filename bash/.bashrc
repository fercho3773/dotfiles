#  ~/.bashrc

# variables
export HISTCONTROL=ignoredups # stop logging of identical commands
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar/:$PATH"
export IGNOREEOF=100 # prevent exiting with ctrl-d

# if not running, do not do anything
[ -z "$PS1" ] && return

# vi/vim mode

# prompts
# PS0 - after every command, and before any output
# PS1 - primary prompt, before every command ( most common )
# PS2 - secondary output, when a commands needs more input 

# configs
stty stop undef                     # disable freezing with ctrl+s

# aliases
alias ..="cd ..; ls"                # up one directory
alias ...="cd ../..; ls"            # up two dir
alias ....="cd ../../..;ls"         # up three dir
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# my aliases
alias reloadbash='source ~/.bashrc'
alias rb='source ~/.bashrc'

# Show current network information
netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}









