#! /usr/bin/env bash

set -euo pipefail
# DIR_ME=$(realpath "$(dirname "$0")")

# this script is called by root an must fail if no user is provided
# . ${DIR_ME}/../../install/.installUtils.sh

USERNAME=""
HOMEDIR=""
OS_TYPE=${2-"ubuntu"}

setUserName () {
  USERNAME=${1-""}
  verifyUserName
}

verifyUserName () {
  if [[ $USERNAME == "" ]]; then
    echo "Please pass a user name"
    exit 1
  elif [[ $USERNAME == "root" ]]; then
    HOMEDIR="/root"
  else
    HOMEDIR="/home/$USERNAME"
  fi
}

modifyWslConf () {
  verifyUserName

  echo "\
[automount]
enabled = true
root = \"/mnt/\"
options=\"metadata,uid=1000,gid=1000,umask=22,fmask=11\"
mountFsTab = false

[interop]
appendWindowsPath = false

[user]
default=$USERNAME
" | sudo tee /etc/wsl.conf
}

createMainUser () {
  verifyUserName

  if [[ $(grep -c "$USERNAME" /etc/passwd) == 0 ]]; then
    useradd -m -s /bin/bash "$USERNAME"
  fi

  # add to sudo group
  if [[ "${OS_TYPE}" == "ubuntu" ]]; then
    usermod -aG sudo "$USERNAME"
  fi

  if [[ "${OS_TYPE}" == "centos" ]]; then
    usermod -aG wheel "$USERNAME"
  fi

  if [[ ! -d "$HOMEDIR/Downloads" ]]; then
      mkdir "$HOMEDIR/Downloads"
      chown "$USERNAME:$USERNAME" "$HOMEDIR/Downloads"
  fi

  # ensure no password is set
  passwd -d "$USERNAME"
}

setUserName "${1-""}"
createMainUser

modifyWslConf
