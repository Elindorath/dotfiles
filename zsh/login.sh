#! /usr/bin/env zsh
# shellcheck shell=bash

{{ if eq .chezmoi.os "darwin" -}}
{{   if stat "/opt/homebrew/bin/brew" -}}
eval "$(/opt/homebrew/bin/brew shellenv)"
{{   else if stat "/usr/local/bin/brew" -}}
eval "$(/usr/local/bin/brew shellenv)"
{{   end -}}
{{ end -}}
