#!/bin/bash

echo Cloning pure prompt...
git clone git@github.com:sindresorhus/pure.git $ZSH_PURE
echo Cloning syntax highlighting...
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $(dirname $ZSH_SYNTAX_HIGHLIGHTING_FILE)
echo Cloning autosuggestions...
git clone git@github.com:zsh-users/zsh-autosuggestions.git $(dirname $ZSH_AUTOSUGGESTIONS_FILE)
echo Cloning history substring search...
git clone git@github.com:zsh-users/zsh-history-substring-search.git $(dirname $ZSH_HISTORY_SUBSTRING_SEARCH_FILE)