# .bash_functions
# ===============
# sourced in .bashrc or .zshrc

# by default, open nvim with startify and tasks
function nvim_default {
  if [ $# -eq 0 ]; then
    cd $DOCUMENTS
    nvim -c "Startify | vsplit $DOCUMENTS/wiki/tasks.todo"
  else
    nvim "$@"
  fi
}
