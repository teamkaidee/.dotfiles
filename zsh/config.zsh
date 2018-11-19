bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[1;9D' beginning-of-line
bindkey '^[[1;9C' end-of-line
bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down