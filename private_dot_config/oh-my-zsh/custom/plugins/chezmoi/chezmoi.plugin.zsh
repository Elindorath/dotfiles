#! /usr/bin/env zsh
# shellcheck shell=bash

if (( ! $+commands[chezmoi] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `chezmoi`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/chezmoi" ]]; then
  typeset -g -A _comps
  autoload -Uz chezmoi
  _comps[chezmoi]=chezmoi
fi

chezmoi completion zsh >| "$ZSH_CACHE_DIR/completions/chezmoi" &|
