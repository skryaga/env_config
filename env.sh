#!/bin/zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PLUGINS=$HOME/.zsh_plugins

fpath=( "$PLUGINS" $fpath )

# retain colors even in console terminal
export TERM="xterm-256color"
# set up history
HISTSIZE=$(( 1024 * 256)) # size
SAVEHIST=$HISTSIZE # persistent size
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups hist_expire_dups_first hist_find_no_dups

autoload -Uz compinit promptinit
compinit
promptinit

# group completion by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true
# use menu completion and add colors
zstyle ':completion:*' menu select yes
zstyle ':completion:*:default' list-colors ''

export ZSH_SYNTAX_HIGHLIGHTING_FILE=$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_AUTOSUGGESTIONS_FILE=$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_HISTORY_SUBSTRING_SEARCH_FILE=$PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_SYNTAX_HIGHLIGHTING_FILE
source $ZSH_AUTOSUGGESTIONS_FILE
source $ZSH_HISTORY_SUBSTRING_SEARCH_FILE

# only letters are considered "word characters" in order
# for word motions to work nicely (Alt+BSp, Alt+{F,B} etc.)
WORDCHARS=''

# PURE prompt plugin
export ZSH_PURE=$PLUGINS/pure
RPROMPT=""
prompt pure

# color scheme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=default,underline'

# fuzzy search on Ctrl+{P,N}
bindkey -e
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='subl -w'
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects

# Owner
export USER_NAME="kirill.skryaga"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Use sublimetext for editing config files
alias zshconfig="subl ~/.zshrc"
alias envconfig="subl ~/projects/config/env.sh"

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$PROJECT_HOME/go
export PATH=$PATH:$GOPATH/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
