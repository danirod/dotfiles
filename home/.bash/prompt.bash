function __prompt__exitcode() {
    # Tints the prompt red if the last executed command returns non-zero
    local EXIT_CODE="$?"
    local red=`tput setaf 1`
    [ $EXIT_CODE != 0 ] && echo -e "\001\033[1;31m\002"
}

export PS1="\`__prompt__exitcode\`\e[2m\h\e[22m \w \$\[\e[0m\] "
