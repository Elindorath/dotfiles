#! /usr/bin/env bash

set -euo pipefail

# Makes the system ssh configuration include ~/.config/ssh/config, so every ssh
# invocation gets it. OpenSSH has no environment variable for the user
# configuration and only reads ~/.ssh/config, which this setup does not use.
#
# `%d` rather than `~`: the manual only documents tilde expansion for user
# configurations, `%d` works in any context.
#
# Plain `run_` rather than `run_onchange_`: the state is outside chezmoi, so it
# must be rechecked on every apply. A macOS upgrade resetting /etc/ssh leaves
# this script's contents unchanged.

readonly system_config=/etc/ssh/ssh_config
readonly include_dir=/etc/ssh/ssh_config.d
readonly target="${include_dir}/200-xdg.conf"
readonly content='Include %d/.config/ssh/config'

# Nothing to do: stay silent and, above all, do not invoke sudo.
if [[ -f ${target} ]] && [[ "$(cat "${target}")" == "${content}" ]]; then
  exit 0
fi

# Writing the file is pointless if the system configuration does not read it.
if [[ ! -d ${include_dir} ]] || ! grep -qE "^[[:space:]]*Include[[:space:]]+${include_dir}/\*" "${system_config}"; then
  echo "ssh: ${system_config} does not include ${include_dir}/*, skipping" >&2
  echo "ssh: add the Include there by hand, or drop this script" >&2
  exit 0
fi

echo "ssh: installing ${target} (needs sudo)" >&2
if ! printf '%s\n' "${content}" | sudo tee "${target}" >/dev/null; then
  cat >&2 <<EOF
ssh: could not write ${target}. Run this once, by hand:
  printf '%s\\n' '${content}' | sudo tee ${target} >/dev/null && sudo chmod 644 ${target}
EOF
  exit 1
fi
sudo chmod 644 "${target}"
echo "ssh: ${target} installed" >&2
