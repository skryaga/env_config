#!/bin/bash

export PLUGINS=$HOME/.zsh_plugins

mkdir -p $PLUGINS

export ZSH_PURE=$PLUGINS/pure
export ZSH_SYNTAX_HIGHLIGHTING_FILE=$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_AUTOSUGGESTIONS_FILE=$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_HISTORY_SUBSTRING_SEARCH_FILE=$PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh

source clone-plugs.sh

ln -s "$ZSH_PURE/pure.zsh" "$PLUGINS/prompt_pure_setup"
ln -s "$ZSH_PURE/async.zsh" "$PLUGINS/async"

# TODO add .zsherc update with env.sh