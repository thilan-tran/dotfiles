# .bashrc
# =======
# executed for non-login shells

# simple arrow prompt
# -------------------
export PS1="\[\033[2;96m\]\W \[\033[4;00m\]-> "

# aliases and functions
# ---------------------
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi

# fzf configuration
# -----------------
if [ -f ~/.fzf.bash ]; then
  source  ~/.fzf.bash
fi

# use ripgrep for faster searching
export FZF_DEFAULT_COMMAND="rg --files --hidden"

# base16 color scheme
export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:4,fg+:253,bg+:0,hl+:4
    --color info:4,prompt:2,spinner:1,pointer:1,marker:1
"

# shell variables
# ---------------
export MNT="/mnt/c/Users/Thilan"
export PSHELL="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
export DOCUMENTS="/home/thilan/documents"
export CODE="$DOCUMENTS/code"
export COURSEWORK="$DOCUMENTS/code/coursework"
export PROJECTS="$DOCUMENTS/code/projects"
# export DOCKER_HOST=tcp://localhost:2375
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
