__prompt() {
  local EXIT_CODE="$?"
  local blue='\[\e[1;34m\]'
  local cyan='\[\e[1;36m\]'
  local green='\[\e[1;32m\]'
  local red='\[\e[1;31m\]'
  local reset='\[\e[0m\]'

  PS1="$blue\u$reset@$cyan\h$reset:$green\w"

  if [ $EXIT_CODE != 0 ]; then
    PS1="$PS1 $red[$EXIT_CODE]"
  fi

  PS1="$PS1$reset -> "
}

export PROMPT_COMMAND=__prompt
