# Thilan Tran 2020
#                   __
#     .-----.-----.|  |--.----.----.
#   __|-- __|__ --||     |   _|  __|
#  |__|_____|_____||__|__|__| |____|
#
# ==================================

# oh-my-zsh plugins
# -----------------
export ZSH="/home/thilan/.oh-my-zsh"

ZSH_THEME='elessar'

plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

# vi-mode keybinds and prompt
# ---------------------------
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^[l' clear-screen

# custom vi-mode prompt indicator
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# bash stuff
# ----------
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi

# fzf configuration
# -----------------
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# use ripgrep for faster searching
export FZF_DEFAULT_COMMAND="rg --files --hidden"

# base16 color scheme
export FZF_DEFAULT_OPTS="
    --color hl:4,fg+:253,bg+:0,hl+:4
    --color prompt:253,info:4,spinner:4,pointer:1,marker:1
"

# shell variables
# ---------------
export MNT="/mnt/c/Users/Thilan"
export PSHELL="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
export DOCUMENTS="/home/thilan/documents"
export CODE="$DOCUMENTS/code"
export COURSEWORK="$DOCUMENTS/code/coursework"
export PROJECTS="$DOCUMENTS/code/projects"
export DOCKER_HOST=tcp://localhost:2375
export PATH="$HOME/bin:$PATH"

# custom ls colors
# ----------------
LS_COLORS=""

# white files by default
LS_COLORS=$LS_COLORS:'ex=0:fi=0;37'
# blue directories
LS_COLORS=$LS_COLORS:'di=1;34:ow=1;34:st=1;34:tw=1;34'
# green source files
LS_COLORS=$LS_COLORS:'*.c=0;32:*.cpp=0;32:*.h=0;32:*.js=0;32:*.py=0;32:*.sh=0;32:*.ml=0;32'
# yellow text files
LS_COLORS=$LS_COLORS:'*.txt=0;33:*.md=0;33:*README=0;33:*LICENSE=0;33:*.log=0;33:*.info=0;33'
# magenta image files
LS_COLORS=$LS_COLORS:'*.jpg=0;35:*.png=0;35:*.pdf=0;35:*.ppm=0;35'
# cyan compressed files
LS_COLORS=$LS_COLORS:'*.gz=0;36:*.tar=0;36:*.tgz=0;36:*.zip=0;36'

export LS_COLORS

# use ls colors for zsh completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# uncomment to print task dashboard on startup
# if [ -z "$TMUX" ]; then
#   tasks
# fi
