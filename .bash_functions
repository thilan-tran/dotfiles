# .bash_functions
# ===============
# sourced in .bashrc or .zshrc

# by default, open nvim with startify and tasks
function nvim_default() {
  if [ $# -eq 0 ]; then
    cd $DOCUMENTS
    if [ -n "$TMUX" ]; then
      nvim
    else
      nvim -c "Startify | vsplit $DOCUMENTS/wiki/tasks.todo"
    fi
  else
    nvim "$@"
  fi
}

# print colorscheme blocks, by u/fatal_squash
function blox() {
  function pcs() {
    for i in {0..7}; do
      echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"
    done;
  }
  printf "\n%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
}

# print system info, by u/fatal_squash
function sysinfo() {
  distro="$(cat /etc/*-release | grep PRETTY_NAME | cut -d '=' -f2 | tr -d '"')"
  packages="$(dpkg --list | wc -l)"
  font="Iosevka"
  colors="One Dark"

  printf " \e[0m\n"
  printf " \e[1;34m      distro \e[0m$distro\n"
  printf " \e[1;34m    packages \e[0m$packages\n"
  printf " \e[1;34m        font \e[0m$font $fontsize\n"
  printf " \e[1;34m      colors \e[0m$colors\n"
  printf " \e[0m"

  blox
}
