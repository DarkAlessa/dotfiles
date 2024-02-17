# by Nuke 
# update : 14-02-2024

# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# /etc/bash.bashrc: executed by bash(1) for interactive shells.

# Git Prompt
source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# System-wide bashrc file

# Check that we haven't already been sourced.
([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# If started from sshd, make sure profile is sourced
if [[ -n "$SSH_CONNECTION" ]] && [[ "$PATH" != *:/usr/bin* ]]; then
    source /etc/profile
fi

# Warnings
unset _warning_found
for _warning_prefix in '' ${MINGW_PREFIX}; do
    for _warning_file in ${_warning_prefix}/etc/profile.d/*.warning{.once,}; do
        test -f "${_warning_file}" || continue
        _warning="$(command sed 's/^/\t\t/' "${_warning_file}" 2>/dev/null)"
        if test -n "${_warning}"; then
            if test -z "${_warning_found}"; then
                _warning_found='true'
                echo
            fi
            if test -t 1
                then printf "\t\e[1;33mwarning:\e[0m\n${_warning}\n\n"
                else printf "\twarning:\n${_warning}\n\n"
            fi
        fi
        [[ "${_warning_file}" = *.once ]] && rm -f "${_warning_file}"
    done
done
unset _warning_found
unset _warning_prefix
unset _warning_file
unset _warning

# If MSYS2_PS1 is set, use that as default PS1;
# if a PS1 is already set and exported, use that;
# otherwise set a default prompt
# of user@host, MSYSTEM variable, and current_directory
[[ -n "${MSYS2_PS1}" ]] && export PS1="${MSYS2_PS1}"
# if we have the "High Mandatory Level" group, it means we're elevated
if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
  then _ps1_symbol='\[\e[1m\]\#\[\e[0m\]'
  else _ps1_symbol='\[\e[38;2;251;126;20;48;2;24;24;24m\]\$\[\e[0m\]'
fi
[[ $(declare -p PS1 2>/dev/null | cut -c 1-11) = 'declare -x ' ]] || \
  export PS1='\[\e[38;2;251;126;20m\]\[\e[0m\]\[\e[38;2;24;24;24;48;2;251;126;20m\] \[\e[0m\]\[\e[38;2;251;126;20;48;2;24;24;24m\]\[\e[0m\]\[\e[0m\]\[\e[38;2;251;126;20;48;2;24;24;24m\] \W \[\e[0m\]\[\e[0m\]\[\e[38;2;44;240;41;48;2;24;24;24m\]$(__git_ps1 " %s ")\[\e[0m\]'"${_ps1_symbol}"'\[\e[38;2;24;24;24m\]\[\e[0m\] '
unset _ps1_symbol

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

alias pacman='pacman --color=auto'
alias dev='cd D:/Documents/Dev'
alias repo='cd C:/Users/nuker/Documents/DarkAlessa/'
alias des='cd C:/Users/nuker/Desktop/'
alias ll='ls -la --color=auto'

# cmake command alias
alias cb='clear && cmake --build ./build'
alias crb='clear && cmake -S . -B ./build -G "MSYS Makefiles"'

# meson command alias
alias mb='clear && meson compile -C ./builddir'
alias mbr='clear && meson compile -C ./builddir && ./builddir/*.exe'
alias mrb='clear && meson setup ./builddir'

# Helix
alias hx='helix'
