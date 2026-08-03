#! /usr/bin/env bash

set -ex

# This script installs everything from scratch. It is meant to be used through a curl to bash command.

brew_bin=$(command -v brew || true)

if [[ "${OSTYPE}" == "darwin"* ]]; then
  # Install XCode Command Line Tools if necessary
  xcode-select --install || echo "XCode already installed"
fi

# Install Homebrew if necessary
if [[ -n "${brew_bin}" ]]; then
  echo 'Homebrew is already installed'
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # The installer doesn't add brew to the PATH of the running shell.
  # Keep in sync with `homebrew_prefix` in .chezmoi.toml.tmpl.
  case "${OSTYPE}" in
    darwin*)
      if [[ "$(/usr/bin/uname -m)" == "arm64" ]]; then
        brew_prefix="/opt/homebrew"
      else
        brew_prefix="/usr/local"
      fi
      ;;
    linux*)
      brew_prefix="/home/linuxbrew/.linuxbrew"
      ;;
    *)
      echo "Unsupported platform: ${OSTYPE}" >&2
      exit 1
      ;;
  esac

  brew_bin="${brew_prefix}/bin/brew"

  if [[ ! -x "${brew_bin}" ]]; then
    echo "Homebrew installation failed: ${brew_bin} not found" >&2
    exit 1
  fi

  eval "$("${brew_bin}" shellenv)"
fi

brew install chezmoi
chezmoi init --apply Elindorath

# defaults write at.eggerapps.Postico TabWidth -int 2
# defaults write at.eggerapps.Postico AutomaticallyUppercaseSQLKeywords -int 1
# defaults write at.eggerapps.Postico IndentWithSpaces -int 1

# tmp_dir=$(mktemp -d)
# curl -fsSL https://iterm2.com/downloads/browser-plugin/iTermBrowserPlugin-1.0.zip -o "${tmp_dir}/iTermBrowserPlugin-1.0.zip"
# unzip "${tmp_dir}/iTermBrowserPlugin-1.0.zip" -d /Applications
# rm -rf "${tmp_dir}"

# defaults write com.googlecode.iterm2 PrefsCustomFolder -string ~/.local/share/chezmoi/.app_preferences/iterm2
# defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
