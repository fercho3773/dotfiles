# zsh keybindings

# Escape codes
#   right arrow : ^[[1;5C
#   left arrow  : ^[[1;5D
#   up arrow    : ^[[A
#   down arrow  : ^[[B

# 'Ctrl + x'  is: ^F
# 'Space/+ x' is: -M vicmd 'f'

# zsh-vi-mode clear all keybinds, therefore
# all 'bindkey' must be defined in here

zvm_after_init() {
# edit command line in $EDITOR
bindkey '^E' edit-command-line
bindkey -M vicmd ' e' edit-command-line

# move forward one word
bindkey '^[[1;5C' forward-word

# move backward one word
bindkey '^[[1;5D' backward-word

# toggle autosuggestions
bindkey '^\' autosuggest-toggle

# history search by substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fzf git status
bindkey '^G' _fzf_git_status
bindkey -M vicmd ' g' _fzf_git_status

# fzf branches
bindkey '^B' _fzf_branches
bindkey -M vicmd ' b' _fzf_branches

# fzf file picker (no hidden files)
bindkey '^F' _fzf_file_no_hidden
bindkey -M vicmd ' f' _fzf_file_no_hidden
}

# cursor shape per vi mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# disable command mode line highlight
ZVM_VI_HIGHLIGHT_BACKGROUND=none
ZVM_VI_HIGHLIGHT_FOREGROUND=none
ZVM_VI_HIGHLIGHT_EXTRASTYLE=none

