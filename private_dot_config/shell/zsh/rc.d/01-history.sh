#! /usr/bin/env zsh
# shellcheck shell=bash

# This history configuration is focused on usability and exhaustiveness.
# This means we keep in history all commands with some context to be able to replay command that affect state

HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history

[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

# Max number of entries to keep in history file.
SAVEHIST=$(( 100 * 1000 ))      # Use multiplication for readability.
1 000 000 000

# Max number of history entries to keep in memory.
HISTSIZE=$(( 1.2 * SAVEHIST ))  # Zsh recommended value

# Might be migrated to https://github.com/larkery/zsh-histdb

# Append commands to the history when the shell session close instead of replacing them
# Disable APPEND_HISTORY, mutually exclusive with SHARE_HISTORY
setopt APPEND_HISTORY

# Treat the character '!' specially to perform history expansion
setopt BANG_HIST

# Save timestamp and execution duration of each command
setopt EXTENDED_HISTORY

# When a command contains an output redirection, store it in the history with an additional '|' to allow clobber files even when CLOBBER is unset
setopt HIST_ALLOW_CLOBBER

# Beep when a widget attempts to access a history entry which isn’t there
setopt HIST_BEEP

# Prevent removing the oldest duplicates when history needs to be trimmed off
setopt NO_HIST_EXPIRE_DUPS_FIRST

# Use modern file-locking mechanisms, for better safety & performance
setopt HIST_FCNTL_LOCK

# Avoid duplicates when cycling back in history
setopt HIST_FIND_NO_DUPS

# Let duplicated commands to be stored in history
setopt NO_HIST_IGNORE_ALL_DUPS

# Let duplicate of the previous command to be stored in history
setopt NO_HIST_IGNORE_DUPS

# Let command prepended with space to be stored in history
setopt NO_HIST_IGNORE_SPACE

# Don't understand what this option does, letting this as default
setopt NO_HIST_LEX_WORDS

# Let function definitions to be stored in history
setopt NO_HIST_NO_FUNCTIONS

# Prevent both commands `history` and `fc -l` to be stored in history as they are mostly used to search in history and don't affect the state
setopt HIST_NO_STORE

# Remove superfleous blanks from each commands
setopt HIST_REDUCE_BLANKS

# Write out a copy of the file named $HISTFILE.new and then rename it over the old one when the history file is re-written
# This is the default behavior and should be disable only for special needs
setopt HIST_SAVE_BY_COPY

# Let duplicated commands to be stored in history
setopt HIST_SAVE_NO_DUPS

# Expand history expansion first before execution
setopt HIST_VERIFY

# Append commands to the history as soon as they are entered
# Disable INC_APPEND_HISTORY, mutually exclusive with SHARE_HISTORY
setopt NO_INC_APPEND_HISTORY

# Disable INC_APPEND_HISTORY_TIME, mutually exclusive with SHARE_HISTORY
setopt NO_INC_APPEND_HISTORY_TIME

# Same as INC_APPEND_HISTORY but also import new commands across multiple shell sessions
setopt SHARE_HISTORY

function zshaddhistory() {
  print -sr "${1%%$'\n'} ### ${PWD}"
  fc -p
}
