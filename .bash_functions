#!/bin/sh

# .bash_functions
# ===============
# simple functions sourced in .bashrc or .zshrc

# by default, open nvim with startify and tasks
function nvim_default() {
  if [ $# -eq 0 ]; then
    nvim -c "cd $DOCUMENTS | Startify | vsplit $DOCUMENTS/wiki/tasks.todo"
  else
    nvim "$@"
  fi
}

# colorscheme blocks, by u/fatal_squash
function blox() {
  function pcs() {
    for i in {0..7}; do
      echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"
    done;
  }
  printf "\n%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
}

# system info, by u/fatal_squash
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

# tasks dashboard
function tasks() {
  taskfile="$DOCUMENTS/wiki/tasks.todo"
  todo=$(grep -P '\[ \] (?!\+\w+$)|- (?!\[(-|x)])' $taskfile | wc -l)
  pending=$(grep '\[-]' $taskfile | wc -l)
  completed=$(grep '\[x]' $taskfile | wc -l)
  percent=$(echo $todo $pending $completed |
            awk '{printf "%.0f", ($2/2+$3) / ($1+$2+$3) * 100}')

  printf " \e[4;39mTasks\e[0m\n\n"
  printf " \e[1;39m    progress \e[0m%2d \e[1;39m%%\n" $percent
  printf " \e[1;34m        todo \e[0m%2d \e[1;34m\u25a1\n" $todo
  printf " \e[1;33m     pending \e[0m%2d \e[1;33m\u25cf\n" $pending
  printf " \e[1;32m   completed \e[0m%2d \e[1;32m\u2713\n" $completed
  printf " \e[0m\n"
}

# hello with eftiwall
function hello() {
  wall=$(figlet -f ~/downloads/figlet/eftiwall "!9!!!")

  printf "$wall\n"
  printf "|             Greetings, meatbag.            |\n"
  printf "----------------------------------------------\n"
}

function agent() {
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_rsa
}
