# .bash_aliases
# =============
# sourced in .bashrc or .zshrc

# useful aliases
alias cat='bat'
alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
alias mv='mv -i' # confirm mv overwrite

alias mat='cmatrix -b'
alias cl='clear'
alias t='tmux'

# by default, open nvim with startify and tasks
alias vi='nvim_default'
alias vim='nvim_default'
