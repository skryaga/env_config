#!/bin/bash

set -e
echo Pulling pure prompt...
cd $ZSH_PURE
git pull
echo Pulling syntax highlighting...
cd $(dirname $ZSH_SYNTAX_HIGHLIGHTING_FILE)
git pull
echo Pulling autosuggestions...
cd $(dirname $ZSH_AUTOSUGGESTIONS_FILE)
git pull
echo Pulling history substring search...
cd $(dirname $ZSH_AUTOSUGGESTIONS_FILE)
git pull