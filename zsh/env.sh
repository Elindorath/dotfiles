#! /usr/bin/env zsh
# shellcheck shell=bash

export LC_ALL="en_US.UTF-8"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="code --wait"
fi

export VISUAL="code --wait"

# Use sane default for XDG directories
# See: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# XDG_RUNTIME_DIR should be handled by the system
# In WSL, XDG_RUNTIME_DIR="/mnt/wslg/runtime-dir"
# Might be moved to /etc/security/pam_env.conf according to https://superuser.com/questions/365847/where-should-the-xdg-config-home-variable-be-defined
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Brew
export HOMEBREW_GITHUB_API_TOKEN={{ (bitwardenFields "item" "Homebrew").HOMEBREW_GITHUB_API_TOKEN.value }}
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export HOMEBREW_SHELLENV_PREFIX="/home/linuxbrew/.linuxbrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

typeset -U path
