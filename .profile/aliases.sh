#!/bin/bash

if [ -f "$HOME/.config/.curl" ]; then
	alias curlf="curl -w \"@$HOME/.config/.curl\" -o /dev/null -s"
	alias curlfr="curl -w \"@$HOME/.config/.curl\" -s"
fi

alias w="ssh  workstation-1.host.puhome.net"
alias zola='docker run -i -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app ghcr.io/getzola/zola:v0.19.1'
alias zola-build='docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app ghcr.io/getzola/zola:v0.19.1 build'
alias zola-run-remote='docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app -p 8080:8080 ghcr.io/getzola/zola:v0.19.1 serve --interface 0.0.0.0 --port 8080'
alias zola-run-wsl='docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app -p 8080:8080 ghcr.io/getzola/zola:v0.19.1 serve --interface 0.0.0.0 --port 8080 --base-url "http://127.0.0.1"'
alias zola-run='docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app -p 8080:8080 ghcr.io/getzola/zola:v0.19.1 serve --interface 0.0.0.0 --port 8080 --base-url workstation-1.hnet'
alias zola-run-remote='docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app -p 8080:8080 ghcr.io/getzola/zola:v0.19.1 serve --interface 0.0.0.0 --port 8080'
alias zola-run-wsl='docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app -p 8080:8080 ghcr.io/getzola/zola:v0.19.1 serve --interface 0.0.0.0 --port 8080 --base-url "http://127.0.0.1"'
alias llama-cpp-run='docker run -d --gpus all -v /home/uknth/models:/models -p 8000:8000 ghcr.io/ggml-org/llama.cpp:server-cuda -m /models/qwen3/Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL.gguf --port 8000 --host 0.0.0.0 -n 512 --n-gpu-layers 25 --jinja --ctx-size 102400'

alias brew-save='brew list | xargs -L1 > .Brewfile && yadm add .Brewfile'
