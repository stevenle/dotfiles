export PATH="$HOME/bin:$GOROOT/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
export EDITOR="vim"
export ZSH="/Users/stevenle/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(git)

# Search history using up/down arrows.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Dow

loadzsh() {
  configpath="$1"
  if [ -f "$configpath" ]; then
    source "$configpath"
  fi
}

loadzsh $ZSH/oh-my-zsh.sh
loadzsh $HOME/.zsh/aliases.zsh
loadzsh $HOME/.zsh/gcloud.zsh
loadzsh $HOME/.zsh/golang.zsh
loadzsh $HOME/.zsh/java.zsh
loadzsh $HOME/.zsh/nodejs.zsh
