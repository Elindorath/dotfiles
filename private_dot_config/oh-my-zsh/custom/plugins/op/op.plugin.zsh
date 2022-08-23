#! /usr/bin/env zsh
# shellcheck shell=bash

if (( ! $+commands[op] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `op`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_op" ]]; then
  typeset -g -A _comps
  autoload -Uz _op
  _comps[op]=_op
fi

op completion zsh >| "$ZSH_CACHE_DIR/completions/_op" &|
