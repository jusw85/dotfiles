#
# ~/.bash_profile
#

if [[ -d "${HOME}/bin" ]]; then
  PATH="${HOME}/bin:${PATH}"
fi

if [[ -d "${HOME}/.local/bin" ]]; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

if command -v ruby &> /dev/null; then
  gem_home="$(ruby -e 'puts Gem.user_dir')"
  gem_bin="${gem_home}/bin"
  if [[ -d "${gem_bin}" ]]; then
    PATH="${gem_bin}:${PATH}"
  fi
  unset gem_bin
  unset gem_home
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
