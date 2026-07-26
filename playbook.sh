#! /usr/bin/env bash

set -ex

# Prepare
echo "Close any open System Preferences window"
osascript -e 'tell application "System Preferences" to quit'

sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo sed -ie '/auth/s/^#//g' /etc/pam.d/sudo_local

# Brew

