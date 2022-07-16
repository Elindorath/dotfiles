unalias run-help &>/dev/null
autoload run-help

[ -d /usr/share/zsh/help ] && HELPDIR=/usr/share/zsh/help
[ -d /usr/local/share/zsh/help ] && HELPDIR=/usr/local/share/zsh/help

# Handle brew installation
brew_prefix=$(brew --prefix zsh 2>/dev/null)

[ -d "${brew_prefix}" ] && HELPDIR="${brew_prefix}/share/zsh/help"
