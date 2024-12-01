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
- [ ] `.wget-hsts`
- [ ] Make a proper color scheme in OKLab colorspace, inspired from Selenium and OKSolar (see the ["Color schemes" section](#color-schemes-wip))
<!-- ##### WINDOWS ##### -->
- [ ] Patch Solarized Dark theme
- [ ] Install fonts: `choco install nerd-fonts-hack`
<!-- ##### WSL ##### -->
- [ ] Install wslu: `brew install wslu`
- [ ] `brew install bzip2 libffi`
- [ ] `sudo add-apt-repository ppa:wslutilities/wslu`
- [ ] `sudo apt install --no-install-recommends wslu`
<!-- Might not be required -->
- [ ] `export LDFLAGS="-L${HOMEBREW_PREFIX}/lib -L/home/linuxbrew/.linuxbrew/opt/openssl@3/lib"`
- [ ] `export CPPFLAGS="-I${HOMEBREW_PREFIX}/include -I/home/linuxbrew/.linuxbrew/opt/openssl@3/include"`

```sh
# Install the Ubuntu keyring
sudo apt install gnome-keyring

# Install 1Password desktop app for linux
# Add the key for the 1Password apt repository
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
# Add the 1Password apt repository
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
# Add the debsig-verify policy
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
# Install 1Password
sudo apt update && sudo apt install 1password

# Install 1Password cli for Ubuntu
# Add the key for the 1Password apt repository (same as the desktop app)
sudo -s \
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
# Add the 1Password apt repository (same as the desktop app)
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
tee /etc/apt/sources.list.d/1password.list
# Add the debsig-verify policy (same as the desktop app)
mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
# Install 1Password cli
apt update && apt install 1password-cli

# Install WSL Hello sudo
wget http://github.com/nullpo-head/WSL-Hello-sudo/releases/latest/download/release.tar.gz
tar xvf release.tar.gz
cd release
./install.sh
```

## Color schemes (WIP)

```plain
// OKSOLAR REWORKED

// bg_0
base03     #002d38
// bg_1
base02     #093946
// bg_2
           #244d59
// dim_0   oklch(53.5% 0.017 219.6)
           #637074
// fg_0    oklch(72.5% 0.017 219.6)
           #9ba9ad
// fg_1    oklch(82.5% 0.017 219.6)
           #bac9cd
base01     #5b7279
base00     #657377
base0      #98a8a8
base1      #8faaab
base2      #f1e9d2
base3      #fbf7ef

red        #f23749
green      #819500
yellow     #ac8300
blue       #2b90d8
magenta    #dd459d
cyan       #259d94
orange     #d56500
violet     #7d80d1

br_red     #ff4a58
br_green   #90a423
br_yellow  #bb9223
br_blue    #3ea0e9
br_magenta #ef56ac
br_cyan    #3aada3
br_orange  #e77422
br_violet  #8b8fe1



// SELENIUM DARK

bg_0         #103c48
bg_1         #184956
bg_2         #2d5b69
dim_0        #72898f
fg_0         #adbcbc
fg_1         #cad8d9

red          #fa5750
green        #75b938
yellow       #dbb32d
blue         #4695f7
magenta      #f275be
cyan         #41c7b9
orange       #ed8649
violet       #af88eb

br_red       #ff665c
br_green     #84c747
br_yellow    #ebc13d
br_blue      #58a3ff
br_magenta   #ff84cd
br_cyan      #53d6c7
br_orange    #fd9456
br_violet    #bd96fa
```
