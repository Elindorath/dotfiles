#! /usr/bin/env zsh
# shellcheck shell=bash

# TODO: replace by export WIN_HOME="{{ .win_home }}"
WIN_HOME=$(wslpath "$(wslvar USERPROFILE)")
export WIN_HOME

if ! service rsyslog status > /dev/null; then
  sudo /etc/init.d/rsyslog start > /dev/null;
fi

if ! service cron status > /dev/null; then
  sudo /etc/init.d/cron start > /dev/null;
fi
