# Aliases.
alias g='git'
alias g3='cd $(~/bin/find_parent_dir.py package.json)'
alias g4='cd $(git rev-parse --show-cdup)'
alias git-root='cd $(git root)'
alias gr='grep --color=always -n -R -i'
# git root
alias groot='cd $(git root)'
alias gti='git'
alias killbg='kill %%'
alias l='gls --color -lh --group-directories-first'
alias ls='gls --color -lh --group-directories-first'
alias lessf='less +F'
alias opendir='nautilus'
alias otp='watch -n1 gauth'
# package root
alias proot='cd $(~/bin/find_parent_dir.py package.json)'
alias prunenm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
alias s='tmux ls'
alias sr='tmux a -d -t'
alias ss='tmux new -s'
alias unbz2='tar xvjf'
alias untar='tar xvf'
alias vim='vim -X'
