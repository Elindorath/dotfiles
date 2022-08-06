#! /usr/bin/env zsh
# shellcheck shell=bash

if (( ! $+commands[pnpm] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `pnpm`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_pnpm" ]]; then
  typeset -g -A _comps
  autoload -Uz _pnpm
  _comps[pnpm]=_pnpm
fi

cp completions "$ZSH_CACHE_DIR/completions/pnpm" &|
