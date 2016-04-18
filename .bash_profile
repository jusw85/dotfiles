#
# ~/.bash_profile
#

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.node/bin" ] ; then
    PATH="$PATH:$HOME/.node/bin"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
