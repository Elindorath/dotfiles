# Keep a clean home

## Dump of my current home (Mac)

```toml
~/
├── .ansible/
├── .bash_history
├── .cache/
├── .CFUserTextEncoding
├── .config/
├── .docker/
├── .DS_Store
├── .envrc
├── .expo/
├── .local/
├── .rndebuggerrc
├── .tool-versions
├── .Trash/
├── .vscode/
├── .yarnrc
├── .zshenv
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

19 directories, 8 files
```

## Explanations

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
    <b>.CFUserTextEncoding</b>
    <i>(Mac specific)</i>
  </summary>

Stores the default text encoding and preferred language

See: <https://superuser.com/questions/82123/mac-whats-cfusertextencoding-for>

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
    <b>.DS_Store</b>
    <i>(Mac specific)</i>
  </summary>

Stores the Finder view settings of the directory

See: <https://www.arno.org/on-the-origins-of-ds-store>

Required, should not be removed

</details>

<details>
  <summary>
    <b>.envrc</b>
    <i></i>
  </summary>

Used automatically by `direnv` when navigating with zsh to use asdf and exporting environment

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

<details>
  <summary>
    <b>.local/</b>
    <i></i>
  </summary>

Part of the XDG Base Directory Specification, contains the `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_BIN_HOME`

Required, should not be removed

</details>

<details>
  <summary>
    <b>.rndebuggerrc</b>
    <i></i>
  </summary>

Stores the `react-native-debugger` global configuration

Doesn't seem to be configurable.

Consider making a PR to change [this](https://github.com/jhen0409/react-native-debugger/blob/a3963ac60f22958005e6ed41721eeeffffb35d91/electron/config/index.js#L7:L10)

</details>

<details>
  <summary>
    <b>.tool-versions</b>
    <i></i>
  </summary>

Used automatically by `asdf` when navigating with zsh to exposed the configured tool version binaries

Required, should not be removed

</details>

<details>
  <summary>
    <b>.Trash/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the Trash (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>.vscode/</b>
    <i></i>
  </summary>

Stores the VSCode extensions and the `argv.json` file (to launch VSCode with default arguments)

The extensions path seems to be configurable, but not the `argv.json` location

See: <https://github.com/microsoft/vscode/issues/3884> and <https://github.com/microsoft/vscode/issues/84808>

</details>

<details>
  <summary>
    <b>.yarnrc</b>
    <i></i>
  </summary>

Stores the `yarn` global configuration

Doesn't seem to be configurable yet

See: <https://github.com/yarnpkg/yarn/issues/2334>

</details>

<details>
  <summary>
    <b>.zshenv</b>
    <i></i>
  </summary>

Used at startup by zsh. It set the `$ZDOTFILE` environment variable to specify the directory where zsh configuration files live.

Required, should not be removed

</details>

<details>
  <summary>
    <b>Applications/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the desktop applications (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Desktop/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the files visible on desktop (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>dev/</b>
    <i></i>
  </summary>

Stores all of the projects I work on

Required, should not be removed

</details>

<details>
  <summary>
    <b>Documents/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the documents (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Downloads/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the downloaded files (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Library/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the system and applications files (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Movies/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the movie files (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Music/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the audio files (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Pictures/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the pictures files (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Public/</b>
    <i>(Mac specific)</i>
  </summary>

Stores the files accessible by other users (yeah, you guessed it)

Required, should not be removed

</details>

<details>
  <summary>
    <b>Screenshots/</b>
    <i></i>
  </summary>

Stores the screenshots (yeah, you guessed it)

Required, should not be removed

</details>

## Todo

- [ ] `~/.ansible/`
- [ ] `.bash_history`
- [ ] `.docker/`
- [ ] `.expo/`
- [ ] `.vscode/`
- [ ] `.yarnrc`
