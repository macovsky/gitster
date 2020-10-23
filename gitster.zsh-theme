# vim:et sts=2 sw=2 ft=zsh
#
# Gitster theme
# https://github.com/shashankmehta/dotfiles/blob/master/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

_prompt_gitster_pwd() {
  print -n "%F{cyan}%2~"
}

setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format '%F{12}%b'
  zstyle ':zim:git-info:commit' format '%F{12}%c'
  zstyle ':zim:git-info:dirty' format '%F{12}±'
  zstyle ':zim:git-info:keys' format 'prompt' ' %b%c%D'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='%(?::%F{red}! )${SSH_TTY:+"%F{12}%n%F{4}@%F{12}%m "}$(_prompt_gitster_pwd)${(e)git_info[prompt]}%f '
unset RPS1
