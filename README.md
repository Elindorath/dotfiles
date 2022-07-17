# Keep a clean home

## Dump of my current home (Mac)

```toml
~/
├── .CFUserTextEncoding # Mac specific
├── .DS_Store # Mac specific
├── .Trash/ # Mac specific
├── .ansible/
├── .asdf/
├── .bash_history
├── .cache/
├── .config/
├── .docker/
├── .envrc
├── .expo/
├── .gitconfig
├── .lesshst
├── .local/
├── .node-gyp/
├── .npm/
├── .oh-my-zsh/
├── .p10k.zsh
├── .redhat/
├── .tool-versions
├── .viminfo
├── .vscode/
├── .yarnrc
├── .zcompdump--5.9
├── .zlogin
├── .zsh_history
├── .zsh_sessions/
├── .zshenv
├── .zshrc
├── Applications/
├── Desktop/
├── Documents/
├── Downloads/
├── Library/
├── Movies/
├── Music/
├── Pictures/
├── Public/
├── Screenshots/
└── dev/

25 directories, 15 files
```

## Explanations

<details>
  <summary>
    <b>.CFUserTextEncoding</b>
    <i>(Mac specific)</i>
  </summary>

Stores the default text encoding and preferred language

See: <https://superuser.com/questions/82123/mac-whats-cfusertextencoding-for>

</details>

<details>
  <summary>
    <b>.DS_Store</b>
    <i>(Mac specific)</i>
  </summary>

Stores the Finder view settings of the directory

See: <https://www.arno.org/on-the-origins-of-ds-store>

</details>

<details>
  <summary>
    <b>.Trash/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the Trash (yeah, you guessed it)

</details>

<details>
  <summary>
    <b>.ansible/</b>
    <i></i>
  </summary>

Stores all ansible files

Will be configurable with the `ANSIBLE_HOME` environment variable in ansible-core v2.14

See: <https://github.com/ansible/ansible/pull/76114>

</details>

<details>
  <summary>
    <b>.asdf/</b>
    <i></i>
  </summary>

Stores all asdf files

Configurable with the `ASDF_DATA_DIR` environment variable (should be set before sourcing `asdf.sh`)

See: <https://asdf-vm.com/manage/configuration.html#environment-variables>

</details>

<details>
  <summary>
    <b>.bash_history</b>
    <i></i>
  </summary>

Stores the bash history (yeah, you guessed it)

Creation could be prevented system-wide with the command `echo 'set +o history' >> /etc/profile` (to avoid prevention from `~.bashrc`)

</details>

<details>
  <summary>
    <b>.cache/</b>
    <i></i>
  </summary>

Part of the XDG Base Directory Specification, corresponds to `XDG_CACHE_HOME`

Required, should not be removed

</details>

<details>
  <summary>
    <b>.config/</b>
    <i></i>
  </summary>

Part of the XDG Base Directory Specification, corresponds to `XDG_CONFIG_HOME`

Required, should not be removed

</details>

<details>
  <summary>
    <b>.docker/</b>
    <i></i>
  </summary>

Doesn't seem to be configurable yet

See: <https://github.com/docker/cli/issues/2423>

</details>

<details>
  <summary>
    <b>.envrc</b>
    <i></i>
  </summary>

Used automatically by direnv when navigating with zsh

Required, should not be removed

</details>

<details>
  <summary>
    <b>.expo/</b>
    <i></i>
  </summary>

Doesn't seem to be configurable yet

See: <https://github.com/expo/expo-cli/pull/3722>

</details>

<details open>
  <summary>
    <b>.gitconfig</b>
    <i></i>
  </summary>

Doesn't seem to be configurable yet

See: <https://github.com/expo/expo-cli/pull/3722>

</details>

## Todo

- [ ] `~/.ansible` will be configurable with `ANSIBLE_HOME` environment variable in ansible-core v2.14
