#! /usr/bin/env zsh
# shellcheck shell=bash

{{ if (eq .chezmoi.os "darwin") -}}
{{   if (stat "/opt/homebrew/bin/brew") -}}
eval "$(/opt/homebrew/bin/brew shellenv)"
{{   else if (stat "/opt/local/bin/brew") -}}
eval "$(/opt/local/bin/brew shellenv)"
{{   end -}}
{{ end -}}

export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"