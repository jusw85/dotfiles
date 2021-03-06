#
# ~/.bashrc
#

# https://github.com/progrium/bashstyle

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


stty -ixon -ixoff
PS1='[\u@\h \W]\$ '
eval "$(dircolors --bourne-shell)"


# https://www.gnu.org/software/bash/manual/bash.html#Using-History-Interactively
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Variables
# https://superuser.com/a/579811
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL="ignoredups:erasedups"
HISTTIMEFORMAT="[%F %T] "
HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
# trap "history -n; history -w; history -c; history -r" EXIT


# https://www.gnu.org/software/gettext/manual/html_node/The-TERM-variable.html
export EDITOR=vim
export TERM=xterm-256color
export LESSHISTFILE=/dev/null
export JAVA_HOME="$(readlink -f /usr/bin/javac | sed "s:bin/javac::")"

# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"


# bind '"\er": redraw-current-line'
bind '"\C-g\C-t": "\C-a$(\C-e|fzf --tac --no-sort)\e\C-e"'
bind '"\C-g\C-g": "$(cheat p | fzf --tac --no-sort)\e\C-e"'


alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias cal='cal -s'
alias mux='tmuxinator'
alias crontab='fcrontab'
alias wget='wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts"'


aur() {
  local op="$1"
  if [[ "${op}" == "sync" || "${op}" == "build" ]]; then
    shift
    command aur "${op}" -c -D /mnt/hdd/packages/chroot/ "$@"
  else
    command aur "$@"
  fi
}
export -f aur


whichpkg() {
  local arg="$1"
  if command -v "${arg}" &> /dev/null; then
    arg="$(which "$1")"
  fi
  pacman -Qo "${arg}"
}


# https://wiki.archlinux.org/title/Fzf#bash
if [ -f /usr/share/fzf/key-bindings.bash ]; then
  source /usr/share/fzf/key-bindings.bash
fi

if [ -f /usr/share/fzf/completion.bash ]; then
  source /usr/share/fzf/completion.bash
fi


# https://github.com/cheat/cheat#advanced-usage
export CHEAT_USE_FZF=true


# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        rm -f "$cmd_file"
        return "$code"
    fi
}
