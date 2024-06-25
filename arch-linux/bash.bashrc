#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# Git Prompt
source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

_ps1_symbol='\[\e[38;2;224;224;224;48;2;70;70;70m\] \$ \[\e[0m\]\[\e[38;2;70;70;70m\]\[\e[0m\]'
if [[ ${EUID} == 0 ]]; then 
    PS1='\[\e[38;2;255;198;10255;198;10;48;2;70;70;70m\]   \[\e[0m\]\[\e[38;2;224;224;224;48;2;70;70;70m\]   \[\e[0m\]\[\e[38;2;32;32;32;48;2;70;70;70m\] \[\e[0m\]\[\e[38;2;224;224;224;48;2;70;70;70m\]   \W\[\e[0m\]\[\e[38;2;32;32;32;48;2;70;70;70m\] \[\e[0m\]$(__git_ps1 "\[\e[38;2;0;255;0;48;2;70;70;70m\]  %s\[\e[0m\]\[\e[38;2;32;32;32;48;2;70;70;70m\] \[\e[0m\]")'"${_ps1_symbol}"' '
else
    PS1='\[\e[38;2;0;255;0;48;2;70;70;70m\] \[\e[0m\]\[\e[38;2;224;224;224;48;2;70;70;70m\]    \[\e[0m\]\[\e[38;2;32;32;32;48;2;70;70;70m\] \[\e[0m\]\[\e[38;2;224;224;224;48;2;70;70;70m\]   \W\[\e[0m\]\[\e[38;2;32;32;32;48;2;70;70;70m\] \[\e[0m\]$(__git_ps1 "\[\e[38;2;0;255;0;48;2;70;70;70m\]  %s\[\e[0m\]\[\e[38;2;32;32;32;48;2;70;70;70m\] \[\e[0m\]")'"${_ps1_symbol}"' '
fi
unset _ps1_symbol

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ll='ls -la --color=auto'
