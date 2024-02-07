export EDITOR="vim"
export PATH="$HOME/bin:$GOROOT/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
export ZSH="/Users/stevenle/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"
ZSH_THEME="robbyrussell"
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
    # echo "📦 $configpath"
    source "$configpath"
  fi
}

loadzsh $ZSH/oh-my-zsh.sh
loadzsh $HOME/.zsh/aliases.zsh
loadzsh $HOME/.zsh/gcloud.zsh
loadzsh $HOME/.zsh/golang.zsh
loadzsh $HOME/.zsh/java.zsh
loadzsh $HOME/.zsh/nodejs.zsh
loadzsh $HOME/.zsh/secrets.zsh
# clear
