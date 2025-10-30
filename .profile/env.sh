#!/bin/bash

git config --global url."git@github.com:".insteadOf "https://github.com/"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi


export GOPATH=$HOME/.local/share/go
export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

