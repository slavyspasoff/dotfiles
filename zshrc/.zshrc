#evn varaibles
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
export HISTFILE=$HOME/.zsh_history
#export LC_ALL=en_US.UTF-8

#path env
export PATH=/home/spasoff/go/bin/:$PATH
export PATH=/home/spasoff/.cargo/bin/:$PATH
export PATH=$PATH:/home/spasoff/.appimage-bin/

#zsh options
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_PUSHD
setopt PUSHD_MINUS
setopt PUSHD_IGNORE_DUPS
setopt CD_SILENT

#enable theme
eval "$(starship init zsh)"

#enable zoxide
eval "$(zoxide init --cmd z zsh)"

#ctrl-w respects "/", etc...
WORDCHARS=

#disable terminal suspense Ctrl+S Ctrl+Q
if [[ -t 0 && $- = *i* ]]
then
  stty -ixon
fi

#ctrl-leftarrow ctrl-rightarrow jump one word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

#tab autocompletion
autoload -U compinit
zmodload zsh/complist
compinit
bindkey -M menuselect '^[[Z' reverse-menu-complete

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias btw='fastfetch'
alias hist='history'
alias ls='eza --icons --group-directories-first'
alias sl='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias dirs='dirs -v'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='fgrep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -m'
alias yy="yazi"
alias fzf="fzf --layout=reverse"
alias zed=zeditor
alias chez=chezmoi

le(){
 if [[ $1 != [0-9] ]]; then
   eza --icons --tree --group-directories-first -L 1 $@
 elif [[ $1 == [0-9] ]]; then
   eza  --icons --tree --group-directories-first -L $@
 fi
}

tree(){
 if [[ -z $1 ]]; then
   eza --icons --tree --group-directories-first -D --git-ignore
 elif  [[ ( $1 == 'a' || $1 == '-a' ) && -z $2 ]];  then
   eza --icons --tree -a --group-directories-first -D
 elif  [[ $1 == [0-9] && -z $2 ]];  then
   eza --icons --tree --group-directories-first -D --git-ignore -L $1
 elif  [[ $1 == [0-9] && ( $2 == 'a' || $2 == '-a' )]];  then
   eza --icons --tree -a --group-directories-first -D -L $1
 elif  [[ ( $1 == 'a' || $1 == '-a' ) && $2 == [0-9] ]];  then
   eza --icons --tree -a --group-directories-first -D -L $2
 fi    
}

#plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
