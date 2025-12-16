#!/bin/bash

git config --global url."git@github.com:".insteadOf "https://github.com/"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi


export GOPATH="$HOME/.local/share/go"
export BREWPATH="/opt/homebrew"
export CARGOPATH="$HOME/.cargo"
export MYBINPATH="$HOME/.bin"

export PATH="$GOPATH/bin:$PATH"
export PATH="$CARGOPATH/bin:$PATH"
export PATH="$BREWPATH/opt/sqlite/bin:$BREWPATH/opt/rustup/bin:$BREWPATH/bin:$PATH"
export PATH="$MYBINPATH:$PATH"

if command -v zoxide &> /dev/null; then
	eval "$(zoxide init zsh)"
fi

if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
if [[ -s "$HOME/.docker/completions" ]]; then
    fpath=(/Users/uknth/.docker/completions $fpath)
    autoload -Uz compinit
    compinit
fi
# End of Docker CLI completions

# Added by Windsurf
if [[ -d "$HOME/.codeium/windsurf/bin" ]]; then
    export PATH="/Users/uknth/.codeium/windsurf/bin:$PATH"
fi
