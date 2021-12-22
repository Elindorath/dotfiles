#! /usr/bin/env zsh
# shellcheck shell=bash

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DEFAULT_USER="$USER"

# ----- Oh My Zsh settings ----- #

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  asdf
  aws
# {{- if (eq .chezmoi.os) "darwin" }}
  brew
# {{- end }}
  clipboard
  # Needs chroma installed
  colorize
  # Should works with brew on Linux if installed
  command-not-found
  docker
  docker-compose
  # Checkout this plugin when it has colon support: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/emoji
  # Checkout also this: https://github.com/b4b4r07/emoji-cli
  # emoji
  fast-syntax-highlighting
  git
  gpg-agent
  # Might be of interest
  # history
  # Might be of interest
  # httpie
  # Might be of interest: https://github.com/reegnz/jq-zsh-plugin
  # jq
  node
  npm
# {{- if (eq .chezmoi.os) "darwin" }}
  macos
# {{- end }}
  passwordless-history
  postgres
  # Might be of interest
  # rsync
  solarized-man
  # Might be of interest
  # ssh-agent
  sudo
  terraform
  vscode
  yarn
  you-should-use
  zsh-asdf-direnv
  zsh-autopair
  zsh-autosuggestions
  zsh-completions
  # Might be of interest: https://github.com/Game4Move78/zsh-bitwarden
  # Depends on bw CLI, jq CLI, and fzf
  zsh-bitwarden
)

ZSH_CUSTOM="$ZSH/custom"

ZSH_CACHE_DIR="$ZSH/cache"

zstyle ":omz:update" mode disabled

ZSH_COMPDUMP="$HOME/.zcompdump-$SHORT_HOST-$ZSH_VERSION"

ZSH_DISABLE_COMPFIX="false"

COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="false"

CASE_SENSITIVE="false"

HYPHEN_INSENSITIVE="true"

DISABLE_MAGIC_FUNCTIONS="false"

DISABLE_LS_COLORS="false"

ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="false"

HIST_STAMPS="%Y/%m/%d"

# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "agnoster")

# ZSH_THEME_RANDOM_IGNORED=("agnoster" "pygmalion" "rkj")

# ZSH_THEME_RANDOM_QUIET="false"

# Specific to zsh-autosuggestions plugin
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Specific to zsh-history-filter plugin
HISTORY_FILTER_EXCLUDE=("_KEY" "Bearer")

# shellcheck source=/home/elindorath/.oh-my-zsh/oh-my-zsh.sh
source "$ZSH/oh-my-zsh.sh"

# The following settings must be set after Oh My Zsh has been sourced

ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<"

# ----- Oh My Zsh settings ----- #



# ----- Custom plugins ----- #
# shellcheck source=/home/elindorath/.oh-my-zsh/custom/plugins/zsh-change-case/change-case.zsh
source "$HOME/.oh-my-zsh/custom/plugins/zsh-change-case/change-case.zsh"
# ----- Custom plugins ----- #



# ----- Native zsh settings ----- #

HISTFILE="$HOME/.zsh_history"
HISTORY_IGNORE="(clear|k)"
# The number of commands to load in memory
HISTSIZE=1000000000
# The number of commands to store in the history file
SAVEHIST=1000000000
LC_ALL="en_US.UTF-8"
# The command to use for redirection of stdout (>) without command
NULLCMD="cat"
# The command to use for redirection of stdin (<) without command
READNULLCMD="less"

watch=(all)
WATCHFMT="%n has %a %l from %M at %T %D{%Y/%m/%d}"

ZDOTDIR="$HOME"

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt NO_HIST_IGNORE_SPACE
setopt NO_HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt NO_INC_APPEND_HISTORY
setopt NO_INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY
setopt HIST_ALLOW_CLOBBER
# Zsh options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt NOCLOBBER
setopt INTERACTIVE_COMMENTS

# ----- Native zsh settings ----- #

# {{- if (eq .chezmoi.os "darwin") }}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# {{- end }}

# ----- Aliases ----- #
# See useful aliases at:
# - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
# - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/cp/cp.plugin.zsh

# Install exa: brew install exa
# Define aliases for exa to replace ls and tree

# Define an alias to git clone then cd into it
# Define an alias to mkdir then cd into it

alias timestamp="date +%s"
alias k=clear

# {{- if (eq .chezmoi.os "linux") }}
alias open="xdg-open"
# {{- end }}

alias myip="dig @resolver4.opendns.com myip.opendns.com +short -4"

# Should be declared in $ZSH_CUSTOM/direnv.zsh
direnv() { asdf exec direnv "$@"; }

# Should be declared in $ZSH_CUSTOM/from.zsh
from() { ls -la "$(which "$1")"; }

alias -g G="| grep"

# ----- Aliases ----- #
