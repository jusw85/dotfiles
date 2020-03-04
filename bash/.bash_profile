#
# ~/.bash_profile
#

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#if [ -d "$HOME/.gem/ruby/2.3.0/bin" ] ; then
    #PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
#fi

if [ -d "$HOME/.node/bin" ] ; then
    PATH="$HOME/.node/bin:$PATH"
fi

if [ -d "$HOME/.gem/ruby/2.5.0/bin" ] ; then
    PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"

source /home/user/.config/broot/launcher/bash/br
