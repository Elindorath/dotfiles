# Working with WSL 2 (Windows Subsystem for Linux)

> It is recommended to install the editor of your choice before installing WSL. Be aware that [VS Code][vscode] has a native integration with WSL.



### Install WSL 2

*All that follows is a summary of [this page](https://docs.microsoft.com/en-us/windows/wsl/install-win10)*

At the time of writing, WSL 2 needs the Windows 10, version 2004 (Build 19041) or higher available in the Windows Insider Program.

```sh
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# Restart Windows
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Restart Windows
wsl --set-default-version 2
```

Search for Ubuntu in the [Microsoft Store](https://aka.ms/wslstore) and install it.

Before launching it, some checks has to be made:
- Search for "Turn Windows features on or off" and ensure `Virtual Machine Platform`, `Windows Hypervisor Platform` and `Windows Subsystem for Linux` are enabled
- Ensure `%USERPROFILE%\AppData\Local\Packages\CanonicalGroupLimited...\LocalState` is not compressed nor encrypted (Right click on the directory > Properties > Advanced)

Launch Ubuntu. It should ask you for a username and password. Choose whatever you like.



### Setting up the WSL config

It is very likely that the filesystem permissions are fucked up. To fix it, we need to configure the wsl.

Create the file `/etc/wsl.conf` and put in:

```
[automount]
enabled = true
options = "metadata,uid=1000,gid=1000,umask=22,famsk=11"
```

The important part here is the options one:
- `metadata` enable the permission bit
- `uid` is the id of the owner user (`1000` is the one you created at initialization)
- `gid` is the id of the owner group (`1000` is the one you created at initialization)
- `umask` is the permission mask for newly created file and directory
- `fmask` is the permission mask for newly created file only



### Restart the WSL

Open a Powershell window and execute:

```powershell
# Stop the WSL
wsl --terminate Ubuntu
# Start the WSL
wsl --distribution Ubuntu
# Ensure the WSL is running
wsl -l -v
```

### Setting up the env

#### IDE and terminal

First, configure your IDE or terminal of your choice to use WSL for interactive terminal.

In [VS Code][vscode]:
```json
“terminal.integrated.shell.windows”: “C:\\WINDOWS\\System32\\wsl.exe”
```

In [Hyper][hyper]:
```js
shell: `C:\\Windows\\System32\\wsl.exe`,
shellArgs: ['~'], // To start the session in the WSL home
```

#### WIN_HOME

As you will surely use this path a lot, it is highly recommended that you create a `WIN_HOME` env variable

```sh
echo "export WIN_HOME=/mnt/c/Users/<your_username>" >> ~/.bashrc
```

#### Securing the files

An important things to know: everything inside the own Linux filesystem is likely to be lost if there is any issue with the WSL.

It is therefore encouraged to put every projects in the Windows filesystem. You can easily do it with a symlink as follow:

```sh
cd
mkdir /mnt/c/the/path/you/want/
ln -s /mnt/c/the/path/you/want/
```

#### ssh

If you already have setup your ssh keys and config in windows, just get it

```sh
cd
cp -r /mnt/c/Users/<WIN_USER>/.ssh ~
chmod 700 ~/.ssh/id_rsa
```

#### git

Git have to interact a lot with the filesystem. Despite having been optimized in the v2, the layer between WSL and Windows add some overhead operation that slow git commands down. It begins to be very painful when your prompt relies on git command results as every commands you make will be slowed down.

To avoid that:

1. Install git for windows
2. Create the file `/usr/local/bin/git` containing:

```sh
#! /bin/sh

case "$(pwd -P)" in
  (/mnt/?/*)
    exec git.exe "$@"
  ;;
  (*)
    exec /usr/bin/git "$@"
  ;;
esac
```

3. Ensure the file `/usr/local/bin/git` is executable
4. Ensure the directory `/usr/local/bin` appears before `/usr/bin` in your `$PATH`

To avoid git falsely reporting filesystem changes

```sh
# Handle execution right bit differences
git.exe config --global core.filemode false
/usr/bin/git config --global core.filemode true
# Handle EOL differences
git.exe config --global core.autocrlf input
/usr/bin/git config --global core.autocrlf input
```

If you already had cloned repositories somewhere in `/mnt`, you need to execute the command `git config core.filemode false` in each of them

Be sure that your IDE is correctly configured to put `\n` as the EOL character

### End

You have now a bare new fully functionnal Ubuntu right in Windows. You are free to install all you need from here. It is highly recommended that you write all your setup in a script, typically stored in a `dotfiles` repository.



[vscode]: https://code.visualstudio.com/ "VS Code homepage"
[hyper]: https://hyper.is/ "Hyper.js homepage"