# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/will/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

#### Aliases ####
# Netctl aliases
alias netstrt='sudo netctl start'
alias netswtch='sudo netctl switch-to'
alias netstop='sudo netctl stop'
# Aura (pacman) alias
alias pacman='sudo aura'
alias svim='sudo vim'
alias hibrnte='sudo systemctl hibernate'
alias cp='rsync -avhz --progress'
alias ls='ls --color=always -h'
alias biggest='du -h . | sort -rh | head -$1'
# Base64 encode and decode
function b64d() {
  echo "$1" | base64 -d
}
function b64e() {
  echo "$1" | base64
}
#### Additional Path directories ####
# scripts
export PATH=$PATH:/home/will/scripts
# android sdk
export PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools
# go-workspace
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin
#### ENV VARS ####
# Java blank windows fix
export _JAVA_AWT_WM_NONREPARENTING=1

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
