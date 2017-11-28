# Path to your oh-my-zsh installation.
export ZSH=$HOME"/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(adb aws bower brew docker docker-compose gem git git-flow-avh node npm nvm osx pip postgres rvm sublime sudo)

# User configuration

export PATH=$PATH:"/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

DEFAULT_USER=$USER

export PATH=$PATH:"/usr/local/bin"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home"

# Android
export PATH=$PATH:$HOME/Library/Android-SDK/tools
export PATH=$PATH:$HOME/Library/Android-SDK/platform-tools
export PATH=$PATH:$HOME/Library/Android-SDK/build-tools/23.0.2

# Zsh
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias zprofile="vim ~/.zprofile && source ~/.zprofile"

# Sublime text
# oh my zsh's sublime plugin already do that
# alias st="sublime"
# alias subl="sublime"

# Vim
alias vim="/usr/local/Cellar/vim/7.4.936/bin/vim"
alias vimrc="vim ~/.vimrc"

# OS X
# oh my zsh's osx plugin already do that
# alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder /System/Library/CoreServices/Finder.app"
# alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder /System/Library/CoreServices/Finder.app"
alias hideSpotlight="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
alias showSpotlight="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# Git
alias pull="git pull"
alias push="git push"
alias rebase="git rebase"
alias status="git status"
alias add="git add"
alias addall="git add --all"
alias commit="git commit -m "
alias checkout="git checkout"
alias stash="git stash"
alias fetch="git fetch"

# Cordova
function rmAllPlugins () {
  for i in `cordova plugin ls | grep '^[^ ]*' -o`; do
    cordova plugin rm $i;
  done
}
alias pluginrm="rmAllPlugins"

# Docker
alias dm="docker-machine"
alias dms="docker-machine start default"
alias dme='eval $(docker-machine env default)'
alias dc="docker-compose"
alias d="docker"
alias drun="docker run -it --rm"
alias dsall='docker stop $(docker ps -q)'
alias drmall='docker rm $(docker ps -qa)'
alias drmiall='docker rmi $(docker images -q)'
alias drmiun='docker rmi $(docker images -f "dangling=true" -q)'

# Sparted
alias server='cd ~/Work/Sparted/Back/Server'
alias app='cd ~/Work/Sparted/Front/V2/cordova/core'
alias appc='cd ~/Work/Sparted/Front/V2/customization'
alias indus='cd ~/Work/Sparted/Industrial/setup'
alias certif='cd ~/Work/Sparted/Certificates/aws'
alias service='cd ~/Work/Sparted/Services'
alias lns='cd ~/Work/Sparted/l10ns'
alias doc='cd ~/Work/Sparted/documentation'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Ruby
eval "$(rbenv init -)"
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/ruby/2.3.0/bin

# Sam
export PATH=$PATH:"$HOME/.sam/bin"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


export PATH="$HOME/.yarn/bin:$PATH"
